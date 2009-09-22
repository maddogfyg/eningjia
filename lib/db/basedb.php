<?php

class BaseDB {

	function _getConnection() {
		//global
		return $GLOBALS['db'];
	}

	function _getUpdateSqlString($arr) {
		//global
		return pwSqlSingle($arr);
	}

	function _getAllResultFromQuery($query) {
		$result = array ();
		while ( $rt = $this->_getConnection ()->fetch_array ( $query ) ) {
			$result [] = $rt;
		}
		return $result;
	}

	function _checkAllowField($fieldData,$allowFields) {
		foreach ($fieldData as $key=>$value) {
			if (!in_array($key,$allowFields)) {
				unset($fieldData[$key]);
			}
		}
		return $fieldData;
	}

	function _addSlashes($var) {
		//global
		return pwEscape($var);
	}

	function _getImplodeString($string,$strip=true) {
		return pwImplode($string,$strip);
	}
}

?>