<?php
!defined('P_W') && exit('Forbidden');
/*
dbs:
	pw_stopic
	pw_stopicCategory
	pw_stopicPicture

	pw_stopicBlock
	pw_stopicUnit
*/
class PW_STopicService {
	var $_stopicConfig = null;

	function getLayoutList() {
		$layoutTypes= $this->_getSTopicConfig('layoutTypes');
		$layoutList	= array ();
		foreach ( $layoutTypes as $typeName => $typeDesc ) {
			$tmp = $this->getLayoutInfo ($typeName);
			if ($tmp)
				$layoutList [$typeName] = $tmp;
		}
		return $layoutList;
	}

	function getLayoutInfo($typeName) {
		$stopicConfig = $this->_getSTopicConfig ();
		$checkDir = $stopicConfig ['layoutPath'] . $typeName . "/";
		if (! is_dir ( $checkDir ))
			return false;

		foreach ( $stopicConfig ['layoutConfig'] as $checkFile ) {
			if (! is_file ( $checkDir . $checkFile ))
				return false;
		}
		$checkData = array ();
		$checkData ['logo'] = $stopicConfig ['layoutBaseUrl'] . $typeName . "/" . $stopicConfig ['layoutConfig'] ['logo'];
		$checkData ['html'] = $checkFile . $stopicConfig ['layoutConfig'] ['html'];
		$checkData ['desc'] = $stopicConfig ['layoutTypes'] [$typeName];
		return $checkData;
	}
	function getLayoutDefaultSet() {
		return $this->_getSTopicConfig('layout_set');
	}

	function getLayoutSet($style) {
		$stylePath = $this->_getSTopicConfig('stylePath');
		if ($style && is_dir($stylePath.$style)) {
			return $this->getStyleConfig($style,'layout_set');
		}
		return $this->getLayoutDefaultSet();
	}

	function getStyles() {
		$stylePath = $this->_getSTopicConfig('stylePath');
		$fp	= opendir($stylePath);
		$styles	= array();
		while ($styleDir = readdir($fp)) {
			if (in_array($styleDir,array('.','..')) || strpos($styleDir,'.')!==false) continue;
			$styles[$styleDir] = array(
				'name'=>$this->getStyleConfig($styleDir,'name'),
				'minipreview'=>$this->getStyleMiniPreview($styleDir),
				'preview'=>$this->getStylePreview($styleDir),
			);
		}
		return $styles;
	}

	function getStyleMiniPreview($style) {
		return $this->_getSTopicConfig('styleBaseUrl').$style.'/'.$this->_getSTopicConfig('styleMiniPreview');
	}
	function getStylePreview($style) {
		return $this->_getSTopicConfig('styleBaseUrl').$style.'/'.$this->_getSTopicConfig('stylePreview');
	}
	function getStyleBanner($style) {
		$temp = $this->getStyleConfig($style,'banner');
		if ($temp) {
			if (strpos($temp,'http')===false) {
				$temp = $GLOBALS['db_bbsurl'].'/'.$temp;
			}
			return $temp;
		}
		if ($style && file_exists($this->_getSTopicConfig('stylePath').$style.'/'.$this->_getSTopicConfig('styleBanner'))) {
			return $this->_getSTopicConfig('styleBaseUrl').$style.'/'.$this->_getSTopicConfig('styleBanner');
		}
		return 'http://';
	}

	function getStyleConfig($style,$key='') {
		static $styles = array();
		if (!isset($styles[$style])) {
			$stylePath = $this->_getSTopicConfig('stylePath');
			if (file_exists($stylePath.$style.'/config.php')) {
				$styles[$style] = include $stylePath.$style."/config.php";
			} else {
				$styles[$style] = array();
			}
		}
		if ($key) {
			return isset($styles[$style][$key]) ? $styles[$style][$key] : '';
		}
		return $styles[$style];
	}

