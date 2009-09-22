<?php
!defined('P_W') && exit('Forbidden');
class PW_TplDB extends BaseDB {
	var $_tableName = "pw_tpl";

	function getData($tplid){
		return $this->_getConnection()->get_one("SELECT * FROM ".$this->_tableName." WHERE tplid=".pwEscape($tplid));
	}
	function getTplIdsByType($type){
		$temp = array();
		$query = $this->_getConnection()->query("SELECT tplid FROM ".$this->_tableName." WHERE type=".pwEscape($type));
		while ($rt = $this->_getConnection()->fetch_array($query)) {
			$temp[] = $rt['tplid'];
		}
		return $temp;
	}
	function getDatas($type,$limit){
		if ($type) {
			$sqladd = ' WHERE type='.pwEscape($type);
			if (!$sqladd) return array();
		} else {
			$sqladd = '';
		}
		$temp	= array();
		$query	= $this->_getConnection()->query("SELECT tplid,name,descrip,image FROM ".$this->_tableName." $sqladd".$limit);
		while ($rt = $this->_getConnection()->fetch_array($query)) {
			$temp[] = $rt;
		}
		return $temp;
	}
	function count(){
		return $this->_getConnection()->get_value("SELECT COUNT(*) AS count FROM ".$this->_tableName."");
	}
	function insertData($array){
		$array = $this->_checkData($array);
		if (!$array['name'] || !$array['tagcode']) {
			Showmsg('tpl_insert_data_error');
		}
		$this->_getConnection()->update("INSERT INTO ".$this->_tableName." SET ".pwSqlSingle($array,false));
		return $this->_getConnection()->insert_id();
	}
	function updataById($tplid,$array) {
		$array	= $this->_checkData($array);
		if (!$array) return null;
		$this->_getConnection()->update("UPDATE ".$this->_tableName." SET ".pwSqlSingle($array,false)." WHERE tplid=".pwEscape($tplid));
	}


	function _checkData($array) {
		if (!is_array($array)) return false;
		$strtct = $this->getStruct();
		foreach ($array as $key=>$value) {
			if (!in_array($key,$strtct)) {
				unset($array[$key]);
			}
		}
		return $array;
	}
	function getStruct() {
		return array('tplid','type','name','descrip','tagcode','image');
	}
}
?>