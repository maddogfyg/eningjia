<?php
!defined('P_W') && exit('Forbidden');
/*
dbs:
	pw_tpl
	pw_invoke
	pw_invokepiece

	pw_pushdata

	pw_stamp
	pw_cachedata

	pw_mpageconfig
*/
class PW_InvokeService {

/**	pw_tpl **/
	function getTpl($tplid) {
		return $this->_getTplDB()->getData($tplid);
	}
	function insertTpl($data) {
		$this->_getTplDB()->insertData($data);
	}
	function updateTpl($id,$data) {
		$this->_getTplDB()->updataById($id,$data);
		$this->_updateInvokeByTplId($id);
	}
/**	pw_invoke **/
	function getInvokeByName($invokename,$cateid=0) {
		return $this->_getInvokeDB()->getDataByName($invokename,$cateid);
	}
	function getInvokesByNames($names,$cateid=0,$type='') {
		return $this->_getInvokeDB()->getDatasByNames($names,$cateid,$type);
	}
	function updateInvokeByName($name,$data) {
		$this->_getInvokeDB()->updateByName($name,$data);
	}
	function getInvokeByTplId($tplid) {
		return $this->_getInvokeDB()->getByTplId($tplid);
	}

	function _updateInvokeByTplId($tplid) {
		$parsetpl	= L::loadClass('parsetpl');
		$tempInvokes	= $this->getInvokeByTplId($tplid);
		foreach ($tempInvokes as $invoke) {
			$parsetpl->init($tplid,$invoke['name'],$invoke['ifloop']);
			$parsecode	= $parsetpl->getParseCode();
			$this->updateInvokeByName($invoke['name'],array('parsecode'=>$parsecode));

			$this->deleteInovkePieceByInvokeName($invoke['name']);		//更新所属的invokepiece
			$invokepiece = $parsetpl->getConditoin();
			$this->insertInvokePieces($invokepiece);
		}
	}
/**	pw_invokepiece **/
	function getInvokePieceByInvokeId($id) {
		return $this->_getInvokePieceDB()->getDataById($id);
	}

	function getInvokePieceByInvokeName($invokename) {
		return $this->_getInvokePieceDB()->getDatasByInvokeName($invokename);
	}

	function getInvokePiecesByInvokeNames($names) {
		return $this->_getInvokePieceDB()->getDatasByInvokeNames($names);
	}

	function getInvokePieceByNameAndTitle($invokename,$title) {
		return $this->_getInvokePieceDB()->getDataByInvokeNameAndTitle($invokename,$title);
	}

	function updateInvokePieceById($id,$array) {
		$this->_getInvokePieceDB()->updateById($id,$array);
	}

	function insertInvokePiece($array) {
		return $this->_getInvokePieceDB()->insertData($array);
	}

	function insertInvokePieces($array) {
		$this->_getInvokePieceDB()->insertDatas($array);
	}
	function deleteInovkePieceByInvokeName($name) {
		$this->_getInvokePieceDB()->deleteByInvokeName($name);
	}
	function updateInvokePieces($array) {
		if (!is_array($array) || !$array) return false;
		foreach ($array as $key=>$value) {
			if (!is_array($value)) return false;
			$this->_updateInvokePiece($value);
		}
	}
	function _updateInvokePiece($array) {
		if (!isset($array['invokename']) || !isset($array['title'])) return false;
		$temp = $this->getInvokePieceByNameAndTitle($array['invokename'],$array['title']);
		if ($temp) {
			$this->updateInvokePieceById($temp['id'],$array);
		} else {
			$this->insertInvokePiece($array);
		}
	}

/**	pw_pushdata **/

	function getPushDataById($id) {
		return $this->_getPushDataDB()->getDataById($id);
	}

	function getPushDataEffect($invokepieceid,$fid=0,$loopid=0,$num = 10) {
		return $this->_getPushDataDB()->getEffectData($invokepieceid,$fid,$loopid,$num);
	}
	function getPushDataOverdue($invokepieceid,$fid=0,$loopid=0,$num = 10) {
		return $this->_getPushDataDB()->getOverdueData($invokepieceid,$fid,$loopid,$num);
	}
	function countEffectPushData($invokepieceid,$fid,$loopid) {
		return $this->_getPushDataDB()->countEffect($invokepieceid,$fid,$loopid);
	}
	function countOverduePushData($invokepieceid,$fid,$loopid) {
		return $this->_getPushDataDB()->countOverdue($invokepieceid,$fid,$loopid);
	}
	function insertPushData($array) {
		return $this->_getPushDataDB()->insertData($array);
	}
	function updatePushData($id,$array) {
		$this->_getPushDataDB()->update($id,$array);
	}
	function deletePushData($id) {
		$this->_getPushDataDB()->delete($id);
	}

	function deleteOverduePushData($invokepieceid,$fid,$loopid) {
		$this->_getPushDataDB()->deleteOverdues($invokepieceid,$fid,$loopid);
	}

/**	pw_stamp **/

	function getStampBlocks($stamp) {
		return $this->_getStampDB()->getBlocksByStamp($stamp);
	}
/**	pw_cachedata **/
	function updateCacheDataPiece($invokepieceid,$fid=0,$loopid=0) {
		$this->deleteCacheData($invokepieceid,$fid,$loopid);
		updateAreaStaticRefreshTime();
	}
	function deleteCacheData($invokepieceid,$fid=0,$loopid=0) {
		$this->_getCacheDataDB()->deleteData($invokepieceid,$fid,$loopid);
	}

/**	pw_mpageconfig **/

	function getMPageConfig($mode,$SCR,$fid=0) {
		$temp_fid	= $this->getMPageConfigFid($fid);
		return $this->_getMPageConfigDB()->getConfig($mode,$SCR,$temp_fid);
	}
	function getMPageConfigFid($fid) {
		return $this->_getMPageConfigDB()->getAreaFid($fid);
	}
	function getMPageConfigInvoke($db_mode,$SCR,$fid=0) {
		return $this->_getMPageConfigDB()->getInvokes($db_mode,$SCR,$fid);
	}


/** getDBs **/
	function _getTplDB() {
		return L::loadDB('Tpl');
	}
	function _getInvokeDB() {
		return L::loadDB('Invoke');
	}
	function _getInvokePieceDB() {
		return L::loadDB('InvokePiece');
	}

	function _getPushDataDB() {
		return L::loadDB('PushData');
	}
	function _getStampDB() {
		return L::loadDB('Stamp');
	}
	function _getCacheDataDB() {
		return L::loadDB('CacheData');
	}
	function _getMPageConfigDB() {
		return L::loadDB('MPageConfig');
	}
}
?>