	function creatStopicHtml($stopic_id) {
		global $db_charset,$wind_version,$db_bbsurl;
		$stopic	= $this->getSTopicInfoById($stopic_id);
		if (!$stopic) return false;
		$tpl_content	= $this->getStopicContent($stopic_id,0);
		@extract($stopic, EXTR_SKIP);
		if (defined('A_P')) {
			include(A_P.'template/stopic.htm');
		} else {
			include(R_P.'apps/stopic/template/stopic.htm');
		}
		$output = str_replace(array('<!--<!---->','<!---->'),array('',''),ob_get_contents());
		ob_end_clean();
		$stopicDir	= $this->getStopicDir($stopic_id);
		writeover($stopicDir,$output);

		ObStart();
	}

	function addSTopic($fieldsData) {
		if (!is_array($fieldsData) || !count($fieldsData)) return 0;
		$fieldsData['create_date'] = time();

		$stopicId = $this->_getSTopicDB()->add($fieldsData);
		if ($stopicId && isset($fieldsData['copy_from']) && $fieldsData['copy_from']) $this->_getSTopicDB()->increaseField($fieldsData['copy_from'], 'used_count');
		if ($stopicId && isset($fieldsData['bg_id']) && $fieldsData['bg_id']) $this->_getSTopicPicturesDB()->increaseField($fieldsData['bg_id'], 'num');
		return $stopicId;
	}

	function deleteSTopics($stopicIds) {
		$success = 0;
		foreach ( $stopicIds as $stopicId ) {
			$success += $this->deleteSTopicById ( $stopicId );
		}
		return $success;
	}

	function deleteSTopicById($stopicId) {
		$stopicData = $this->_getSTopicDB()->get($stopicId);
		if (null == $stopicData) return false;
		$isSuccess = (bool) $this->_getSTopicDB()->delete($stopicId);
		if ($isSuccess && $stopicData['bg_id']) $this->_getSTopicPicturesDB()->increaseField($stopicData['bg_id'], 'num', -1);
		if ($isSuccess) $this->_delFile($this->getStopicDir($stopicId));
		return $isSuccess;
	}

	function _delFile($fileName) {
		return P_unlink($fileName);
	}

	function updateSTopicById($stopicId, $updateData) {
		$stopicData = $this->_getSTopicDB()->get($stopicId);
		if (null == $stopicData) return false;

		$isSuccess = (bool) $this->_getSTopicDB()->update($stopicId,$updateData);
		if ($isSuccess && isset($updateData['bg_id']) && $updateData['bg_id'] != $stopicData['bg_id']) {
			if ($stopicData['bg_id']) $this->_getSTopicPicturesDB()->increaseField($stopicData['bg_id'], 'num', -1);
			if ($updateData['bg_id']) $this->_getSTopicPicturesDB()->increaseField($updateData['bg_id'], 'num');
		}
		return $isSuccess;
	}

	function getSTopicInfoById($stopicId) {
		static $stopics = array();
		if (!isset($stopics[$stopicId])) {
			$stopics[$stopicId] = $this->_getSTopicDB()->get($stopicId);
			$stopics[$stopicId]['bg_url'] = $stopics[$stopicId]['bg_id'] ? $this->_getBackgroundUrl($stopics[$stopicId]['bg_id']) : "";
		}
		return $stopics[$stopicId];
	}

	function countSTopic($keyword = '', $categoryId = 0) {
		return $this->_getSTopicDB()->countByKeyWord ($keyword, $categoryId);
	}

	function findSTopicInPage($page, $perPage, $keyword = '', $categoryId = 0) {
		$page = intval ( $page );
		$perPage = intval ( $perPage );
		if ($page <= 0 || $perPage <= 0) return array ();
		$result	= $this->_getSTopicDB()->findByKeyWordInPage($page, $perPage, $keyword, $categoryId);
		foreach ($result as $key=>$value) {
			$result[$key]['url'] = $this->getStopicUrl($value['stopic_id']);
			$result[$key]['create_date'] = get_date($value['create_date']);
		}
		return $result;
	}

	function findValidCategorySTopicInPage($page, $perPage, $categoryId = 0) {
		$page = intval ( $page );
		$perPage = intval ( $perPage );
		if ($page <= 0 || $perPage <= 0)
			return array ();

		return $this->_getSTopicDB()->findValidByCategoryIdInPage ( $page, $perPage, $categoryId );
	}

