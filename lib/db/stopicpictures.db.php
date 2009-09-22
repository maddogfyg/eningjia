<?php
! defined ( 'P_W' ) && exit ( 'Forbidden' );
class PW_STopicPicturesDB extends BaseDB {
	
	var $_tableName = "pw_stopicpictures";
	
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
		$this->_getConnection ()->update ( "UPDATE " . $this->_tableName . " SET " . $this->_getUpdateSqlString ( $fieldData ) . " WHERE id=" . $this->_addSlashes ( $id ) . " LIMIT 1" );
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
		$query = $this->_getConnection ()->query ( "SELECT * FROM " . $this->_tableName . " ORDER BY num DESC " );
		return $this->_getAllResultFromQuery ( $query );
	}
	
	function count() {
		return $this->_getConnection ()->get_value ( "SELECT COUNT(*) FROM " . $this->_tableName . " LIMIT 1" );
	}
	
	function getsByCategoryId($categoryId) {
		$query = $this->_getConnection ()->query ( "SELECT * FROM " . $this->_tableName . " WHERE categoryid=" . $this->_addSlashes ( $categoryId ) . " OR categoryid=0 ORDER BY num DESC " );
		return $this->_getAllResultFromQuery ( $query );
	}
	
	function countByCategoryId($categoryId) {
		return $this->_getConnection ()->get_value ( "SELECT COUNT(*) FROM " . $this->_tableName . " WHERE categoryid=" . $this->_addSlashes ( $categoryId ) . " OR categoryid=0 LIMIT 1" );
	}
	
	function updateByCategoryId($fieldData, $categoryId) {
		$fieldData = $this->_checkData ( $fieldData );
		if (! $fieldData)
			return null;
		$this->_getConnection ()->update ( "UPDATE " . $this->_tableName . " SET " . $this->_getUpdateSqlString ( $fieldData ) . " WHERE categoryid=" . $this->_addSlashes ( $categoryId ) );
		return $this->_getConnection ()->affected_rows ();
	}
	
	function increaseField($pictureId, $fieldName, $step = 1) {
		if (! in_array ( $fieldName, array ('num' ) ))
			return 0;
		$step = intval ( $step );
		if ($step == 0)
			return 0;
		$step = $step > 0 ? "+" . $step : $step;
		$this->_getConnection ()->update ( "UPDATE " . $this->_tableName . " SET $fieldName=$fieldName" . $step . " WHERE id=" . intval ( $pictureId ) . " LIMIT 1" );
		return $this->_getConnection ()->affected_rows ();
	}
	
	/**
	 * 背景图片允许字段
	 *
	 * @return array
	 */
	function getStruct() {
		return array ('id', 'categoryid', 'title', 'path', 'num', 'creator', 'createtime' );
	}
	
	function _checkData($data) {
		if (! is_array ( $data ) || ! count ( $data ))
			return false;
		$data = $this->_checkAllowField ( $data, $this->getStruct () );
		! isset ( $data ['createtime'] ) ? $data ['createtime'] = time () : '';
		return $data;
	}

}
?>