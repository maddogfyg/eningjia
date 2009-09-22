<?php
!function_exists('adminmsg') && exit('Forbidden');
$basename = "$admin_file?adminjob=creathtm&type=$type";

$sqladd = "WHERE type<>'category' AND allowvisit='' AND f_type!='hidden' AND cms='0'";

if (!$action) {

	@include_once(D_P.'data/bbscache/forumcache.php');
	$num = 0;
	$forumcheck = "<table cellspacing='0' cellpadding='0' border='0' width='100%' align='center'><tr>";

	$select = '';
	$query	= $db->query("SELECT fid,name,allowhtm FROM pw_forums $sqladd");
	while ($rt = $db->fetch_array($query)) {
		$num++;
		$htm_tr = $num % 5 == 0 ? '</tr><tr>' : '';
		$checked = $rt['allowhtm'] ? 'checked' : $checked='';
		$forumcheck .= "<td><input type='checkbox' name='selid[]' value='$rt[fid]' $checked>$rt[name]</td>$htm_tr";
		$rt['allowhtm'] && $select .= "<option value=\"$rt[fid]\">$rt[name]</option>";
	}
	$forumcheck.="</tr></table>";
	include PrintEot('creathtm');exit;

} elseif ($_POST['action'] == 'submit') {

	InitGP(array('selid'),'P');
	$selid = checkselid($selid);
	if ($selid === false) {
		$basename = "javascript:history.go(-1);";
		adminmsg('operate_error');
	} elseif ($selid == '') {
		$db->update("UPDATE pw_forums SET allowhtm='0' $sqladd");
	} elseif ($selid) {
		$db->update("UPDATE pw_forums SET allowhtm='1' $sqladd AND fid IN($selid)");
		$db->update("UPDATE pw_forums SET allowhtm='0' $sqladd AND fid NOT IN($selid)");
	}
	updatecache_f();
	adminmsg('operate_success');

} elseif ($action == 'creat') {

	@set_time_limit(0);
	$pwServer['REQUEST_METHOD'] != 'POST' && PostCheck($verify);
	InitGP(array('creatfid','percount','step','tfid','forumnum'));

	$fids = $tid = $fieldadd = $tableadd = $tids = '';
	!is_array($creatfid) && $creatfid = explode(',',$creatfid);
	if (in_array('all', $creatfid)) {
		$query = $db->query("SELECT fid FROM pw_forums $sqladd AND allowhtm='1'");
		while ($rt = $db->fetch_array($query)) {
			$fids .= ($fids ? ',' : '') . $rt['fid'];
		}
		$creatfid = explode(',',$fids);
	} else {
		$fids = implode(',',$creatfid);
	}
	!$fids && adminmsg('template_noforum');

	!$tfid && $tfid = 0;
	$thisfid = (int)$creatfid[$tfid];
	
	$imgpath	= $db_http	!= 'N' ? $db_http : $db_picpath;
	$attachpath	= $db_attachurl	!= 'N' ? $db_attachurl : $db_attachname;
	$staticPage = L::loadClass('StaticPage');

	if (!$staticPage->initForum($thisfid)) {
		Showmsg('data_error');
	}
	(!is_numeric($forumnum) || $forumnum < 0) && $forumnum = 0;
	!$step && $step = 1;
	!$percount && $percount = 100;
	$start = ($step-1) * $percount;
	$next  = $start + $percount;
	$step++;
	$j_url = "$basename&action=$action&percount=$percount&creatfid=$fids&forumnum=$forumnum";
	$goon  = 0;
	
	$query = $db->query("SELECT tid FROM pw_threads WHERE fid='$thisfid' AND ifcheck=1 AND special='0' ORDER BY topped DESC,lastpost DESC" . pwLimit($start, $percount));
	while ($topic = $db->fetch_array($query)) {
		$goon = 1;
		$staticPage->update($topic['tid']);
	}
	if ($forumnum && $next >= $forumnum) {
		$goon = 0;
	}
	if ($goon) {
		$j_url .= "&step=$step&tfid=$tfid";
		adminmsg('updatecache_step',EncodeUrl($j_url));
	} else {
		$tfid++;
		if (isset($creatfid[$tfid])) {
			$j_url .= "&step=1&tfid=$tfid";
			adminmsg('updatecache_step1',EncodeUrl($j_url));
		}
		adminmsg('operate_success');
	}
} elseif ($_POST['action'] == 'delete') {

	@include_once(D_P.'data/bbscache/forum_cache.php');
	InitGP(array('creatfid'),'P');
	if (in_array('all',$creatfid)) {
		$handle = opendir(R_P.$db_htmdir.'/');
		while ($file = readdir($handle)) {
			if (($file != ".") && ($file != "..") && ($file != "")) {
				if (is_dir(R_P.$db_htmdir.'/'.$file)){
					//cms
					if (!$forum[$file]['cms']) {
						deldir(R_P.$db_htmdir.'/'.$file);
					}
					//cms
				}
			}
		}
	} elseif ($creatfid) {
		foreach ($creatfid as $key => $value) {
			if (is_numeric($value)) {
				deldir(R_P.$db_htmdir.'/'.$value);
			}
		}
	} else {
		adminmsg('forumid_error');
	}
	adminmsg('operate_success');
}
function pwAdvert($ckey,$fid=0,$lou=0,$scr=0) {
	global $timestamp,$db_advertdb,$db_mode;
	if (empty($db_advertdb[$ckey])) return false;

	$fid || $fid = $GLOBALS['fid'];
	$scr || $scr = SCR;
	$tmpAdvert = $db_advertdb[$ckey];
	if ($db_advertdb['config'][$ckey] == 'rand') {
		shuffle($tmpAdvert);
	}
	$advert = array();
	foreach ($tmpAdvert as $key=>$value) {
		if ($value['stime'] <= $timestamp && $value['etime'] >= $timestamp) {
			if (($value['mode'] && strpos($value['mode'],($db_mode?$db_mode:'bbs'))===false)
				|| ($value['page'] && strpos($value['page'],$scr)===false)
				|| ($value['fid'] && strpos(",{$value['fid']},",",$fid,")===false)
				|| ($value['lou'] && strpos(",{$value['lou']},",",$lou,")===false)) {
				continue;
			}
			if ($db_advertdb['config'][$ckey] != 'all') {
				$advert = $value['code'];break;
			} else {
				$advert[] = $value['code'];
			}
		}
	}
	return $advert;
}

function pwNavBar() {
	global $db_mainnav,$db_mode;
	$tmpNav = array();

	if (empty($db_mainnav)) $db_mainnav = array();
	foreach ($db_mainnav as $key => $value) {
		if ($value['pos'] == '-1' || strpos(",{$value['pos']},",','.($db_mode?$db_mode:'bbs').',') !== false) {
			$tmpNav['main']['html'] .= 'KEYbbs' == $key ? "<li class=\"current\">{$value['html']}</li>" : "<li>{$value['html']}</li>";
		}
	}
	return array($tmpNav);
}
?>