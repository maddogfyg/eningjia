<?php
$forum=array(
	'1' => array(
		'fid' => '1',
		'fup' => '0',
		'ifsub' => '0',
		'childid' => '1',
		'type' => 'category',
		'name' => '互动',
		'style' => '0',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
	'2' => array(
		'fid' => '2',
		'fup' => '1',
		'ifsub' => '0',
		'childid' => '0',
		'type' => 'forum',
		'name' => '有问有答',
		'style' => '0',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
	'3' => array(
		'fid' => '3',
		'fup' => '1',
		'ifsub' => '0',
		'childid' => '0',
		'type' => 'forum',
		'name' => '业主交流',
		'style' => '0',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
	'4' => array(
		'fid' => '4',
		'fup' => '0',
		'ifsub' => '0',
		'childid' => '1',
		'type' => 'category',
		'name' => '装修',
		'style' => '0',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
	'8' => array(
		'fid' => '8',
		'fup' => '4',
		'ifsub' => '0',
		'childid' => '0',
		'type' => 'forum',
		'name' => '装修宝典',
		'style' => '0',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
	'5' => array(
		'fid' => '5',
		'fup' => '0',
		'ifsub' => '0',
		'childid' => '1',
		'type' => 'category',
		'name' => '家居',
		'style' => '0',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
	'9' => array(
		'fid' => '9',
		'fup' => '5',
		'ifsub' => '0',
		'childid' => '0',
		'type' => 'forum',
		'name' => '时尚家居',
		'style' => '0',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
	'6' => array(
		'fid' => '6',
		'fup' => '0',
		'ifsub' => '0',
		'childid' => '1',
		'type' => 'category',
		'name' => '设计',
		'style' => '',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
	'10' => array(
		'fid' => '10',
		'fup' => '6',
		'ifsub' => '0',
		'childid' => '0',
		'type' => 'forum',
		'name' => '家装设计',
		'style' => '0',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
	'11' => array(
		'fid' => '11',
		'fup' => '0',
		'ifsub' => '0',
		'childid' => '1',
		'type' => 'category',
		'name' => '管理',
		'style' => '',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
	'12' => array(
		'fid' => '12',
		'fup' => '11',
		'ifsub' => '0',
		'childid' => '0',
		'type' => 'forum',
		'name' => '社区管理',
		'style' => '0',
		'f_type' => 'forum',
		'cms' => '0',
		'ifhide' => '1',
	),
);
$forumcache='
<option value="1">&gt;&gt; 互动</option>
<option value="2"> &nbsp;|- 有问有答</option>
<option value="3"> &nbsp;|- 业主交流</option>
<option value="4">&gt;&gt; 装修</option>
<option value="8"> &nbsp;|- 装修宝典</option>
<option value="5">&gt;&gt; 家居</option>
<option value="9"> &nbsp;|- 时尚家居</option>
<option value="6">&gt;&gt; 设计</option>
<option value="10"> &nbsp;|- 家装设计</option>
<option value="11">&gt;&gt; 管理</option>
<option value="12"> &nbsp;|- 社区管理</option>
';
$cmscache='
';
$pwForumList=array(
	'1' => array(
		'name' => '互动',
		'child' => array(
			'2' => '有问有答',
			'3' => '业主交流',
		),
	),
	'4' => array(
		'name' => '装修',
		'child' => array(
			'8' => '装修宝典',
		),
	),
	'5' => array(
		'name' => '家居',
		'child' => array(
			'9' => '时尚家居',
		),
	),
	'6' => array(
		'name' => '设计',
		'child' => array(
			'10' => '家装设计',
		),
	),
	'11' => array(
		'name' => '管理',
		'child' => array(
			'12' => '社区管理',
		),
	),
);
$topic_type_cache=NULL;

$md_appgroups='';
$md_groups=',3,';
$md_ifapply='1';
$md_ifmsg='1';
$md_ifopen='1';


$ltitle=$lpic=$lneed=array();
/**
* default
*/
$ltitle[1]='default';		$lpic[1]='8';
$ltitle[2]='游客';		$lpic[2]='8';
$ltitle[6]='禁止发言';		$lpic[6]='8';
$ltitle[7]='未验证会员';		$lpic[7]='8';

/**
* system
*/
$ltitle[3]='管理员';		$lpic[3]='3';
$ltitle[4]='总版主';		$lpic[4]='4';
$ltitle[5]='论坛版主';		$lpic[5]='5';
$ltitle[17]='门户编辑';		$lpic[17]='5';

/**
* special
*/
$ltitle[16]='荣誉会员';		$lpic[16]='5';

/**
* member
*/
$ltitle[8]='新手上路';		$lpic[8]='8';		$lneed[8]='0';
$ltitle[9]='侠客';		$lpic[9]='9';		$lneed[9]='100';
$ltitle[10]='骑士';		$lpic[10]='10';		$lneed[10]='300';
$ltitle[11]='圣骑士';		$lpic[11]='11';		$lneed[11]='600';
$ltitle[12]='精灵王';		$lpic[12]='12';		$lneed[12]='1000';
$ltitle[13]='风云使者';		$lpic[13]='13';		$lneed[13]='5000';
$ltitle[14]='光明使者';		$lpic[14]='14';		$lneed[14]='10000';
$ltitle[15]='天使';		$lpic[15]='14';		$lneed[15]='50000';


$gp_right=array(
	'1' => array(
		'fontsize' => '',
		'imgheight' => '',
		'imgwidth' => '',
	),
	'2' => array(
		'fontsize' => '',
		'imgheight' => '',
		'imgwidth' => '',
	),
	'3' => array(
		'fontsize' => '',
		'imgheight' => '',
		'imgwidth' => '',
	),
	'4' => array(
		'fontsize' => '',
		'imgheight' => '',
		'imgwidth' => '',
	),
	'5' => array(
		'fontsize' => '',
		'imgheight' => '',
		'imgwidth' => '',
	),
	'6' => array(
		'fontsize' => '',
		'imgheight' => '',
		'imgwidth' => '',
	),
	'7' => array(
		'fontsize' => '',
		'imgheight' => '',
		'imgwidth' => '',
	),
	'8' => array(
		'fontsize' => '3',
		'imgheight' => '',
		'imgwidth' => '',
	),
	'16' => array(
		'fontsize' => '',
		'imgheight' => '',
		'imgwidth' => '',
	),
	'17' => array(
		'fontsize' => '',
		'imgheight' => '',
		'imgwidth' => '',
	),
);

$customfield=array(
);

$_MEDALDB=array(
	'1' => array(
		'id' => '1',
		'name' => '终身成就奖',
		'intro' => '谢谢您为社区发展做出的不可磨灭的贡献!!',
		'picurl' => '1.gif',
	),
	'2' => array(
		'id' => '2',
		'name' => '优秀斑竹奖',
		'intro' => '辛劳地为论坛付出劳动，收获快乐，感谢您!',
		'picurl' => '2.gif',
	),
	'3' => array(
		'id' => '3',
		'name' => '宣传大使奖',
		'intro' => '谢谢您为社区积极宣传,特颁发此奖!',
		'picurl' => '3.gif',
	),
	'4' => array(
		'id' => '4',
		'name' => '特殊贡献奖',
		'intro' => '您为论坛做出了特殊贡献,谢谢您!',
		'picurl' => '4.gif',
	),
	'5' => array(
		'id' => '5',
		'name' => '金点子奖',
		'intro' => '为社区提出建设性的建议被采纳,特颁发此奖!',
		'picurl' => '5.gif',
	),
	'6' => array(
		'id' => '6',
		'name' => '原创先锋奖',
		'intro' => '谢谢您积极发表原创作品,特颁发此奖!',
		'picurl' => '6.gif',
	),
	'7' => array(
		'id' => '7',
		'name' => '贴图大师奖',
		'intro' => '帖图高手,堪称大师!',
		'picurl' => '7.gif',
	),
	'8' => array(
		'id' => '8',
		'name' => '灌水天才奖',
		'intro' => '能够长期提供优质的社区水资源者,可得这个奖章!',
		'picurl' => '8.gif',
	),
	'9' => array(
		'id' => '9',
		'name' => '新人进步奖',
		'intro' => '新人有很大的进步可以得到这个奖章!',
		'picurl' => '9.gif',
	),
	'10' => array(
		'id' => '10',
		'name' => '幽默大师奖',
		'intro' => '您总是能给别人带来欢乐,谢谢您!',
		'picurl' => '10.gif',
	),
);

?>