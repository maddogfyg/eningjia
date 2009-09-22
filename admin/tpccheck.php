<?php
!function_exists('adminmsg') && exit('Forbidden');
$basename="$admin_file?adminjob=tpccheck";
include_once(D_P.'data/bbscache/forumcache.php');
include_once(R_P.'require/forum.php');

if ($admin_gid == 5) {
	list($allowfid,$forumcache) = GetAllowForum($admin_name);
	$sql = $allowfid ? "fid IN($allowfid)" : '0';
} else {
	include(D_P.'data/bbscache/forumcache.php');
	list($hidefid,$hideforum) = GetHiddenForum();
	if ($admin_gid == 3) {
		$forumcache .= $hideforum;
		$sql = '1';
	} else {
		$sql = $hidefid ? "fid NOT IN($hidefid)" : '1';
	}
}

if (!$_POST['step']) {

	InitGP(array('fid','username','uid','page'));
	if (is_numeric($fid)) {
		$sql .= " AND fid=" . pwEscape($fid);
	} elseif ($sql == '1') {
		$fids = array();
		foreach ($forum as $key => $value) {
			$fids[] = $key;
		}
		$fids && $sql .= " AND fid IN(" . pwImplode($fids) . ")";
	}
	$sql .= " AND ifcheck='0'";

	if ($username) {
		$rt  = $db->get_one("SELECT uid FROM pw_members WHERE username=".pwEscape($username));
		$uid = $rt['uid'];
	}
	is_numeric($uid) && $sql .= "AND authorid=" . pwEscape($uid);

	(!is_numeric($page) || $page < 1) && $page = 1;
	$limit = pwLimit(($page-1)*$db_perpage,$db_perpage);
	$rt    = $db->get_one("SELECT COUNT(*) AS sum FROM pw_threads WHERE $sql");
	$pages = numofpage($rt['sum'],$page,ceil($rt['sum']/$db_perpage),"$basename&fid=$fid&uid=$uid&");

	$checkdb = array();
	$query = $db->query("SELECT tid,fid,subject,author,authorid,postdate FROM pw_threads WHERE $sql ORDER BY postdate DESC $limit");
	while ($rt = $db->fetch_array($query)) {
		$rt['subject']  = substrs($rt['subject'],35);
		$rt['name']     = $forum[$rt['fid']]['name'];
		$rt['postdate'] = get_date($rt['postdate']);
		$checkdb[]      = $rt;
	}
	include PrintEot('tpccheck');exit;

} elseif ($_POST['step'] == 2) {

	InitGP(array('selid'),'P');
	if (!$selid = checkselid($selid)) {
		$basename="javascript:history.go(-1);";
		adminmsg('operate_error');
	}
	if ($type == 'pass') {
		$fids  = array();
		$query = $db->query("SELECT fid FROM pw_threads WHERE $sql AND tid IN($selid)");
		while ($rt = $db->fetch_array($query)) {
			$fids[$rt['fid']] ++;
		}
		foreach ($fids as $key => $value) {
			$rt = $db->get_one("SELECT tid,author,postdate,subject FROM pw_threads WHERE fid=" . pwEscape($key) . " ORDER BY lastpost DESC LIMIT 1");
			$lastpost = $rt['subject']."\t".$rt['author']."\t".$rt['postdate']."\t"."read.php?tid=$rt[tid]&page=e#a";
			$db->update("UPDATE pw_forumdata"
				. " SET topic=topic+" . pwEscape($value)
					. ',article=article+' . pwEscape($value)
					. ',tpost=tpost+' . pwEscape($value)
					. ',lastpost=' . pwEscape($lastpost)
				. ' WHERE fid=' . pwEscape($key));
		}
		if ($selid) {
			$db->update("UPDATE pw_threads SET ifcheck='1' WHERE $sql AND tid IN($selid)");
			$threadList = L::loadClass("threadlist");
			$threadList->refreshThreadIdsByForumId($fid);
		}
	} else {
		$ttable_a = $_tids = array();
		foreach (explode(',',$selid) as $key => $value) {
			$ttable_a[GetTtable($value)][] = $value;
		}
		foreach ($ttable_a as $pw_tmsgs => $value) {
			if (empty($value)) continue;
			$value = pwImplode($value);
			$query = $db->query("SELECT t.tid,t.fid FROM pw_threads t WHERE $sql AND t.tid IN($value)");
			$tids = array();
			while ($read = $db->fetch_array($query)) {
				$tids[] = $read['tid'];
				$_tids[] = $read['tid'];
			}
			if ($tids) {
				$tids = pwImplode($tids);
				$db->update("DELETE FROM $pw_tmsgs WHERE tid IN($tids)");
			}
		}
		# $selid && $db->update("DELETE FROM pw_threads WHERE $sql AND tid IN($selid)");
		# ThreadManager
		if ($selid) {
			$threadManager = L::loadClass("threadmanager");
			$threadManager->deleteByThreadIds($fid,$selid);
		}

		require_once(R_P.'require/updateforum.php');
		delete_tag($selid);
		if ($_tids) {
			$pw_attachs = L::loadDB('attachs');
			$attachdb = $pw_attachs->getByTid($_tids);
			require_once(R_P.'require/updateforum.php');
			delete_att($attachdb);
			pwFtpClose($ftp);
		}
	}
	adminmsg('operate_success');
}
?>