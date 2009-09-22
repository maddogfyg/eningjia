<?php
!defined('P_W') && exit('Forbidden');
/**
$_memcache = array(
	'host'	=> '127.0.0.1',
	'port'	=> 11211,
	'expire'=> 15
);
*/

/**
 * memcached缓存插件，需服务器环境支持
 *
 */
class PW_Memcache {
	var $cache = null;
	var $connected = null;
	var $config = array();

	/**
	 * 根据默认配置自动连接Memcahce服务器,当参数为TRUE时
	 *
	 * @param bool $connect
	 * @return PW_Memcache
	 */
	function PW_Memcache($connect = true) {
		if ($this->exists()) {
			$this->cache = new Memcache;
			if ($connect) {
				$this->config = $GLOBALS['db_memcache'] ? $GLOBALS['db_memcache'] : array('host'=>'localhost','port'=>11211);
				$this->connect();
			}
		}
	}

	function addServer($host,$port) {
		$this->config[] = array('host'=>$host,'port'=>$port);
	}

	/**
	 * 连接Memcache服务器
	 *
	 */
	function connect ($force = false) {
		if ($force && $this->isConnected()) {
			$this->close();
		}
		if (is_null($this->connected)) {
			$this->connected = true;
			if (isset($this->config[0])) {
				if (method_exists($this->cache, 'addServer')) {
					foreach ($this->config as $value) {
						$this->cache->addServer($value['host'],$value['port']);
					}
				} elseif (!$this->cache->connect($this->config[0]['host'],$this->config[0]['port'])) {
					$this->connected = false;
				}
			} elseif (!$this->cache->connect($this->config['host'],$this->config['port'])) {
				$this->connected = false;
			}
		}
	}

	function close() {
		if ($this->isConnected()) {
			$this->cache->close();
			$this->connected = null;
		}
	}

	/**
	 * 清空memcache缓存
	 *
	 * @return bool
	 */
	function flush() {
		if (!$this->isConnected()) return false;
		return $this->cache->flush();
	}

	/**
	 * 删除指定KEY的数据
	 *
	 * @param string $key
	 * @return bool
	 */
	function delete($key) {
		if (!$this->isConnected()) return false;
		return $this->cache->delete($key,10);
	}

	/**
	 * 批量更新memcache缓存数据
	 *
	 * @param array $data 缓存数据,array('KEY'=>'VALUE')
	 * @param int $expire 缓存数据自动过期时间(秒)
	 * @return bool
	 */
	function update($data,$expire=30) {
		if (!$this->isConnected()) return false;
		foreach ($data as $key=>$value) {
			$this->set($key,$value,$expire);
		}
		return true;
	}

	/**
	 * 更新指定KEY的缓存数据
	 *
	 * @param string $key 缓存KEY
	 * @param string $value
	 * @param int $expire
	 * @return bool
	 */
	function set($key,$value,$expire=30) {
		if (!$this->isConnected()) return false;
		return $this->cache->set($key,$value,MEMCACHE_COMPRESSED,$expire);
	}

	/**
	 * 获取指定KEY的数据
	 *
	 * @param string|array $keys
	 * @return string|array
	 */
	function get($keys) {
		if (!$this->isConnected()) return false;
		return $this->cache->get($keys);
	}

	/**
	 * 获取Memcache实例化对象
	 *
	 * @return object
	 */
	function &getMemcache() {
		if (!is_object($this->cache)) {
			$this->cache = new Memcache;
		}
		return $this->cache;
	}

	function isConnected() {
		return $this->connected === true ? true : false;
	}

	/**
	 * 检查环境是否支持memcache组件
	 *
	 * @return bool
	 */
	function exists() {
		if (class_exists('Memcache')) {
			return true;
		}
		return false;
	}
}
?>