<?php
define('SCR','push');
require_once('global.php');

$action = GetGP('action');

if (empty($action)) {
	$weeknum = get_date($timestamp,'w');
	$weeknum < 1 && $weeknum = 7;
	$weektime = $tdtime-($weeknum-1)*86400;
	$cachenum = 20;

	$weekname	= 'fweek';
	$monthname	= 'fmonth';
	$sqladd		= '';
	$fidoff		= array();
	$ifview		= false;
	include_once(D_P.'data/bbscache/forumcache.php');

	$query = $db->query("SELECT fid,password,allowvisit FROM pw_forums WHERE password!='' OR allowvisit!='' OR f_type='hidden'");
	while ($rt = $db->fetch_array($query)) {
		$fidoff[] = $rt['fid'];
		if ($fid == $rt['fid'] && !$rt['password'] && strpos($rt['allowvisit'],",$groupid,")!==false) {
			$ifview = true;
		}
	}

	if ($fid && (!in_array($fid,$fidoff) || $ifview)) {
		include_once(D_P.'data/bbscache/forum_cache.php');
		$sqladd		 = " AND fid=".pwEscape($fid);
		$weekname	.= '_'.$fid;
		$monthname	.= '_'.$fid;
		$forumcache = str_replace("<option value=\"$fid\">","<option value=\"$fid\" selected>",$forumcache);
	} elseif ($fidoff) {
		$sqladd		 = " AND fid NOT IN(".pwImplode($fidoff).")";
	}

	require_once(R_P.'require/header.php');
	$threaddb = array(array(),array(),array());

	$query = $db->query("SELECT tid,author,authorid,subject,dig FROM pw_threads WHERE postdate>".pwEscape($tdtime)." AND dig>0 $sqladd ORDER BY dig DESC LIMIT $cachenum");
	while ($rt = $db->fetch_array($query)) {
		$rt['subject'] = substrs($rt['subject'],25);
		$threaddb[0][] = $rt;
	}
	$shtdb = array();
	$query = $db->query("SELECT * FROM pw_cache WHERE name IN(".pwImplode(array($weekname,$monthname)).")");
	while ($rt = $db->fetch_array($query)) {
		$shtdb[$rt['name']] = $rt;
	}

	if(!isset($shtdb[$weekname]) || $timestamp-$shtdb[$weekname]['time']>21600 || $shtdb[$weekname]['time']<$weektime){
		$query = $db->query("SELECT tid,author,authorid,subject,dig FROM pw_threads WHERE postdate>".pwEscape($weektime)." AND dig>0 $sqladd ORDER BY dig DESC LIMIT $cachenum");
		while ($rt = $db->fetch_array($query)) {
			$rt['subject'] = substrs($rt['subject'],25);
			$threaddb[1][] = $rt;
		}
		$cache = $threaddb[1] ? addslashes(serialize($threaddb[1])) : '';
		$pwSQL = pwSqlSingle(array(
			'name'	=> $weekname,
			'cache'	=> $cache,
			'time'	=> $timestamp
		));
		$db->update("REPLACE INTO pw_cache	SET $pwSQL");
	} else {
		$shtdb[$weekname]['cache'] && $threaddb[1] = unserialize($shtdb[$weekname]['cache']);
	}
	if (!isset($shtdb[$monthname]) || $timestamp-$shtdb[$monthname]['time']>86400 || $shtdb[$monthname]['time']<$montime) {
		$query = $db->query("SELECT tid,author,authorid,subject,dig FROM pw_threads WHERE postdate>".pwEscape($montime)." AND dig>0 $sqladd ORDER BY dig DESC LIMIT $cachenum");
		while ($rt = $db->fetch_array($query)) {
			$rt['subject'] = substrs($rt['subject'],25);
			$threaddb[2][] = $rt;
		}
		$cache = $threaddb[2] ? addslashes(serialize($threaddb[2])) : '';
		$pwSQL = pwSqlSingle(array(
			'name'	=> $monthname,
			'cache'	=> $cache,
			'time'	=> $timestamp
		));
		$db->update("REPLACE INTO pw_cache SET $pwSQL");
	} else {
		$shtdb[$monthname]['cache'] && $threaddb[2] = unserialize($shtdb[$monthname]['cache']);
	}
	require_once PrintEot('push');footer();
} elseif ($action == 'pushto') {
	//define('ajax',1);
	InitGP(array('step','fid','selid','back'));
	$fid = (int)$fid;
	$selid = (int)$selid;
	if (empty($fid) || empty($selid)) {
		Showmsg('undefined_action');
	}
	require_once(R_P.'require/forum.php');
	require_once(R_P.'require/msg.php');
	require_once(R_P.'require/writelog.php');
	include_once(D_P.'data/bbscache/forum_cache.php');

	$foruminfo = $db->get_one("SELECT * FROM pw_forums f LEFT JOIN pw_forumsextra fe USING(fid) WHERE f.fid='$fid' AND f.type<>'category'");
	!$foruminfo && Showmsg('data_error');
	wind_forumcheck($foruminfo);

	$isGM = CkInArray($windid,$manager);
	$isBM = admincheck($foruminfo['forumadmin'],$foruminfo['fupadmin'],$windid);
	if (!$isBM && $groupid!='3' && $groupid!='4' && !$isBM) {
		Showmsg('mawhole_right');
	}
	//TODO 用户操作权限
	if (empty($step)) {
		$areaPage = array();
		$mConfig = pwLoadClass('mpageconfig');
		$tmpArray = $mConfig->getInvokesByMode('area');
		if (empty($tmpArray)) {
			Showmsg('undefined_action');
		}
		foreach ($tmpArray as $key => $value) {
			$index = $value['mode'].'_'.$value['scr'].'_';
			if ($value['scr'] == 'index') {
				$areaPage[$index.'0'] = $db_modes[$value['mode']]['m_name'].getLangInfo('other','pushto_index');
			} elseif ($value['scr'] == 'cate') {
				if ($value['fid'] == 0) {
					foreach ($forum as $v) {
						if ($v['type'] == 'category' && !isset($areaPage[$index.$v['fid']])) {
							$areaPage[$index.$v['fid']] = $forum[$v['fid']]['name'];
						}
					}
				} else {
					$areaPage[$index.$value['fid']] = $forum[$value['fid']]['name'];
				}
			}
		}
		if (!$back && count($areaPage) == 1) {
			$_GET['index'] = key($areaPage);
			$step = 1;
		}
	}
	if ($step == 1) {
		InitGP(array('index'));
		list($keyid['mode'],$keyid['scr'],$keyid['fid']) = explode('_',$index);
		$keyid['fid'] = (int)$keyid['fid'];
		if (!isset($db_modes[$keyid['mode']]) || ($keyid['scr'] == 'cate' && !$keyid['fid'])) {
			Showmsg('undefined_action');
		}
		$paramfid = 0;
		if ($keyid['fid']) {
			include_once(D_P.'data/bbscache/area_config.php');
			if ($area_cateinfo && isset($area_cateinfo[$keyid['fid']]) && isset($area_cateinfo[$keyid['fid']]['tpl'])) {
				$paramfid = $keyid['fid'];
			}
		}
		$areaPage = array();$selTitle = '';
		$mConfig = pwLoadClass('mpageconfig');
		$areaPage = $mConfig->getInvokes($keyid['mode'],$keyid['scr'],$paramfid);
		if (empty($areaPage)) {
			$areaPage = $mConfig->getInvokes($keyid['mode'],$keyid['scr']);
			if (empty($areaPage)) {
				Showmsg('undefined_action');
			}
		}
		$pw_invoke	= pwLoadClass('invoke');
		$invokedata	= $pw_invoke->getDatasByNames($areaPage);
		foreach ($areaPage as $key=>$value) {
			if (!in_array($invokedata[$value]['type'],array('subject','image','player'))) {
				unset($areaPage[$key]);
			} elseif ($invokedata[$value]['ifloop']) {
				if ($invokedata[$value]['loops']) {
					foreach ($invokedata[$value]['loops'] as $v) {
						$areaPage[$areaPage[$key].','.$v] = $forum[$v]['name'];
					}
				}
				unset($areaPage[$key]);
			}
		}
		if ($keyid['scr'] == 'index') {
			$selTitle = $db_modes[$keyid['mode']]['m_name'].getLangInfo('other','pushto_index');
		} elseif ($keyid['scr'] == 'cate') {
			$selTitle = $forum[$keyid['fid']]['name'];
		}
		$index = $keyid['mode'].'_'.$keyid['scr'].'_'.$keyid['fid'];
		if (!$back && count($areaPage) == 1) {
			$_GET['name'] = current($areaPage);
			$_GET['index'] = $index;
			$step = 2;
		}
	}
	if ($step == 2) {
		InitGP(array('name','index'));
		list($keyid['mode'],$keyid['scr'],$keyid['fid']) = explode('_',$index);
		$keyid['fid'] = (int)$keyid['fid'];
		if (!isset($db_modes[$keyid['mode']]) || ($keyid['scr'] == 'cate' && !$keyid['fid'])) {
			Showmsg('undefined_action');
		}
		list($tname,$loopid) = explode(',',$name);
		$pw_invokepiece	= pwLoadClass('invokepiece');
		$invokepiece = $pw_invokepiece->getDatasByInvokeName($tname);
		empty($invokepiece) && Showmsg('undefined_action');
		$subtitle = $mInvok = array();$invokeparam = $firstKey = '';
		if (count($invokepiece)>1) {
			foreach ($invokepiece as $value) {
				$invokeparam .= $value['id'].':'.$value['num'].',';
				$subtitle[$value['id']] = $value['title'];
				if ($firstKey === '') {
					$firstKey = $value['id'];
					$mInvok = $value;
				}
			}
		} else{
			$mInvok = current($invokepiece);
		}
		$invokeparam = '{'.trim($invokeparam,',').'}';

		$attimages = array();
		$read = $db->get_one("SELECT * FROM pw_threads WHERE tid=".pwEscape($selid));
		empty($read) && Showmsg('data_error');
		if ($read['fid'] != $fid && $groupid == 5) {
			Showmsg('admin_forum_right');
		}
		$read['postdate'] = get_date($read['postdate']);
		$read['url'] = 'read.php?tid='.$read['tid'];
		$pw_tmsgs = GetTtable($read['tid']);
		$content = $db->get_value("SELECT content FROM $pw_tmsgs WHERE tid=".pwEscape($read['tid'],false));
		require_once R_P.'require/bbscode.php';
		$content = convert($content, $db_windpost);
		$content = substrs(strip_tags($content),300,'N');
		$query = $db->query("SELECT attachurl FROM pw_attachs WHERE uid=".pwEscape($read['authorid'],false)." AND tid=".pwEscape($read['tid'],false)." AND type='img' LIMIT 5");
		while ($rt = $db->fetch_array($query)) {
			$a_url = geturl($rt['attachurl'],'show');
			if ($a_url != 'nopic') {
				$attimages[$rt['attachurl']] = is_array($a_url) ? $a_url[0] : $a_url;
			}
		}
		$selTitle = '';
		if ($keyid['scr'] == 'index') {
			$selTitle = $db_modes[$keyid['mode']]['m_name'].getLangInfo('other','pushto_index');
		} elseif ($keyid['scr'] == 'cate') {
			$selTitle = $forum[$keyid['fid']]['name'];
		}
		$selTitle .= ' -&gt; '.$tname . ($loopid ? ' -&gt; ' . $forum[$loopid]['name'] : '');
		$index = $keyid['mode'].'_'.$keyid['scr'].'_'.$keyid['fid'];

		$reason_sel = '';
		$reason_a   = explode("\n",$db_adminreason);
		foreach ($reason_a as $k => $v) {
			if ($v = trim($v)) {
				$reason_sel .= "<option value=\"$v\">$v</option>";
			} else {
				$reason_sel .= "<option value=\"\">-------</option>";
			}
		}
		if (empty($ajax)) {
			require_once R_P.'require/header.php';
			require_once PrintEot('push');footer();
		}
	} elseif ($step == 3) {
		InitGP(array('subject','content','ifmsg','titleid','offset','index','invokename','endtime'));
		InitGP(array('url','attachurl','cimgurl'),'P',0);
		$url 		= str_replace('&#61;','=',$url);
		$attachurl 	= str_replace('&#61;','=',$attachurl);
		$cimgurl 	= str_replace('&#61;','=',$cimgurl);
		list($invoke,$loopid) = explode(',',$invokename);
		$loopid = intval($loopid);
		$pw_invokepiece	= pwLoadClass('invokepiece');
		$invokepiece = $pw_invokepiece->getDatasByInvokeName($invoke);
		(empty($invokepiece) || !isset($invokepiece[$titleid])) && Showmsg('undefined_action');
		$offset = (int)$offset;
		$mInvoke = $invokepiece[$titleid];
		if ($offset < 1 || $offset > $mInvoke['num']) {
			$offset = 1;
		}
		if ($endtime) {
			$endtime	= PwStrtoTime($endtime);
			if ($endtime == -1) {
				$endtime = 0;
			}
		}
		$read = $db->get_one("SELECT * FROM pw_threads WHERE tid=".pwEscape($selid));
		empty($read) && Showmsg('data_error');
		$cateid = getCateid($read['fid']);
		if ($cateid != $fid && $groupid == 5) {
			Showmsg('admin_forum_right');
		}
		$custom = array();
		foreach ($mInvoke['param'] as $key=>$value) {
			switch ($key) {
				case 'title':
					$custom[$key] = $subject;
					break;
				case 'url':
					$custom[$key] = $url;
					break;
				case 'descrip':
					$custom[$key] = $content;
					break;
				case 'image':
					$custom[$key] = $cimgurl;
					break;
				case 'author':
					$custom[$key] = $read['author'];
					break;
				case 'forumname':
					$custom[$key] = $forum[$read['fid']]['name'];
					break;

			}
		}
		if ($custom) {
			$mInvoke['rang'] != 'fid' && $cateid = 0;
			$pw_pushdata	= pwLoadClass('pushdata');
			$pw_cachedata	= pwLoadClass('cachedata');
			$pw_pushdata->insertData(array('invokepieceid'=>$mInvoke['id'],'fid'=>$cateid,'loopid'=>$loopid,'uid'=>$winduid,'offset'=>$offset-1,'starttime'=>$timestamp,'endtime'=>$endtime,'data'=>$custom));
			$pw_cachedata->deleteData($mInvoke['id'],$cateid,$loopid);
		}
		if ($ifmsg) {
			$msgdb = array(
				'toUser'	=> $read['author'],
				'subject'	=> 'pushto_title',
				'content'	=> 'pushto_content',
				'other'		=> array(
					'manager'	=> $windid,
					'fid'		=> $read['fid'],
					'tid'		=> $read['tid'],
					'subject'	=> $read['subject'],
					'postdate'	=> get_date($read['postdate']),
					'forum'		=> strip_tags($forum[$fid]['name']),
					'admindate'	=> get_date($timestamp),
					'reason'	=> stripslashes($atc_content)
				)
			);
			pwSendMsg($msgdb);
		}
		$logdb[] = array(
			'type'      => 'pushto',
			'username1' => $read['author'],
			'username2' => $windid,
			'field1'    => $read['fid'],
			'field2'    => $read['tid'],
			'field3'    => '',
			'descrip'   => 'pushto_descrip',
			'timestamp' => $timestamp,
			'ip'        => $onlineip,
			'tid'		=> $read['tid'],
			'subject'	=> substrs($read['subject'],28),
			'forum'		=> $forum[$read['fid']]['name'],
			'reason'	=> stripslashes($atc_content)
		);
		writelog($log);
		refreshto("read.php?tid=".$read['tid'],'operate_success');
	}

	require_once PrintEot('push');ajax_footer();
}

Showmsg('undefined_action');
?>