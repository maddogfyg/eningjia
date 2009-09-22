<?php
!defined('P_W') && exit('Forbidden');

/*
* fix by sky_hold@163.com
*
*/

class PW_Ucuser {
	
	var $db;

	function PW_Ucuser() {
		global $db;
		$this->db =& $db;
	}

	function ucedit($uid, $oldname, $info) {
		require_once(R_P . 'uc_client/uc_client.php');
		$errmsg  = null;
		$errcode = array(
			'-1' => 'illegal_username',			'-2' => 'username_same',
			'-3' => 'illegal_email',			'-4' => 'reg_email_have_same'
		);
		$ucstatus = uc_user_edit($uid, $oldname, $info['username'], $info['password'], $info['email']);
		if ($ucstatus < 0) {
			$errmsg = $errcode[$ucstatus];
		}
		if ($ucstatus == 2) {
			$this->alterName($uid, $oldname, $info['username']);
		}
		return array($ucstatus, $errmsg);
	}

	function alterName($uid, $oldname, $username) {
		global $db_plist;
		$this->db->update("UPDATE pw_threads SET author=" . pwEscape($username) . " WHERE authorid=" . pwEscape($uid));
		$ptable_a = array('pw_posts');
		if ($db_plist) {
			$p_list = explode(',',$db_plist);
			foreach ($p_list as $val) {
				$ptable_a[] = 'pw_posts'.$val;
			}
		}
		foreach ($ptable_a as $val) {
			$this->db->update("UPDATE $val SET author=" . pwEscape($username) . " WHERE authorid=" . pwEscape($uid));
		}
		$this->db->update("UPDATE pw_cmembers SET username=" . pwEscape($username) . " WHERE uid=" . pwEscape($uid));
		$this->db->update("UPDATE pw_colonys SET admin=" . pwEscape($username) . " WHERE admin=" . pwEscape($oldname));
		$this->db->update("UPDATE pw_announce SET author=" . pwEscape($username) . " WHERE author=".pwEscape($oldname));
		$this->db->update("UPDATE pw_medalslogs SET awardee=" . pwEscape($username) . " WHERE awardee=".pwEscape($oldname));

		$query = $this->db->query("SELECT fid,forumadmin,fupadmin FROM pw_forums WHERE forumadmin LIKE " . pwEscape("%,$oldname,%",false) . " OR fupadmin LIKE " . pwEscape("%,$oldname,%",false));
		while ($rt = $this->db->fetch_array($query)) {
			$rt['forumadmin']	= str_replace(",$oldname,",",$username,",$rt['forumadmin']);
			$rt['fupadmin']		= str_replace(",$oldname,",",$username,",$rt['fupadmin']);
			$this->db->update("UPDATE pw_forums SET forumadmin=" . pwEscape($rt['forumadmin'],false) . ",fupadmin=" . pwEscape($rt['fupadmin'],false) . " WHERE fid=" . pwEscape($rt['fid'],false));
		}
	}
}
?>