	function findUsefulSTopicInCategory($limit, $categoryId = 0) {
		$limit = intval ( $limit );
		if ($limit <= 0) return array ();

		return $this->_lardBackground($this->_getSTopicDB()->findByCategoryIdOrderByUsedInPage(1, $limit, $categoryId));
	}

	function getStopicDir($stopic_id) {
		$stopic_id = (int) $stopic_id;
		if (!$stopic_id) return false;
		$stopicDir	= Pcv($this->_getSTopicConfig('htmlDir'));
		if (!file_exists($stopicDir)) {
			if (mkdir($stopicDir)) {
				@chmod($stopicDir,0777);
			} else {
				showmsg('stopic_htm_is_not_777');
			}
		}
		return $stopicDir.'/'.$stopic_id.$this->_getSTopicConfig('htmlSuffix');
	}

	function getStopicUrl($stopic_id) {
		$stopicDir = $this->getStopicDir($stopic_id);
		if ($stopicDir && file_exists($stopicDir)) {
			return $this->_getSTopicConfig('htmlUrl').'/'.$stopic_id.$this->_getSTopicConfig('htmlSuffix');
		} else {
			return false;
		}
	}

	function getStopicContent($stopic_id,$ifadmin) {
		$stopic	= $this->getSTopicInfoById($stopic_id);
		$units	= $this->getStopicUnitsByStopicId($stopic_id);
		$blocks	= $this->getBlocks();

		$parseStopicTpl	= L::loadClass('ParseStopicTpl','stopic');
		$tpl_content	= $parseStopicTpl->exute($this,$stopic,$units,$blocks,$ifadmin);
		return $tpl_content;
	}

	/**
	 * 新增一个专题分类
	 *
	 * @param array $fieldData
	 * @return lastInsertId or null
	 */
	function addCategory($fieldData) {
		return $this->_getSTopicCategoryDB()->add($fieldData);
	}

	/**
	 * 更新一个专题分类
	 *
	 * @param array $fieldData
	 * @param int $categoryId
	 * @return affected_rows or null
	 */
	function updateCategory($fieldData, $categoryId) {
		$categoryId = intval ( $categoryId );
		if ($categoryId<= 0) {
			return NULL;
		}
		return $this->_getSTopicCategoryDB()->update($fieldData,$categoryId);
	}

	/**
	 * 删除一个专题分类 同时更新背景分类
	 *
	 * @param int $categoryId
	 * @return affected_rows or null
	 */
	function deleteCategory($categoryId) {
		$categoryId = intval ( $categoryId );
		if ($categoryId <= 0 || ! $this->isAllowDeleteCategory ( $categoryId )) {
			return NULL;
		}
		return ($this->_getSTopicCategoryDB()->delete ( $categoryId )) ? $this->_getSTopicPicturesDB()->updateByCategoryId ( array("categoryid"=>0),$categoryId ) : NULL;
	}

	/**
	 * 是否允许删除分类
	 * 默认专题不能删除/分类下如果有专题不能删除
	 *
	 * @param int $categoryId
	 * @return bool
	 */
	function isAllowDeleteCategory($categoryId) {
		if ($this->_getSTopicDB()->countByCategoryId($categoryId)) return false;
		$category = $this->_getSTopicCategoryDB()->get($categoryId);
		if (!$category || $category['status'] == 1) return false;
		return true;
	}

	/**
	 * 获取所有专题分类
	 *
	 * @return array
	 */
	function getCategorys() {
		return $this->_getSTopicCategoryDB()->gets ();
	}

	/**
	 * 获取某个分类信息
	 *
	 * @return array
	 */
	function getCategory($categoryId) {
		return $this->_getSTopicCategoryDB()->get ( $categoryId );
	}

