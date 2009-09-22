<?php
! defined ( 'P_W' ) && exit ( 'Forbidden' );
class PW_STopicCategoryDB extends BaseDB {
	
	var $_tableName = "pw_stopiccategory";
	
	function add($fieldData) {
		$fieldData = $this->_checkData ( $fieldData );
		if (! $fieldData)
			return null;
		$this->_getConnection ()->update ( "INSERT INTO " . $this->_tableName . " SET " . $this->_getUpdateSqlString ( $fieldData ) );
		return $this->_getConnection ()->insert_id ();
	}
	
	function update($fieldData, $id) {
		$fieldData = $this->_checkData ( $fieldData );
		if (! $fieldData)
			return null;
		$this->_getConnection ()->update ( "UPDATE " . $this->_tableName . " SET " . $this->_getUpdateSqlString ( $fieldData ) . "WHERE id=" . $this->_addSlashes ( $id ) . " LIMIT 1" );
		return $this->_getConnection ()->affected_rows ();
	}
	
	function delete($id) {
		$this->_getConnection ()->update ( "DELETE FROM " . $this->_tableName . " WHERE id=" . $this->_addSlashes ( $id ) . " LIMIT 1" );
		return $this->_getConnection ()->affected_rows ();
	}
	
	function get($id) {
		return $this->_getConnection ()->get_one ( "SELECT * FROM " . $this->_tableName . " WHERE id=" . $this->_addSlashes ( $id ) . " LIMIT 1" );
	}
	
	function gets() {
		$query = $this->_getConnection ()->query ( "SELECT * FROM " . $this->_tableName . " " );
		return $this->_getAllResultFromQuery ( $query );
	}
	
	function count() {
		return $this->_getConnection ()->get_value ( "SELECT COUNT(*) FROM " . $this->_tableName . " LIMIT 1" );
	}
	
	/**
	 * 分类允许字段
	 *
	 * @return array
	 */
	function getStruct() {
		return array ('id', 'title', 'status', 'num', 'creator', 'createtime' );
	}
	
	function _checkData($data) {
		if (! is_array ( $data ) || ! count ( $data ))
			Showmsg ( 'data_is_not_array' );
		$data = $this->_checkAllowField ( $data, $this->getStruct () );
		return $data;
	}
}
?>