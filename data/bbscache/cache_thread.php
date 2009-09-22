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

$notice_A=array(
);
$notice_C=array(
);

?>