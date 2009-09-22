<?php
! function_exists ( 'adminmsg' ) && exit ( 'Forbidden' );
$basename = "$admin_file?adminjob=ipstates";

if ($action != 'submit' && $action != 'ipIndex') {
	
	ifcheck ( $db_ipstates, 'ipstates' );
	include PrintEot ( 'ipstates' );

} elseif ($_POST ['action'] == "submit") {
	
	InitGP ( array ('ipstates' ), 'P' );
	setConfig ( 'db_ipstates', $ipstates );
	
	$navMenu = L::loadClass ( 'navmenu' );
	$navMenu->settype ( 'bbs_navinfo' );
	$navMenu->setshow ( 'sort_ipstate', $ipstates );
	$navMenu->cache ();
	adminmsg ( 'operate_success' );
} elseif ($action == "ipIndex") {
	@include_once (R_P . 'lib/ipTable.class.php');
	$ipTable = new PW_IPTable ( );
	$ipTable->createIpIndex ();
	adminmsg ( 'operate_success' );
}
?>