<?php
!defined('M_P') && exit('Forbidden');
!defined('USED_HEAD') && define('USED_HEAD', 1);
define('F_M',true);

extract(L::style(null, 'wind'));

if (!defined('MSG')) {
	if (in_array($q,array('write','diary','share','article','photos','groups','group','galbum','friend', 'home','myapp','app','board', 'browse','invite','hot'))) {
		if ($space == 1) {
			$pwModeCss = $imgpath.'/apps/browse-style.css';
		} else {
			$pwModeCss = $imgpath.'/apps/app-style.css';
		}
	} elseif ($q == 'user'){
		$pwModeCss = $imgpath.'/apps/browse-style.css';
	} else {
		$pwModeCss = $imgpath.'/apps/index-style.css';
	}
} else {
	$pwModeCss = $imgpath.'/apps/app-style.css';
}

if($q == 'home') {
	$baseUrl = 'mode.php?m=' . $m.'&';
}

list($_Navbar,$_LoginInfo) = pwNavBar();
require_once PrintEot('header');
unset($_Navbar,$pwModeCss);
?>