	/**
	 * 上传背景图片 并增加一条图片 记录
	 *
	 * @param array $fileArray
	 * @return picture name like[20090819152809.jpg]
	 */
	function uploadPicture($fileArray, $categoryId, $creator) {
		if (count ( $fileArray ) < 0 || intval ( $categoryId ) < 0 || trim ( $creator ) == "") {
			return null;
		}
		$filename = $this->_setUploadPictureClass ()->upload ( $fileArray );
		if ($filename === FALSE) {
			return null;
		}
		$fieldData = array (
			"title" => time(),
			"categoryid" => intval($categoryId),
			"path" => trim ($filename),
			"creator" => $creator
		);
		return $this->_getSTopicPicturesDB()->add ( $fieldData );
	}

	function _setUploadPictureClass() {
		$tempUpdatePicture = L::loadClass('UpdatePicture','stopic');
		$tempUpdatePicture->init($this->_getSTopicConfig ('bgUploadPath'));
		return $tempUpdatePicture;
		//return new UpdatePicture ($this->_getSTopicConfig ('bgUploadPath'));
	}

	/**
	 * 更新背景图片
	 *
	 * @param int $fieldData
	 * @param int $pictureId
	 * @return affected_rows or null
	 */
	function updatePicture($fieldData, $pictureId) {
		$pictureId = intval ( $pictureId );
		if ($pictureId <= 0) {
			return NULL;
		}
		return $this->_getSTopicPicturesDB()->update($fieldData,$pictureId);
	}

	/**
	 * 删除背景图片 删除数据并删除物理图片
	 *
	 * @param int $pictureId
	 * @return affected_rows or null
	 */
	function deletePicture($pictureId) {
		$pictureId = intval ( $pictureId );
		if ($pictureId <= 0) return null;
		if (!$this->isAllowDeletePicture($pictureId)) return null;
		$picture = $this->_getSTopicPicturesDB()->get($pictureId);
		if (!$picture) return null;
		return ($this->_getSTopicPicturesDB()->delete ( $pictureId )) ? $this->_setUploadPictureClass ()->delete ( $picture ['path'] ) : "";
	}

	/**
	 * 是否允许删除背景图片
	 *
	 * @param int $pictureId
	 * @return bool
	 */
	function isAllowDeletePicture($pictureId) {
		return $this->_getSTopicDB()->countByBackgroundId($pictureId) ? false : true;
	}

	/**
	 * 获取背景图片
	 *
	 * @param int $categoryId 分类id，为0则找所有
	 * @return array
	 */
	function getPictures($categoryId = 0) {
		$categoryId = intval ( $categoryId );
		if ($categoryId < 0) return array();

		return $this->_lardBackground( $categoryId
			? $this->_getSTopicPicturesDB()->getsByCategoryId ($categoryId)
			: $this->_getSTopicPicturesDB()->gets() );
	}

	function getPicturesAndDefaultBGs($categoryId = 0) {
		$defaults = $this->_getDefaultBackGrounds();
		$thisTypePictures = $this->getPictures($categoryId);
		return array_merge($defaults,$thisTypePictures);
	}

	function _getBackgroundUrl($bgId) {
		if ($bgId<0) return $this->_getDefaultBackgroundUrl($bgId);

		$bg = $this->_getSTopicPicturesDB()->get($bgId);
		return $bg['path'] ? $this->_getSTopicConfig ('bgBaseUrl') . $bg ['path'] : "";
	}

	function _getDefaultBackgroundUrl($bgId) {
		$bgId = (int) $bgId;
		$bgId = abs($bgId);
		if (file_exists($this->_getSTopicConfig('bgDefalutPath').$bgId.'.jpg')) {
			return $this->_getSTopicConfig('bgDefalutUrl').$bgId.'.jpg';
		}
		return '';
	}

	function _getDefaultBackGrounds() {
		$backPath = $this->_getSTopicConfig('bgDefalutPath');
		$fp	= opendir($backPath);
		$backs	= array();

		while ($back = readdir($fp)) {
			if (in_array($back,array('.','..')) || !strpos($back,'.jpg')) continue;
			$id	= $this->_getDefaultBackGroudId($back);
			$backs[] = array(
				'id'	=> $id,
				'categoryid'	=> 'defalut',
				'thumb_url'	=> $this->_getDefaultBackgroundUrl($id)
			);
		}
		return $backs;
	}
	function _getDefaultBackGroudId($filename) {
		$temp = (int) $filename;
		if (!$temp || $temp<0) return false;
		return 0-$temp;
	}

