<?php
!defined('M_P') && exit('Forbidden');
$basename = "mode.php?m=$m&";
$pwModeImg = "$imgpath/apps";
if ($winduid) {
	ObHeader("mode.php?m=o");
}
@include_once(D_P.'data/bbscache/o_config.php');
require_once(M_P.'require/header.php');

$element = L::loadClass('element');
require_once(R_P.'require/app_core.php');

@extract($db->get_one("SELECT * FROM pw_bbsinfo WHERE id=1"));
$arr_logintype = $feeds = $reGroups = $hotuser = $newuser = $smphoto = $hotsubject = $hotforum = array();
if ($db_logintype) {
	for ($i = 0; $i < 3; $i++) {
		if ($db_logintype & pow(2,$i)) {
			$arr_logintype[] = $i;
		}
	}
} else {
	$arr_logintype[0] = 0;
}
$pwCacheFile = D_P.'data/bbscache/o_indexset_cache.php';

list(,$loginq)	= explode("\t",$db_qcheck);

if (pwFilemtime($pwCacheFile) + 60 < $timestamp) {

	require_once(R_P.'require/showimg.php');

	$newuser = browseNewuser(8);

	if ($o_indexset & 2) {
		$smphoto = browsePhoto(6);
	}

	if ($o_indexset & 4) {
		$hotsubject = forumHotSubject(12);
		$hotforum_temp = forumSortpost(12);
		foreach ($hotforum_temp as $key => $value){
			$value['title'] = strip_tags($value['title']);
			$value['title_sub'] = substrs($value['title'],15);
			$hotforum[] = $value;
		}
		unset($hotforum_temp);
	}

	if ($o_indexset & 8) {
		$feeds = browseFeeds(15);
	}

	if ($o_indexset & 16) {
		$hotuser = browseHotuser(9);
	}

	if ($o_indexset & 32) {
		$newWrite = browseWrite(5);
	}
	if ($db_share_open && $o_indexset & 64) {
		$newShares = browseShare(6);
	}
	if ($db_phopen && $o_indexset & 128) {
		$albumdb = browseAlbum(3);
	}
	if ($db_groups_open && $o_indexset & 256) {
		$reGroups = browseGroup(5);
	}
	if ($db_dopen && $o_indexset & 512) {
		list($newDiarys,$diarytype) = browseDiary(8);
	}	writeover($pwCacheFile,"<?php\r\n\$reGroups=".pw_var_export($reGroups).";\r\n\$newShares=".pw_var_export($newShares).";\r\n\$hotsubject=".pw_var_export($hotsubject).";\r\n\$hotforum=".pw_var_export($hotforum).";\r\n\$hotuser=".pw_var_export($hotuser).";\r\n\$newDiarys=".pw_var_export($newDiarys).";\r\n\$diarytype=".pw_var_export($diarytype).";\r\n\$newWrite=".pw_var_export($newWrite).";\r\n\$albumdb=".pw_var_export($albumdb).";\r\n\$smphoto=".pw_var_export($smphoto).";\r\n\$newuser=".pw_var_export($newuser).";\r\n\$feeds=".pw_var_export($feeds).";\r\n?>");
} else {
	include_once ($pwCacheFile);
}

function browseNewuser($num) {
	global $db,$tdtime;
	$newuser = array();
	$query = $db->query("SELECT username,uid,regdate FROM pw_members ORDER BY uid DESC LIMIT $num");
	while ($rt = $db->fetch_array($query)) {
		if ($rt['regdate'] >= $tdtime) {
			$newuser[] = $rt;
		}
	}
	/*
	$query = $db->query("SELECT username,uid FROM pw_members FORCE INDEX(PRIMARY) WHERE regdate>=" .pwEscape($tdtime)." AND regdate<=".pwEscape($tdtime+86400)." LIMIT $num");
	while ($rt = $db->fetch_array($query)) {
		$newuser[] = $rt;
	}
	*/
	return $newuser;
}

function browseHotuser($num) {
	global $db;
	$element = L::loadClass('element');
	$temp	= $element->userSort('todaypost',$num);
	return $temp;
}

