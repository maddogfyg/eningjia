<?php
/**
 * 贴子管理操作类
 */
class PW_ThreadManager {

    var $_tableName = 'pw_threads';
    var $_memcache = FALSE;

    function PW_ThreadManager() {
        $this->_memcache = $GLOBALS['db_memcache'];
    }

    function deleteByThreadId($forumId,$threadId) {
        if($threadId<1) {
            return false;
        }
        $this->_getConnection()->update("DELETE FROM ".$this->_tableName." WHERE tid=".pwEscape($threadId));
        $result =  $this->_getConnection ()->affected_rows ();
        if($result && $this->_memcache){
            $this->_getThreadList()->removeThreadIdsByForumId($forumId,$threadId);
        }
		$threads = L::loadClass('Threads');
		$threads->delThreads($threadId);
        return $result;
    }

    function deleteByThreadIds($forumId,$threadIds) {
		if (empty($threadIds) || empty($forumId)) return null;
        if(is_array($threadIds)) {
			$threads = L::loadClass('Threads');
			$threads->delThreads($threadIds);
            $threadIds = pwImplode($threadIds);
        }
        $this->_getConnection()->update("DELETE FROM ".$this->_tableName." WHERE tid in(".$threadIds.")");
        $result =  $this->_getConnection ()->affected_rows ();
        if($result && $this->_memcache){
            $this->_getThreadList()->refreshThreadIdsByForumId($forumId);
        }
        return $result;
    }

    function deleteByForumId($forumId) {
        if($forumId<1) {
            return false;
        }
        $this->_getConnection()->update("DELETE FROM ".$this->_tableName." WHERE fid=".pwEscape($forumId));
        $result =  $this->_getConnection ()->affected_rows ();
        if($result && $this->_memcache){
            $this->_getThreadList()->clearThreadIdsByForumId($forumId);
        }
        return $result;
    }

    function deleteByAuthorId($authorId) {
        if($authorId<1) {
            return false;
        }
        $this->_getConnection()->update("DELETE FROM ".$this->_tableName." WHERE authorid=".pwEscape($authorId,false));
        return $this->_getConnection ()->affected_rows ();
    }

    function _getThreadList() {
        require_once R_P."lib/threadlist.class.php";
        return new PW_ThreadList();
    }

    function _getConnection() {
        return $GLOBALS['db'];
    }
}

?>
