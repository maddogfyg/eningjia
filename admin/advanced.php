<?php
!function_exists('adminmsg') && exit('Forbidden');

$basename = $basename.'&admintype='.$admintype;
if ($admintype == 'mmemcache') {

	require_once R_P.'lib/memcache.class.php';
	$mcache = new PW_Memcache(false);

	if ($_POST['step'] == 2) {
		InitGP ( array ('host', 'port', 'isopen') );

		empty($host) && adminmsg ( "抱歉，服务器主机不能为空" );
		empty($port) && adminmsg ( "抱歉，服务器端口不能为空" );
		$isopen = (isset ( $isopen )) ? $isopen : 0;
		if ($isopen) {
			$errormsg = testSockopen($host,$port);
			if ($errormsg[0] != 1) {
				adminmsg($errormsg[1]);
			}
		}
		$db_memcache = array ('isopen' => $isopen, 'host' => $host, 'port' => $port );
		$db_datastore = $db_memcache['isopen'] ? 'memcache' : '';
		setConfig ( 'db_memcache', $db_memcache );
		setConfig ( 'db_datastore', $db_datastore );
		updatecache_c ();
		adminmsg("operate_success");
	} else {
		$ajax = GetGP('ajax');
		if ($ajax == 1 && strtolower ( $pwServer ['REQUEST_METHOD'] ) == 'post') {
			InitGP ( array ('host', 'port') );
			$errormsg = testSockopen($host,$port);
			showError($errormsg[1]);
		}
		$baseUrl = EncodeUrl ($basename);
		$configure =  $db_memcache ? $db_memcache : array('isopen'=>0,'host'=>'localhost','port'=>11211);
		($configure ['isopen'] == 0) ? $isopenCheck [0] = 'checked=checked' : $isopenCheck [1] = 'checked=checked';
		include PrintEot ('advanced');
	}
} elseif ($admintype == 'msphinx') {

	if ($_POST ['step'] == 2) {
		InitGP ( array ('host', 'port', 'isopen' ) );
		empty($host) && adminmsg ( "抱歉，服务器主机不能为空" );
		empty($port) && adminmsg ( "抱歉，服务器端口不能为空" );
		$isopen = (isset ( $isopen )) ? $isopen : 0;
		if ($isopen) {
			$errormsg = testSockopen($host,$port);
			if ($errormsg[0] != 1) {
				adminmsg($errormsg[1]);
			}
		}
		$sphinxData = array ('isopen' => $isopen, 'host' => $host, 'port' => $port );
		setConfig ( 'db_sphinx', $sphinxData );
		updatecache_c ();
		adminmsg("operate_success");

	} else {
		$ajax = GetGP('ajax');
		if ($ajax == 1 && strtolower ( $pwServer ['REQUEST_METHOD'] ) == 'post') {
			InitGP ( array ('host', 'port') );
			$errormsg = testSockopen($host,$port);
			showError($errormsg[1]);
		}
		$baseUrl = EncodeUrl ($basename);
		$configure = ($db_sphinx) ? $db_sphinx : array ('isopen' => 0, 'host' => 'localhost', 'port' => 3312 );
		($configure ['isopen'] == 0) ? $isopenCheck [0] = 'checked=checked' : $isopenCheck [1] = 'checked=checked';
		include PrintEot ( 'advanced' );
	}
}

function showError($error) {
	echo $error;
	ajax_footer ();
	exit ();
}

function testSockopen($host,$port){
	$errormsg = array();
	if ($host == '' || strlen ( $host ) < 8 || $port == '' || ! is_numeric ( $port )) {
		$errormsg = array(4,'服务器host地址或端口号不正确');
	} else {
		$fp = @fsockopen ( $host, $port, $errno, $errstr , 2 );
		if (! $fp) {
			$errstr = trim ( $errstr );
			$errormsg = array(2,"连接 {$host}:{$port} 服务器失败 (errno=$errno, msg=$errstr)");
		} else {
			$errormsg = array(1,"恭喜，服务器连接成功!");
		}
	}
	return $errormsg;
}
?>