	/**
	 * 统计背景图片个数
	 *
	 * @param int $categoryId 分类id，为0则统计所有
	 * @return number
	 */
	function countPictures($categoryId = 0) {
		return $categoryId ? $this->_getSTopicPicturesDB()->countByCategoryId($categoryId) : $this->_getSTopicPicturesDB()->count();
	}

	function _lardBackground($bgList) {
		foreach ( $bgList as &$bg ) {
			$bg ['thumb_url'] = $bg ['path'] ? $this->_getSTopicConfig ('bgBaseUrl') . "thumb_" . $bg ['path'] : "";
		}
		unset ( $bg );
		return $bgList;
	}

	function addBlock($fieldData) {
		$fieldData = $this->_completeBlockFields($fieldData);

		return $this->_getSTopicBloackDB()->add($fieldData);
	}

	function replaceBlock($fieldData) {
		$fieldData = $this->_completeBlockFields($fieldData);
		return $this->_getSTopicBloackDB()->replace($fieldData);
	}

	function updateBlock($block_id,$fieldData) {
		$fieldData = $this->_completeBlockFields($fieldData);
		return $this->_getSTopicBloackDB()->update($block_id,$fieldData);
	}

	function getBlocks() {
		static $blocks;
		if (!$blocks) {
			$blocks	= $this->_getSTopicBloackDB()->gets();
		}
		return $blocks;
	}

	function getBlockById($id) {
		return $this->_getSTopicBloackDB()->get($id);
	}

	function _completeBlockFields($fieldData) {
		$parseStopicBlock = L::loadClass('ParseStopicBlock','stopic');
		$parseStopicBlock->execut($fieldData['tagcode']);
		$fieldData['begin']	= $parseStopicBlock->getBegin();
		$fieldData['loops']	= $parseStopicBlock->getLoops();
		$fieldData['end']	= $parseStopicBlock->getEnd();
		$fieldData['config']	= $parseStopicBlock->getConfig();
		$fieldData['replacetag']	= $parseStopicBlock->getReplacetag();
		return $fieldData;
	}

	function addUnit($fieldData) {
		return $this->_getSTopicUnitDB()->add($fieldData);
	}

	function updateUnitByFild($stopic_id,$html_id,$fieldData) {
		return $this->_getSTopicUnitDB()->updateByFild($stopic_id,$html_id,$fieldData);
	}

	function deleteUnits($stopic_id,$html_ids) {
		return $this->_getSTopicUnitDB()->deletes($stopic_id,$html_ids);
	}

	function getStopicUnitsByStopicId($stopic_id) {
		return $this->_getSTopicUnitDB()->getStopicUnits($stopic_id);
	}

	function getStopicUnitByStopic($stopic_id,$html_id) {
		return $this->_getSTopicUnitDB()->getByStopicAndHtml($stopic_id,$html_id);
	}

	function getHtmlData($data,$block) {
		$temp	= $block['begin'];
		$temp	.= $this->_getUnitLoopsData($data,$block);
		$temp	.= $block['end'];
		return $temp;
	}

	function _getUnitLoopsData($data,$block) {
		$temp = '';
		foreach ($data as $key=>$value) {
			$temp .= str_replace($block['replacetag'],$value,$block['loops']);
		}
		return $temp;
	}
/*
调用各个DB相对应的DB类
*/
	function _getSTopicDB() {
		return L::loadDB('STopic');
	}
	function _getSTopicPicturesDB() {
		return L::loadDB('STopicPictures');
	}
	function _getSTopicCategoryDB() {
		return L::loadDB('STopicCategory');
	}
	function _getSTopicUnitDB() {
		return L::loadDB('STopicUnit');
	}
	function _getSTopicBloackDB() {
		return L::loadDB('STopicBlock');
	}

	function _getSTopicConfig($key = '') {
		if (null == $this->_stopicConfig) {
			$this->_stopicConfig = include A_P."config.php";
		}
		if ($key) {
			return $this->_stopicConfig[$key];
		}
		return $this->_stopicConfig;
	}
}
?>