function forumHotSubject($num) {
	global $db;
	$element = L::loadClass('element');
	$temp	= $element->replySort(0,$num);
	return $temp;
}

function forumSortpost($num) {
	global $db;
	$element = L::loadClass('element');
	$temp	= $element->forumSort('article',$num);
	return $temp;
}

function browsePhoto($num) {
	global $db;
	$smphoto = array();
	$query = $db->query("SELECT cp.pid,cp.aid,cp.path,cp.ifthumb FROM pw_cnphoto cp LEFT JOIN pw_cnalbum ca ON cp.aid=ca.aid WHERE ca.private='0' AND atype='0' ORDER BY pid DESC LIMIT $num");
	while ($rt = $db->fetch_array($query)) {
		$rt['path'] = getphotourl($rt['path'],$rt['ifthumb']);
		$smphoto[] = $rt;
	}
	return $smphoto;
}

function browseFeeds($num) {
	global $db,$groupid,$db_shield;
	$feeds = array();
	$query = $db->query("SELECT f.*,m.username,m.groupid FROM pw_feed f LEFT JOIN pw_members m ON f.uid=m.uid ORDER BY timestamp DESC LIMIT $num");
	while ($rt = $db->fetch_array($query)) {
		$rt['descrip'] = parseFeed($rt['descrip']);
		if ($rt['groupid'] == 6 && $db_shield && $groupid != 3) {
			$rt['descrip'] = appShield('ban_feed');
		}
		$key = get_date($rt['timestamp'],'y-m-d');
		$feeds[$key][] = $rt;
	}
	return $feeds;
}

function browseWrite($num) {
	global $db,$db_shield,$groupid;
	$newWrite = array();
	$query = $db->query("SELECT wd.*,m.username,m.icon,m.groupid FROM pw_owritedata wd LEFT JOIN pw_members m ON wd.uid=m.uid WHERE wd.touid='' ORDER BY wd.id DESC LIMIT $num");
	while ($rt = $db->fetch_array($query)) {
		$rt['postdate'] = get_date($rt['postdate']);
		list($rt['icon']) = showfacedesign($rt['icon'],1,'s');

		if ($rt['groupid'] == 6 && $db_shield && $groupid != 3) {
			$rt['content'] = appShield('ban_write');
		}
		$newWrite[] = $rt;
	}
	return $newWrite;
}

function browseShare($num) {
	global $db;
	$newShares = array();
	$query = $db->query("SELECT s.*,m.groupid,m.icon FROM pw_share s LEFT JOIN pw_members m ON s.uid=m.uid WHERE s.ifhidden=0 ORDER BY s.id DESC LIMIT $num");
	while ($rt = $db->fetch_array($query)) {
		$rt['postdate'] = get_date($rt['postdate'],'m-d H:s');
		$temp = unserialize($rt['content']);
		if ($temp['video']) {
			$rt['host'] = $temp['video']['host'];
			$rt['hash'] = $temp['video']['hash'];
		}

		$rt['link']	= $temp['link'];
		if ($rt['type']=='user') {
			$rt['image']	= $temp['user']['image'];
			$rt['title']= "<a href=\"$rt[link]\" target=\"_blank\">".$temp['user']['username']."</a>";
		} elseif ($rt['type']=='photo') {
			$belong	= getLangInfo('app','photo_belong');
			$rt['image'] = $temp['photo']['image'];
			$temp_uid	= $temp['photo']['uid'];
			$rt['title']= $belong."<a href=\"u.php?uid=$temp_uid\" target=\"_blank\">".$temp['photo']['username']."</a>";
		} elseif ($rt['type']=='album') {
			$belong	= getLangInfo('app','photo_belong');
			$rt['image']	= $temp['album']['image'];
			$temp_uid	= $temp['album']['uid'];
			$rt['title']= $belong."<a href=\"u.php?uid=$temp_uid\" target=\"_blank\">".$temp['album']['username']."</a>";
		} elseif ($rt['type']=='group') {
			$rt['image']	= $temp['group']['image'];
			$rt['title']= "<a href=\"$rt[link]\" target=\"_blank\">".$temp['group']['name']."</a>";
		} elseif ($rt['type']=='diary') {
			$rt['title']= "<a href=\"$rt[link]\" target=\"_blank\">".$temp['diary']['subject']."</a>";
		} elseif ($rt['type']=='topic'){
			$rt['title']= "<a href=\"$rt[link]\" target=\"_blank\">".$temp['topic']['subject']."</a>";
			$rt['abstract']= $temp['topic']['abstract'];
			$rt['imgs']= unserialize($temp['topic']['imgs']);
		} else {
			$rt['title']= "<a href=\"$rt[link]\" target=\"_blank\">".substrs($rt['link'],40)."</a>";
		}

		$rt['descrip'] = $temp['descrip'];
		$rt['type_name']= getLangInfo('app',$rt['type']);
		list($rt['icon']) = showfacedesign($rt['icon'],1,'s');
		unset($rt['content']);
		$newShares[] = $rt;
	}
	return $newShares;
}

