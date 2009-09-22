<?php
!defined('P_W') && exit('Forbidden');

class PW_DBCache {
	var $table = 'pw_datastore';
	var $connected = null;
	var $cache = null;
	var $now = null;

	function PW_DBCache() {
		$this->cache = $GLOBALS['db'];
		$this->now = $GLOBALS['timestamp'];
	}

	function flush() {
		$this->cache->update("TRUNCATE TABLE ".$this->table,false);
	}

	function delete($key) {
		$this->cache->update("DELETE FROM ".$this->table." WHERE skey=".pwEscape($key,false));
	}

	/**
	 * 批量更新缓存数据
	 *
	 * @param array $data 缓存数据,array('KEY'=>'VALUE')
	 * @param int $expire 缓存数据自动过期时间(秒)
	 * @return bool
	 */
	function update($data,$expire=180) {
		$values = '';$expire = $this->now + $expire;
		foreach ($data as $key=>$value) {
			$values .= ",(".pwEscape($key,false).",".pwEscape($this->_serialize($value),false).",".pwEscape($expire,false).")";
		}
		if ($values) {
			$values = trim($values,',');
			$this->cache->update("REPLACE INTO ".$this->table ." (skey,value,expire) VALUES $values");
		}
	}

	/**
	 * 更新指定KEY的缓存数据
	 *
	 * @param string $key 缓存KEY
	 * @param string $value
	 * @param int $expire
	 * @return bool
	 */
	function set($key,$value,$expire=180) {
		if ($expire > 0) {
			$this->cache->update("REPLACE INTO ".$this->table
				. " SET skey=" . pwEscape($key,false)
				. ",expire=" . pwEscape($this->now + $expire,false)
				. ",value=" . pwEscape($this->_serialize($value),false)
			);
		}
		$this->_expire();
	}

	/**
	 * 获取指定KEY的数据
	 *
	 * @param string|array $keys
	 * @return string|array
	 */
	function get($keys) {
		if (empty($keys)) return array();
		if (is_array($keys)) {
			$data = array();
			$query = $this->cache->query("SELECT * FROM ".$this->table
				. " WHERE expire > ".pwEscape($this->now,false)
				. " AND skey IN (".pwImplode($keys,false).")"
			);
			while ($rt = $this->cache->fetch_array($query)) {
				$data[$rt['skey']] = $this->_unserialize($rt['value']);
			}
		} else {
			$data = $this->cache->get_value("SELECT value FROM ".$this->table." WHERE expire < ".pwEscape($this->now,false)." AND skey=".pwEscape($keys,false));
			$data = $this->_unserialize($data);
		}
		return $data;
	}

	function _serialize($value) {
		if (!is_string($value) && !is_numeric($value)) {
			$value = serialize($value);
		}
		return $value;
	}
	function _unserialize($value) {
		if ($value && is_array($tmpValue = unserialize($value))) {
			$value = $tmpValue;
		}
		return $value;
	}
	function _expire() {
		$this->cache->update("DELETE FROM ".$this->table." WHERE expire<".pwEscape($this->now,false));
	}
}
?>