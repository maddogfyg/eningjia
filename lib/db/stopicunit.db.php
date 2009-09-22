<?php
!defined('P_W') && exit('Forbidden');
class PW_STopicUnitDB extends BaseDB{
	var $_tableName = "pw_stopicunit";

	function add($fieldsData) {
		$fieldsData = $this->_checkData($fieldsData);
		if (!$fieldsData) return null;
		$this->_getConnection()->update("INSERT INTO ".$this->_tableName." SET " . $this->_getUpdateSqlString($fieldsData));
		return $this->_getConnection()->insert_id();
	}

	function delete($unit_id) {
		$this->_getConnection()->update("DELETE FROM ".$this->_tableName." WHERE unit_id=". $this->_addSlashes($unit_id) ." LIMIT 1");
		return $this->_getConnection()->affected_rows();
	}

	function deletes($stopic_id,$html_ids) {
		$this->_getConnection()->update("DELETE FROM ".$this->_tableName." WHERE stopic_id=". $this->_addSlashes($stopic_id) ."  AND html_id IN(".$this->_getImplodeString($html_ids).")");
		return $this->_getConnection()->affected_rows();
	}

	function update($unit_id, $updateData) {
		$updateData = $this->_checkData($updateData);
		if (!$updateData) return null;
		$this->_getConnection()->update("UPDATE ".$this->_tableName." SET " . $this->_getUpdateSqlString($updateData) . " WHERE unit_id=". $this->_addSlashes($unit_id) ." LIMIT 1");
		return $this->_getConnection()->affected_rows();
	}

	function updateByFild($stopic_id,$html_id,$updateData) {
		$updateData = $this->_checkData($updateData);
		if (!$updateData) return null;
		$this->_getConnection()->update("UPDATE ".$this->_tableName." SET " . $this->_getUpdateSqlString($updateData) . " WHERE stopic_id=". $this->_addSlashes($stopic_id) ." AND html_id=".$this->_addSlashes($html_id)." LIMIT 1");
		return $this->_getConnection()->affected_rows();
	}

	function get($unit_id) {
		$data = $this->_getConnection()->get_one("SELECT * FROM ".$this->_tableName." WHERE unit_id=".$this->_addSlashes($unit_id));
		if (!$data) return null;
		return $this->_unserializeData($data);
	}
	function getStopicUnits($stopic_id) {
		$query = $this->_getConnection()->query("SELECT * FROM ".$this->_tableName." WHERE stopic_id=".$this->_addSlashes($stopic_id));
		$result = array ();
		while ( $rt = $this->_getConnection ()->fetch_array ( $query ) ) {
			$result[$rt['html_id']] = $this->_unserializeData($rt);
		}
		return $result;
	}

	function getByStopicAndHtml($stopic_id,$html_id){
		$data = $this->_getConnection()->get_one("SELECT * FROM ".$this->_tableName." WHERE stopic_id=".$this->_addSlashes($stopic_id)."AND html_id=".$this->_addSlashes($html_id));
		if (!$data) return null;
		return $this->_unserializeData($data);
	}

	function getStruct() {
		return array('unit_id','stopic_id','html_id','block_id','title','data');
	}

	function _checkData($data){
		if (!is_array($data) || !count($data)) return false;
		$data = $this->_checkAllowField($data,$this->getStruct());
		$data = $this->_serializeData($data);
		return $data;
	}
	function _serializeData($data) {
		if (isset($data['data']) && is_array($data['data'])) {
			writeover(D_P.'data/test.txt',print_r($data['data'],1));

			foreach ($data['data'] as $key=>$value) {
				if (!is_array($value)) continue;
				foreach ($value as $k=>$val) {
					$data['data'][$key][$k] = stripslashes($val);
				}
				//$data['data'][$key] = stripslashes($value);

			}

			$data['data'] = serialize($data['data']);
		}
		return $data;
	}
	function _unserializeData($data) {
		if ($data['data']) $data['data'] = unserialize($data['data']);
		return $data;
	}
}
?>