function browseDiary($num) {
	global $db,$db_shield,$groupid;
	$newDiarys = $diarytype = array();
	$uids = '';
	$query = $db->query("SELECT d.did,d.dtid,d.uid,d.username,d.subject,d.content,d.r_num,d.c_num,d.postdate,m.icon,m.groupid FROM pw_diary d LEFT JOIN pw_members m ON d.uid=m.uid WHERE d.privacy!=2 ORDER BY d.did DESC LIMIT $num");
	while ($rt = $db->fetch_array($query)) {
		$rt['postdate'] = get_date($rt['postdate'],'m-d H:s');
		$rt['subject'] = substrs($rt['subject'],45);
		$rt['content'] = substrs($rt['content'],90);
		$rt['url'] = "mode.php?m=o&q=diary&u=$rt[uid]&did=$rt[did]";
		if (strpos(','.$uids.',',','.$rt['uid'].',') === false) {
			$uids .= $uids ? ','.$rt['uid'] : $rt['uid'];
		}
		list($rt['face']) = showfacedesign($rt['icon'],1,'s');
		if ($rt['groupid'] == 6 && $db_shield && $groupid != 3) {
			$rt['subject'] = appShield('ban_diary');
		}
		$newDiarys[$rt['did']] = $rt;
	}


	$query = $db->query("SELECT dtid,name FROM pw_diarytype WHERE uid IN(" .pwEscape($uids). ")");
	while ($rt = $db->fetch_array($query)) {
		$diarytype[$rt['dtid']] = $rt;
	}
	return array($newDiarys,$diarytype);
}

function browseGroup($num) {
	global $db,$pwModeImg;
	$reGroups = array();
	$query = $db->query("SELECT id,classid,cname,members,cnimg,createtime,descrip FROM pw_colonys ORDER BY members DESC LIMIT $num");
	while ($rt = $db->fetch_array($query)) {
		if ($rt['cnimg']) {
			list($rt['cnimg']) = geturl("cn_img/$rt[cnimg]",'lf');
		} else {
			$rt['cnimg'] = $pwModeImg.'/nophoto.gif';
		}
		$rt['createtime'] = get_date($rt['createtime'], 'Y-m-d');
		$reGroups[] = $rt;
	}

	return $reGroups;
}

function browseAlbum($num) {
	global $db,$db_shield,$groupid,$pwModeImg;
	$albumdb = array();
	$query = $db->query("SELECT c.aid,c.aname,c.photonum,c.ownerid,c.owner,c.lastphoto,c.lasttime,m.groupid FROM pw_cnalbum c LEFT JOIN pw_members m ON c.ownerid=m.uid WHERE c.atype='0' AND c.private='0' ORDER BY c.aid DESC LIMIT $num");
	while ($rt = $db->fetch_array($query)) {
		$rt['lasttime']		= get_date($rt['lasttime']);
		$rt['lastphoto']	= getphotourl($rt['lastphoto']);
		if ($rt['groupid'] == 6 && $db_shield && $groupid != 3) {
			$rt['lastphoto'] = $pwModeImg.'/banuser.gif';
			$rt['aname'] = appShield('ban_album');

		}
		$albumdb[] =  $rt;
	}
	return $albumdb;
}
?>