<?php
@include_once (R_P . 'lib/rate.class.php');
class Datanalyse {
	var $db;
	var $nowtimestamp;
	var $overtimestamp;
	var $historyTime;
	var $overTime = 30;
	var $defaultLimit = 20;
	var $specialLimit = null;
	var $actions;
	
	function Datanalyse() {
		$this->__construct ();
	}
	
	function __construct() {
		global $db;
		$this->db = & $db;
		$this->historyTime = $this->getTimestamp('h');
		$this->nowtimestamp = $this->getTimestamp ( 'n' );
		$this->overtimestamp = $this->getTimestamp ( 'o' );
		$this->actions = new DatanalyseAction ( );
	}
	
	/**
	 * @param $specialLimit the $specialLimit to set
	 */
	function setSpecialLimit($specialLimit) {
		$this->specialLimit = $specialLimit;
	}

	
	/**
	 * private method
	 * @return unknown_type
	 */
	function deleteAllOverdueData() {
		$sql = "DELETE FROM pw_datanalyse WHERE timeunit < " . pwEscape($this->overtimestamp);
		$this->db->update ( $sql );
	}
	
	
	/**
	 * @param $action
	 * @return unknown_type
	 */
	function clearData($action){
		//清理超时数据
		$sql = "DELETE FROM pw_datanalyse WHERE action=".pwEscape($action)."
				AND timeunit < ".pwEscape($this->overtimestamp)." AND timeunit != ".pwEscape($this->historyTime);
		$this->db->update($sql);
		
		//保留每天的top 100
		$d_time = $this->getDeleteTimes();
		$d_time[] = $this->historyTime;
		foreach ($d_time as $time) {
			$query = $this->db->query("SELECT * FROM pw_datanalyse
				WHERE action = ". pwEscape($action) ." AND timeunit = ".pwEscape($time)."
				ORDER BY num DESC LIMIT " . $this->getMaxMun());
			while ($rt = $this->db->fetch_array($query)) {
				$num[] = $rt['num'];
			}
			if ($num) {
				sort($num);
				$this->db->update("DELETE FROM pw_datanalyse WHERE action = ".pwEscape($action)."
							AND timeunit = ".pwEscape($time)." AND num < ".pwEscape($num[0]));
			}
		}
		$this->setDeleteTimePoint();
	}
	
	/**
	 * @return unknown_type
	 */
	function getDeleteTimes(){
		$d_points = $this->getDeleteTimePoint();
		$n_points = $this->nowtimestamp;
		if (!$d_points) {
			$d_points = $this->overtimestamp;
		}
		$diff = ($n_points - $d_points) / 86400;
		$result = array();
		for ($index = 0; $index < $diff; $index++) {
			$result[] = $d_points + $index*24*60*60;
		}
		return $result;
	}
	
	/**
	 * @return unknown_type
	 */
	function setDeleteTimePoint(){
		$file = @fopen(R_P."data/bbscache/datanlyse.txt","wb");
		if ($file) {
			$c = "timepoint=".$this->nowtimestamp;
			fwrite($file,$c);
			fclose($file);
		}
	}
	
	/**
	 * @return unknown_type
	 */
	function getDeleteTimePoint(){
		$file = @fopen(R_P."data/bbscache/datanlyse.txt","rb");
		if ($file) {
			$c = fgets($file,'100');
			$c = explode("=",trim($c));
			if (count($c) > 1) {
				$timepoint = $c[1];
			}
			fclose($file);
		}
		return $timepoint;
	}
	
	/**
	 * @return unknown_type
	 */
	function getMaxMun(){
		return $this->defaultLimit * 10;
	}
	
	/**
	 * private method
	 * @param $tag
	 * @param $action
	 * @return unknown_type
	 */
	function update($tag, $action, $value) {
		$num = $this->db->get_value("SELECT num FROM pw_datanalyse
				WHERE tag=". pwEscape($tag) ." AND action=". pwEscape($action) ." AND timeunit=". pwEscape($this->nowtimestamp));
		$num = (int)$num + (int)$value;
		$sql = "REPLACE INTO pw_datanalyse
				SET tag=" . pwEscape($tag) . ",action=" . pwEscape($action) . ",
				timeunit=" . pwEscape($this->nowtimestamp) . ",num= " . pwEscape($num);
		$this->db->update ( $sql );
		
		//记录历史数据
		$snum = $this->db->get_value("SELECT num FROM pw_datanalyse WHERE tag=".pwEscape($tag)."
				AND action=".pwEscape($action)." AND timeunit=".pwEscape($this->historyTime));
		$snum = (int)$snum + $value;
		$sql = "REPLACE INTO pw_datanalyse
				SET tag=" . pwEscape($tag) . ",action=" . pwEscape($action) . ",
				timeunit=".pwEscape($this->historyTime).",num= " . pwEscape($snum);
		$this->db->update($sql);
	}
	
	/**
	 * public method
	 * @param $tag
	 * @param $action
	 * @return unknown_type
	 */
	function updateDatanalyse($tag, $action, $value = 1) {
		if (! empty ( $tag ) && is_numeric ( $tag ) && ! empty ( $action ) && $this->actions->isAction ( $action )) {
			if (empty ( $value ) || ! is_numeric ( $value )) {
				$value = 0;
			}
			$this->update ( $tag, $action, $value );
			return true;
		}
		return false;
	}
	
	/**
	 * public method
	 * @param $action
	 * @param $type
	 * @param $limit
	 * @return unknown_type
	 */
	function getSortData($action, $type, $limit, $subType=null) {
		$this->clearData($action);
		$result = array ();
		$types = array ('today', 'week', 'month', 'history');
		if (! $limit || ! is_numeric ( $limit ) || $limit > $this->defaultLimit) {
			$limit = $this->defaultLimit;
		}
		if ($this->specialLimit != null) {
			$limit = $this->specialLimit;
		}
		if (in_array ( $type, $types )) {
			$result = $this->sortData ( $action, $type, $limit );
		} else {
			if ($this->actions->getMember ( $action ) && ($subType != null)) {
				$result = $this->memberSortByType ( $subType, $limit );
			}
		}
		return $result;
	}
	
	/**
	 * @param $action
	 * @return unknown_type
	 */
	function memberSortByType($action,$limit) {
		@include_once (R_P . 'lib/element.class.php');
		$pwElement = new PW_Element ( $this->defaultLimit );
		$data = $pwElement->userSort ( $action, $limit );
		foreach ( $data as $key => $value ) {
			$tags [] = $value ['addition'] ['uid'];
			$nums [$value ['addition'] ['uid']] = $this->formatValue($value ['value']);
		}
		$r = $this->getMemberSort ( $tags, $nums );
		if (! empty ( $tags ) && ! empty ( $r )) {
			foreach ( $tags as $key => $value ) {
				if (!empty($r [$value])) {
					$result [] = $r [$value];
				}
			}
		}
		return $result;
	}

	/**
	 * @param $action
	 * @param $type
	 * @param $limit
	 * @return unknown_type
	 */
	function sortData($action, $type, $limit){
		if ($type == "today") {
			$timeSpan = " AND a.timeunit = " . pwEscape($this->nowtimestamp);
		} else if ($type == "week") {
			$timeSpan = " AND a.timeunit >= " . pwEscape($this->getTimestamp ( 'w' ));
		} else if ($type == "month") {
			$timeSpan = " AND a.timeunit >= " . pwEscape($this->getTimestamp ( 'm' ));
		} else if ($type == "history") {
			$timeSpan = " AND a.timeunit = ". pwEscape($this->historyTime);
		}
		if ($action == 'memberShareAll') {
			$w_action = "a.action IN ( ". pwImplode($this->actions->share) ." )";
		}else{
			$w_action = "a.action = ". pwEscape($action);
		}
		$sql = "SELECT a.tag, SUM(a.num) AS num FROM pw_datanalyse a
			WHERE $w_action $timeSpan GROUP BY a.tag  ORDER BY num DESC LIMIT $limit ";
		$query = $this->db->query ( $sql );
		while ( $rt = $this->db->fetch_array ( $query ) ) {
			$tags [] = $rt ['tag'];
			$nums [$rt ['tag']] =  $this->formatValue($rt ['num']);
		}
		if ($this->actions->getMember ( $action )) {
			$r = $this->getMemberSort ( $tags, $nums );
		} elseif ($this->actions->getThread ( $action )) {
			$r = $this->getThreadSort ( $tags, $nums );
		} elseif ($this->actions->getDiary ( $action )) {
			$r = $this->getDiarySort ( $tags, $nums );
		} elseif ($this->actions->getPic ( $action )) {
			$r = $this->getPicSort ( $tags, $nums );
		}
		if (! empty ( $tags ) && ! empty ( $r )) {
			foreach ( $tags as $key => $value ) {
				$result [] = $r [$value];
			}
		}
		
		return $result;
	}
	
	function getForumSort($tags, $nums){
		if (! empty ( $tags ) && ! empty ( $nums )) {
			$sql = "SELECT f.fid,f.name,fd.lastpost FROM pw_forumdata fd LEFT JOIN pw_forums f ON f.fid = fd.fid
					WHERE f.fid IN ( " . pwImplode ( $tags ) . " )";
			$query = $this->db->query ( $sql );
			$result = array ();
			while ( $rt = $this->db->fetch_array ( $query ) ) {
				$r ['id'] = $rt ['fid'];
				$r ['title'] = $rt ['name'];
				$lastpost = explode("\t",$rt['lastpost']);
				$r ['desc'] = $lastpost[0];
				$r ['author'] = $lastpost[1];
				$r ['lastDate'] = get_date($lastpost[2]);
				$r ['url'] = $lastpost[3];
				$r ['value'] = $nums [$rt ['fid']];
				$result [$rt['fid']] = $r;
			}
		}
		return $result;
	}
	/**
	 * @param $tags
	 * @param $nums
	 * @return unknown_type
	 */
	function getPicSort($tags, $nums) {
		if (! empty ( $tags ) && ! empty ( $nums )) {
			$sql = "SELECT p.pid, p.path, p.uploader, p.uptime, p.pintro,  a.aid, a.ownerid, a.atype
					FROM pw_cnphoto p LEFT JOIN pw_cnalbum a ON p.aid = a.aid WHERE p.pid IN ( " . pwImplode ( $tags ) . " )";
			$query = $this->db->query ( $sql );
			$result = array ();
			while ( $rt = $this->db->fetch_array ( $query ) ) {
				$r ['id'] = $rt ['pid'];
				if ($rt['atype']=="0") {
					$r ['url'] = "mode.php?m=o&q=photos&a=view&pid=".$rt['pid'];
				}else{
					$r ['url'] = "mode.php?m=o&q=galbum&a=album&cyid=". $rt['ownerid'] ."&aid=".$rt['aid'];
				}
				$r ['author'] = $rt['uploader'];
				$r ['image'] = getphotourl($rt['path'],true);
				$r ['lasttime'] = get_date($rt ["uptime"]);
				$r ['value'] = $nums [$rt ['pid']];
				$result [$rt['pid']] = $r;
			}
		}
		return $result;
	}
	
	/**
	 * @param $tags
	 * @param $nums
	 * @return unknown_type
	 */
	function getDiarySort($tags, $nums) {
		if (! empty ( $tags ) && ! empty ( $nums )) {
			$sql = "SELECT d.did, d.subject, d.postdate, d.username, d.uid FROM pw_diary d
					WHERE d.did IN ( " . pwImplode ( $tags ) . " )";
			$query = $this->db->query ( $sql );
			$result = array ();
			while ( $rt = $this->db->fetch_array ( $query ) ) {
				$r ['id'] = $rt ['did'];
				$r ['title'] = $rt ['subject'];
				$r ['author'] = $rt ['username'];
				$r ['url'] = "mode.php?m=o&space=1&q=diary&did=".$rt['did']."&u=" . $rt ['uid'];
				$r ['postdate'] = get_date($rt ['postdate']);
				$r ['value'] = $nums [$rt['did']];
				$result [$rt ['did']] = $r;
			}
		}
		return $result;
	}
	
	/**
	 * @param $tags
	 * @param $nums
	 * @return unknown_type
	 */
	function getThreadSort($tags, $nums) {
		if (! empty ( $tags ) && ! empty ( $nums )) {
			$sql = "SELECT t.tid, t.fid, t.author, t.subject, t.postdate  FROM pw_threads t
					WHERE t.tid IN ( " . pwImplode ( $tags ) . " ) ";
			$query = $this->db->query ( $sql );
			$result = array ();
			while ( $rt = $this->db->fetch_array ( $query ) ) {
				$r ['id'] = $rt ['tid'];
				$r ['fid'] = $rt ['fid'];
				$r ['title'] = $rt ['subject'];
				$r ['author'] = $rt ['author'];
				$r ['url'] = "read.php?tid=" . $rt ['tid'];
				$r ['postdate'] = get_date($rt ['postdate']);
				$r ['value'] = $nums [$rt ['tid']];
				$result [$rt ['tid']] = $r;
			}
		}
		return $result;
	}
	
	/**
	 * @param $tags
	 * @param $nums
	 * @return unknown_type
	 */
	function getMemberSort($tags, $nums) {
		if (! empty ( $tags ) && ! empty ( $nums )) {
			$sql = "SELECT m.uid, m.icon, m.username, md.lastvisit
					FROM pw_members m LEFT JOIN pw_memberdata md ON m.uid=md.uid
					WHERE m.uid IN ( " . pwImplode ( $tags ) . " ) ";
			$query = $this->db->query ( $sql );
			$result = array ();
			while ( $rt = $this->db->fetch_array ( $query ) ) {
				$r ['id'] = $rt ['uid'];
				$r ['title'] = $rt ['username'];
				$r ['url'] = "u.php?action=show&uid=" . $rt ['uid'];
				list($userIcon) = showfacedesign($rt["icon"],1,'m');
				$r ['image'] = $userIcon;
				list ( $lastDate ) = getLastDate ( $rt ["lastvisit"] );
				$r ['lastDate'] = $lastDate;
				$r ['value'] = $nums [$rt ['uid']];
				$result [$rt ['uid']] = $r;
			}
		}
		return $result;
	}
	
	function formatValue($value){
		if(strlen($value)>5){
			$result = ceil($value/10000).'万';
		}else{
			$result = $value;
		}
		return $result;
	}
	
	/**
	 * @param $type
	 * @return unknown_type
	 */
	function getTimestamp($type = 'n') {
		$timestamp = time();
		$timestamp = PwStrtoTime(get_date($timestamp , 'Y-m-d'));
		if ($type == 'o') {
			$timestamp -= (int)$this->overTime*60*60*24;
		} elseif ($type == 'w') {
			$timestamp -= 7*60*60*24;
		} elseif ($type == 'm') {
			$timestamp -= 30*60*60*24;
		}elseif ($type == 'h') {
			$timestamp = mktime ( 0, 0, 0, 0, 0, 0);
		}
		return $timestamp;
	}
}

class DatanalyseAction {
	var $rate;
	var $share = array();
	var $picRate = array();
	var	$diaryRate = array();
	var	$threadRate = array();
	var $member = array ('memberOnLine', 'memberThread', 'memberShare','memberCredit','memberFriend');
	var $memberUnit = array ('小时','贴','分享');
	var $thread = array ('threadPost', 'threadFav', 'threadShare', 'threadRate');
	var $threadUnit = array ('回复','收藏','分享','评价');
	var $diary = array ('diaryComment', 'diaryFav', 'diaryShare', 'diaryRate');
	var $diaryUnit = array ('评论','收藏','分享','评价');
	var $pic = array ('picComment', 'picFav', 'picShare', 'picRate');
	var $picUnit = array('评论','收藏','分享','评价');
	var $forum = array ('forumPost', 'forumTopic', 'forumArticle' );
	var $forumUnit = array('贴','主题','文章');
	
	function DatanalyseAction(){
		$this->rate = new PW_Rate();
		$this->share = array("memberShareThread","memberShareDiary","memberShareAlbum","memberShareUser","memberShareGroup",
						"memberSharePic","memberShareLink","memberShareVideo","memberShareMusic","memberShareAll");
		$this->picRate = $this->getRate("threadRate");
		$this->diaryRate = $this->getRate("diaryRate");
		$this->threadRate = $this->getRate("picRate");
		!empty($this->share) && $this->member = array_merge($this->member, $this->share);
		!empty($this->picRate) && $this->thread = array_merge($this->thread, $this->picRate);
		!empty($this->diaryRate) && $this->diary = array_merge($this->diary, $this->diaryRate);
		!empty($this->threadRate) && $this->pic = array_merge($this->pic, $this->threadRate);
	}
	
	function getMemberShareType($index){
		if (is_numeric($index) && $index < 10) {
			return $this->share[$index];
		}
	}
	
	function getUnit($action){
		if(in_array($action,$this->member)){
			return $this->memberUnit[array_search($action,$this->member)];
		}elseif(in_array($action,$this->thread)){
			return $this->threadUnit[array_search($action,$this->thread)];
		}elseif(in_array($action,$this->diary)){
			return $this->diaryUnit[array_search($action,$this->diary)];
		}elseif(in_array($action,$this->pic)){
			return $this->picUnit[array_search($action,$this->pic)];
		}elseif(in_array($action,$this->forum)){
			return $this->forumUnit[array_search($action,$this->forum)];
		}
	}
	
	function getAllAction() {
		$array = array_merge ( $this->member, $this->thread, $this->diary, $this->pic );
		return $array;
	}
	
	function isAction($action) {
		$array = array_merge ( $this->member, $this->thread, $this->diary, $this->pic );
		if (in_array ( $action, $array )) {
			return true;
		}
		return false;
	}
	
	function getForum($action){
		if (in_array ( $action, $this->forum )) {
			return $action;
		}
	}
	
	function getPic($action) {
		if (in_array ( $action, $this->pic )) {
			return $action;
		}
	}
	
	function getDiary($action) {
		if (in_array ( $action, $this->diary )) {
			return $action;
		}
	}

	function getThread($action) {
		if (in_array ( $action, $this->thread )) {
			return $action;
		}
	}
	
	function getMember($action) {
		if (in_array ( $action, $this->member )) {
			return $action;
		}
	}
	
	
	function getRate($tag){
		$rates = array();
		if ($tag == "threadRate" && $this->getRateSet($tag)) {
			$rates = $this->rate->getRateThreadHotTypes();
		}elseif($tag == "diaryRate" && $this->getRateSet($tag)){
			$rates = $this->rate->getRateDiaryHotTypes();
		}elseif($tag == "picRate" && $this->getRateSet($tag)){
			$rates = $this->rate->getRatePictureHotTypes();
		}
		$result = array_keys($rates);
		return $result;
	}
	
	function getRateSet($tag){
		$result = 1;
		global $db_ratepower;
		$rateSets = unserialize($db_ratepower);
		$tag == 'threadRate' &&  $type = 1;
		$tag == 'diaryRate' && $type = 2;
		$tag == 'picRate' && $type = 3;
		$type && $result = $rateSets[$type];
		return $result;
	}

}
?>