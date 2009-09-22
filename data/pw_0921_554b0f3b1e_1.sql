#
# PHPwind bakfile
# Version:7.5RC2
# Time: 2009-09-21 17:29
# Type: 
# PHPwind: http://www.phpwind.net
# --------------------------------------------------------


DROP TABLE IF EXISTS pw_actions;
CREATE TABLE pw_actions (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  images varchar(15) NOT NULL DEFAULT '',
  `name` varchar(15) NOT NULL DEFAULT '',
  descrip varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_activity;
CREATE TABLE pw_activity (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL DEFAULT '',
  admin mediumint(8) NOT NULL DEFAULT '0',
  starttime int(10) NOT NULL DEFAULT '0',
  endtime int(10) NOT NULL DEFAULT '0',
  location varchar(20) NOT NULL DEFAULT '',
  num smallint(6) NOT NULL DEFAULT '0',
  sexneed tinyint(1) NOT NULL DEFAULT '0',
  costs int(10) NOT NULL DEFAULT '0',
  deadline int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (tid),
  KEY admin (admin)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_actmember;
CREATE TABLE pw_actmember (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  actid mediumint(8) NOT NULL DEFAULT '0',
  winduid mediumint(8) NOT NULL DEFAULT '0',
  state tinyint(1) NOT NULL DEFAULT '0',
  applydate int(10) NOT NULL DEFAULT '0',
  contact varchar(20) NOT NULL DEFAULT '',
  message varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  KEY actid (actid),
  KEY winduid (winduid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_administrators;
CREATE TABLE pw_administrators (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  username varchar(15) NOT NULL DEFAULT '',
  groupid tinyint(3) NOT NULL DEFAULT '0',
  groups varchar(255) NOT NULL DEFAULT '',
  slog varchar(255) NOT NULL,
  PRIMARY KEY (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_adminlog;
CREATE TABLE pw_adminlog (
  id int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT '',
  username1 varchar(30) NOT NULL DEFAULT '',
  username2 varchar(30) NOT NULL DEFAULT '',
  field1 varchar(30) NOT NULL DEFAULT '',
  field2 varchar(30) NOT NULL DEFAULT '',
  field3 varchar(255) NOT NULL DEFAULT '',
  descrip text NOT NULL,
  `timestamp` int(10) NOT NULL DEFAULT '0',
  ip varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  KEY `type` (`type`,`timestamp`),
  KEY username1 (username1),
  KEY username2 (username2)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_adminset;
CREATE TABLE pw_adminset (
  gid tinyint(3) unsigned NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (gid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_advert;
CREATE TABLE pw_advert (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  uid int(10) unsigned NOT NULL DEFAULT '0',
  ckey varchar(32) NOT NULL,
  stime int(10) unsigned NOT NULL DEFAULT '0',
  etime int(10) unsigned NOT NULL DEFAULT '0',
  ifshow tinyint(1) NOT NULL DEFAULT '0',
  orderby tinyint(1) NOT NULL DEFAULT '0',
  descrip varchar(255) NOT NULL,
  config text NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_announce;
CREATE TABLE pw_announce (
  aid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  fid smallint(6) NOT NULL DEFAULT '-1',
  ifopen tinyint(1) NOT NULL DEFAULT '0',
  ifconvert tinyint(1) NOT NULL DEFAULT '0',
  vieworder smallint(6) NOT NULL DEFAULT '0',
  author varchar(15) NOT NULL DEFAULT '',
  startdate varchar(15) NOT NULL DEFAULT '',
  url varchar(80) NOT NULL DEFAULT '',
  enddate varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(100) NOT NULL DEFAULT '',
  content mediumtext NOT NULL,
  PRIMARY KEY (aid),
  KEY vieworder (vieworder,startdate),
  KEY fid (fid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_argument;
CREATE TABLE pw_argument (
  tid mediumint(8) unsigned NOT NULL,
  cyid smallint(6) unsigned NOT NULL,
  postdate int(10) unsigned NOT NULL DEFAULT '0',
  lastpost int(10) NOT NULL DEFAULT '0',
  topped tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (tid),
  KEY cyid (cyid,topped,lastpost)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_attachbuy;
CREATE TABLE pw_attachbuy (
  aid mediumint(8) unsigned NOT NULL,
  uid mediumint(8) unsigned NOT NULL,
  ctype varchar(20) NOT NULL,
  cost smallint(5) unsigned NOT NULL,
  PRIMARY KEY (aid,uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_attachs;
CREATE TABLE pw_attachs (
  aid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0',
  pid int(10) unsigned NOT NULL DEFAULT '0',
  did int(10) NOT NULL DEFAULT '0',
  `name` varchar(80) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  size int(10) unsigned NOT NULL DEFAULT '0',
  attachurl varchar(80) NOT NULL DEFAULT '0',
  hits mediumint(8) unsigned NOT NULL DEFAULT '0',
  needrvrc smallint(6) unsigned NOT NULL DEFAULT '0',
  special tinyint(3) unsigned NOT NULL DEFAULT '0',
  ctype varchar(20) NOT NULL DEFAULT '',
  uploadtime int(10) NOT NULL DEFAULT '0',
  descrip varchar(100) NOT NULL DEFAULT '',
  ifthumb tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (aid),
  KEY fid (fid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid),
  KEY `type` (`type`),
  KEY did (did),
  KEY post (tid,pid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_banuser;
CREATE TABLE pw_banuser (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  startdate int(10) NOT NULL DEFAULT '0',
  days int(4) NOT NULL DEFAULT '0',
  admin varchar(15) NOT NULL DEFAULT '',
  reason varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  UNIQUE KEY uid (uid,fid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_bbsinfo;
CREATE TABLE pw_bbsinfo (
  id smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  newmember varchar(15) NOT NULL DEFAULT '',
  totalmember mediumint(8) unsigned NOT NULL DEFAULT '0',
  higholnum smallint(6) unsigned NOT NULL DEFAULT '0',
  higholtime int(10) unsigned NOT NULL DEFAULT '0',
  tdtcontrol int(10) unsigned NOT NULL DEFAULT '0',
  yposts mediumint(8) unsigned NOT NULL DEFAULT '0',
  hposts mediumint(8) unsigned NOT NULL DEFAULT '0',
  hit_tdtime int(10) unsigned NOT NULL DEFAULT '0',
  hit_control tinyint(2) unsigned NOT NULL DEFAULT '0',
  plantime int(10) NOT NULL DEFAULT '0',
  o_post int(10) unsigned NOT NULL DEFAULT '0',
  o_tpost int(10) unsigned NOT NULL DEFAULT '0',
  KEY id (id)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_block;
CREATE TABLE pw_block (
  bid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  sid smallint(6) unsigned NOT NULL,
  func varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  rang varchar(30) NOT NULL,
  cachetime int(10) unsigned NOT NULL,
  iflock tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (bid)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_buyadvert;
CREATE TABLE pw_buyadvert (
  id int(10) unsigned NOT NULL DEFAULT '0',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  ifcheck tinyint(1) NOT NULL DEFAULT '0',
  lasttime int(10) NOT NULL DEFAULT '0',
  config text NOT NULL,
  PRIMARY KEY (id,uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_cache;
CREATE TABLE pw_cache (
  `name` varchar(20) NOT NULL DEFAULT '',
  `cache` mediumtext NOT NULL,
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_cachedata;
CREATE TABLE pw_cachedata (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  invokepieceid smallint(6) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  loopid smallint(6) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  cachetime int(10) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY invokepieceid (invokepieceid,fid,loopid)
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_clientorder;
CREATE TABLE pw_clientorder (
  id int(11) NOT NULL AUTO_INCREMENT,
  order_no varchar(30) NOT NULL DEFAULT '',
  `type` tinyint(3) unsigned NOT NULL,
  uid mediumint(8) NOT NULL DEFAULT '0',
  paycredit varchar(15) NOT NULL DEFAULT '',
  price decimal(8,2) NOT NULL DEFAULT '0.00',
  payemail varchar(60) NOT NULL DEFAULT '',
  number smallint(6) NOT NULL DEFAULT '0',
  `date` int(10) NOT NULL DEFAULT '0',
  state tinyint(1) NOT NULL DEFAULT '0',
  extra_1 mediumint(8) NOT NULL,
  PRIMARY KEY (id),
  KEY uid (uid),
  KEY order_no (order_no)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_cmembers;
CREATE TABLE pw_cmembers (
  id mediumint(9) NOT NULL AUTO_INCREMENT,
  uid mediumint(9) unsigned NOT NULL DEFAULT '0',
  username varchar(20) NOT NULL DEFAULT '',
  realname varchar(20) NOT NULL DEFAULT '',
  ifadmin tinyint(1) NOT NULL DEFAULT '0',
  gender tinyint(1) NOT NULL DEFAULT '0',
  tel varchar(15) NOT NULL DEFAULT '',
  email varchar(50) NOT NULL DEFAULT '',
  colonyid smallint(6) NOT NULL DEFAULT '0',
  address varchar(255) NOT NULL DEFAULT '',
  introduce varchar(255) NOT NULL DEFAULT '',
  addtime int(10) unsigned NOT NULL DEFAULT '0',
  lastvisit int(10) unsigned NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY colonyid (colonyid,uid),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_cnalbum;
CREATE TABLE pw_cnalbum (
  aid mediumint(8) NOT NULL AUTO_INCREMENT,
  aname varchar(50) NOT NULL DEFAULT '',
  aintro varchar(200) NOT NULL DEFAULT '',
  atype smallint(4) NOT NULL DEFAULT '0',
  private tinyint(1) unsigned NOT NULL,
  albumpwd varchar(40) NOT NULL,
  ownerid mediumint(8) unsigned NOT NULL,
  `owner` varchar(50) NOT NULL DEFAULT '',
  photonum smallint(6) NOT NULL DEFAULT '0',
  lastphoto varchar(100) NOT NULL DEFAULT '',
  lasttime int(10) unsigned NOT NULL,
  lastpid varchar(100) NOT NULL,
  crtime int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (aid),
  KEY atype (atype,ownerid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_cnclass;
CREATE TABLE pw_cnclass (
  fid smallint(6) unsigned NOT NULL,
  cname varchar(20) NOT NULL DEFAULT '',
  cnsum int(10) NOT NULL DEFAULT '0',
  ifopen tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (fid),
  KEY cname (cname)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_cnphoto;
CREATE TABLE pw_cnphoto (
  pid smallint(8) NOT NULL AUTO_INCREMENT,
  aid smallint(8) NOT NULL DEFAULT '0',
  pintro varchar(200) NOT NULL DEFAULT '',
  path varchar(200) NOT NULL DEFAULT '',
  uploader varchar(50) NOT NULL DEFAULT '',
  uptime int(10) NOT NULL DEFAULT '0',
  hits smallint(6) NOT NULL DEFAULT '0',
  ifthumb tinyint(1) unsigned NOT NULL DEFAULT '0',
  c_num mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (pid),
  KEY aid (aid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_colonys;
CREATE TABLE pw_colonys (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  classid smallint(6) NOT NULL DEFAULT '0',
  cname varchar(20) NOT NULL DEFAULT '',
  admin varchar(20) NOT NULL DEFAULT '',
  members int(10) NOT NULL DEFAULT '0',
  ifcheck tinyint(1) NOT NULL DEFAULT '0',
  ifopen tinyint(1) NOT NULL DEFAULT '0',
  albumopen tinyint(1) NOT NULL DEFAULT '0',
  cnimg varchar(100) NOT NULL DEFAULT '',
  banner varchar(100) NOT NULL,
  createtime int(10) NOT NULL DEFAULT '0',
  annouce text,
  albumnum smallint(6) NOT NULL DEFAULT '0',
  annoucesee smallint(6) NOT NULL DEFAULT '0',
  descrip varchar(255) NOT NULL DEFAULT '',
  visitor text NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY cname (cname),
  KEY admin (admin),
  KEY classid (classid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_comment;
CREATE TABLE pw_comment (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  uid mediumint(8) unsigned NOT NULL,
  username varchar(15) NOT NULL,
  title varchar(255) NOT NULL,
  `type` varchar(10) NOT NULL,
  typeid mediumint(8) NOT NULL,
  upid mediumint(8) NOT NULL,
  postdate int(10) NOT NULL,
  ifwordsfb tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (id),
  KEY `type` (`type`,typeid),
  KEY upid (upid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_config;
CREATE TABLE pw_config (
  db_name varchar(30) NOT NULL DEFAULT '',
  vtype enum('string','array') NOT NULL DEFAULT 'string',
  db_value text NOT NULL,
  decrip text NOT NULL,
  PRIMARY KEY (db_name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_creditlog;
CREATE TABLE pw_creditlog (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  uid mediumint(8) unsigned NOT NULL,
  username varchar(15) NOT NULL,
  ctype varchar(8) NOT NULL,
  affect int(10) NOT NULL,
  adddate int(10) NOT NULL,
  logtype varchar(20) NOT NULL,
  ip varchar(15) NOT NULL,
  descrip varchar(255) NOT NULL,
  PRIMARY KEY (id),
  KEY uid (uid),
  KEY adddate (adddate)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_credits;
CREATE TABLE pw_credits (
  cid tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  unit varchar(30) NOT NULL DEFAULT '',
  description varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (cid)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_customfield;
CREATE TABLE pw_customfield (
  id smallint(6) NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL DEFAULT '',
  maxlen smallint(6) NOT NULL DEFAULT '0',
  vieworder smallint(6) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  state tinyint(1) NOT NULL DEFAULT '0',
  required tinyint(1) NOT NULL DEFAULT '0',
  viewinread tinyint(1) NOT NULL DEFAULT '0',
  editable tinyint(1) NOT NULL DEFAULT '0',
  descrip varchar(255) NOT NULL DEFAULT '',
  viewright varchar(255) NOT NULL DEFAULT '',
  `options` text NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_datanalyse;
CREATE TABLE pw_datanalyse (
  tag int(10) NOT NULL,
  `action` varchar(30) NOT NULL,
  timeunit int(10) NOT NULL,
  num mediumint(8) NOT NULL DEFAULT '0',
  UNIQUE KEY idx_action_timeunit_tag (`action`,timeunit,tag)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_datastate;
CREATE TABLE pw_datastate (
  `year` smallint(4) NOT NULL DEFAULT '0',
  `month` tinyint(2) NOT NULL DEFAULT '0',
  `day` tinyint(2) NOT NULL DEFAULT '0',
  topic mediumint(8) NOT NULL DEFAULT '0',
  reply mediumint(8) NOT NULL DEFAULT '0',
  regmen mediumint(8) NOT NULL DEFAULT '0',
  postmen mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`year`,`month`,`day`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_datastore;
CREATE TABLE pw_datastore (
  skey varchar(32) NOT NULL,
  expire int(10) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (skey)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_debatedata;
CREATE TABLE pw_debatedata (
  pid int(10) unsigned NOT NULL,
  tid int(10) unsigned NOT NULL,
  authorid int(10) unsigned NOT NULL,
  standpoint tinyint(1) unsigned NOT NULL DEFAULT '0',
  postdate int(10) unsigned NOT NULL,
  vote int(10) unsigned NOT NULL,
  voteids text NOT NULL,
  PRIMARY KEY (pid,tid,authorid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_debates;
CREATE TABLE pw_debates (
  tid int(10) unsigned NOT NULL,
  authorid int(10) unsigned NOT NULL,
  postdate int(10) unsigned NOT NULL,
  obtitle varchar(255) NOT NULL,
  retitle varchar(255) NOT NULL,
  endtime int(10) unsigned NOT NULL,
  obvote int(10) unsigned NOT NULL DEFAULT '0',
  revote int(10) unsigned NOT NULL DEFAULT '0',
  obposts int(10) unsigned NOT NULL DEFAULT '0',
  reposts int(10) unsigned NOT NULL DEFAULT '0',
  umpire varchar(16) NOT NULL,
  umpirepoint varchar(255) NOT NULL,
  debater varchar(16) NOT NULL,
  judge tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_diary;
CREATE TABLE pw_diary (
  did int(10) NOT NULL AUTO_INCREMENT,
  uid int(10) NOT NULL,
  dtid mediumint(8) NOT NULL,
  aid text NOT NULL,
  username varchar(15) NOT NULL,
  privacy tinyint(1) NOT NULL DEFAULT '0',
  `subject` varchar(150) NOT NULL,
  content text NOT NULL,
  ifcopy tinyint(1) NOT NULL DEFAULT '0',
  copyurl varchar(100) NOT NULL,
  ifconvert tinyint(1) NOT NULL DEFAULT '0',
  ifwordsfb tinyint(1) NOT NULL DEFAULT '0',
  ifupload tinyint(1) NOT NULL DEFAULT '0',
  r_num int(10) NOT NULL DEFAULT '0',
  c_num int(10) NOT NULL DEFAULT '0',
  postdate int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (did),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_diarytype;
CREATE TABLE pw_diarytype (
  dtid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  uid mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  num mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (dtid),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_draft;
CREATE TABLE pw_draft (
  did mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  uid mediumint(8) NOT NULL DEFAULT '0',
  content text NOT NULL,
  PRIMARY KEY (did),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_elements;
CREATE TABLE pw_elements (
  eid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  mark varchar(30) NOT NULL,
  id mediumint(8) unsigned NOT NULL,
  `value` int(10) NOT NULL,
  addition varchar(255) NOT NULL,
  special tinyint(1) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (eid),
  UNIQUE KEY `type` (`type`,mark,id)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_extragroups;
CREATE TABLE pw_extragroups (
  uid mediumint(9) NOT NULL DEFAULT '0',
  gid smallint(6) NOT NULL DEFAULT '0',
  togid smallint(6) NOT NULL DEFAULT '0',
  startdate int(10) NOT NULL DEFAULT '0',
  days smallint(6) NOT NULL DEFAULT '0',
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_favors;
CREATE TABLE pw_favors (
  uid mediumint(8) unsigned NOT NULL DEFAULT '1',
  tids text NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_feed;
CREATE TABLE pw_feed (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  uid mediumint(8) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  descrip text,
  `timestamp` int(10) unsigned NOT NULL,
  typeid mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (id),
  KEY uid (uid)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_focus;
CREATE TABLE pw_focus (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  pushto varchar(30) NOT NULL,
  pushtime int(10) NOT NULL,
  fid smallint(6) NOT NULL,
  tid mediumint(8) NOT NULL,
  `subject` varchar(100) NOT NULL,
  content text NOT NULL,
  postdate int(10) NOT NULL,
  url varchar(100) NOT NULL,
  imgurl varchar(100) NOT NULL,
  PRIMARY KEY (id),
  KEY pushto (pushto)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_forumdata;
CREATE TABLE pw_forumdata (
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  tpost mediumint(8) unsigned NOT NULL DEFAULT '0',
  topic mediumint(8) unsigned NOT NULL DEFAULT '0',
  article mediumint(8) unsigned NOT NULL DEFAULT '0',
  subtopic mediumint(8) unsigned NOT NULL DEFAULT '0',
  top1 smallint(6) unsigned NOT NULL DEFAULT '0',
  top2 smallint(6) unsigned NOT NULL DEFAULT '0',
  aid smallint(6) unsigned NOT NULL DEFAULT '0',
  aidcache int(10) unsigned NOT NULL DEFAULT '0',
  aids varchar(135) NOT NULL DEFAULT '',
  lastpost varchar(135) NOT NULL DEFAULT '',
  PRIMARY KEY (fid),
  KEY aid (aid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_forumlog;
CREATE TABLE pw_forumlog (
  id int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT '',
  username1 varchar(30) NOT NULL DEFAULT '',
  username2 varchar(30) NOT NULL DEFAULT '',
  field1 varchar(30) NOT NULL DEFAULT '',
  field2 varchar(30) NOT NULL DEFAULT '',
  field3 varchar(255) NOT NULL DEFAULT '',
  descrip text NOT NULL,
  `timestamp` int(10) NOT NULL DEFAULT '0',
  ip varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  KEY `type` (`type`),
  KEY username1 (username1),
  KEY username2 (username2)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_forummsg;
CREATE TABLE pw_forummsg (
  id smallint(6) NOT NULL AUTO_INCREMENT,
  fid smallint(6) NOT NULL DEFAULT '0',
  uid mediumint(8) NOT NULL DEFAULT '0',
  username varchar(15) NOT NULL,
  toname varchar(200) NOT NULL,
  msgtype tinyint(1) NOT NULL DEFAULT '0',
  posttime int(10) NOT NULL DEFAULT '0',
  savetime int(10) NOT NULL DEFAULT '0',
  message mediumtext NOT NULL,
  PRIMARY KEY (id),
  KEY fid (fid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_forums;
CREATE TABLE pw_forums (
  fid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  fup smallint(6) unsigned NOT NULL DEFAULT '0',
  ifsub tinyint(1) NOT NULL DEFAULT '0',
  childid tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('category','forum','sub','sub2') NOT NULL DEFAULT 'forum',
  logo varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  descrip varchar(255) NOT NULL DEFAULT '',
  dirname varchar(15) NOT NULL DEFAULT '',
  keywords varchar(50) NOT NULL DEFAULT '',
  vieworder tinyint(3) NOT NULL DEFAULT '0',
  forumadmin varchar(255) NOT NULL DEFAULT '',
  fupadmin varchar(255) NOT NULL DEFAULT '',
  style varchar(12) NOT NULL DEFAULT '',
  across tinyint(1) NOT NULL DEFAULT '0',
  allowhtm tinyint(1) NOT NULL DEFAULT '0',
  allowhide tinyint(1) NOT NULL DEFAULT '1',
  allowsell tinyint(1) NOT NULL DEFAULT '1',
  allowtype tinyint(3) NOT NULL DEFAULT '1',
  copyctrl tinyint(1) NOT NULL DEFAULT '0',
  allowencode tinyint(1) NOT NULL DEFAULT '1',
  `password` varchar(32) NOT NULL DEFAULT '',
  viewsub tinyint(1) NOT NULL DEFAULT '0',
  allowvisit varchar(120) NOT NULL DEFAULT '',
  allowread varchar(120) NOT NULL DEFAULT '',
  allowpost varchar(120) NOT NULL DEFAULT '',
  allowrp varchar(120) NOT NULL DEFAULT '',
  allowdownload varchar(120) NOT NULL DEFAULT '',
  allowupload varchar(120) NOT NULL DEFAULT '',
  f_type enum('forum','former','hidden','vote') NOT NULL DEFAULT 'forum',
  f_check tinyint(1) unsigned NOT NULL DEFAULT '0',
  t_type tinyint(1) NOT NULL DEFAULT '0',
  forumsell varchar(15) NOT NULL DEFAULT '',
  cms tinyint(1) NOT NULL DEFAULT '0',
  ifhide tinyint(1) NOT NULL DEFAULT '1',
  showsub tinyint(1) NOT NULL DEFAULT '0',
  cateid tinyint(3) unsigned NOT NULL,
  forumcate tinyint(1) NOT NULL DEFAULT '1',
  modelid varchar(50) NOT NULL,
  ifcms tinyint(1) unsigned NOT NULL DEFAULT '0',
  pcid varchar(50) NOT NULL,
  PRIMARY KEY (fid),
  KEY fup (fup),
  KEY `type` (ifsub,vieworder,fup)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_forumsell;
CREATE TABLE pw_forumsell (
  id mediumint(8) NOT NULL AUTO_INCREMENT,
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  uid mediumint(8) unsigned NOT NULL DEFAULT '1',
  buydate int(10) unsigned NOT NULL DEFAULT '0',
  overdate int(10) unsigned NOT NULL DEFAULT '0',
  credit varchar(8) NOT NULL DEFAULT '',
  cost decimal(8,2) NOT NULL,
  PRIMARY KEY (id),
  KEY fid (fid),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_forumsextra;
CREATE TABLE pw_forumsextra (
  fid smallint(6) NOT NULL DEFAULT '0',
  creditset text NOT NULL,
  forumset text NOT NULL,
  commend text NOT NULL,
  PRIMARY KEY (fid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_friends;
CREATE TABLE pw_friends (
  uid mediumint(8) NOT NULL DEFAULT '0',
  friendid mediumint(8) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  joindate int(10) NOT NULL DEFAULT '0',
  descrip varchar(255) NOT NULL DEFAULT '',
  ftid mediumint(8) unsigned NOT NULL DEFAULT '0',
  iffeed tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (uid,friendid),
  KEY joindate (joindate),
  KEY ftid (ftid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_friendtype;
CREATE TABLE pw_friendtype (
  ftid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  uid mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (ftid),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_hack;
CREATE TABLE pw_hack (
  hk_name varchar(30) NOT NULL DEFAULT '',
  vtype enum('string','array') NOT NULL,
  hk_value text NOT NULL,
  decrip text NOT NULL,
  PRIMARY KEY (hk_name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_help;
CREATE TABLE pw_help (
  hid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  hup smallint(6) unsigned NOT NULL DEFAULT '0',
  lv tinyint(2) NOT NULL DEFAULT '0',
  fathers varchar(100) NOT NULL DEFAULT '',
  ifchild tinyint(1) NOT NULL DEFAULT '0',
  title varchar(80) NOT NULL DEFAULT '',
  url varchar(80) NOT NULL DEFAULT '',
  content mediumtext NOT NULL,
  vieworder tinyint(3) NOT NULL DEFAULT '0',
  ispw tinyint(1) DEFAULT '0',
  PRIMARY KEY (hid),
  KEY hup (hup)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_invitecode;
CREATE TABLE pw_invitecode (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  invcode varchar(40) NOT NULL DEFAULT '',
  uid mediumint(8) NOT NULL DEFAULT '0',
  receiver varchar(20) NOT NULL DEFAULT '',
  createtime int(10) NOT NULL DEFAULT '0',
  usetime int(10) NOT NULL DEFAULT '0',
  ifused tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY uid (uid),
  KEY invcode (invcode)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_invoke;
CREATE TABLE pw_invoke (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  tplid smallint(6) NOT NULL,
  parsecode text NOT NULL,
  ifloop tinyint(1) unsigned NOT NULL DEFAULT '0',
  loops text NOT NULL,
  descrip varchar(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_invokepiece;
CREATE TABLE pw_invokepiece (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  invokename varchar(50) NOT NULL,
  title varchar(50) NOT NULL,
  `action` varchar(30) NOT NULL,
  func varchar(50) NOT NULL,
  num smallint(6) NOT NULL,
  rang varchar(50) NOT NULL,
  param text NOT NULL,
  cachetime int(10) unsigned NOT NULL,
  PRIMARY KEY (id),
  KEY invokename (invokename)
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_ipstates;
CREATE TABLE pw_ipstates (
  `day` varchar(10) NOT NULL DEFAULT '',
  `month` varchar(7) NOT NULL DEFAULT '',
  nums int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`day`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_medalinfo;
CREATE TABLE pw_medalinfo (
  id smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  intro varchar(255) NOT NULL DEFAULT '',
  picurl varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_medalslogs;
CREATE TABLE pw_medalslogs (
  id int(10) NOT NULL AUTO_INCREMENT,
  awardee varchar(40) NOT NULL DEFAULT '',
  awarder varchar(40) NOT NULL DEFAULT '',
  awardtime int(10) NOT NULL DEFAULT '0',
  timelimit tinyint(2) NOT NULL DEFAULT '0',
  state tinyint(1) NOT NULL DEFAULT '0',
  `level` smallint(6) NOT NULL DEFAULT '0',
  `action` tinyint(1) NOT NULL DEFAULT '0',
  why varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  KEY awardee (awardee)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_medaluser;
CREATE TABLE pw_medaluser (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  uid mediumint(8) unsigned NOT NULL,
  mid smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_membercredit;
CREATE TABLE pw_membercredit (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  cid tinyint(3) NOT NULL DEFAULT '0',
  `value` mediumint(8) NOT NULL DEFAULT '0',
  KEY uid (uid),
  KEY cid (cid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_memberdata;
CREATE TABLE pw_memberdata (
  uid mediumint(8) unsigned NOT NULL DEFAULT '1',
  postnum int(10) unsigned NOT NULL DEFAULT '0',
  digests smallint(6) NOT NULL DEFAULT '0',
  rvrc int(10) NOT NULL DEFAULT '0',
  money int(10) NOT NULL DEFAULT '0',
  credit int(10) NOT NULL DEFAULT '0',
  currency int(10) NOT NULL DEFAULT '0',
  lastvisit int(10) unsigned NOT NULL DEFAULT '0',
  thisvisit int(10) unsigned NOT NULL DEFAULT '0',
  lastpost int(10) unsigned NOT NULL DEFAULT '0',
  onlinetime int(10) unsigned NOT NULL DEFAULT '0',
  monoltime int(10) unsigned NOT NULL DEFAULT '0',
  todaypost smallint(6) unsigned NOT NULL DEFAULT '0',
  monthpost smallint(6) unsigned NOT NULL DEFAULT '0',
  uploadtime int(10) unsigned NOT NULL DEFAULT '0',
  uploadnum smallint(6) unsigned NOT NULL DEFAULT '0',
  onlineip varchar(30) NOT NULL DEFAULT '',
  starttime int(10) unsigned NOT NULL DEFAULT '0',
  postcheck varchar(16) NOT NULL DEFAULT '',
  pwdctime int(10) unsigned NOT NULL DEFAULT '0',
  f_num int(10) unsigned NOT NULL DEFAULT '0',
  creditpop varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (uid),
  KEY postnum (postnum)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_memberinfo;
CREATE TABLE pw_memberinfo (
  uid mediumint(8) unsigned NOT NULL DEFAULT '1',
  adsips mediumtext NOT NULL,
  credit text NOT NULL,
  deposit int(10) NOT NULL DEFAULT '0',
  startdate int(10) NOT NULL DEFAULT '0',
  ddeposit int(10) NOT NULL DEFAULT '0',
  dstartdate int(10) NOT NULL DEFAULT '0',
  regreason varchar(255) NOT NULL DEFAULT '',
  readmsg mediumtext NOT NULL,
  delmsg mediumtext NOT NULL,
  tooltime varchar(42) NOT NULL DEFAULT '',
  replyinfo varchar(81) NOT NULL DEFAULT '',
  lasttime int(10) NOT NULL DEFAULT '0',
  digtid text NOT NULL,
  customdata text NOT NULL,
  tradeinfo text NOT NULL,
  PRIMARY KEY (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_members;
CREATE TABLE pw_members (
  uid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  username varchar(15) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  safecv varchar(10) NOT NULL DEFAULT '',
  email varchar(60) NOT NULL DEFAULT '',
  groupid tinyint(3) NOT NULL DEFAULT '-1',
  memberid tinyint(3) NOT NULL DEFAULT '0',
  groups varchar(255) NOT NULL DEFAULT '',
  icon varchar(255) NOT NULL DEFAULT '',
  gender tinyint(1) NOT NULL DEFAULT '0',
  regdate int(10) unsigned NOT NULL DEFAULT '0',
  signature text NOT NULL,
  introduce text NOT NULL,
  oicq varchar(12) NOT NULL DEFAULT '',
  aliww varchar(30) NOT NULL,
  icq varchar(12) NOT NULL DEFAULT '',
  msn varchar(35) NOT NULL DEFAULT '',
  yahoo varchar(35) NOT NULL DEFAULT '',
  site varchar(75) NOT NULL DEFAULT '',
  location varchar(36) NOT NULL DEFAULT '',
  honor varchar(100) NOT NULL DEFAULT '',
  bday date NOT NULL DEFAULT '0000-00-00',
  lastaddrst varchar(255) NOT NULL DEFAULT '',
  yz int(10) NOT NULL DEFAULT '1',
  timedf varchar(5) NOT NULL DEFAULT '',
  style varchar(12) NOT NULL DEFAULT '',
  datefm varchar(15) NOT NULL DEFAULT '',
  t_num tinyint(3) unsigned NOT NULL DEFAULT '0',
  p_num tinyint(3) unsigned NOT NULL DEFAULT '0',
  attach varchar(50) NOT NULL DEFAULT '',
  hack varchar(255) NOT NULL DEFAULT '0',
  newpm smallint(6) unsigned NOT NULL DEFAULT '0',
  banpm text NOT NULL,
  msggroups varchar(255) NOT NULL DEFAULT '',
  medals varchar(255) NOT NULL DEFAULT '',
  userstatus int(10) unsigned NOT NULL DEFAULT '0',
  shortcut varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (uid),
  UNIQUE KEY username (username),
  KEY groupid (groupid),
  KEY email (email)
) ENGINE=MyISAM AUTO_INCREMENT=206 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_memo;
CREATE TABLE pw_memo (
  mid int(10) unsigned NOT NULL AUTO_INCREMENT,
  username varchar(15) NOT NULL,
  postdate int(10) NOT NULL DEFAULT '0',
  content text NOT NULL,
  isuser tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (mid),
  KEY isuser (isuser,username)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_modehot;
CREATE TABLE pw_modehot (
  id int(20) unsigned NOT NULL AUTO_INCREMENT,
  parent_id int(20) unsigned DEFAULT NULL,
  sort int(2) NOT NULL DEFAULT '1',
  tag varchar(20) DEFAULT NULL,
  type_name varchar(100) NOT NULL,
  filter_type text NOT NULL,
  filter_time text NOT NULL,
  display char(2) NOT NULL DEFAULT '0',
  active char(2) NOT NULL DEFAULT '0',
  remark varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_mpageconfig;
CREATE TABLE pw_mpageconfig (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `mode` varchar(20) NOT NULL,
  scr varchar(20) NOT NULL,
  fid smallint(6) unsigned NOT NULL,
  invokes text NOT NULL,
  config text NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY `mode` (`mode`,scr,fid)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_msg;
CREATE TABLE pw_msg (
  mid int(10) unsigned NOT NULL AUTO_INCREMENT,
  touid mediumint(8) unsigned NOT NULL DEFAULT '0',
  togroups varchar(80) NOT NULL DEFAULT '',
  fromuid mediumint(8) unsigned NOT NULL DEFAULT '0',
  username varchar(15) NOT NULL DEFAULT '',
  `type` enum('rebox','sebox','public') NOT NULL DEFAULT 'rebox',
  ifnew tinyint(1) NOT NULL DEFAULT '0',
  mdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (mid),
  KEY touid (touid),
  KEY fromuid (fromuid,mdate),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_msgc;
CREATE TABLE pw_msgc (
  mid int(10) unsigned NOT NULL,
  title varchar(130) NOT NULL,
  content text NOT NULL,
  PRIMARY KEY (mid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_msglog;
CREATE TABLE pw_msglog (
  mid int(10) unsigned NOT NULL DEFAULT '0',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  withuid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mdate int(10) unsigned NOT NULL DEFAULT '0',
  mtype enum('send','receive') NOT NULL DEFAULT 'send',
  PRIMARY KEY (mid,uid),
  KEY uid (uid,withuid,mdate)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_nav;
CREATE TABLE pw_nav (
  nid smallint(4) NOT NULL AUTO_INCREMENT,
  nkey varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  title char(50) NOT NULL DEFAULT '',
  style char(50) NOT NULL DEFAULT '',
  link char(100) NOT NULL DEFAULT '',
  alt char(50) NOT NULL DEFAULT '',
  pos char(32) NOT NULL,
  target tinyint(1) NOT NULL DEFAULT '0',
  `view` smallint(4) NOT NULL DEFAULT '0',
  upid smallint(4) NOT NULL,
  isshow tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (nid)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_oboard;
CREATE TABLE pw_oboard (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  uid mediumint(8) unsigned NOT NULL,
  username varchar(15) NOT NULL,
  touid mediumint(8) unsigned NOT NULL,
  title varchar(255) NOT NULL,
  postdate int(10) NOT NULL,
  c_num mediumint(8) unsigned NOT NULL DEFAULT '0',
  ifwordsfb tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (id),
  KEY touid (touid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_online;
CREATE TABLE pw_online (
  olid int(10) NOT NULL DEFAULT '0',
  username varchar(15) NOT NULL DEFAULT '',
  lastvisit int(10) NOT NULL DEFAULT '0',
  ip varchar(30) NOT NULL DEFAULT '',
  fid smallint(6) NOT NULL DEFAULT '0',
  tid mediumint(8) NOT NULL DEFAULT '0',
  groupid tinyint(3) NOT NULL DEFAULT '0',
  `action` varchar(2) NOT NULL DEFAULT '',
  ifhide tinyint(1) NOT NULL DEFAULT '0',
  uid mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (olid),
  KEY uid (uid),
  KEY ip (ip)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_ouserdata;
CREATE TABLE pw_ouserdata (
  uid int(10) unsigned NOT NULL,
  index_privacy tinyint(1) unsigned NOT NULL DEFAULT '0',
  profile_privacy tinyint(1) unsigned NOT NULL DEFAULT '0',
  info_privacy tinyint(1) unsigned NOT NULL DEFAULT '0',
  credit_privacy tinyint(1) unsigned NOT NULL DEFAULT '0',
  owrite_privacy tinyint(1) unsigned NOT NULL DEFAULT '0',
  msgboard_privacy tinyint(1) unsigned NOT NULL DEFAULT '0',
  photos_privacy tinyint(1) unsigned NOT NULL DEFAULT '0',
  diary_privacy tinyint(1) unsigned NOT NULL DEFAULT '0',
  article_isfeed tinyint(1) unsigned NOT NULL DEFAULT '1',
  write_isfeed tinyint(1) unsigned NOT NULL DEFAULT '1',
  diary_isfeed tinyint(1) unsigned NOT NULL DEFAULT '1',
  share_isfeed tinyint(1) unsigned NOT NULL DEFAULT '1',
  photos_isfeed tinyint(1) unsigned NOT NULL DEFAULT '1',
  visits int(10) unsigned NOT NULL DEFAULT '0',
  tovisits int(10) unsigned NOT NULL DEFAULT '0',
  tovisit varchar(255) NOT NULL,
  whovisit varchar(255) NOT NULL,
  diarynum int(10) unsigned NOT NULL DEFAULT '0',
  photonum int(10) unsigned NOT NULL DEFAULT '0',
  owritenum int(10) unsigned NOT NULL DEFAULT '0',
  groupnum int(10) unsigned NOT NULL DEFAULT '0',
  sharenum int(10) unsigned NOT NULL DEFAULT '0',
  diary_lastpost int(10) unsigned NOT NULL DEFAULT '0',
  photo_lastpost int(10) unsigned NOT NULL DEFAULT '0',
  owrite_lastpost int(10) unsigned NOT NULL DEFAULT '0',
  group_lastpost int(10) unsigned NOT NULL DEFAULT '0',
  share_lastpost int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_owritedata;
CREATE TABLE pw_owritedata (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  uid int(10) unsigned NOT NULL,
  touid int(10) unsigned NOT NULL,
  postdate int(10) unsigned NOT NULL,
  isshare tinyint(1) unsigned NOT NULL DEFAULT '0',
  `source` varchar(10) NOT NULL,
  content varchar(255) NOT NULL,
  c_num mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (id),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_pcfield;
CREATE TABLE pw_pcfield (
  fieldid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  fieldname varchar(30) NOT NULL,
  pcid smallint(6) unsigned NOT NULL,
  vieworder tinyint(3) NOT NULL,
  `type` varchar(20) NOT NULL,
  rules mediumtext NOT NULL,
  ifable tinyint(1) NOT NULL DEFAULT '1',
  ifsearch tinyint(1) NOT NULL DEFAULT '0',
  ifasearch tinyint(1) NOT NULL DEFAULT '0',
  threadshow tinyint(1) NOT NULL DEFAULT '0',
  ifmust tinyint(1) NOT NULL DEFAULT '1',
  ifdel tinyint(1) NOT NULL DEFAULT '0',
  textsize tinyint(3) NOT NULL DEFAULT '0',
  descrip varchar(255) NOT NULL,
  PRIMARY KEY (fieldid),
  KEY pcid (pcid)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_pcmember;
CREATE TABLE pw_pcmember (
  pcmid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  tid mediumint(8) unsigned NOT NULL,
  uid mediumint(8) unsigned NOT NULL,
  pcid tinyint(3) unsigned NOT NULL,
  username varchar(15) NOT NULL,
  nums tinyint(3) unsigned NOT NULL,
  totalcash int(10) NOT NULL,
  phone varchar(15) NOT NULL,
  mobile varchar(15) NOT NULL,
  address varchar(255) NOT NULL,
  extra varchar(10) NOT NULL,
  ifpay tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (pcmid),
  KEY tid (tid,uid),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_pcvalue1;
CREATE TABLE pw_pcvalue1 (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0',
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  pctype tinyint(3) unsigned NOT NULL DEFAULT '0',
  begintime int(10) unsigned NOT NULL DEFAULT '0',
  endtime int(10) unsigned NOT NULL DEFAULT '0',
  limitnum int(10) unsigned NOT NULL DEFAULT '0',
  objecter tinyint(3) unsigned NOT NULL DEFAULT '0',
  price varchar(255) NOT NULL,
  deposit varchar(255) NOT NULL,
  payway tinyint(3) unsigned NOT NULL DEFAULT '0',
  contacter varchar(255) NOT NULL,
  tel varchar(255) NOT NULL,
  phone varchar(255) NOT NULL,
  mobile varchar(255) NOT NULL,
  pcattach varchar(255) NOT NULL,
  PRIMARY KEY (tid),
  KEY fid (fid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_pcvalue2;
CREATE TABLE pw_pcvalue2 (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0',
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  pctype tinyint(3) unsigned NOT NULL DEFAULT '0',
  begintime int(10) unsigned NOT NULL DEFAULT '0',
  endtime int(10) unsigned NOT NULL DEFAULT '0',
  address varchar(255) NOT NULL,
  limitnum int(10) unsigned NOT NULL DEFAULT '0',
  objecter tinyint(3) unsigned NOT NULL DEFAULT '0',
  gender tinyint(3) unsigned NOT NULL DEFAULT '0',
  price varchar(255) NOT NULL,
  deposit varchar(255) NOT NULL,
  payway tinyint(3) unsigned NOT NULL DEFAULT '0',
  contacter varchar(255) NOT NULL,
  tel varchar(255) NOT NULL,
  phone varchar(255) NOT NULL,
  mobile varchar(255) NOT NULL,
  pcattach varchar(255) NOT NULL,
  PRIMARY KEY (tid),
  KEY fid (fid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_permission;
CREATE TABLE pw_permission (
  uid mediumint(8) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL,
  gid smallint(6) unsigned NOT NULL,
  rkey varchar(20) NOT NULL,
  `type` enum('basic','special','system','systemforum') NOT NULL,
  rvalue text NOT NULL,
  PRIMARY KEY (uid,fid,gid,rkey),
  KEY rkey (rkey)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_pidtmp;
CREATE TABLE pw_pidtmp (
  pid int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (pid)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_pinglog;
CREATE TABLE pw_pinglog (
  id mediumint(8) NOT NULL AUTO_INCREMENT,
  fid smallint(6) NOT NULL DEFAULT '0',
  tid mediumint(8) NOT NULL DEFAULT '0',
  pid int(10) NOT NULL DEFAULT '0',
  `name` varchar(15) NOT NULL,
  `point` varchar(10) NOT NULL,
  pinger varchar(15) NOT NULL,
  record mediumtext NOT NULL,
  pingdate int(10) NOT NULL DEFAULT '0',
  ifhide tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY tid (tid),
  KEY pid (pid),
  KEY fid (fid,tid,pid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_plan;
CREATE TABLE pw_plan (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(80) NOT NULL DEFAULT '',
  `month` varchar(2) NOT NULL DEFAULT '',
  `week` varchar(1) NOT NULL DEFAULT '',
  `day` varchar(2) NOT NULL DEFAULT '',
  `hour` varchar(80) NOT NULL DEFAULT '',
  usetime int(10) NOT NULL DEFAULT '0',
  nexttime int(10) NOT NULL DEFAULT '0',
  ifsave tinyint(1) NOT NULL DEFAULT '0',
  ifopen tinyint(1) NOT NULL DEFAULT '0',
  filename varchar(80) NOT NULL DEFAULT '',
  config text NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_polls;
CREATE TABLE pw_polls (
  pollid int(10) unsigned NOT NULL AUTO_INCREMENT,
  tid mediumint(8) unsigned NOT NULL DEFAULT '0',
  voteopts mediumtext NOT NULL,
  modifiable tinyint(1) NOT NULL DEFAULT '0',
  previewable tinyint(1) NOT NULL DEFAULT '0',
  multiple tinyint(1) unsigned NOT NULL,
  mostvotes smallint(6) unsigned NOT NULL,
  voters mediumint(8) unsigned NOT NULL,
  timelimit int(3) NOT NULL DEFAULT '0',
  leastvotes int(3) unsigned NOT NULL,
  regdatelimit int(10) unsigned NOT NULL,
  creditlimit varchar(255) NOT NULL,
  postnumlimit int(10) unsigned NOT NULL,
  PRIMARY KEY (pollid),
  KEY tid (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_postcate;
CREATE TABLE pw_postcate (
  pcid tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  ifable tinyint(1) NOT NULL DEFAULT '1',
  vieworder tinyint(3) NOT NULL,
  viewright varchar(255) NOT NULL,
  adminright varchar(255) NOT NULL,
  PRIMARY KEY (pcid)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_posts;
CREATE TABLE pw_posts (
  pid int(10) unsigned NOT NULL AUTO_INCREMENT,
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0',
  aid smallint(6) unsigned NOT NULL DEFAULT '0',
  author varchar(15) NOT NULL DEFAULT '',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  icon tinyint(2) NOT NULL DEFAULT '0',
  postdate int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  userip varchar(15) NOT NULL DEFAULT '',
  ifsign tinyint(1) NOT NULL DEFAULT '0',
  buy text NOT NULL,
  alterinfo varchar(50) NOT NULL DEFAULT '',
  remindinfo varchar(150) NOT NULL DEFAULT '',
  leaveword varchar(255) NOT NULL DEFAULT '',
  ipfrom varchar(255) NOT NULL DEFAULT '',
  ifconvert tinyint(1) NOT NULL DEFAULT '1',
  ifwordsfb tinyint(1) NOT NULL DEFAULT '1',
  ifcheck tinyint(1) NOT NULL DEFAULT '0',
  content mediumtext NOT NULL,
  ifmark varchar(255) NOT NULL DEFAULT '',
  ifreward tinyint(1) NOT NULL DEFAULT '0',
  ifshield tinyint(1) unsigned NOT NULL DEFAULT '0',
  anonymous tinyint(1) NOT NULL DEFAULT '0',
  ifhide tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (pid),
  KEY fid (fid),
  KEY postdate (postdate),
  KEY tid (tid,postdate),
  KEY authorid (authorid),
  KEY ifcheck (ifcheck)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_postsfloor;
CREATE TABLE pw_postsfloor (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  tid mediumint(8) NOT NULL DEFAULT '0',
  pid int(10) NOT NULL DEFAULT '0',
  floor int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_proclock;
CREATE TABLE pw_proclock (
  uid mediumint(8) unsigned NOT NULL,
  `action` varchar(20) NOT NULL,
  `time` int(10) NOT NULL,
  PRIMARY KEY (uid,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_pushdata;
CREATE TABLE pw_pushdata (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  invokepieceid smallint(6) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  loopid smallint(6) unsigned NOT NULL DEFAULT '0',
  uid int(10) unsigned NOT NULL,
  starttime int(10) unsigned NOT NULL,
  endtime int(10) unsigned NOT NULL,
  `offset` tinyint(1) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (id),
  KEY invokepieceid (invokepieceid,fid,loopid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_rate;
CREATE TABLE pw_rate (
  objectid int(10) NOT NULL DEFAULT '0',
  optionid smallint(6) NOT NULL DEFAULT '0',
  typeid smallint(6) NOT NULL DEFAULT '0',
  uid mediumint(8) NOT NULL DEFAULT '0',
  created_at int(10) NOT NULL DEFAULT '0',
  ip varchar(15) DEFAULT NULL,
  KEY idx_tid_oid_uid (typeid,objectid,uid),
  KEY idx_tid_time (typeid,created_at,optionid,objectid),
  KEY idx_uid_time (uid,created_at)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_rateconfig;
CREATE TABLE pw_rateconfig (
  id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(12) NOT NULL,
  icon varchar(75) NOT NULL,
  isopen tinyint(1) NOT NULL DEFAULT '1',
  isdefault tinyint(1) NOT NULL DEFAULT '0',
  typeid tinyint(1) NOT NULL DEFAULT '0',
  creditset tinyint(1) NOT NULL DEFAULT '0',
  voternum tinyint(1) NOT NULL DEFAULT '0',
  authornum tinyint(1) NOT NULL DEFAULT '0',
  creator varchar(20) DEFAULT NULL,
  created_at int(10) DEFAULT NULL,
  updater varchar(20) DEFAULT NULL,
  update_at int(10) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_type_id (typeid)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_rateresult;
CREATE TABLE pw_rateresult (
  id int(10) NOT NULL AUTO_INCREMENT,
  objectid int(10) NOT NULL DEFAULT '0',
  optionid smallint(6) NOT NULL DEFAULT '0',
  typeid tinyint(1) NOT NULL DEFAULT '0',
  num int(10) NOT NULL DEFAULT '0',
  ip varchar(15) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_oid (optionid,objectid),
  KEY idx_tid (typeid,objectid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_recycle;
CREATE TABLE pw_recycle (
  pid int(10) unsigned NOT NULL DEFAULT '0',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0',
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  deltime int(10) unsigned NOT NULL DEFAULT '0',
  admin varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (pid,tid),
  KEY tid (tid),
  KEY fid (fid,pid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_report;
CREATE TABLE pw_report (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  tid mediumint(8) unsigned NOT NULL DEFAULT '0',
  pid int(10) unsigned NOT NULL DEFAULT '0',
  uid mediumint(9) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '0',
  state tinyint(1) unsigned NOT NULL DEFAULT '0',
  reason varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_reward;
CREATE TABLE pw_reward (
  tid mediumint(8) NOT NULL,
  cbtype varchar(20) NOT NULL,
  catype varchar(20) NOT NULL,
  cbval int(10) NOT NULL,
  caval int(10) NOT NULL,
  timelimit int(10) NOT NULL,
  author varchar(30) NOT NULL,
  pid mediumint(8) NOT NULL,
  PRIMARY KEY (tid),
  KEY timelimit (timelimit)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_schcache;
CREATE TABLE pw_schcache (
  sid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  sorderby varchar(13) NOT NULL DEFAULT '',
  schline varchar(32) NOT NULL DEFAULT '',
  schtime int(10) unsigned NOT NULL DEFAULT '0',
  total mediumint(8) unsigned NOT NULL DEFAULT '0',
  schedid text NOT NULL,
  PRIMARY KEY (sid),
  KEY schline (schline)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_setform;
CREATE TABLE pw_setform (
  id int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  ifopen tinyint(1) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_share;
CREATE TABLE pw_share (
  id mediumint(8) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  uid mediumint(8) NOT NULL,
  username varchar(15) NOT NULL,
  postdate int(10) NOT NULL,
  content text NOT NULL,
  ifhidden tinyint(1) unsigned NOT NULL DEFAULT '0',
  c_num mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY uid (uid,postdate)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_sharelinks;
CREATE TABLE pw_sharelinks (
  sid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  threadorder tinyint(3) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  url varchar(100) NOT NULL DEFAULT '',
  descrip varchar(200) NOT NULL DEFAULT '0',
  logo varchar(100) NOT NULL DEFAULT '',
  ifcheck tinyint(1) NOT NULL DEFAULT '0',
  username varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (sid)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_singleright;
CREATE TABLE pw_singleright (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  visit varchar(80) NOT NULL DEFAULT '',
  post varchar(80) NOT NULL DEFAULT '',
  reply varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_smiles;
CREATE TABLE pw_smiles (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  path varchar(20) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  descipt varchar(100) NOT NULL DEFAULT '',
  vieworder tinyint(2) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_sqlcv;
CREATE TABLE pw_sqlcv (
  id int(10) NOT NULL AUTO_INCREMENT,
  var varchar(20) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_stamp;
CREATE TABLE pw_stamp (
  sid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  stamp varchar(30) NOT NULL,
  init smallint(6) NOT NULL,
  iflock tinyint(1) unsigned NOT NULL DEFAULT '0',
  iffid tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (sid),
  UNIQUE KEY stamp (stamp)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_stopic;
CREATE TABLE pw_stopic (
  stopic_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL DEFAULT '',
  category_id int(10) unsigned NOT NULL DEFAULT '0',
  bg_id int(10) NOT NULL DEFAULT '0',
  copy_from int(10) unsigned NOT NULL DEFAULT '0',
  layout varchar(20) NOT NULL DEFAULT '',
  create_date int(10) unsigned NOT NULL DEFAULT '0',
  start_date int(10) unsigned NOT NULL DEFAULT '0',
  end_date int(10) unsigned NOT NULL DEFAULT '0',
  used_count mediumint(8) unsigned NOT NULL DEFAULT '0',
  view_count int(10) unsigned NOT NULL DEFAULT '0',
  banner_url varchar(100) NOT NULL DEFAULT '',
  seo_keyword varchar(255) NOT NULL DEFAULT '',
  seo_desc varchar(255) NOT NULL DEFAULT '',
  block_config text NOT NULL,
  layout_config text NOT NULL,
  nav_config text NOT NULL,
  PRIMARY KEY (stopic_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_stopicblock;
CREATE TABLE pw_stopicblock (
  block_id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  tagcode text NOT NULL,
  `begin` text NOT NULL,
  loops text NOT NULL,
  `end` text NOT NULL,
  config varchar(255) NOT NULL,
  replacetag varchar(255) NOT NULL,
  PRIMARY KEY (block_id)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_stopiccategory;
CREATE TABLE pw_stopiccategory (
  id smallint(6) NOT NULL AUTO_INCREMENT,
  title varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  num smallint(6) NOT NULL DEFAULT '0',
  creator varchar(20) DEFAULT NULL,
  createtime int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_stopicpictures;
CREATE TABLE pw_stopicpictures (
  id int(10) NOT NULL AUTO_INCREMENT,
  categoryid smallint(6) NOT NULL DEFAULT '0',
  title varchar(45) NOT NULL,
  path varchar(255) NOT NULL,
  num smallint(6) NOT NULL DEFAULT '0',
  creator varchar(20) DEFAULT NULL,
  createtime int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_stopicunit;
CREATE TABLE pw_stopicunit (
  unit_id int(10) unsigned NOT NULL AUTO_INCREMENT,
  stopic_id int(10) unsigned NOT NULL,
  html_id varchar(50) NOT NULL,
  block_id smallint(6) unsigned NOT NULL,
  title varchar(255) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (unit_id),
  UNIQUE KEY stopic_id (stopic_id,html_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_styles;
CREATE TABLE pw_styles (
  sid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  uid mediumint(8) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  customname varchar(50) NOT NULL DEFAULT '',
  createtime int(10) NOT NULL,
  lastmodify int(10) NOT NULL,
  ifopen tinyint(1) NOT NULL DEFAULT '0',
  stylepath varchar(50) NOT NULL DEFAULT '',
  tplpath varchar(50) NOT NULL DEFAULT '',
  yeyestyle varchar(3) NOT NULL DEFAULT '',
  bgcolor varchar(100) NOT NULL,
  linkcolor varchar(7) NOT NULL,
  tablecolor varchar(7) NOT NULL DEFAULT '',
  tdcolor varchar(7) NOT NULL,
  tablewidth varchar(7) NOT NULL,
  mtablewidth varchar(7) NOT NULL,
  headcolor varchar(100) NOT NULL,
  headborder varchar(7) NOT NULL,
  headfontone varchar(7) NOT NULL,
  headfonttwo varchar(7) NOT NULL,
  cbgcolor varchar(100) NOT NULL,
  cbgborder varchar(7) NOT NULL,
  cbgfont varchar(7) NOT NULL,
  forumcolorone varchar(7) NOT NULL DEFAULT '',
  forumcolortwo varchar(7) NOT NULL DEFAULT '',
  extcss text NOT NULL,
  PRIMARY KEY (sid),
  KEY uid (uid)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_tagdata;
CREATE TABLE pw_tagdata (
  tagid mediumint(8) NOT NULL DEFAULT '0',
  tid mediumint(8) NOT NULL DEFAULT '0',
  KEY tagid (tagid),
  KEY tid (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_tags;
CREATE TABLE pw_tags (
  tagid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  tagname varchar(15) NOT NULL DEFAULT '',
  num mediumint(8) NOT NULL DEFAULT '0',
  ifhot tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (tagid),
  KEY num (ifhot,num),
  KEY tagname (tagname)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_threads;
CREATE TABLE pw_threads (
  tid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  fid smallint(6) unsigned NOT NULL DEFAULT '0',
  icon tinyint(2) NOT NULL DEFAULT '0',
  titlefont varchar(15) NOT NULL DEFAULT '',
  author varchar(15) NOT NULL DEFAULT '',
  authorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  toolinfo varchar(16) NOT NULL DEFAULT '',
  toolfield varchar(21) NOT NULL DEFAULT '',
  ifcheck tinyint(1) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  postdate int(10) unsigned NOT NULL DEFAULT '0',
  lastpost int(10) unsigned NOT NULL DEFAULT '0',
  lastposter varchar(15) NOT NULL DEFAULT '',
  hits int(10) unsigned NOT NULL DEFAULT '0',
  replies int(10) unsigned NOT NULL DEFAULT '0',
  favors int(10) NOT NULL DEFAULT '0',
  topped smallint(6) NOT NULL DEFAULT '0',
  locked tinyint(1) NOT NULL DEFAULT '0',
  digest tinyint(1) NOT NULL DEFAULT '0',
  special tinyint(1) NOT NULL DEFAULT '0',
  state tinyint(1) NOT NULL DEFAULT '0',
  ifupload tinyint(1) NOT NULL DEFAULT '0',
  ifmail tinyint(1) NOT NULL DEFAULT '0',
  ifmark smallint(6) NOT NULL DEFAULT '0',
  ifshield tinyint(1) NOT NULL DEFAULT '0',
  anonymous tinyint(1) NOT NULL DEFAULT '0',
  dig int(10) NOT NULL DEFAULT '0',
  fight int(10) NOT NULL DEFAULT '0',
  ptable tinyint(3) NOT NULL DEFAULT '0',
  ifmagic tinyint(1) NOT NULL DEFAULT '0',
  ifhide tinyint(1) NOT NULL DEFAULT '0',
  inspect varchar(30) NOT NULL DEFAULT '',
  tpcstatus int(10) unsigned NOT NULL,
  cateid tinyint(3) unsigned NOT NULL,
  modelid smallint(6) unsigned NOT NULL,
  shares mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (tid),
  KEY authorid (authorid),
  KEY postdate (postdate),
  KEY digest (digest),
  KEY `type` (fid,`type`,ifcheck),
  KEY special (special),
  KEY lastpost (fid,ifcheck,topped,lastpost)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_tmsgs;
CREATE TABLE pw_tmsgs (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0',
  aid smallint(6) unsigned NOT NULL DEFAULT '0',
  userip varchar(15) NOT NULL DEFAULT '',
  ifsign tinyint(1) NOT NULL DEFAULT '0',
  buy text NOT NULL,
  ipfrom varchar(255) NOT NULL DEFAULT '',
  alterinfo varchar(50) NOT NULL DEFAULT '',
  remindinfo varchar(150) NOT NULL DEFAULT '',
  tags varchar(100) NOT NULL DEFAULT '',
  ifconvert tinyint(1) NOT NULL DEFAULT '1',
  ifwordsfb tinyint(1) NOT NULL DEFAULT '1',
  content mediumtext NOT NULL,
  form varchar(30) NOT NULL DEFAULT '',
  ifmark varchar(255) NOT NULL DEFAULT '',
  c_from varchar(30) NOT NULL DEFAULT '',
  magic varchar(50) NOT NULL,
  PRIMARY KEY (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_toollog;
CREATE TABLE pw_toollog (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL DEFAULT '',
  nums smallint(6) NOT NULL DEFAULT '0',
  money smallint(6) NOT NULL DEFAULT '0',
  descrip varchar(255) NOT NULL DEFAULT '',
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  username varchar(15) NOT NULL DEFAULT '',
  ip varchar(15) NOT NULL DEFAULT '',
  `time` int(10) NOT NULL DEFAULT '0',
  filename varchar(20) NOT NULL DEFAULT '',
  touid mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY uid (uid),
  KEY touid (touid),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_tools;
CREATE TABLE pw_tools (
  id smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  filename varchar(20) NOT NULL DEFAULT '',
  descrip varchar(255) NOT NULL DEFAULT '',
  vieworder tinyint(3) NOT NULL DEFAULT '0',
  logo varchar(100) NOT NULL DEFAULT '',
  state tinyint(1) NOT NULL DEFAULT '0',
  price varchar(255) NOT NULL DEFAULT '',
  creditype varchar(10) NOT NULL DEFAULT '',
  rmb decimal(8,2) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  stock smallint(6) NOT NULL DEFAULT '0',
  conditions text NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topiccate;
CREATE TABLE pw_topiccate (
  cateid tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  ifable tinyint(1) NOT NULL DEFAULT '1',
  vieworder tinyint(3) NOT NULL,
  ifdel tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (cateid)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topicfield;
CREATE TABLE pw_topicfield (
  fieldid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  fieldname varchar(30) NOT NULL,
  modelid smallint(6) unsigned NOT NULL,
  vieworder tinyint(3) NOT NULL,
  `type` varchar(20) NOT NULL,
  rules mediumtext NOT NULL,
  ifable tinyint(1) NOT NULL DEFAULT '1',
  ifsearch tinyint(1) NOT NULL DEFAULT '0',
  ifasearch tinyint(1) NOT NULL DEFAULT '0',
  threadshow tinyint(1) NOT NULL DEFAULT '0',
  ifmust tinyint(1) NOT NULL DEFAULT '1',
  textsize tinyint(3) NOT NULL DEFAULT '0',
  descrip varchar(255) NOT NULL,
  PRIMARY KEY (fieldid),
  KEY modelid (modelid)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topicmodel;
CREATE TABLE pw_topicmodel (
  modelid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  cateid tinyint(3) unsigned NOT NULL,
  ifable tinyint(1) NOT NULL DEFAULT '1',
  vieworder tinyint(3) NOT NULL,
  PRIMARY KEY (modelid),
  KEY cateid (cateid)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topictype;
CREATE TABLE pw_topictype (
  id smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  fid smallint(6) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  vieworder tinyint(3) NOT NULL DEFAULT '0',
  upid smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topicvalue1;
CREATE TABLE pw_topicvalue1 (
  tid mediumint(8) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL,
  field1 varchar(255) NOT NULL,
  field2 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field3 varchar(255) NOT NULL,
  field4 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field5 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field6 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field7 int(10) unsigned NOT NULL DEFAULT '0',
  field8 int(10) unsigned NOT NULL DEFAULT '0',
  field9 int(10) unsigned NOT NULL DEFAULT '0',
  field10 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field11 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field12 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field13 varchar(255) NOT NULL,
  field14 varchar(255) NOT NULL,
  field15 varchar(255) NOT NULL,
  field16 varchar(255) NOT NULL,
  field17 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field18 varchar(255) NOT NULL,
  field19 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field20 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field21 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field22 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field23 tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topicvalue2;
CREATE TABLE pw_topicvalue2 (
  tid mediumint(8) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL,
  field24 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field25 varchar(255) NOT NULL,
  field26 varchar(255) NOT NULL,
  field27 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field28 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field29 int(10) unsigned NOT NULL DEFAULT '0',
  field30 int(10) unsigned NOT NULL DEFAULT '0',
  field31 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field32 int(10) unsigned NOT NULL DEFAULT '0',
  field33 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field34 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field35 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field36 int(10) unsigned NOT NULL DEFAULT '0',
  field37 int(10) unsigned NOT NULL DEFAULT '0',
  field38 varchar(255) NOT NULL,
  field39 varchar(255) NOT NULL,
  field40 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field41 varchar(255) NOT NULL,
  field42 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field43 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field44 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field45 tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topicvalue3;
CREATE TABLE pw_topicvalue3 (
  tid mediumint(8) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL,
  field46 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field47 varchar(255) NOT NULL,
  field48 varchar(255) NOT NULL,
  field49 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field50 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field51 int(10) unsigned NOT NULL DEFAULT '0',
  field52 int(10) unsigned NOT NULL DEFAULT '0',
  field53 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field54 int(10) unsigned NOT NULL DEFAULT '0',
  field55 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field56 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field57 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field58 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field59 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field60 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field61 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field62 int(10) unsigned NOT NULL DEFAULT '0',
  field63 int(10) unsigned NOT NULL DEFAULT '0',
  field64 varchar(255) NOT NULL,
  field65 varchar(255) NOT NULL,
  field66 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field67 varchar(255) NOT NULL,
  PRIMARY KEY (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topicvalue4;
CREATE TABLE pw_topicvalue4 (
  tid mediumint(8) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL,
  field68 varchar(255) NOT NULL,
  field69 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field70 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field71 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field72 varchar(255) NOT NULL,
  field73 varchar(255) NOT NULL,
  field74 varchar(255) NOT NULL,
  field75 varchar(255) NOT NULL,
  field76 varchar(255) NOT NULL,
  field77 varchar(255) NOT NULL,
  field78 varchar(255) NOT NULL,
  field79 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field80 varchar(255) NOT NULL,
  PRIMARY KEY (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topicvalue5;
CREATE TABLE pw_topicvalue5 (
  tid mediumint(8) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL,
  field81 varchar(255) NOT NULL,
  field82 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field83 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field84 varchar(255) NOT NULL,
  field85 varchar(255) NOT NULL,
  field86 varchar(255) NOT NULL,
  field87 varchar(255) NOT NULL,
  field88 varchar(255) NOT NULL,
  field89 varchar(255) NOT NULL,
  field90 varchar(255) NOT NULL,
  field91 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field92 varchar(255) NOT NULL,
  PRIMARY KEY (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topicvalue6;
CREATE TABLE pw_topicvalue6 (
  tid mediumint(8) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL,
  field93 varchar(255) NOT NULL,
  field94 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field95 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field96 varchar(255) NOT NULL,
  field97 varchar(255) NOT NULL,
  field98 varchar(255) NOT NULL,
  field99 varchar(255) NOT NULL,
  field100 varchar(255) NOT NULL,
  field101 varchar(255) NOT NULL,
  field102 varchar(255) NOT NULL,
  field103 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field104 varchar(255) NOT NULL,
  PRIMARY KEY (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topicvalue7;
CREATE TABLE pw_topicvalue7 (
  tid mediumint(8) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL,
  field105 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field106 varchar(255) NOT NULL,
  field107 varchar(255) NOT NULL,
  field108 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field109 int(10) unsigned NOT NULL DEFAULT '0',
  field110 varchar(255) NOT NULL,
  field111 varchar(255) NOT NULL,
  field112 varchar(255) NOT NULL,
  field113 varchar(255) NOT NULL,
  field114 varchar(255) NOT NULL,
  field115 varchar(255) NOT NULL,
  PRIMARY KEY (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_topicvalue8;
CREATE TABLE pw_topicvalue8 (
  tid mediumint(8) unsigned NOT NULL,
  fid smallint(6) unsigned NOT NULL,
  field116 tinyint(3) unsigned NOT NULL DEFAULT '0',
  field117 varchar(255) NOT NULL,
  field118 varchar(255) NOT NULL,
  field119 varchar(255) NOT NULL,
  field120 varchar(255) NOT NULL,
  field121 varchar(255) NOT NULL,
  field122 varchar(255) NOT NULL,
  field123 varchar(255) NOT NULL,
  field124 varchar(255) NOT NULL,
  field125 varchar(255) NOT NULL,
  field126 varchar(255) NOT NULL,
  field127 varchar(255) NOT NULL,
  field128 varchar(255) NOT NULL,
  PRIMARY KEY (tid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_tpl;
CREATE TABLE pw_tpl (
  tplid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  descrip varchar(255) NOT NULL,
  tagcode text NOT NULL,
  image varchar(255) NOT NULL,
  PRIMARY KEY (tplid),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_tpltype;
CREATE TABLE pw_tpltype (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_trade;
CREATE TABLE pw_trade (
  tid mediumint(8) unsigned NOT NULL,
  uid mediumint(8) unsigned NOT NULL,
  `name` varchar(80) NOT NULL,
  icon varchar(80) NOT NULL,
  degree tinyint(1) unsigned NOT NULL,
  `type` smallint(6) unsigned NOT NULL,
  num smallint(6) unsigned NOT NULL,
  salenum smallint(6) unsigned NOT NULL,
  price decimal(8,2) NOT NULL,
  costprice decimal(8,2) NOT NULL,
  locus varchar(30) NOT NULL,
  paymethod tinyint(3) unsigned NOT NULL,
  transport tinyint(1) unsigned NOT NULL,
  mailfee decimal(4,2) NOT NULL,
  expressfee decimal(4,2) NOT NULL,
  emsfee decimal(4,2) NOT NULL,
  deadline int(10) unsigned NOT NULL,
  PRIMARY KEY (tid),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_tradeorder;
CREATE TABLE pw_tradeorder (
  oid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  order_no varchar(30) NOT NULL,
  tid mediumint(8) unsigned NOT NULL,
  `subject` varchar(80) NOT NULL,
  buyer mediumint(8) unsigned NOT NULL,
  seller mediumint(8) unsigned NOT NULL,
  price decimal(6,2) NOT NULL,
  quantity smallint(6) unsigned NOT NULL,
  transportfee decimal(4,2) NOT NULL,
  transport tinyint(1) unsigned NOT NULL,
  buydate int(10) unsigned NOT NULL,
  tradedate int(10) unsigned NOT NULL,
  ifpay tinyint(1) NOT NULL,
  address varchar(80) NOT NULL,
  consignee varchar(15) NOT NULL,
  tel varchar(15) NOT NULL,
  zip varchar(15) NOT NULL,
  descrip varchar(255) NOT NULL,
  payment tinyint(1) unsigned NOT NULL,
  tradeinfo varchar(255) NOT NULL,
  PRIMARY KEY (oid),
  UNIQUE KEY order_no (order_no),
  KEY tid (tid),
  KEY buyer (buyer),
  KEY seller (seller)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_ucapp;
CREATE TABLE pw_ucapp (
  id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  siteurl varchar(50) NOT NULL,
  secretkey varchar(40) NOT NULL,
  interface varchar(30) NOT NULL,
  uc tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_ucnotify;
CREATE TABLE pw_ucnotify (
  uid mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_ucsyncredit;
CREATE TABLE pw_ucsyncredit (
  uid mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_userapp;
CREATE TABLE pw_userapp (
  uid mediumint(8) unsigned NOT NULL,
  appid mediumint(8) unsigned NOT NULL,
  appname varchar(20) NOT NULL,
  allowfeed tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (uid,appid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_usergroups;
CREATE TABLE pw_usergroups (
  gid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  gptype enum('default','member','system','special') NOT NULL DEFAULT 'member',
  grouptitle varchar(60) NOT NULL DEFAULT '',
  groupimg varchar(15) NOT NULL DEFAULT '',
  grouppost int(10) NOT NULL DEFAULT '0',
  ifdefault tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (gid),
  KEY gptype (gptype),
  KEY grouppost (grouppost)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_usertool;
CREATE TABLE pw_usertool (
  uid mediumint(8) unsigned NOT NULL DEFAULT '0',
  toolid smallint(6) NOT NULL DEFAULT '0',
  nums smallint(6) NOT NULL DEFAULT '0',
  sellnums smallint(6) NOT NULL DEFAULT '0',
  sellprice varchar(255) NOT NULL DEFAULT '',
  sellstatus tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_voter;
CREATE TABLE pw_voter (
  tid mediumint(8) unsigned NOT NULL,
  uid mediumint(8) unsigned NOT NULL,
  username varchar(15) NOT NULL,
  vote tinyint(3) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL,
  KEY tid (tid),
  KEY uid (uid)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_windcode;
CREATE TABLE pw_windcode (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL DEFAULT '',
  icon varchar(30) NOT NULL DEFAULT '',
  pattern varchar(30) NOT NULL DEFAULT '',
  replacement text NOT NULL,
  param tinyint(1) NOT NULL DEFAULT '0',
  ifopen tinyint(1) NOT NULL DEFAULT '0',
  title varchar(30) NOT NULL DEFAULT '',
  descrip varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS pw_wordfb;
CREATE TABLE pw_wordfb (
  id smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  word varchar(100) NOT NULL DEFAULT '',
  wordreplace varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO pw_actions VALUES('1','1.gif','比酷','摆了个ＰＯＳＥ道：你、你、你没我酷..');
INSERT INTO pw_actions VALUES('2','2.gif','生气','撅了撅嘴说：气死我了呀!呀!呀!');
INSERT INTO pw_actions VALUES('3','3.gif','狂笑','仰天狂笑：普天之下,竟然没有我的对手...');
INSERT INTO pw_actions VALUES('4','4.gif','痛哭','鼻子一酸,开始叭嗒叭嗒掉眼泪了');
INSERT INTO pw_actions VALUES('5','5.gif','唱歌','清清嗓子唱起歌来：东方红,太阳升');



INSERT INTO pw_administrators VALUES('1','admin','3','','1253334243,127.0.0.1;1253363717,127.0.0.1;1253366134,127.0.0.1;1253369505,127.0.0.1;1253434010,127.0.0.1;1253512911,127.0.0.1;1253520876,127.0.0.1;1253525332,127.0.0.1');


INSERT INTO pw_adminset VALUES('3','a:53:{s:8:\"settings\";a:11:{s:5:\"basic\";i:1;s:4:\"safe\";i:1;s:3:\"att\";i:1;s:6:\"credit\";i:1;s:3:\"reg\";i:1;s:6:\"member\";i:1;s:6:\"pcache\";i:1;s:5:\"index\";i:1;s:6:\"thread\";i:1;s:4:\"read\";i:1;s:5:\"other\";i:1;}s:11:\"updatecache\";s:1:\"1\";s:9:\"postcache\";s:1:\"1\";s:6:\"credit\";s:1:\"1\";s:8:\"setforum\";s:1:\"1\";s:10:\"uniteforum\";s:1:\"1\";s:8:\"creathtm\";s:1:\"1\";s:7:\"setuser\";s:1:\"1\";s:8:\"ipsearch\";s:1:\"1\";s:9:\"userstats\";s:1:\"1\";s:7:\"upgrade\";s:1:\"1\";s:9:\"editgroup\";s:1:\"1\";s:5:\"level\";s:1:\"1\";s:7:\"article\";i:0;s:6:\"member\";i:0;s:7:\"message\";i:0;s:7:\"banuser\";s:1:\"1\";s:7:\"viewban\";s:1:\"1\";s:5:\"ipban\";s:1:\"1\";s:6:\"setbwd\";s:1:\"1\";s:8:\"tpccheck\";s:1:\"1\";s:9:\"postcheck\";s:1:\"1\";s:6:\"report\";s:1:\"1\";s:10:\"checkemail\";i:0;s:8:\"checkreg\";i:0;s:12:\"announcement\";s:1:\"1\";s:8:\"mailuser\";s:1:\"1\";s:8:\"send_msg\";s:1:\"1\";s:8:\"giveuser\";s:1:\"1\";s:10:\"attachment\";s:1:\"1\";s:11:\"attachstats\";s:1:\"1\";s:11:\"attachrenew\";s:1:\"1\";s:8:\"adminlog\";i:0;s:8:\"forumlog\";s:1:\"1\";s:9:\"creditlog\";s:1:\"1\";s:7:\"userlog\";s:1:\"1\";s:6:\"setads\";s:1:\"1\";s:8:\"ipstates\";s:1:\"1\";s:5:\"share\";s:1:\"1\";s:8:\"viewtody\";s:1:\"1\";s:5:\"c_set\";s:1:\"1\";s:7:\"c_forum\";s:1:\"1\";s:7:\"c_unite\";s:1:\"1\";s:5:\"c_htm\";s:1:\"1\";s:6:\"addatc\";s:1:\"1\";s:6:\"schatc\";s:1:\"1\";s:6:\"bakout\";s:1:\"0\";s:5:\"bakin\";s:1:\"0\";s:6:\"repair\";s:1:\"0\";s:9:\"setstyles\";s:1:\"1\";s:8:\"superdel\";a:3:{s:7:\"article\";i:1;s:6:\"member\";i:1;s:7:\"message\";i:1;}s:9:\"usercheck\";a:2:{s:10:\"checkemail\";i:1;s:8:\"checkreg\";i:1;}s:6:\"record\";a:1:{s:8:\"adminlog\";i:1;}}');
INSERT INTO pw_adminset VALUES('4','a:52:{s:8:\"settings\";s:1:\"0\";s:11:\"updatecache\";s:1:\"0\";s:9:\"postcache\";s:1:\"1\";s:6:\"credit\";s:1:\"0\";s:8:\"setforum\";s:1:\"0\";s:10:\"uniteforum\";s:1:\"0\";s:8:\"creathtm\";s:1:\"0\";s:7:\"setuser\";s:1:\"0\";s:8:\"ipsearch\";s:1:\"1\";s:9:\"userstats\";s:1:\"1\";s:7:\"upgrade\";s:1:\"0\";s:9:\"editgroup\";s:1:\"1\";s:5:\"level\";s:1:\"0\";s:7:\"article\";s:1:\"0\";s:6:\"member\";s:1:\"0\";s:7:\"message\";i:0;s:7:\"banuser\";s:1:\"1\";s:7:\"viewban\";s:1:\"1\";s:5:\"ipban\";s:1:\"1\";s:6:\"setbwd\";s:1:\"1\";s:8:\"tpccheck\";s:1:\"1\";s:9:\"postcheck\";s:1:\"1\";s:6:\"report\";s:1:\"1\";s:10:\"checkemail\";i:0;s:8:\"checkreg\";i:0;s:12:\"announcement\";s:1:\"1\";s:8:\"mailuser\";s:1:\"0\";s:8:\"send_msg\";s:1:\"0\";s:8:\"giveuser\";s:1:\"1\";s:10:\"attachment\";s:1:\"1\";s:11:\"attachstats\";s:1:\"1\";s:11:\"attachrenew\";s:1:\"1\";s:8:\"adminlog\";s:1:\"0\";s:8:\"forumlog\";s:1:\"1\";s:9:\"creditlog\";s:1:\"1\";s:7:\"userlog\";s:1:\"1\";s:6:\"setads\";s:1:\"1\";s:8:\"ipstates\";s:1:\"0\";s:5:\"share\";s:1:\"1\";s:8:\"viewtody\";s:1:\"1\";s:5:\"c_set\";s:1:\"0\";s:7:\"c_forum\";s:1:\"0\";s:7:\"c_unite\";s:1:\"0\";s:5:\"c_htm\";s:1:\"0\";s:6:\"addatc\";s:1:\"0\";s:6:\"schatc\";s:1:\"0\";s:6:\"bakout\";s:1:\"0\";s:5:\"bakin\";s:1:\"0\";s:6:\"repair\";s:1:\"0\";s:9:\"setstyles\";s:1:\"0\";s:8:\"superdel\";a:1:{s:7:\"message\";i:1;}s:9:\"usercheck\";a:2:{s:10:\"checkemail\";i:1;s:8:\"checkreg\";i:1;}}');
INSERT INTO pw_adminset VALUES('5','a:50:{s:8:\"settings\";s:1:\"0\";s:11:\"updatecache\";s:1:\"0\";s:9:\"postcache\";s:1:\"0\";s:6:\"credit\";s:1:\"0\";s:8:\"setforum\";s:1:\"0\";s:10:\"uniteforum\";s:1:\"0\";s:8:\"creathtm\";s:1:\"0\";s:7:\"setuser\";s:1:\"0\";s:8:\"ipsearch\";s:1:\"0\";s:9:\"userstats\";s:1:\"0\";s:7:\"upgrade\";s:1:\"0\";s:9:\"editgroup\";s:1:\"0\";s:5:\"level\";s:1:\"0\";s:7:\"article\";s:1:\"0\";s:6:\"member\";s:1:\"0\";s:7:\"message\";s:1:\"0\";s:7:\"banuser\";s:1:\"1\";s:7:\"viewban\";s:1:\"1\";s:5:\"ipban\";s:1:\"0\";s:6:\"setbwd\";s:1:\"0\";s:8:\"tpccheck\";s:1:\"0\";s:9:\"postcheck\";s:1:\"0\";s:6:\"report\";s:1:\"1\";s:10:\"checkemail\";s:1:\"0\";s:8:\"checkreg\";s:1:\"0\";s:12:\"announcement\";s:1:\"1\";s:8:\"mailuser\";s:1:\"0\";s:8:\"send_msg\";s:1:\"0\";s:8:\"giveuser\";s:1:\"0\";s:10:\"attachment\";s:1:\"0\";s:11:\"attachstats\";s:1:\"0\";s:11:\"attachrenew\";s:1:\"0\";s:8:\"adminlog\";s:1:\"0\";s:8:\"forumlog\";s:1:\"1\";s:9:\"creditlog\";s:1:\"1\";s:7:\"userlog\";s:1:\"0\";s:6:\"setads\";s:1:\"0\";s:8:\"ipstates\";s:1:\"0\";s:5:\"share\";s:1:\"0\";s:8:\"viewtody\";s:1:\"0\";s:5:\"c_set\";s:1:\"0\";s:7:\"c_forum\";s:1:\"0\";s:7:\"c_unite\";s:1:\"0\";s:5:\"c_htm\";s:1:\"0\";s:6:\"addatc\";s:1:\"0\";s:6:\"schatc\";s:1:\"0\";s:6:\"bakout\";s:1:\"0\";s:5:\"bakin\";s:1:\"0\";s:6:\"repair\";s:1:\"0\";s:9:\"setstyles\";s:1:\"0\";}');
INSERT INTO pw_adminset VALUES('17','a:1:{s:15:\"area_tplcontent\";i:1;}');

INSERT INTO pw_advert VALUES('1','0','0','Site.Header','0','0','1','0','头部横幅~	~显示在页面的头部，一般以图片或flash方式显示，多条广告时系统将随机选取一条显示','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('2','0','0','Site.Footer','0','0','1','0','底部横幅~	~显示在页面的底部，一般以图片或flash方式显示，多条广告时系统将随机选取一条显示','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('3','0','0','Site.NavBanner1','0','0','1','0','导航通栏[1]~	~显示在主导航的下面，一般以图片或flash方式显示，多条广告时系统将随机选取一条显示','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('4','0','0','Site.NavBanner2','0','0','1','0','导航通栏[2]~	~显示在头部通栏广告[1]位置的下面,与通栏广告[1]可一起显示,一般为图片广告','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('5','0','0','Site.PopupNotice','0','0','1','0','弹窗广告[右下]~	~在页面右下角以浮动的层弹出显示，此广告内容需要单独设置相关窗口参数','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('6','0','0','Site.FloatRand','0','0','1','0','漂浮广告[随机]~	~以各种形式在页面内随机漂浮的广告','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('7','0','0','Site.FloatLeft','0','0','1','0','漂浮广告[左]~	~以各种形式在页面左边漂浮的广告，俗称对联广告[左]','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('8','0','0','Site.FloatRight','0','0','1','0','漂浮广告[右]~	~以各种形式在页面右边漂浮的广告，俗称对联广告[右]','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('9','0','0','Mode.TextIndex','0','0','1','0','文字广告[论坛首页]~	~显示在页面的导航下面，一般以文字方式显示，每行四条广告，超过四条将换行显示','a:1:{s:7:\"display\";s:3:\"all\";}');
INSERT INTO pw_advert VALUES('10','0','0','Mode.Forum.TextRead','0','0','1','0','文字广告[帖子页]~	~显示在页面的导航下面，一般以文字方式显示，每行四条广告，超过四条将换行显示','a:1:{s:7:\"display\";s:3:\"all\";}');
INSERT INTO pw_advert VALUES('11','0','0','Mode.Forum.TextThread','0','0','1','0','文字广告[主题页]~	~显示在页面的导航下面，一般以文字方式显示，每行四条广告，超过四条将换行显示','a:1:{s:7:\"display\";s:3:\"all\";}');
INSERT INTO pw_advert VALUES('12','0','0','Mode.Forum.Layer.TidRight','0','0','1','0','楼层广告[帖子右侧]~	~出现在帖子右侧，一般以图片或文字显示，多条帖间广告时系统将随机选取一条显示','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('13','0','0','Mode.Forum.Layer.TidDown','0','0','1','0','楼层广告[帖子下方]~	~出现在帖子下方，一般以图片或文字显示，多条帖间广告时系统将随机选取一条显示','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('14','0','0','Mode.Forum.Layer.TidUp','0','0','1','0','楼层广告[帖子上方]~	~出现在帖子上方，一般以图片或文字显示，多条帖间广告时系统将随机选取一条显示','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('15','0','0','Mode.Forum.Layer.TidAmong','0','0','1','0','楼层广告[楼层中间]~	~出现在帖子楼层之间，一般以图片或文字显示，多条帖间广告时系统将随机选取一条显示','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('16','0','0','Mode.Layer.Index','0','0','1','0','论坛首页分类间~	~出现在首页分类层之间，一般以图片或文字显示，多条帖间广告时系统将随机选取一条显示','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('17','0','0','Mode.area.IndexMain','0','0','1','0','门户首页中间~	~门户首页循环广告下面的中间主要广告位,一般为图片广告','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('18','0','0','Mode.Layer.area.IndexLoop','0','0','1','0','门户首页循环~	~门户首页中间循环模块之间的广告投放，一般为图片广告','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('19','0','0','Mode.Layer.area.IndexSide','0','0','1','0','门户首页侧边~	~门户首页侧边每隔一个模块都有一个广告位显示,位置顺序对应选择的楼层数.一般为小图片广告','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('20','0','0','Mode.Forum.area.CateMain','0','0','1','0','门户频道中间~	~门户频道焦点下面的中间主要广告位,一般为图片广告','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('21','0','0','Mode.Forum.Layer.area.CateLoop','0','0','1','0','门户频道循环~	~门户频道中间循环模块之间的广告投放，一般为图片广告','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('22','0','0','Mode.Forum.Layer.area.CateSide','0','0','1','0','门户频道侧边~	~门户频道侧边每隔一个模块都有一个广告位显示,位置顺序对应选择的楼层数.一般为小图片广告','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('23','0','0','Mode.Forum.Layer.area.ThreadTop','0','0','1','0','门户帖子列表页右上~	~帖子列表页门户模式浏览时，右上方的广告位','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('24','0','0','Mode.Forum.Layer.area.ThreadBtm','0','0','1','0','门户帖子列表页右下~	~帖子列表页门户模式浏览时，右下方的广告位','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('25','0','0','Mode.Forum.Layer.area.ReadTop','0','0','1','0','门户帖子内容页右上~	~帖子内容页门户模式浏览时，右上方的广告位','a:1:{s:7:\"display\";s:4:\"rand\";}');
INSERT INTO pw_advert VALUES('26','0','0','Mode.Forum.Layer.area.ReadBtm','0','0','1','0','门户帖子内容页右下~	~帖子内容页门户模式浏览时，右下方的广告位','a:1:{s:7:\"display\";s:4:\"rand\";}');






INSERT INTO pw_bbsinfo VALUES('1','admin','1','2','1253409047','1253462400','0','39','0','0','0','0','0');

INSERT INTO pw_block VALUES('1','1','newsubject','最新主题','','1800','1');
INSERT INTO pw_block VALUES('2','1','newreply','最新回复','','600','1');
INSERT INTO pw_block VALUES('3','1','digestsubject','精华主题','','86400','1');
INSERT INTO pw_block VALUES('4','1','replysort','回复排行','','86400','1');
INSERT INTO pw_block VALUES('5','1','hitsort','人气排行','','86400','1');
INSERT INTO pw_block VALUES('6','2','usersort','金钱排行','money','3000','1');
INSERT INTO pw_block VALUES('7','2','usersort','威望排行','rvrc','3000','1');
INSERT INTO pw_block VALUES('8','3','forumsort','今日发帖','tpost','600','1');
INSERT INTO pw_block VALUES('9','3','forumsort','主题数排行','topic','86400','1');
INSERT INTO pw_block VALUES('10','3','forumsort','发帖量排行','article','86400','1');
INSERT INTO pw_block VALUES('11','4','gettags','热门标签','hot','86400','1');
INSERT INTO pw_block VALUES('12','4','gettags','最新标签','new','86400','1');
INSERT INTO pw_block VALUES('13','5','newpic','最新图片','','1700','1');
INSERT INTO pw_block VALUES('15','6','hotactive','热门活动','','86400','1');
INSERT INTO pw_block VALUES('18','2','usersort','在线时间排行','onlinetime','86400','1');
INSERT INTO pw_block VALUES('19','2','usersort','今日发帖排行','todaypost','1200','1');
INSERT INTO pw_block VALUES('20','2','usersort','月发帖排行','monthpost','40000','1');
INSERT INTO pw_block VALUES('21','2','usersort','发贴排行','postnum','40000','1');
INSERT INTO pw_block VALUES('22','2','usersort','发贴排行','monoltime','40000','1');
INSERT INTO pw_block VALUES('23','1','replysortday','今日热帖','','1800','1');
INSERT INTO pw_block VALUES('25','2','usersort','贡献值排行','credit','3000','1');
INSERT INTO pw_block VALUES('26','2','usersort','交易币排行榜','currency','3000','1');
INSERT INTO pw_block VALUES('29','1','highlightsubject','加亮主题','','50000','1');
INSERT INTO pw_block VALUES('38','6','todayactive','今日活动','','3600','1');
INSERT INTO pw_block VALUES('41','6','newactive','最新活动','','1800','1');
INSERT INTO pw_block VALUES('49','1','replysortweek','近期热贴','','86400','1');
INSERT INTO pw_block VALUES('47','1','hitsortday','今日人气','','1800','1');


INSERT INTO pw_cache VALUES('index_cache','$notice_A=array(\r\n);\r\n$sharelink=array(\r\n	\'1\' => \'<a href=\"http://www.phpwind.net\" target=\"_blank\"><img src=\"logo.gif\" alt=\"PHPwind官方论坛\" width=\"88\" height=\"31\"></a>\',\r\n);','0');
INSERT INTO pw_cache VALUES('thread_announce','$notice_A=array(\r\n);\r\n$notice_C=array(\r\n);','0');
INSERT INTO pw_cache VALUES('postcache','$faces=array(\r\n	\'default\'=>array(\r\n		\'name\'=>\'默认表情\',\r\n		\'child\'=>array(\'2\',\'14\',\'13\',\'12\',\'11\',\'10\',\'9\',\'8\',\'7\',\'6\',\'5\',\'4\',\'3\',\'15\',),\r\n	),\r\n);\r\n$face=array(\r\n	\'2\'=>array(\'default/1.gif\',\'\',\'\'),\r\n	\'14\'=>array(\'default/13.gif\',\'\',\'\'),\r\n	\'13\'=>array(\'default/12.gif\',\'\',\'\'),\r\n	\'12\'=>array(\'default/11.gif\',\'\',\'\'),\r\n	\'11\'=>array(\'default/10.gif\',\'\',\'\'),\r\n	\'10\'=>array(\'default/9.gif\',\'\',\'\'),\r\n	\'9\'=>array(\'default/8.gif\',\'\',\'\'),\r\n	\'8\'=>array(\'default/7.gif\',\'\',\'\'),\r\n	\'7\'=>array(\'default/6.gif\',\'\',\'\'),\r\n	\'6\'=>array(\'default/5.gif\',\'\',\'\'),\r\n	\'5\'=>array(\'default/4.gif\',\'\',\'\'),\r\n	\'4\'=>array(\'default/3.gif\',\'\',\'\'),\r\n	\'3\'=>array(\'default/2.gif\',\'\',\'\'),\r\n	\'15\'=>array(\'default/14.gif\',\'\',\'\'),\r\n);','0');
INSERT INTO pw_cache VALUES('medaldb','$_MEDALDB=array(\r\n	\'1\' => array(\r\n		\'id\' => \'1\',\r\n		\'name\' => \'终身成就奖\',\r\n		\'intro\' => \'谢谢您为社区发展做出的不可磨灭的贡献!!\',\r\n		\'picurl\' => \'1.gif\',\r\n	),\r\n	\'2\' => array(\r\n		\'id\' => \'2\',\r\n		\'name\' => \'优秀斑竹奖\',\r\n		\'intro\' => \'辛劳地为论坛付出劳动，收获快乐，感谢您!\',\r\n		\'picurl\' => \'2.gif\',\r\n	),\r\n	\'3\' => array(\r\n		\'id\' => \'3\',\r\n		\'name\' => \'宣传大使奖\',\r\n		\'intro\' => \'谢谢您为社区积极宣传,特颁发此奖!\',\r\n		\'picurl\' => \'3.gif\',\r\n	),\r\n	\'4\' => array(\r\n		\'id\' => \'4\',\r\n		\'name\' => \'特殊贡献奖\',\r\n		\'intro\' => \'您为论坛做出了特殊贡献,谢谢您!\',\r\n		\'picurl\' => \'4.gif\',\r\n	),\r\n	\'5\' => array(\r\n		\'id\' => \'5\',\r\n		\'name\' => \'金点子奖\',\r\n		\'intro\' => \'为社区提出建设性的建议被采纳,特颁发此奖!\',\r\n		\'picurl\' => \'5.gif\',\r\n	),\r\n	\'6\' => array(\r\n		\'id\' => \'6\',\r\n		\'name\' => \'原创先锋奖\',\r\n		\'intro\' => \'谢谢您积极发表原创作品,特颁发此奖!\',\r\n		\'picurl\' => \'6.gif\',\r\n	),\r\n	\'7\' => array(\r\n		\'id\' => \'7\',\r\n		\'name\' => \'贴图大师奖\',\r\n		\'intro\' => \'帖图高手,堪称大师!\',\r\n		\'picurl\' => \'7.gif\',\r\n	),\r\n	\'8\' => array(\r\n		\'id\' => \'8\',\r\n		\'name\' => \'灌水天才奖\',\r\n		\'intro\' => \'能够长期提供优质的社区水资源者,可得这个奖章!\',\r\n		\'picurl\' => \'8.gif\',\r\n	),\r\n	\'9\' => array(\r\n		\'id\' => \'9\',\r\n		\'name\' => \'新人进步奖\',\r\n		\'intro\' => \'新人有很大的进步可以得到这个奖章!\',\r\n		\'picurl\' => \'9.gif\',\r\n	),\r\n	\'10\' => array(\r\n		\'id\' => \'10\',\r\n		\'name\' => \'幽默大师奖\',\r\n		\'intro\' => \'您总是能给别人带来欢乐,谢谢您!\',\r\n		\'picurl\' => \'10.gif\',\r\n	),\r\n);','0');
INSERT INTO pw_cache VALUES('forum_cache','$forum=array(\r\n	\'1\' => array(\r\n		\'fid\' => \'1\',\r\n		\'fup\' => \'0\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'1\',\r\n		\'type\' => \'category\',\r\n		\'name\' => \'互动\',\r\n		\'style\' => \'0\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n	\'2\' => array(\r\n		\'fid\' => \'2\',\r\n		\'fup\' => \'1\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'0\',\r\n		\'type\' => \'forum\',\r\n		\'name\' => \'有问有答\',\r\n		\'style\' => \'0\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n	\'3\' => array(\r\n		\'fid\' => \'3\',\r\n		\'fup\' => \'1\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'0\',\r\n		\'type\' => \'forum\',\r\n		\'name\' => \'业主交流\',\r\n		\'style\' => \'0\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n	\'4\' => array(\r\n		\'fid\' => \'4\',\r\n		\'fup\' => \'0\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'1\',\r\n		\'type\' => \'category\',\r\n		\'name\' => \'装修\',\r\n		\'style\' => \'0\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n	\'8\' => array(\r\n		\'fid\' => \'8\',\r\n		\'fup\' => \'4\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'0\',\r\n		\'type\' => \'forum\',\r\n		\'name\' => \'装修宝典\',\r\n		\'style\' => \'0\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n	\'5\' => array(\r\n		\'fid\' => \'5\',\r\n		\'fup\' => \'0\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'1\',\r\n		\'type\' => \'category\',\r\n		\'name\' => \'家居\',\r\n		\'style\' => \'0\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n	\'9\' => array(\r\n		\'fid\' => \'9\',\r\n		\'fup\' => \'5\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'0\',\r\n		\'type\' => \'forum\',\r\n		\'name\' => \'时尚家居\',\r\n		\'style\' => \'0\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n	\'6\' => array(\r\n		\'fid\' => \'6\',\r\n		\'fup\' => \'0\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'1\',\r\n		\'type\' => \'category\',\r\n		\'name\' => \'设计\',\r\n		\'style\' => \'\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n	\'10\' => array(\r\n		\'fid\' => \'10\',\r\n		\'fup\' => \'6\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'0\',\r\n		\'type\' => \'forum\',\r\n		\'name\' => \'家装设计\',\r\n		\'style\' => \'0\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n	\'11\' => array(\r\n		\'fid\' => \'11\',\r\n		\'fup\' => \'0\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'1\',\r\n		\'type\' => \'category\',\r\n		\'name\' => \'管理\',\r\n		\'style\' => \'\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n	\'12\' => array(\r\n		\'fid\' => \'12\',\r\n		\'fup\' => \'11\',\r\n		\'ifsub\' => \'0\',\r\n		\'childid\' => \'0\',\r\n		\'type\' => \'forum\',\r\n		\'name\' => \'社区管理\',\r\n		\'style\' => \'0\',\r\n		\'f_type\' => \'forum\',\r\n		\'cms\' => \'0\',\r\n		\'ifhide\' => \'1\',\r\n	),\r\n);\r\n$forumcache=\'\r\n<option value=\"1\">&gt;&gt; 互动</option>\r\n<option value=\"2\"> &nbsp;|- 有问有答</option>\r\n<option value=\"3\"> &nbsp;|- 业主交流</option>\r\n<option value=\"4\">&gt;&gt; 装修</option>\r\n<option value=\"8\"> &nbsp;|- 装修宝典</option>\r\n<option value=\"5\">&gt;&gt; 家居</option>\r\n<option value=\"9\"> &nbsp;|- 时尚家居</option>\r\n<option value=\"6\">&gt;&gt; 设计</option>\r\n<option value=\"10\"> &nbsp;|- 家装设计</option>\r\n<option value=\"11\">&gt;&gt; 管理</option>\r\n<option value=\"12\"> &nbsp;|- 社区管理</option>\r\n\';\r\n$cmscache=\'\r\n\';\r\n$pwForumList=array(\r\n	\'1\' => array(\r\n		\'name\' => \'互动\',\r\n		\'child\' => array(\r\n			\'2\' => \'有问有答\',\r\n			\'3\' => \'业主交流\',\r\n		),\r\n	),\r\n	\'4\' => array(\r\n		\'name\' => \'装修\',\r\n		\'child\' => array(\r\n			\'8\' => \'装修宝典\',\r\n		),\r\n	),\r\n	\'5\' => array(\r\n		\'name\' => \'家居\',\r\n		\'child\' => array(\r\n			\'9\' => \'时尚家居\',\r\n		),\r\n	),\r\n	\'6\' => array(\r\n		\'name\' => \'设计\',\r\n		\'child\' => array(\r\n			\'10\' => \'家装设计\',\r\n		),\r\n	),\r\n	\'11\' => array(\r\n		\'name\' => \'管理\',\r\n		\'child\' => array(\r\n			\'12\' => \'社区管理\',\r\n		),\r\n	),\r\n);\r\n$topic_type_cache=NULL;','0');
INSERT INTO pw_cache VALUES('md_config','$md_appgroups=\'\';\r\n$md_groups=\',3,\';\r\n$md_ifapply=\'1\';\r\n$md_ifmsg=\'1\';\r\n$md_ifopen=\'1\';\r\n','0');
INSERT INTO pw_cache VALUES('level','$ltitle=$lpic=$lneed=array();\r\n/**\r\n* default\r\n*/\r\n$ltitle[1]=\'default\';		$lpic[1]=\'8\';\r\n$ltitle[2]=\'游客\';		$lpic[2]=\'8\';\r\n$ltitle[6]=\'禁止发言\';		$lpic[6]=\'8\';\r\n$ltitle[7]=\'未验证会员\';		$lpic[7]=\'8\';\r\n\r\n/**\r\n* system\r\n*/\r\n$ltitle[3]=\'管理员\';		$lpic[3]=\'3\';\r\n$ltitle[4]=\'总版主\';		$lpic[4]=\'4\';\r\n$ltitle[5]=\'论坛版主\';		$lpic[5]=\'5\';\r\n$ltitle[17]=\'门户编辑\';		$lpic[17]=\'5\';\r\n\r\n/**\r\n* special\r\n*/\r\n$ltitle[16]=\'荣誉会员\';		$lpic[16]=\'5\';\r\n\r\n/**\r\n* member\r\n*/\r\n$ltitle[8]=\'新手上路\';		$lpic[8]=\'8\';		$lneed[8]=\'0\';\r\n$ltitle[9]=\'侠客\';		$lpic[9]=\'9\';		$lneed[9]=\'100\';\r\n$ltitle[10]=\'骑士\';		$lpic[10]=\'10\';		$lneed[10]=\'300\';\r\n$ltitle[11]=\'圣骑士\';		$lpic[11]=\'11\';		$lneed[11]=\'600\';\r\n$ltitle[12]=\'精灵王\';		$lpic[12]=\'12\';		$lneed[12]=\'1000\';\r\n$ltitle[13]=\'风云使者\';		$lpic[13]=\'13\';		$lneed[13]=\'5000\';\r\n$ltitle[14]=\'光明使者\';		$lpic[14]=\'14\';		$lneed[14]=\'10000\';\r\n$ltitle[15]=\'天使\';		$lpic[15]=\'14\';		$lneed[15]=\'50000\';\r\n','0');
INSERT INTO pw_cache VALUES('gp_right','$gp_right=array(\r\n	\'1\' => array(\r\n		\'fontsize\' => \'\',\r\n		\'imgheight\' => \'\',\r\n		\'imgwidth\' => \'\',\r\n	),\r\n	\'2\' => array(\r\n		\'fontsize\' => \'\',\r\n		\'imgheight\' => \'\',\r\n		\'imgwidth\' => \'\',\r\n	),\r\n	\'3\' => array(\r\n		\'fontsize\' => \'\',\r\n		\'imgheight\' => \'\',\r\n		\'imgwidth\' => \'\',\r\n	),\r\n	\'4\' => array(\r\n		\'fontsize\' => \'\',\r\n		\'imgheight\' => \'\',\r\n		\'imgwidth\' => \'\',\r\n	),\r\n	\'5\' => array(\r\n		\'fontsize\' => \'\',\r\n		\'imgheight\' => \'\',\r\n		\'imgwidth\' => \'\',\r\n	),\r\n	\'6\' => array(\r\n		\'fontsize\' => \'\',\r\n		\'imgheight\' => \'\',\r\n		\'imgwidth\' => \'\',\r\n	),\r\n	\'7\' => array(\r\n		\'fontsize\' => \'\',\r\n		\'imgheight\' => \'\',\r\n		\'imgwidth\' => \'\',\r\n	),\r\n	\'8\' => array(\r\n		\'fontsize\' => \'3\',\r\n		\'imgheight\' => \'\',\r\n		\'imgwidth\' => \'\',\r\n	),\r\n	\'16\' => array(\r\n		\'fontsize\' => \'\',\r\n		\'imgheight\' => \'\',\r\n		\'imgwidth\' => \'\',\r\n	),\r\n	\'17\' => array(\r\n		\'fontsize\' => \'\',\r\n		\'imgheight\' => \'\',\r\n		\'imgwidth\' => \'\',\r\n	),\r\n);','0');
INSERT INTO pw_cache VALUES('customfield','$customfield=array(\r\n);','0');

INSERT INTO pw_cachedata VALUES('146','13','0','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253526324');
INSERT INTO pw_cachedata VALUES('147','14','0','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253526324');
INSERT INTO pw_cachedata VALUES('148','15','0','0','a:10:{i:0;a:2:{s:3:\"url\";s:15:\"read.php?tid=39\";s:5:\"title\";s:30:\"装饰装修石材如何选 ..\";}i:1;a:2:{s:3:\"url\";s:15:\"read.php?tid=38\";s:5:\"title\";s:30:\"水磨石地面装饰施工 ..\";}i:2;a:2:{s:3:\"url\";s:15:\"read.php?tid=37\";s:5:\"title\";s:30:\"德国研发新工具，解 ..\";}i:3;a:2:{s:3:\"url\";s:15:\"read.php?tid=36\";s:5:\"title\";s:27:\"装修设计之十种武器\";}i:4;a:2:{s:3:\"url\";s:15:\"read.php?tid=35\";s:5:\"title\";s:31:\"何时买建材 掌握合适 ..\";}i:5;a:2:{s:3:\"url\";s:15:\"read.php?tid=34\";s:5:\"title\";s:30:\"业主如何当监工，装 ..\";}i:6;a:2:{s:3:\"url\";s:15:\"read.php?tid=33\";s:5:\"title\";s:18:\"装修省钱宝典\";}i:7;a:2:{s:3:\"url\";s:15:\"read.php?tid=32\";s:5:\"title\";s:24:\"浅析“绿色家具”\";}i:8;a:2:{s:3:\"url\";s:15:\"read.php?tid=31\";s:5:\"title\";s:30:\"风水之谈：办公室里 ..\";}i:9;a:2:{s:3:\"url\";s:15:\"read.php?tid=30\";s:5:\"title\";s:27:\"详解装修面积如何算\";}}','1253526424');
INSERT INTO pw_cachedata VALUES('31','1','0','0','a:0:{}','1252826155');
INSERT INTO pw_cachedata VALUES('150','2','0','0','a:15:{i:0;a:2:{s:3:\"url\";s:15:\"read.php?tid=39\";s:5:\"title\";s:33:\"装饰装修石材如何选， ..\";}i:1;a:2:{s:3:\"url\";s:15:\"read.php?tid=38\";s:5:\"title\";s:33:\"水磨石地面装饰施工及 ..\";}i:2;a:2:{s:3:\"url\";s:15:\"read.php?tid=37\";s:5:\"title\";s:33:\"德国研发新工具，解决 ..\";}i:3;a:2:{s:3:\"url\";s:15:\"read.php?tid=36\";s:5:\"title\";s:27:\"装修设计之十种武器\";}i:4;a:2:{s:3:\"url\";s:15:\"read.php?tid=35\";s:5:\"title\";s:34:\"何时买建材 掌握合适的 ..\";}i:5;a:2:{s:3:\"url\";s:15:\"read.php?tid=34\";s:5:\"title\";s:33:\"业主如何当监工，装修 ..\";}i:6;a:2:{s:3:\"url\";s:15:\"read.php?tid=33\";s:5:\"title\";s:18:\"装修省钱宝典\";}i:7;a:2:{s:3:\"url\";s:15:\"read.php?tid=32\";s:5:\"title\";s:24:\"浅析“绿色家具”\";}i:8;a:2:{s:3:\"url\";s:15:\"read.php?tid=31\";s:5:\"title\";s:33:\"风水之谈：办公室里如 ..\";}i:9;a:2:{s:3:\"url\";s:15:\"read.php?tid=30\";s:5:\"title\";s:27:\"详解装修面积如何算\";}i:10;a:2:{s:3:\"url\";s:15:\"read.php?tid=29\";s:5:\"title\";s:25:\"橱柜安装之4大重点\";}i:11;a:2:{s:3:\"url\";s:15:\"read.php?tid=28\";s:5:\"title\";s:27:\"环保装修之十大要点\";}i:12;a:2:{s:3:\"url\";s:15:\"read.php?tid=27\";s:5:\"title\";s:33:\"去除装修污染有帮手， ..\";}i:13;a:2:{s:3:\"url\";s:15:\"read.php?tid=26\";s:5:\"title\";s:33:\"家装业如何适应人口老 ..\";}i:14;a:2:{s:3:\"url\";s:15:\"read.php?tid=25\";s:5:\"title\";s:33:\"选购绿色环保安全的涂 ..\";}}','1253527127');
INSERT INTO pw_cachedata VALUES('151','6','0','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253527027');
INSERT INTO pw_cachedata VALUES('143','33','0','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253522708');
INSERT INTO pw_cachedata VALUES('144','9','0','0','a:6:{i:0;a:3:{s:5:\"value\";s:2:\"28\";s:3:\"url\";s:16:\"thread.php?fid=8\";s:5:\"title\";s:12:\"装修宝典\";}i:1;a:3:{s:5:\"value\";s:1:\"9\";s:3:\"url\";s:16:\"thread.php?fid=9\";s:5:\"title\";s:12:\"时尚家居\";}i:2;a:3:{s:5:\"value\";s:1:\"2\";s:3:\"url\";s:17:\"thread.php?fid=10\";s:5:\"title\";s:12:\"家装设计\";}i:3;a:3:{s:5:\"value\";s:1:\"0\";s:3:\"url\";s:16:\"thread.php?fid=3\";s:5:\"title\";s:12:\"业主交流\";}i:4;a:3:{s:5:\"value\";s:1:\"0\";s:3:\"url\";s:16:\"thread.php?fid=2\";s:5:\"title\";s:12:\"有问有答\";}i:5;a:3:{s:5:\"value\";s:1:\"0\";s:3:\"url\";s:17:\"thread.php?fid=12\";s:5:\"title\";s:12:\"社区管理\";}}','1253607438');
INSERT INTO pw_cachedata VALUES('145','18','0','0','a:2:{i:0;a:3:{s:5:\"value\";s:3:\"179\";s:3:\"url\";s:23:\"u.php?action=show&uid=1\";s:5:\"title\";s:5:\"admin\";}i:1;a:3:{s:5:\"value\";s:2:\"19\";s:3:\"url\";s:23:\"u.php?action=show&uid=3\";s:5:\"title\";s:6:\"maddog\";}}','1253524038');
INSERT INTO pw_cachedata VALUES('149','142','0','0','a:3:{i:0;a:4:{s:3:\"url\";s:15:\"read.php?tid=39\";s:5:\"title\";s:27:\"装饰装修石材如何 ..\";s:7:\"descrip\";s:42:\"在现今的装饰装修中，石材是 ..\";s:9:\"tagrelate\";a:0:{}}i:1;a:4:{s:3:\"url\";s:15:\"read.php?tid=38\";s:5:\"title\";s:27:\"水磨石地面装饰施 ..\";s:7:\"descrip\";s:42:\"水磨石是一种常用的建筑装饰 ..\";s:9:\"tagrelate\";a:0:{}}i:2;a:4:{s:3:\"url\";s:15:\"read.php?tid=37\";s:5:\"title\";s:27:\"德国研发新工具， ..\";s:7:\"descrip\";s:42:\"据有关方面统计，地板铺装后 ..\";s:9:\"tagrelate\";a:0:{}}}','1253527127');
INSERT INTO pw_cachedata VALUES('105','39','0','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253514796');
INSERT INTO pw_cachedata VALUES('106','88','1','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253522896');
INSERT INTO pw_cachedata VALUES('107','143','0','0','a:3:{i:0;a:4:{s:3:\"url\";s:15:\"read.php?tid=39\";s:5:\"title\";s:27:\"装饰装修石材如何 ..\";s:7:\"descrip\";s:42:\"在现今的装饰装修中，石材是 ..\";s:9:\"tagrelate\";a:0:{}}i:1;a:4:{s:3:\"url\";s:15:\"read.php?tid=38\";s:5:\"title\";s:27:\"水磨石地面装饰施 ..\";s:7:\"descrip\";s:42:\"水磨石是一种常用的建筑装饰 ..\";s:9:\"tagrelate\";a:0:{}}i:2;a:4:{s:3:\"url\";s:15:\"read.php?tid=37\";s:5:\"title\";s:27:\"德国研发新工具， ..\";s:7:\"descrip\";s:42:\"据有关方面统计，地板铺装后 ..\";s:9:\"tagrelate\";a:0:{}}}','1253514896');
INSERT INTO pw_cachedata VALUES('57','91','1','0','a:0:{}','1253375668');
INSERT INTO pw_cachedata VALUES('58','92','1','0','a:0:{}','1253375868');
INSERT INTO pw_cachedata VALUES('59','93','1','0','a:0:{}','1253375868');
INSERT INTO pw_cachedata VALUES('60','94','1','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253375868');
INSERT INTO pw_cachedata VALUES('61','95','1','0','a:0:{}','1253375968');
INSERT INTO pw_cachedata VALUES('141','7','0','0','a:0:{}','1253522808');
INSERT INTO pw_cachedata VALUES('142','8','0','0','a:8:{i:0;a:2:{s:3:\"url\";s:15:\"read.php?tid=39\";s:5:\"title\";s:33:\"装饰装修石材如何选， ..\";}i:1;a:2:{s:3:\"url\";s:15:\"read.php?tid=38\";s:5:\"title\";s:33:\"水磨石地面装饰施工及 ..\";}i:2;a:2:{s:3:\"url\";s:15:\"read.php?tid=37\";s:5:\"title\";s:33:\"德国研发新工具，解决 ..\";}i:3;a:2:{s:3:\"url\";s:15:\"read.php?tid=35\";s:5:\"title\";s:34:\"何时买建材 掌握合适的 ..\";}i:4;a:2:{s:3:\"url\";s:15:\"read.php?tid=34\";s:5:\"title\";s:33:\"业主如何当监工，装修 ..\";}i:5;a:2:{s:3:\"url\";s:15:\"read.php?tid=33\";s:5:\"title\";s:18:\"装修省钱宝典\";}i:6;a:2:{s:3:\"url\";s:15:\"read.php?tid=30\";s:5:\"title\";s:27:\"详解装修面积如何算\";}i:7;a:2:{s:3:\"url\";s:15:\"read.php?tid=29\";s:5:\"title\";s:25:\"橱柜安装之4大重点\";}}','1253522808');
INSERT INTO pw_cachedata VALUES('108','88','4','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253522901');
INSERT INTO pw_cachedata VALUES('109','91','4','0','a:5:{i:0;a:2:{s:3:\"url\";s:15:\"read.php?tid=39\";s:5:\"title\";s:33:\"装饰装修石材如何选， ..\";}i:1;a:2:{s:3:\"url\";s:15:\"read.php?tid=38\";s:5:\"title\";s:33:\"水磨石地面装饰施工及 ..\";}i:2;a:2:{s:3:\"url\";s:15:\"read.php?tid=37\";s:5:\"title\";s:33:\"德国研发新工具，解决 ..\";}i:3;a:2:{s:3:\"url\";s:15:\"read.php?tid=35\";s:5:\"title\";s:34:\"何时买建材 掌握合适的 ..\";}i:4;a:2:{s:3:\"url\";s:15:\"read.php?tid=34\";s:5:\"title\";s:33:\"业主如何当监工，装修 ..\";}}','1253522701');
INSERT INTO pw_cachedata VALUES('110','92','4','0','a:8:{i:0;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=39\";s:5:\"title\";s:33:\"装饰装修石材如何选， ..\";}i:1;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=38\";s:5:\"title\";s:33:\"水磨石地面装饰施工及 ..\";}i:2;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=37\";s:5:\"title\";s:33:\"德国研发新工具，解决 ..\";}i:3;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=35\";s:5:\"title\";s:34:\"何时买建材 掌握合适的 ..\";}i:4;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=34\";s:5:\"title\";s:33:\"业主如何当监工，装修 ..\";}i:5;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=33\";s:5:\"title\";s:18:\"装修省钱宝典\";}i:6;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=30\";s:5:\"title\";s:27:\"详解装修面积如何算\";}i:7;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=29\";s:5:\"title\";s:25:\"橱柜安装之4大重点\";}}','1253522901');
INSERT INTO pw_cachedata VALUES('111','93','4','0','a:10:{i:0;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=39\";s:5:\"title\";s:33:\"装饰装修石材如何选， ..\";}i:1;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=38\";s:5:\"title\";s:33:\"水磨石地面装饰施工及 ..\";}i:2;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=37\";s:5:\"title\";s:33:\"德国研发新工具，解决 ..\";}i:3;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=35\";s:5:\"title\";s:34:\"何时买建材 掌握合适的 ..\";}i:4;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=34\";s:5:\"title\";s:33:\"业主如何当监工，装修 ..\";}i:5;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=33\";s:5:\"title\";s:18:\"装修省钱宝典\";}i:6;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=30\";s:5:\"title\";s:27:\"详解装修面积如何算\";}i:7;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=29\";s:5:\"title\";s:25:\"橱柜安装之4大重点\";}i:8;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=28\";s:5:\"title\";s:27:\"环保装修之十大要点\";}i:9;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=8\";s:9:\"forumname\";s:12:\"装修宝典\";s:3:\"url\";s:15:\"read.php?tid=26\";s:5:\"title\";s:33:\"家装业如何适应人口老 ..\";}}','1253522901');
INSERT INTO pw_cachedata VALUES('112','94','4','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253522901');
INSERT INTO pw_cachedata VALUES('113','95','4','0','a:5:{i:0;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=39\";s:5:\"title\";s:33:\"装饰装修石材如何选， ..\";}i:1;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=38\";s:5:\"title\";s:33:\"水磨石地面装饰施工及 ..\";}i:2;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=37\";s:5:\"title\";s:33:\"德国研发新工具，解决 ..\";}i:3;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=35\";s:5:\"title\";s:34:\"何时买建材 掌握合适的 ..\";}i:4;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=34\";s:5:\"title\";s:33:\"业主如何当监工，装修 ..\";}}','1253523001');
INSERT INTO pw_cachedata VALUES('114','88','5','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253522905');
INSERT INTO pw_cachedata VALUES('115','91','5','0','a:5:{i:0;a:2:{s:3:\"url\";s:15:\"read.php?tid=32\";s:5:\"title\";s:24:\"浅析“绿色家具”\";}i:1;a:2:{s:3:\"url\";s:15:\"read.php?tid=31\";s:5:\"title\";s:33:\"风水之谈：办公室里如 ..\";}i:2;a:2:{s:3:\"url\";s:15:\"read.php?tid=27\";s:5:\"title\";s:33:\"去除装修污染有帮手， ..\";}i:3;a:2:{s:3:\"url\";s:15:\"read.php?tid=22\";s:5:\"title\";s:33:\"酷暑盛夏中家电如何保 ..\";}i:4;a:2:{s:3:\"url\";s:15:\"read.php?tid=19\";s:5:\"title\";s:33:\"宝宝卧室装修的风水讲 ..\";}}','1253522705');
INSERT INTO pw_cachedata VALUES('116','92','5','0','a:8:{i:0;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=32\";s:5:\"title\";s:24:\"浅析“绿色家具”\";}i:1;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=31\";s:5:\"title\";s:33:\"风水之谈：办公室里如 ..\";}i:2;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=27\";s:5:\"title\";s:33:\"去除装修污染有帮手， ..\";}i:3;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=22\";s:5:\"title\";s:33:\"酷暑盛夏中家电如何保 ..\";}i:4;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=19\";s:5:\"title\";s:33:\"宝宝卧室装修的风水讲 ..\";}i:5;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=18\";s:5:\"title\";s:33:\"家居装饰中风水设计的 ..\";}i:6;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=15\";s:5:\"title\";s:21:\"家居风水知多少\";}i:7;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=14\";s:5:\"title\";s:33:\"收纳的创意！如何给宝 ..\";}}','1253522905');
INSERT INTO pw_cachedata VALUES('117','93','5','0','a:9:{i:0;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=32\";s:5:\"title\";s:24:\"浅析“绿色家具”\";}i:1;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=31\";s:5:\"title\";s:33:\"风水之谈：办公室里如 ..\";}i:2;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=27\";s:5:\"title\";s:33:\"去除装修污染有帮手， ..\";}i:3;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=22\";s:5:\"title\";s:33:\"酷暑盛夏中家电如何保 ..\";}i:4;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=19\";s:5:\"title\";s:33:\"宝宝卧室装修的风水讲 ..\";}i:5;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=18\";s:5:\"title\";s:33:\"家居装饰中风水设计的 ..\";}i:6;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=15\";s:5:\"title\";s:21:\"家居风水知多少\";}i:7;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:15:\"read.php?tid=14\";s:5:\"title\";s:33:\"收纳的创意！如何给宝 ..\";}i:8;a:4:{s:8:\"forumurl\";s:16:\"thread.php?fid=9\";s:9:\"forumname\";s:12:\"时尚家居\";s:3:\"url\";s:14:\"read.php?tid=9\";s:5:\"title\";s:33:\"家居风水之“三要”与 ..\";}}','1253522905');
INSERT INTO pw_cachedata VALUES('118','94','5','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253522905');
INSERT INTO pw_cachedata VALUES('119','95','5','0','a:5:{i:0;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=32\";s:5:\"title\";s:24:\"浅析“绿色家具”\";}i:1;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=31\";s:5:\"title\";s:33:\"风水之谈：办公室里如 ..\";}i:2;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=27\";s:5:\"title\";s:33:\"去除装修污染有帮手， ..\";}i:3;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=22\";s:5:\"title\";s:33:\"酷暑盛夏中家电如何保 ..\";}i:4;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=19\";s:5:\"title\";s:33:\"宝宝卧室装修的风水讲 ..\";}}','1253523005');
INSERT INTO pw_cachedata VALUES('120','88','6','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253523567');
INSERT INTO pw_cachedata VALUES('121','91','6','0','a:2:{i:0;a:2:{s:3:\"url\";s:15:\"read.php?tid=36\";s:5:\"title\";s:27:\"装修设计之十种武器\";}i:1;a:2:{s:3:\"url\";s:15:\"read.php?tid=23\";s:5:\"title\";s:33:\"装饰的艺术——墙绘的 ..\";}}','1253523367');
INSERT INTO pw_cachedata VALUES('122','92','6','0','a:2:{i:0;a:4:{s:8:\"forumurl\";s:17:\"thread.php?fid=10\";s:9:\"forumname\";s:12:\"家装设计\";s:3:\"url\";s:15:\"read.php?tid=36\";s:5:\"title\";s:27:\"装修设计之十种武器\";}i:1;a:4:{s:8:\"forumurl\";s:17:\"thread.php?fid=10\";s:9:\"forumname\";s:12:\"家装设计\";s:3:\"url\";s:15:\"read.php?tid=23\";s:5:\"title\";s:33:\"装饰的艺术——墙绘的 ..\";}}','1253523567');
INSERT INTO pw_cachedata VALUES('123','93','6','0','a:2:{i:0;a:4:{s:8:\"forumurl\";s:17:\"thread.php?fid=10\";s:9:\"forumname\";s:12:\"家装设计\";s:3:\"url\";s:15:\"read.php?tid=36\";s:5:\"title\";s:27:\"装修设计之十种武器\";}i:1;a:4:{s:8:\"forumurl\";s:17:\"thread.php?fid=10\";s:9:\"forumname\";s:12:\"家装设计\";s:3:\"url\";s:15:\"read.php?tid=23\";s:5:\"title\";s:33:\"装饰的艺术——墙绘的 ..\";}}','1253523567');
INSERT INTO pw_cachedata VALUES('124','94','6','0','a:1:{i:0;a:1:{s:5:\"image\";s:16:\"images/nopic.gif\";}}','1253523567');
INSERT INTO pw_cachedata VALUES('125','95','6','0','a:2:{i:0;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=36\";s:5:\"title\";s:27:\"装修设计之十种武器\";}i:1;a:3:{s:6:\"author\";s:5:\"admin\";s:3:\"url\";s:15:\"read.php?tid=23\";s:5:\"title\";s:33:\"装饰的艺术——墙绘的 ..\";}}','1253523667');
INSERT INTO pw_cachedata VALUES('137','154','0','0','a:2:{i:0;a:2:{s:3:\"url\";s:15:\"read.php?tid=36\";s:5:\"title\";s:27:\"装修设计之十种武器\";}i:1;a:2:{s:3:\"url\";s:15:\"read.php?tid=23\";s:5:\"title\";s:33:\"装饰的艺术——墙绘的 ..\";}}','1253522709');
INSERT INTO pw_cachedata VALUES('136','153','0','0','a:8:{i:0;a:2:{s:3:\"url\";s:15:\"read.php?tid=32\";s:5:\"title\";s:24:\"浅析“绿色家具”\";}i:1;a:2:{s:3:\"url\";s:15:\"read.php?tid=31\";s:5:\"title\";s:33:\"风水之谈：办公室里如 ..\";}i:2;a:2:{s:3:\"url\";s:15:\"read.php?tid=27\";s:5:\"title\";s:33:\"去除装修污染有帮手， ..\";}i:3;a:2:{s:3:\"url\";s:15:\"read.php?tid=22\";s:5:\"title\";s:33:\"酷暑盛夏中家电如何保 ..\";}i:4;a:2:{s:3:\"url\";s:15:\"read.php?tid=19\";s:5:\"title\";s:33:\"宝宝卧室装修的风水讲 ..\";}i:5;a:2:{s:3:\"url\";s:15:\"read.php?tid=18\";s:5:\"title\";s:33:\"家居装饰中风水设计的 ..\";}i:6;a:2:{s:3:\"url\";s:15:\"read.php?tid=15\";s:5:\"title\";s:21:\"家居风水知多少\";}i:7;a:2:{s:3:\"url\";s:15:\"read.php?tid=14\";s:5:\"title\";s:33:\"收纳的创意！如何给宝 ..\";}}','1253522709');




INSERT INTO pw_cnclass VALUES('6','默认分类','0','1');




INSERT INTO pw_config VALUES('db_hackdb','array','a:9:{s:6:\"advert\";a:3:{i:0;s:12:\"广告管理\";i:1;s:6:\"advert\";i:2;i:0;}s:4:\"bank\";a:3:{i:0;s:6:\"银行\";i:1;s:4:\"bank\";i:2;i:2;}s:4:\"blog\";a:3:{i:0;s:12:\"博客接口\";i:1;s:4:\"blog\";i:2;i:0;}s:6:\"invite\";a:3:{i:0;s:12:\"邀请注册\";i:1;s:6:\"invite\";i:2;i:0;}s:5:\"medal\";a:3:{i:0;s:12:\"勋章中心\";i:1;s:5:\"medal\";i:2;i:0;}s:3:\"new\";a:3:{i:0;s:18:\"首页调用管理\";i:1;s:3:\"new\";i:2;i:0;}s:8:\"passport\";a:3:{i:0;s:9:\"通行证\";i:1;s:8:\"passport\";i:2;i:0;}s:4:\"team\";a:3:{i:0;s:12:\"团队管理\";i:1;s:4:\"team\";i:2;i:0;}s:10:\"toolcenter\";a:3:{i:0;s:12:\"道具中心\";i:1;s:10:\"toolcenter\";i:2;i:1;}}','');
INSERT INTO pw_config VALUES('rg_regdetail','string','1','');
INSERT INTO pw_config VALUES('rg_emailcheck','string','0','');
INSERT INTO pw_config VALUES('rg_allowsameip','string','0','');
INSERT INTO pw_config VALUES('rg_regsendemail','string','1','');
INSERT INTO pw_config VALUES('rg_whyregclose','string','管理员关闭了注册!','');
INSERT INTO pw_config VALUES('rg_welcomemsg','string','e宁家管理人员向您问好！\n\n您的注册名为:$rg_name\n\n请仔细阅读社区规章，谢谢！','');
INSERT INTO pw_config VALUES('rg_rgpermit','string','当您申请用户时，表示您已经同意遵守本规章。 <br />\n<br />\n欢迎您加入本站点参加交流和讨论，本站点为公共论坛，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款： <br />\n<br />\n一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：<br />\n　 （一）煽动抗拒、破坏宪法和法律、行政法规实施的；<br />\n　（二）煽动颠覆国家政权，推翻社会主义制度的；<br />\n　（三）煽动分裂国家、破坏国家统一的；<br />\n　（四）煽动民族仇恨、民族歧视，破坏民族团结的；<br />\n　（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br />\n　（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br />\n　（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br />\n　（八）损害国家机关信誉的；<br />\n　（九）其他违反宪法和法律行政法规的；<br />\n　（十）进行商业广告行为的。<br />\n<br />\n二、互相尊重，对自己的言论和行为负责。<br />\n三、禁止在申请用户时使用相关本站的词汇，或是带有侮辱、毁谤、造谣类的或是有其含义的各种语言进行注册用户，否则我们会将其删除。<br />\n四、禁止以任何方式对本站进行各种破坏行为。<br />\n五、如果您有违反国家相关法律法规的行为，本站概不负责，您的登录论坛信息均被记录无疑，必要时，我们会向相关的国家管理部门提供此类信息。 ','');
INSERT INTO pw_config VALUES('rg_registertype','string','0','');
INSERT INTO pw_config VALUES('rg_regweek','string','','');
INSERT INTO pw_config VALUES('rg_banname','string','版主,管理员,admin,斑竹','');
INSERT INTO pw_config VALUES('ml_mailifopen','string','1','');
INSERT INTO pw_config VALUES('db_bbsifopen','string','1','');
INSERT INTO pw_config VALUES('db_whybbsclose','string','论坛升级中... 请等候 15分钟','');
INSERT INTO pw_config VALUES('db_openpost','string','0	0	0','');
INSERT INTO pw_config VALUES('db_onlinelmt','string','0','');
INSERT INTO pw_config VALUES('db_regpopup','string','0','');
INSERT INTO pw_config VALUES('db_debug','string','0','');
INSERT INTO pw_config VALUES('db_forumdir','string','0','');
INSERT INTO pw_config VALUES('db_bbstitle','array','a:2:{s:5:\"index\";s:45:\"宁波最专业的家居装饰装修网站！\";s:5:\"other\";s:45:\"宁波最专业的家居装饰装修网站！\";}','');
INSERT INTO pw_config VALUES('db_metakeyword','string','宁波,家装,家居,装饰,装修,建材,五金,卫浴,地板,橱柜,风水,','');
INSERT INTO pw_config VALUES('db_metadescrip','string','宁波最专业的家居装饰装修网站！','');
INSERT INTO pw_config VALUES('db_bbsname','string','e宁家 -- 宁波家居装修网','');
INSERT INTO pw_config VALUES('db_bfn','string','index.php','');
INSERT INTO pw_config VALUES('db_bbsurl','string','http://localhost','');
INSERT INTO pw_config VALUES('db_ceoconnect','string','http://localhost/sendemail.php?username=admin','');
INSERT INTO pw_config VALUES('db_ceoemail','string','769584845@qq.com','');
INSERT INTO pw_config VALUES('db_recycle','string','1','');
INSERT INTO pw_config VALUES('db_icp','string','','');
INSERT INTO pw_config VALUES('db_autochange','string','0','');
INSERT INTO pw_config VALUES('db_hour','string','4','');
INSERT INTO pw_config VALUES('db_http','string','N','');
INSERT INTO pw_config VALUES('db_attachurl','string','N','');
INSERT INTO pw_config VALUES('db_lp','string','0','');
INSERT INTO pw_config VALUES('db_obstart','string','9','');
INSERT INTO pw_config VALUES('db_charset','string','utf-8','');
INSERT INTO pw_config VALUES('db_forcecharset','string','0','');
INSERT INTO pw_config VALUES('db_defaultstyle','string','wind_orange','');
INSERT INTO pw_config VALUES('db_cvtime','string','0','');
INSERT INTO pw_config VALUES('db_timedf','string','8','');
INSERT INTO pw_config VALUES('db_datefm','string','Y-m-d H:i','');
INSERT INTO pw_config VALUES('db_pingtime','string','0','');
INSERT INTO pw_config VALUES('db_columns','string','0','');
INSERT INTO pw_config VALUES('db_msgsound','string','0','');
INSERT INTO pw_config VALUES('db_shield','string','1','');
INSERT INTO pw_config VALUES('db_tcheck','string','0','');
INSERT INTO pw_config VALUES('db_adminset','string','0','');
INSERT INTO pw_config VALUES('db_ifonlinetime','string','0','');
INSERT INTO pw_config VALUES('db_threadrelated','string','1','');
INSERT INTO pw_config VALUES('db_ifjump','string','1','');
INSERT INTO pw_config VALUES('db_refreshtime','string','0','');
INSERT INTO pw_config VALUES('db_onlinetime','string','3600','');
INSERT INTO pw_config VALUES('db_maxresult','string','500','');
INSERT INTO pw_config VALUES('db_footertime','string','0','');
INSERT INTO pw_config VALUES('db_ckpath','string','/','');
INSERT INTO pw_config VALUES('db_ckdomain','string','','');
INSERT INTO pw_config VALUES('db_postallowtime','string','0','');
INSERT INTO pw_config VALUES('db_cvtimes','string','30','');
INSERT INTO pw_config VALUES('db_windpost','array','a:8:{s:3:\"pic\";i:1;s:8:\"picwidth\";i:700;s:9:\"picheight\";i:700;s:4:\"size\";i:6;s:5:\"flash\";i:1;s:4:\"mpeg\";i:1;s:6:\"iframe\";i:0;s:8:\"checkurl\";i:1;}','');
INSERT INTO pw_config VALUES('db_signheight','string','80','');
INSERT INTO pw_config VALUES('db_signwindcode','string','1','');
INSERT INTO pw_config VALUES('db_windpic','array','a:5:{s:3:\"pic\";i:1;s:8:\"picwidth\";i:700;s:9:\"picheight\";i:700;s:4:\"size\";i:5;s:5:\"flash\";i:0;}','');
INSERT INTO pw_config VALUES('db_allowupload','string','1','');
INSERT INTO pw_config VALUES('db_attachdir','string','3','');
INSERT INTO pw_config VALUES('db_attachhide','string','0','');
INSERT INTO pw_config VALUES('db_attachnum','string','4','');
INSERT INTO pw_config VALUES('db_showreplynum','string','5','');
INSERT INTO pw_config VALUES('db_selcount','string','1000','');
INSERT INTO pw_config VALUES('db_replysendmail','string','0','');
INSERT INTO pw_config VALUES('db_replysitemail','string','1','');
INSERT INTO pw_config VALUES('db_pwcode','string','0','');
INSERT INTO pw_config VALUES('db_setform','string','0','');
INSERT INTO pw_config VALUES('db_titlemax','string','100','');
INSERT INTO pw_config VALUES('db_postmax','string','50000','');
INSERT INTO pw_config VALUES('db_postmin','string','2','');
INSERT INTO pw_config VALUES('db_autoimg','string','1','');
INSERT INTO pw_config VALUES('db_ntnum','string','2','');
INSERT INTO pw_config VALUES('db_ifselfshare','string','1','');
INSERT INTO pw_config VALUES('db_indexlink','string','0','');
INSERT INTO pw_config VALUES('db_indexmqshare','string','0','');
INSERT INTO pw_config VALUES('db_indexshowbirth','string','1','');
INSERT INTO pw_config VALUES('db_indexonline','string','1','');
INSERT INTO pw_config VALUES('db_adminshow','string','0','');
INSERT INTO pw_config VALUES('db_showguest','string','0','');
INSERT INTO pw_config VALUES('db_today','string','0','');
INSERT INTO pw_config VALUES('db_indexfmlogo','string','2','');
INSERT INTO pw_config VALUES('db_todaypost','string','1','');
INSERT INTO pw_config VALUES('db_newtime','string','3600','');
INSERT INTO pw_config VALUES('db_perpage','string','20','');
INSERT INTO pw_config VALUES('db_readperpage','string','10','');
INSERT INTO pw_config VALUES('db_maxpage','string','1000','');
INSERT INTO pw_config VALUES('db_maxmember','string','1000','');
INSERT INTO pw_config VALUES('db_anonymousname','string','匿名','');
INSERT INTO pw_config VALUES('db_hithour','string','0','');
INSERT INTO pw_config VALUES('db_topped','string','1','');
INSERT INTO pw_config VALUES('db_threadonline','string','0','');
INSERT INTO pw_config VALUES('db_showonline','string','0','');
INSERT INTO pw_config VALUES('db_threadshowpost','string','0','');
INSERT INTO pw_config VALUES('db_showcolony','string','0','');
INSERT INTO pw_config VALUES('db_threademotion','string','0','');
INSERT INTO pw_config VALUES('db_ipfrom','string','0','');
INSERT INTO pw_config VALUES('db_watermark','string','1','');
INSERT INTO pw_config VALUES('db_ifgif','string','2','');
INSERT INTO pw_config VALUES('db_waterwidth','string','0','');
INSERT INTO pw_config VALUES('db_waterheight','string','0','');
INSERT INTO pw_config VALUES('db_waterpos','string','1','');
INSERT INTO pw_config VALUES('db_waterimg','string','mark.gif','');
INSERT INTO pw_config VALUES('db_watertext','string','http://www.eningjia.com','');
INSERT INTO pw_config VALUES('db_waterfont','string','5','');
INSERT INTO pw_config VALUES('db_watercolor','string','#0000FF','');
INSERT INTO pw_config VALUES('db_waterpct','string','85','');
INSERT INTO pw_config VALUES('db_jpgquality','string','75','');
INSERT INTO pw_config VALUES('db_iffthumb','string','1','');
INSERT INTO pw_config VALUES('db_ifathumb','string','1','');
INSERT INTO pw_config VALUES('db_signmoney','string','0','');
INSERT INTO pw_config VALUES('db_wapifopen','string','1','');
INSERT INTO pw_config VALUES('db_wapcharset','string','0','');
INSERT INTO pw_config VALUES('db_waplimit','string','2000','');
INSERT INTO pw_config VALUES('db_jsifopen','string','1','');
INSERT INTO pw_config VALUES('db_jsper','string','600','');
INSERT INTO pw_config VALUES('db_bindurl','string','','');
INSERT INTO pw_config VALUES('db_loadavg','string','3','');
INSERT INTO pw_config VALUES('db_cc','string','1','');
INSERT INTO pw_config VALUES('db_ipcheck','string','0','');
INSERT INTO pw_config VALUES('db_ifsafecv','string','0','');
INSERT INTO pw_config VALUES('db_iplimit','string','','');
INSERT INTO pw_config VALUES('db_ifftp','string','0','');
INSERT INTO pw_config VALUES('db_ftpweb','string','','');
INSERT INTO pw_config VALUES('db_enterreason','string','0','');
INSERT INTO pw_config VALUES('db_adminreason','string','广告帖\r\n恶意灌水\r\n非法内容\r\n与版规不符\r\n重复发帖\r\n\r\n优秀文章\r\n原创内容','');
INSERT INTO pw_config VALUES('db_opensch','string','0	0	0','');
INSERT INTO pw_config VALUES('db_gdcheck','string','1','');
INSERT INTO pw_config VALUES('db_postgd','string','0','');
INSERT INTO pw_config VALUES('db_gdstyle','string','63','');
INSERT INTO pw_config VALUES('db_gdtype','string','1','');
INSERT INTO pw_config VALUES('db_gdsize','string','200	80	4','');
INSERT INTO pw_config VALUES('db_upload','string','1	200	180	20480','');
INSERT INTO pw_config VALUES('db_uploadfiletype','string','a:6:{s:3:\"gif\";i:2000;s:3:\"png\";i:2000;s:3:\"zip\";i:2000;s:3:\"rar\";i:2000;s:3:\"jpg\";i:2000;s:3:\"txt\";i:2000;}','');
INSERT INTO pw_config VALUES('db_creditset','string','a:6:{s:6:\"Digest\";a:5:{s:5:\"money\";d:7;s:4:\"rvrc\";d:0;s:6:\"credit\";d:0;s:8:\"currency\";d:0;i:1;d:0;}s:4:\"Post\";a:5:{s:5:\"money\";d:3;s:4:\"rvrc\";d:0;s:6:\"credit\";d:0;s:8:\"currency\";d:0;i:1;d:0;}s:5:\"Reply\";a:5:{s:5:\"money\";d:1;s:4:\"rvrc\";d:0;s:6:\"credit\";d:0;s:8:\"currency\";d:0;i:1;d:0;}s:8:\"Undigest\";a:5:{s:5:\"money\";d:7;s:4:\"rvrc\";d:0;s:6:\"credit\";d:0;s:8:\"currency\";d:0;i:1;d:0;}s:6:\"Delete\";a:5:{s:5:\"money\";d:3;s:4:\"rvrc\";d:0;s:6:\"credit\";d:0;s:8:\"currency\";d:0;i:1;d:0;}s:8:\"Deleterp\";a:5:{s:5:\"money\";d:1;s:4:\"rvrc\";d:0;s:6:\"credit\";d:0;s:8:\"currency\";d:0;i:1;d:0;}}','');
INSERT INTO pw_config VALUES('db_showgroup','string',',3,4,5,16,','');
INSERT INTO pw_config VALUES('db_showcustom','string',',1,','');
INSERT INTO pw_config VALUES('db_menu','string','1','');
INSERT INTO pw_config VALUES('db_fthumbsize','string','100	100','');
INSERT INTO pw_config VALUES('db_athumbsize','string','575	0','');
INSERT INTO pw_config VALUES('db_signgroup','string',',6,7,5,16,8,9,10,11,12,13,14,15,','');
INSERT INTO pw_config VALUES('db_autoban','string','0','');
INSERT INTO pw_config VALUES('db_wapfids','string','','');
INSERT INTO pw_config VALUES('db_safegroup','string','','');
INSERT INTO pw_config VALUES('db_attfg','string','1','');
INSERT INTO pw_config VALUES('rg_allowregister','string','1','');
INSERT INTO pw_config VALUES('rg_reg','string','1','');
INSERT INTO pw_config VALUES('rg_regsendmsg','string','0','');
INSERT INTO pw_config VALUES('rg_ifcheck','string','0','');
INSERT INTO pw_config VALUES('rg_rglower','string','0','');
INSERT INTO pw_config VALUES('rg_namelen','string','3	15','');
INSERT INTO pw_config VALUES('rg_pwdlen','string','6	16','');
INSERT INTO pw_config VALUES('ml_smtpauth','string','1','');
INSERT INTO pw_config VALUES('db_banby','string','0','');
INSERT INTO pw_config VALUES('db_bantype','string','0','');
INSERT INTO pw_config VALUES('db_banlimit','string','0','');
INSERT INTO pw_config VALUES('db_banmax','string','0','');
INSERT INTO pw_config VALUES('db_rmbrate','string','10','');
INSERT INTO pw_config VALUES('db_rmblest','string','5','');
INSERT INTO pw_config VALUES('cy_virement','string','0','');
INSERT INTO pw_config VALUES('cy_virerate','string','0','');
INSERT INTO pw_config VALUES('cy_virelimit','string','0','');
INSERT INTO pw_config VALUES('db_diy','string','settings_basic,setforum,setuser,level,postcache,customfield,area_forumtype,o_global,o_groups,o_photos','');
INSERT INTO pw_config VALUES('db_ipban','string','','');
INSERT INTO pw_config VALUES('db_ipstates','string','1','');
INSERT INTO pw_config VALUES('db_union','string','a:0:{}	<script src=\"http://u.phpwind.com/src/nc.php\" language=\"JavaScript\"></script><br>			<script src=\"http://u.phpwind.com/src/un.php\" language=\"JavaScript\"></script><br>		0	a:0:{}	','');
INSERT INTO pw_config VALUES('fc_shownum','string','7','');
INSERT INTO pw_config VALUES('db_tlist','string','','');
INSERT INTO pw_config VALUES('db_ptable','string','','');
INSERT INTO pw_config VALUES('db_plist','string','','');
INSERT INTO pw_config VALUES('db_ads','string','1','');
INSERT INTO pw_config VALUES('db_wordsfb','string','1','');
INSERT INTO pw_config VALUES('db_htmifopen','string','0','');
INSERT INTO pw_config VALUES('db_dir','string','.php?','');
INSERT INTO pw_config VALUES('db_ext','string','.html','');
INSERT INTO pw_config VALUES('db_upgrade','string','a:7:{s:7:\"postnum\";s:1:\"1\";s:7:\"digests\";s:1:\"0\";s:4:\"rvrc\";s:1:\"0\";s:5:\"money\";s:1:\"0\";s:6:\"credit\";s:1:\"0\";s:10:\"onlinetime\";s:1:\"0\";i:1;s:1:\"0\";}','');
INSERT INTO pw_config VALUES('ol_onlinepay','string','1','');
INSERT INTO pw_config VALUES('ol_whycolse','string','系统没有开启网上支付功能!','');
INSERT INTO pw_config VALUES('ol_payto','string','','');
INSERT INTO pw_config VALUES('ol_md5code','string','','');
INSERT INTO pw_config VALUES('ol_paypal','string','','');
INSERT INTO pw_config VALUES('ol_paypalcode','string','','');
INSERT INTO pw_config VALUES('ol_99bill','string','','');
INSERT INTO pw_config VALUES('ol_99billcode','string','','');
INSERT INTO pw_config VALUES('db_head','string','','');
INSERT INTO pw_config VALUES('db_foot','string','','');
INSERT INTO pw_config VALUES('db_pptifopen','string','0','');
INSERT INTO pw_config VALUES('db_pptkey','string','','');
INSERT INTO pw_config VALUES('db_ppttype','string','client','');
INSERT INTO pw_config VALUES('db_ppturls','string','','');
INSERT INTO pw_config VALUES('db_pptserverurl','string','','');
INSERT INTO pw_config VALUES('db_pptloginurl','string','login.php','');
INSERT INTO pw_config VALUES('db_pptloginouturl','string','login.php?action=quit','');
INSERT INTO pw_config VALUES('db_pptregurl','string','register.php','');
INSERT INTO pw_config VALUES('db_pptcredit','string','','');
INSERT INTO pw_config VALUES('db_toolifopen','string','1','');
INSERT INTO pw_config VALUES('db_allowtrade','string','1','');
INSERT INTO pw_config VALUES('db_attachname','string','attachment','');
INSERT INTO pw_config VALUES('db_picpath','string','images','');
INSERT INTO pw_config VALUES('db_htmdir','string','htm_data','');
INSERT INTO pw_config VALUES('db_guestdir','string','data/guestcache','');
INSERT INTO pw_config VALUES('ml_mailmethod','string','1','');
INSERT INTO pw_config VALUES('ml_smtphost','string','','');
INSERT INTO pw_config VALUES('ml_smtpport','string','25','');
INSERT INTO pw_config VALUES('ml_smtpfrom','string','','');
INSERT INTO pw_config VALUES('ml_smtpuser','string','','');
INSERT INTO pw_config VALUES('ml_smtphelo','string','','');
INSERT INTO pw_config VALUES('ml_smtpmxmailname','string','','');
INSERT INTO pw_config VALUES('ml_mxdns','string','','');
INSERT INTO pw_config VALUES('ml_mxdnsbak','string','','');
INSERT INTO pw_config VALUES('ftp_pass','string','','');
INSERT INTO pw_config VALUES('ftp_server','string','','');
INSERT INTO pw_config VALUES('ftp_port','string','21','');
INSERT INTO pw_config VALUES('ftp_dir','string','','');
INSERT INTO pw_config VALUES('ftp_user','string','','');
INSERT INTO pw_config VALUES('db_schwait','string','2','');
INSERT INTO pw_config VALUES('db_registerfile','string','register.php','');
INSERT INTO pw_config VALUES('db_adminfile','string','admin.php','');
INSERT INTO pw_config VALUES('db_newinfoifopen','string','0','');
INSERT INTO pw_config VALUES('db_sortnum','string','20','');
INSERT INTO pw_config VALUES('db_styledb','array','a:5:{s:4:\"wind\";a:2:{i:0;s:34:\"<font color=#3366cc>■wind</font>\";i:1;i:1;}s:10:\"wind_green\";a:2:{i:0;s:33:\"<font color=green>■green</font>\";i:1;i:1;}s:11:\"wind_orange\";a:2:{i:0;s:35:\"<font color=orange>■orange</font>\";i:1;i:1;}s:11:\"wind_purple\";a:2:{i:0;s:35:\"<font color=purple>■purple</font>\";i:1;i:1;}s:8:\"wind_red\";a:2:{i:0;s:29:\"<font color=red>■red</font>\";i:1;i:1;}}','');
INSERT INTO pw_config VALUES('db_moneyname','string','铜币','');
INSERT INTO pw_config VALUES('db_moneyunit','string','枚','');
INSERT INTO pw_config VALUES('db_rvrcname','string','威望','');
INSERT INTO pw_config VALUES('db_rvrcunit','string','点','');
INSERT INTO pw_config VALUES('db_creditname','string','贡献值','');
INSERT INTO pw_config VALUES('db_creditunit','string','点','');
INSERT INTO pw_config VALUES('db_currencyname','string','银元','');
INSERT INTO pw_config VALUES('db_currencyunit','string','个','');
INSERT INTO pw_config VALUES('db_maxtypenum','string','5','');
INSERT INTO pw_config VALUES('db_selectgroup','string','1','');
INSERT INTO pw_config VALUES('db_ifpwcache','string','567','');
INSERT INTO pw_config VALUES('db_urlcheck','string','phpwind.net,phpwind.com','');
INSERT INTO pw_config VALUES('db_xforwardip','string','0','');
INSERT INTO pw_config VALUES('db_adminrecord','string','0','');
INSERT INTO pw_config VALUES('db_floorunit','string','楼','');
INSERT INTO pw_config VALUES('db_floorname','array','a:4:{i:0;s:6:\"楼主\";i:1;s:6:\"沙发\";i:2;s:6:\"板凳\";i:3;s:6:\"地板\";}','');
INSERT INTO pw_config VALUES('db_toolbar','string','0','');
INSERT INTO pw_config VALUES('db_creditlog','array','a:6:{s:3:\"reg\";a:1:{s:5:\"money\";i:1;}s:5:\"topic\";a:1:{s:5:\"money\";i:1;}s:6:\"credit\";a:1:{s:5:\"money\";i:1;}s:6:\"reward\";a:1:{s:5:\"money\";i:1;}s:4:\"hack\";a:1:{s:5:\"money\";i:1;}s:5:\"other\";a:1:{s:5:\"money\";i:1;}}','');
INSERT INTO pw_config VALUES('db_sitemsg','array','a:4:{s:3:\"reg\";a:2:{i:0;s:64:\"带红色*的都是必填项目，若填写不全将无法注册\";i:1;s:39:\"请添加能正常收发邮件的邮箱\";}s:5:\"login\";a:1:{i:0;s:103:\"如果您在网吧或者非个人电脑，建议设置Cookie有效期为 即时，以保证账户安全\";}s:4:\"post\";a:3:{i:0;s:66:\"如果您在写长篇帖子又不马上发表，建议存为草稿\";i:1;s:84:\"如果您提交过一次失败了，可以用”恢复数据”来恢复帖子内容\";i:2;s:51:\"批量上传需要先选择文件，再选择上传\";}s:5:\"reply\";a:3:{i:0;s:66:\"如果您在写长篇帖子又不马上发表，建议存为草稿\";i:1;s:84:\"如果您提交过一次失败了，可以用”恢复数据”来恢复帖子内容\";i:2;s:51:\"批量上传需要先选择文件，再选择上传\";}}','');
INSERT INTO pw_config VALUES('rg_timeend','string','2020','');
INSERT INTO pw_config VALUES('rg_timestart','string','1930','');
INSERT INTO pw_config VALUES('db_dopen','string','1','');
INSERT INTO pw_config VALUES('db_phopen','string','1','');
INSERT INTO pw_config VALUES('db_groups_open','string','1','');
INSERT INTO pw_config VALUES('db_share_open','string','1','');
INSERT INTO pw_config VALUES('rg_regcredit','array','a:5:{s:5:\"money\";i:0;s:4:\"rvrc\";i:0;s:6:\"credit\";i:0;s:8:\"currency\";i:0;i:1;i:0;}','');
INSERT INTO pw_config VALUES('db_waterfonts','string','en/PilsenPlakat','');
INSERT INTO pw_config VALUES('ftp_timeout','string','10','');
INSERT INTO pw_config VALUES('db_virerate','string','1','');
INSERT INTO pw_config VALUES('db_virelimit','string','10','');
INSERT INTO pw_config VALUES('db_signcurtype','string','money','');
INSERT INTO pw_config VALUES('db_bdayautohide','string','1','');
INSERT INTO pw_config VALUES('db_creditpay','array','a:1:{s:5:\"money\";a:3:{s:7:\"rmbrate\";i:10;s:7:\"rmblest\";d:10;s:8:\"virement\";i:1;}}','');
INSERT INTO pw_config VALUES('db_sellset','array','a:3:{s:4:\"type\";a:1:{i:0;s:5:\"money\";}s:5:\"price\";s:0:\"\";s:6:\"income\";s:0:\"\";}','');
INSERT INTO pw_config VALUES('db_logintype','string','5','');
INSERT INTO pw_config VALUES('db_func','string','2','');
INSERT INTO pw_config VALUES('jf_A','string','a:1:{s:7:\"money_1\";a:3:{i:0;s:1:\"2\";i:1;s:1:\"1\";i:2;i:1;}}','');
INSERT INTO pw_config VALUES('nf_config','string','a:3:{s:8:\"position\";i:1;s:8:\"titlelen\";i:50;s:7:\"shownum\";i:9;}','');
INSERT INTO pw_config VALUES('nf_order','string','a:0:{}','');
INSERT INTO pw_config VALUES('area_cateinfo','string','a:7:{i:22;a:1:{s:3:\"tpl\";s:3:\"jia\";}i:40;a:1:{s:3:\"tpl\";s:5:\"women\";}i:28;a:1:{s:3:\"tpl\";s:4:\"auto\";}i:18;a:1:{s:3:\"tpl\";s:8:\"children\";}i:12;a:1:{s:3:\"tpl\";s:3:\"fun\";}i:5;a:1:{s:3:\"tpl\";N;}i:34;a:1:{s:3:\"tpl\";s:3:\"fun\";}}','');
INSERT INTO pw_config VALUES('area_catetpl','string','default','');
INSERT INTO pw_config VALUES('area_indextpl','string','default','');
INSERT INTO pw_config VALUES('db_iftag','string','1','');
INSERT INTO pw_config VALUES('db_readtag','string','0','');
INSERT INTO pw_config VALUES('db_tagindex','string','20','');
INSERT INTO pw_config VALUES('db_enhideset','array','a:1:{s:4:\"type\";a:1:{i:0;s:5:\"money\";}}','');
INSERT INTO pw_config VALUES('db_hash','string','0@ap%x8qV','');
INSERT INTO pw_config VALUES('db_windmagic','string','1','');
INSERT INTO pw_config VALUES('db_siteid','string','094ae3d6c7ba7357547b907e3eef0018','');
INSERT INTO pw_config VALUES('db_siteownerid','string','35debcafe21f945bf140d1f4895c68dd','');
INSERT INTO pw_config VALUES('db_sitehash','string','10A1IDB1ANAAYAAQ0GAg1QAAIAVAJUWwcHDlIHDFZSBFE','');
INSERT INTO pw_config VALUES('db_modes','array','a:3:{s:3:\"bbs\";a:3:{s:6:\"m_name\";s:12:\"论坛模式\";s:6:\"ifopen\";i:1;s:5:\"title\";s:6:\"论坛\";}s:4:\"area\";a:3:{s:6:\"m_name\";s:12:\"门户模式\";s:6:\"ifopen\";i:1;s:5:\"title\";s:6:\"门户\";}s:1:\"o\";a:3:{s:6:\"m_name\";s:12:\"圈子模式\";s:6:\"ifopen\";i:0;s:5:\"title\";s:6:\"圈子\";}}','');
INSERT INTO pw_config VALUES('db_mode','string','area','');
INSERT INTO pw_config VALUES('db_modepages','array','a:2:{s:4:\"area\";a:3:{s:5:\"index\";a:2:{s:4:\"name\";s:6:\"首页\";s:8:\"template\";s:5:\"index\";}s:4:\"cate\";a:2:{s:4:\"name\";s:9:\"频道页\";s:8:\"template\";s:4:\"cate\";}s:6:\"thread\";a:2:{s:4:\"name\";s:9:\"列表页\";s:8:\"template\";s:6:\"thread\";}}s:1:\"o\";a:2:{s:5:\"index\";a:2:{s:4:\"name\";s:6:\"首页\";s:8:\"template\";s:5:\"index\";}s:6:\"m_home\";a:2:{s:4:\"name\";s:6:\"动态\";s:8:\"template\";s:6:\"m_home\";}}}','');
INSERT INTO pw_config VALUES('db_headnav','array','a:0:{}','');
INSERT INTO pw_config VALUES('db_footnav','array','a:0:{}','');
INSERT INTO pw_config VALUES('db_mainnav','array','a:2:{s:7:\"KEYarea\";a:2:{s:4:\"html\";s:54:\"<a href=\"http://localhost/\" id=\"td_KEYarea\">门户</a>\";s:3:\"pos\";s:8:\"bbs,area\";}s:6:\"KEYbbs\";a:2:{s:4:\"html\";s:51:\"<a href=\"index.php?m=bbs\" id=\"td_KEYbbs\">论坛</a>\";s:3:\"pos\";s:8:\"bbs,area\";}}','');
INSERT INTO pw_config VALUES('db_navinfo','array','a:9:{s:7:\"KEYsort\";a:2:{s:4:\"html\";s:51:\"<a href=\"sort.php\" id=\"td_KEYsort\">统计排行</a>\";s:5:\"child\";a:9:{s:13:\"KEYsort_basic\";a:1:{s:4:\"html\";s:57:\"<a href=\"sort.php\" id=\"td_KEYsort_basic\">基本信息</a>\";}s:15:\"KEYsort_ipstate\";a:1:{s:4:\"html\";s:76:\"<a href=\"sort.php?action=ipstate\" id=\"td_KEYsort_ipstate\">到访IP统计</a>\";}s:12:\"KEYsort_team\";a:1:{s:4:\"html\";s:68:\"<a href=\"sort.php?action=team\" id=\"td_KEYsort_team\">管理团队</a>\";}s:13:\"KEYsort_admin\";a:1:{s:4:\"html\";s:70:\"<a href=\"sort.php?action=admin\" id=\"td_KEYsort_admin\">管理操作</a>\";}s:14:\"KEYsort_online\";a:1:{s:4:\"html\";s:72:\"<a href=\"sort.php?action=online\" id=\"td_KEYsort_online\">在线会员</a>\";}s:14:\"KEYsort_member\";a:1:{s:4:\"html\";s:72:\"<a href=\"sort.php?action=member\" id=\"td_KEYsort_member\">会员排行</a>\";}s:13:\"KEYsort_forum\";a:1:{s:4:\"html\";s:70:\"<a href=\"sort.php?action=forum\" id=\"td_KEYsort_forum\">版块排行</a>\";}s:15:\"KEYsort_article\";a:1:{s:4:\"html\";s:74:\"<a href=\"sort.php?action=article\" id=\"td_KEYsort_article\">帖子排行</a>\";}s:15:\"KEYsort_taglist\";a:1:{s:4:\"html\";s:73:\"<a href=\"job.php?action=taglist\" id=\"td_KEYsort_taglist\">标签排行</a>\";}}}s:6:\"KEYapp\";a:1:{s:4:\"html\";s:54:\"<a href=\"javascript:;\" id=\"td_KEYapp\">社区应用</a>\";}s:7:\"KEYbank\";a:1:{s:4:\"html\";s:57:\"<a href=\"hack.php?H_name=bank\" id=\"td_KEYbank\">银行</a>\";}s:7:\"KEYhack\";a:2:{s:4:\"html\";s:55:\"<a href=\"javascript:;\" id=\"td_KEYhack\">社区服务</a>\";s:5:\"child\";a:1:{s:13:\"KEYtoolcenter\";a:1:{s:4:\"html\";s:75:\"<a href=\"hack.php?H_name=toolcenter\" id=\"td_KEYtoolcenter\">道具中心</a>\";}}}s:9:\"KEYmember\";a:1:{s:4:\"html\";s:55:\"<a href=\"member.php\" id=\"td_KEYmember\">会员列表</a>\";}s:11:\"KEYlastpost\";a:1:{s:4:\"html\";s:106:\"<a href=\"search.php?sch_time=all&orderway=lastpost&asc=desc&newatc=1\" id=\"td_KEYlastpost\">最新帖子</a>\";}s:9:\"KEYdigest\";a:1:{s:4:\"html\";s:61:\"<a href=\"search.php?digest=1\" id=\"td_KEYdigest\">精华区</a>\";}s:9:\"KEYsearch\";a:1:{s:4:\"html\";s:49:\"<a href=\"search.php\" id=\"td_KEYsearch\">搜索</a>\";}s:6:\"KEYfaq\";a:1:{s:4:\"html\";s:43:\"<a href=\"faq.php\" id=\"td_KEYfaq\">帮助</a>\";}}','');
INSERT INTO pw_config VALUES('o_navinfo','string','a:5:{s:8:\"KEYindex\";a:1:{s:4:\"html\";s:57:\"<a href=\"index.php?m=o\" id=\"td_KEYindex\">圈子首页</a>\";}s:7:\"KEYhome\";a:1:{s:4:\"html\";s:55:\"<a href=\"mode.php?m=o\" id=\"td_KEYhome\">我的首页</a>\";}s:7:\"KEYuser\";a:1:{s:4:\"html\";s:62:\"<a href=\"mode.php?m=o&q=user\" id=\"td_KEYuser\">个人空间</a>\";}s:9:\"KEYfriend\";a:1:{s:4:\"html\";s:60:\"<a href=\"mode.php?m=o&q=friend\" id=\"td_KEYfriend\">朋友</a>\";}s:9:\"KEYbrowse\";a:1:{s:4:\"html\";s:66:\"<a href=\"mode.php?m=o&q=browse\" id=\"td_KEYbrowse\">随便看看</a>\";}}','');
INSERT INTO pw_config VALUES('PHPWind','string','a:3:{s:7:\"history\";a:2:{i:0;s:27:\"Install	1252810875		7.5RC,	\";i:1;s:33:\"UPGRADE	1253334239	7.5RC	7.5RC2,	\";}s:7:\"version\";s:6:\"7.5RC2\";s:6:\"repair\";s:0:\"\";}','PHPWind');
INSERT INTO pw_config VALUES('db_shortcutforum','array','a:6:{i:11;s:6:\"管理\";i:1;s:6:\"互动\";i:6;s:6:\"设计\";i:12;s:12:\"社区管理\";i:2;s:12:\"有问有答\";i:8;s:12:\"装修宝典\";}','');
INSERT INTO pw_config VALUES('db_online','string','0','');
INSERT INTO pw_config VALUES('db_redundancy','string','0','');
INSERT INTO pw_config VALUES('db_qcheck','string','0	0	0	0','');
INSERT INTO pw_config VALUES('db_question','array','a:0:{}','');
INSERT INTO pw_config VALUES('db_answer','array','a:0:{}','');
INSERT INTO pw_config VALUES('db_visitopen','string','0','');
INSERT INTO pw_config VALUES('db_visituser','string','','');
INSERT INTO pw_config VALUES('db_visitmsg','string','','');
INSERT INTO pw_config VALUES('db_ifcredit','string','0','');
INSERT INTO pw_config VALUES('db_txtadnum','string','0','');
INSERT INTO pw_config VALUES('db_readinfo','string','0','');
INSERT INTO pw_config VALUES('db_posturlnum','string','','');
INSERT INTO pw_config VALUES('db_fcachenum','string','0','');
INSERT INTO pw_config VALUES('db_fcachetime','string','0','');
INSERT INTO pw_config VALUES('db_guestindex','string','0','');
INSERT INTO pw_config VALUES('db_fguestnum','string','0','');
INSERT INTO pw_config VALUES('db_guestthread','string','0','');
INSERT INTO pw_config VALUES('db_tguestnum','string','0','');
INSERT INTO pw_config VALUES('db_guestread','string','0','');
INSERT INTO pw_config VALUES('db_visitgroup','string','','');
INSERT INTO pw_config VALUES('db_ajax','string','0','');
INSERT INTO pw_config VALUES('rg_regmon','string','0','');
INSERT INTO pw_config VALUES('rg_email','string','','');
INSERT INTO pw_config VALUES('rg_npdifferf','string','0','');
INSERT INTO pw_config VALUES('rg_pwdcomplex','string','','');
INSERT INTO pw_config VALUES('ml_smtppass','string','','');
INSERT INTO pw_config VALUES('area_navinfo','string','a:1:{s:4:\"KEY1\";a:1:{s:4:\"html\";s:51:\"<a href=\"cate.php?cateid=1\" id=\"td_KEY1\">装修</a>\";}}','');
INSERT INTO pw_config VALUES('db_ratepower','string','a:3:{i:1;s:1:\"1\";i:2;s:1:\"1\";i:3;s:1:\"1\";}','');
INSERT INTO pw_config VALUES('db_rategroup','string','a:12:{i:8;s:1:\"5\";i:9;s:2:\"20\";i:10;s:2:\"20\";i:11;s:2:\"20\";i:12;s:2:\"20\";i:13;s:2:\"20\";i:14;s:2:\"20\";i:15;s:2:\"20\";i:4;s:4:\"1000\";i:5;s:4:\"1000\";i:16;s:2:\"20\";i:2;s:1:\"0\";}','');
INSERT INTO pw_config VALUES('db_modelids','string','4,5,6,7,8,1,2,3','');

INSERT INTO pw_creditlog VALUES('1','1','admin','money','3','1253367993','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('2','1','admin','money','3','1253368029','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('3','1','admin','money','3','1253368067','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('4','1','admin','money','3','1253368102','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('5','1','admin','money','3','1253368129','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('6','1','admin','money','3','1253368189','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('7','1','admin','money','3','1253368226','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('8','1','admin','money','3','1253368256','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('9','1','admin','money','3','1253368293','topic_Post','127.0.0.1','[b]admin[/b] 在版块 时尚家居 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('10','1','admin','money','3','1253368327','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('11','1','admin','money','3','1253368354','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('12','1','admin','money','3','1253368407','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('13','1','admin','money','3','1253368444','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('14','1','admin','money','3','1253368473','topic_Post','127.0.0.1','[b]admin[/b] 在版块 时尚家居 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('15','1','admin','money','3','1253368503','topic_Post','127.0.0.1','[b]admin[/b] 在版块 时尚家居 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('16','1','admin','money','3','1253368552','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('17','1','admin','money','3','1253368586','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('18','1','admin','money','3','1253368611','topic_Post','127.0.0.1','[b]admin[/b] 在版块 时尚家居 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('19','1','admin','money','3','1253368640','topic_Post','127.0.0.1','[b]admin[/b] 在版块 时尚家居 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('20','1','admin','money','3','1253368666','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('21','1','admin','money','3','1253368692','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('22','1','admin','money','3','1253368713','topic_Post','127.0.0.1','[b]admin[/b] 在版块 时尚家居 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('23','1','admin','money','3','1253368781','topic_Post','127.0.0.1','[b]admin[/b] 在版块 家装设计 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('24','1','admin','money','3','1253368827','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('25','1','admin','money','3','1253368855','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('26','1','admin','money','3','1253368879','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('27','1','admin','money','3','1253368962','topic_Post','127.0.0.1','[b]admin[/b] 在版块 时尚家居 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('28','1','admin','money','3','1253368995','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('29','1','admin','money','3','1253369023','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('30','1','admin','money','3','1253369042','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('31','1','admin','money','3','1253369065','topic_Post','127.0.0.1','[b]admin[/b] 在版块 时尚家居 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('32','1','admin','money','3','1253369104','topic_Post','127.0.0.1','[b]admin[/b] 在版块 时尚家居 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('33','1','admin','money','3','1253369128','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('34','1','admin','money','3','1253369148','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('35','1','admin','money','3','1253369187','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('36','1','admin','money','3','1253369214','topic_Post','127.0.0.1','[b]admin[/b] 在版块 家装设计 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('37','1','admin','money','3','1253369330','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('38','1','admin','money','3','1253369362','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');
INSERT INTO pw_creditlog VALUES('39','1','admin','money','3','1253369445','topic_Post','127.0.0.1','[b]admin[/b] 在版块 装修宝典 发表主题。\n奖励积分：[b]铜币[/b]，影响：+3。');

INSERT INTO pw_credits VALUES('1','好评度','点','自定义积分');


INSERT INTO pw_datanalyse VALUES('1','memberThread','1253289600','39');
INSERT INTO pw_datanalyse VALUES('1','memberThread','943920000','39');


INSERT INTO pw_datastore VALUES('UID_CREDIT_1','1253521818','');
INSERT INTO pw_datastore VALUES('UID_1','1253521818','a:24:{s:3:\"uid\";s:1:\"1\";s:8:\"username\";s:5:\"admin\";s:6:\"gender\";s:1:\"0\";s:4:\"oicq\";s:0:\"\";s:5:\"aliww\";s:0:\"\";s:7:\"groupid\";s:1:\"3\";s:8:\"memberid\";s:1:\"8\";s:5:\"micon\";s:0:\"\";s:4:\"hack\";s:1:\"0\";s:5:\"honor\";s:0:\"\";s:9:\"signature\";s:0:\"\";s:7:\"regdate\";s:10:\"1246180364\";s:6:\"medals\";s:0:\"\";s:10:\"userstatus\";s:4:\"1216\";s:7:\"postnum\";s:2:\"63\";s:7:\"digests\";s:1:\"0\";s:4:\"rvrc\";s:2:\"10\";s:5:\"money\";s:3:\"179\";s:6:\"credit\";s:1:\"0\";s:8:\"currency\";s:1:\"0\";s:9:\"thisvisit\";s:10:\"1253520909\";s:9:\"lastvisit\";s:10:\"1253520909\";s:10:\"onlinetime\";s:6:\"109605\";s:9:\"starttime\";s:1:\"0\";}');






INSERT INTO pw_elements VALUES('78','usersort','money','1','179','admin','0','1253525327');
INSERT INTO pw_elements VALUES('79','usersort','rvrc','1','1','admin','0','1253525327');
INSERT INTO pw_elements VALUES('3','usersort','credit','1','0','admin','0','1252810950');
INSERT INTO pw_elements VALUES('4','usersort','currency','1','0','admin','0','1252810950');
INSERT INTO pw_elements VALUES('81','usersort','postnum','1','63','admin','0','1253525327');
INSERT INTO pw_elements VALUES('83','usersort','onlinetime','1','30','admin','0','1253525327');
INSERT INTO pw_elements VALUES('82','usersort','monoltime','1','0','admin','0','1253525327');
INSERT INTO pw_elements VALUES('8','usersort','digests','1','0','admin','0','1252814705');
INSERT INTO pw_elements VALUES('12','usersort','money','3','19','maddog','0','1253366107');
INSERT INTO pw_elements VALUES('13','usersort','postnum','3','15','maddog','0','1253366107');
INSERT INTO pw_elements VALUES('14','usersort','onlinetime','3','8','maddog','0','1253366107');
INSERT INTO pw_elements VALUES('80','usersort','monthpost','1','40','admin','0','1253525327');
INSERT INTO pw_elements VALUES('20','hitsort','8','12','2','','0','0');
INSERT INTO pw_elements VALUES('21','hitsortday','8','12','2','1253368407','0','0');
INSERT INTO pw_elements VALUES('22','hitsort','8','11','2','','0','0');
INSERT INTO pw_elements VALUES('23','hitsortday','8','11','2','1253368354','0','0');
INSERT INTO pw_elements VALUES('24','hitsort','8','10','2','','0','0');
INSERT INTO pw_elements VALUES('25','hitsortday','8','10','2','1253368327','0','0');
INSERT INTO pw_elements VALUES('26','hitsort','8','8','2','','0','0');
INSERT INTO pw_elements VALUES('27','hitsortday','8','8','2','1253368256','0','0');
INSERT INTO pw_elements VALUES('28','hitsort','8','7','2','','0','0');
INSERT INTO pw_elements VALUES('29','hitsortday','8','7','2','1253368226','0','0');
INSERT INTO pw_elements VALUES('30','hitsort','8','6','2','','0','0');
INSERT INTO pw_elements VALUES('31','hitsortday','8','6','2','1253368189','0','0');
INSERT INTO pw_elements VALUES('32','hitsort','8','5','2','','0','0');
INSERT INTO pw_elements VALUES('33','hitsortday','8','5','2','1253368129','0','0');
INSERT INTO pw_elements VALUES('34','hitsort','8','4','2','','0','0');
INSERT INTO pw_elements VALUES('35','hitsortday','8','4','2','1253368102','0','0');
INSERT INTO pw_elements VALUES('36','hitsort','8','3','2','','0','0');
INSERT INTO pw_elements VALUES('37','hitsortday','8','3','2','1253368067','0','0');
INSERT INTO pw_elements VALUES('38','hitsort','8','2','2','','0','0');
INSERT INTO pw_elements VALUES('39','hitsortday','8','2','2','1253368029','0','0');
INSERT INTO pw_elements VALUES('40','hitsort','8','1','2','','0','0');
INSERT INTO pw_elements VALUES('41','hitsortday','8','1','2','1253367993','0','0');



INSERT INTO pw_feed VALUES('1','1','post','发表了主题 [url=http://localhost/read.php?tid=1]装修中瓷砖的种类及挑选方法详解[/url]','1253367993','0');
INSERT INTO pw_feed VALUES('2','1','post','发表了主题 [url=http://localhost/read.php?tid=2]厨房装修的12个要点分析[/url]','1253368029','0');
INSERT INTO pw_feed VALUES('3','1','post','发表了主题 [url=http://localhost/read.php?tid=3]怎样延长复合地板的使用寿命[/url]','1253368067','0');
INSERT INTO pw_feed VALUES('4','1','post','发表了主题 [url=http://localhost/read.php?tid=4]移门选购要点谈[/url]','1253368102','0');
INSERT INTO pw_feed VALUES('5','1','post','发表了主题 [url=http://localhost/read.php?tid=5]橱柜行业骗局多，伪洋品牌何其多！[/url]','1253368129','0');
INSERT INTO pw_feed VALUES('6','1','post','发表了主题 [url=http://localhost/read.php?tid=6]定制化地板销售，行业期待创新[/url]','1253368189','0');
INSERT INTO pw_feed VALUES('7','1','post','发表了主题 [url=http://localhost/read.php?tid=7]装修中如何选购不易卷边的装饰壁纸[/url]','1253368226','0');
INSERT INTO pw_feed VALUES('8','1','post','发表了主题 [url=http://localhost/read.php?tid=8]如何解决外墙渗漏的问题[/url]','1253368256','0');
INSERT INTO pw_feed VALUES('9','1','post','发表了主题 [url=http://localhost/read.php?tid=9]家居风水之“三要”与“三运”[/url]','1253368293','0');
INSERT INTO pw_feed VALUES('10','1','post','发表了主题 [url=http://localhost/read.php?tid=10]你了解大理石吗？浅谈装修中大理石采购要点[/url]','1253368327','0');
INSERT INTO pw_feed VALUES('11','1','post','发表了主题 [url=http://localhost/read.php?tid=11]装修材料中乳胶漆的选购要点[/url]','1253368354','0');
INSERT INTO pw_feed VALUES('12','1','post','发表了主题 [url=http://localhost/read.php?tid=12]宁波装修新潮流之卫浴、地板、橱柜[/url]','1253368407','0');
INSERT INTO pw_feed VALUES('13','1','post','发表了主题 [url=http://localhost/read.php?tid=13]小空间，大讲究，详解小卫浴装修要领[/url]','1253368444','0');
INSERT INTO pw_feed VALUES('14','1','post','发表了主题 [url=http://localhost/read.php?tid=14]收纳的创意！如何给宝宝一个合适的空间[/url]','1253368473','0');
INSERT INTO pw_feed VALUES('15','1','post','发表了主题 [url=http://localhost/read.php?tid=15]家居风水知多少[/url]','1253368503','0');
INSERT INTO pw_feed VALUES('16','1','post','发表了主题 [url=http://localhost/read.php?tid=16]如何判断橱柜的优劣[/url]','1253368552','0');
INSERT INTO pw_feed VALUES('17','1','post','发表了主题 [url=http://localhost/read.php?tid=17]详解石材的表面处理[/url]','1253368586','0');
INSERT INTO pw_feed VALUES('18','1','post','发表了主题 [url=http://localhost/read.php?tid=18]家居装饰中风水设计的流程[/url]','1253368611','0');
INSERT INTO pw_feed VALUES('19','1','post','发表了主题 [url=http://localhost/read.php?tid=19]宝宝卧室装修的风水讲究[/url]','1253368640','0');
INSERT INTO pw_feed VALUES('20','1','post','发表了主题 [url=http://localhost/read.php?tid=20]阳台装修有学问之材料篇[/url]','1253368666','0');
INSERT INTO pw_feed VALUES('21','1','post','发表了主题 [url=http://localhost/read.php?tid=21]简装房刷墙漆的学问[/url]','1253368692','0');
INSERT INTO pw_feed VALUES('22','1','post','发表了主题 [url=http://localhost/read.php?tid=22]酷暑盛夏中家电如何保养[/url]','1253368713','0');
INSERT INTO pw_feed VALUES('23','1','post','发表了主题 [url=http://localhost/read.php?tid=23]装饰的艺术——墙绘的前世今生[/url]','1253368781','0');
INSERT INTO pw_feed VALUES('24','1','post','发表了主题 [url=http://localhost/read.php?tid=24]装修中各种瓷砖的挑选方法[/url]','1253368827','0');
INSERT INTO pw_feed VALUES('25','1','post','发表了主题 [url=http://localhost/read.php?tid=25]选购绿色环保安全的涂料之注意事项[/url]','1253368855','0');
INSERT INTO pw_feed VALUES('26','1','post','发表了主题 [url=http://localhost/read.php?tid=26]家装业如何适应人口老龄化的社会现状[/url]','1253368879','0');
INSERT INTO pw_feed VALUES('27','1','post','发表了主题 [url=http://localhost/read.php?tid=27]去除装修污染有帮手，绿色植物来帮忙[/url]','1253368962','0');
INSERT INTO pw_feed VALUES('28','1','post','发表了主题 [url=http://localhost/read.php?tid=28]环保装修之十大要点[/url]','1253368995','0');
INSERT INTO pw_feed VALUES('29','1','post','发表了主题 [url=http://localhost/read.php?tid=29]橱柜安装之4大重点[/url]','1253369023','0');
INSERT INTO pw_feed VALUES('30','1','post','发表了主题 [url=http://localhost/read.php?tid=30]详解装修面积如何算[/url]','1253369042','0');
INSERT INTO pw_feed VALUES('31','1','post','发表了主题 [url=http://localhost/read.php?tid=31]风水之谈：办公室里如何摆鲜花或植物[/url]','1253369065','0');
INSERT INTO pw_feed VALUES('32','1','post','发表了主题 [url=http://localhost/read.php?tid=32]浅析“绿色家具”[/url]','1253369104','0');
INSERT INTO pw_feed VALUES('33','1','post','发表了主题 [url=http://localhost/read.php?tid=33]装修省钱宝典[/url]','1253369128','0');
INSERT INTO pw_feed VALUES('34','1','post','发表了主题 [url=http://localhost/read.php?tid=34]业主如何当监工，装修中不易发现的漏洞[/url]','1253369148','0');
INSERT INTO pw_feed VALUES('35','1','post','发表了主题 [url=http://localhost/read.php?tid=35]何时买建材 掌握合适的采购建材时机[/url]','1253369187','0');
INSERT INTO pw_feed VALUES('36','1','post','发表了主题 [url=http://localhost/read.php?tid=36]装修设计之十种武器[/url]','1253369214','0');
INSERT INTO pw_feed VALUES('37','1','post','发表了主题 [url=http://localhost/read.php?tid=37]德国研发新工具，解决地板安装难题[/url]','1253369330','0');
INSERT INTO pw_feed VALUES('38','1','post','发表了主题 [url=http://localhost/read.php?tid=38]水磨石地面装饰施工及修补磨光工艺[/url]','1253369362','0');
INSERT INTO pw_feed VALUES('39','1','post','发表了主题 [url=http://localhost/read.php?tid=39]装饰装修石材如何选，几大要点须牢记[/url]','1253369445','0');


INSERT INTO pw_forumdata VALUES('1','0','0','0','0','0','0','0','0','','');
INSERT INTO pw_forumdata VALUES('2','0','0','0','0','0','0','0','0','','');
INSERT INTO pw_forumdata VALUES('3','0','0','0','0','0','0','0','0','','');
INSERT INTO pw_forumdata VALUES('4','0','0','0','0','0','0','0','0','','');
INSERT INTO pw_forumdata VALUES('5','0','0','0','0','0','0','0','0','','');
INSERT INTO pw_forumdata VALUES('6','0','0','0','0','0','0','0','0','','');
INSERT INTO pw_forumdata VALUES('8','0','28','28','0','0','0','0','0','','装饰装修石材如何 ..	admin	1253369445	read.php?tid=39&page=e#a');
INSERT INTO pw_forumdata VALUES('9','0','9','9','0','0','0','0','0','','浅析“绿色家具”	admin	1253369104	read.php?tid=32&page=e#a');
INSERT INTO pw_forumdata VALUES('10','0','2','2','0','0','0','0','0','','装修设计之十种武 ..	admin	1253369214	read.php?tid=36&page=e#a');
INSERT INTO pw_forumdata VALUES('11','0','0','0','0','0','0','0','0','','');
INSERT INTO pw_forumdata VALUES('12','0','0','0','0','0','0','0','0','','');



INSERT INTO pw_forums VALUES('1','0','0','1','category','','互动','','','','0','','','0','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');
INSERT INTO pw_forums VALUES('2','1','0','0','forum','','有问有答','','','','0','','','0','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');
INSERT INTO pw_forums VALUES('3','1','0','0','forum','','业主交流','','','','0','','','0','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');
INSERT INTO pw_forums VALUES('4','0','0','1','category','','装修','','','','0','','','0','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');
INSERT INTO pw_forums VALUES('5','0','0','1','category','','家居','','','','0','','','0','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');
INSERT INTO pw_forums VALUES('6','0','0','1','category','','设计','','','','0','','','','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');
INSERT INTO pw_forums VALUES('8','4','0','0','forum','','装修宝典','','','','0','','','0','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');
INSERT INTO pw_forums VALUES('9','5','0','0','forum','','时尚家居','','','','0','','','0','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');
INSERT INTO pw_forums VALUES('10','6','0','0','forum','','家装设计','','','','0','','','0','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');
INSERT INTO pw_forums VALUES('11','0','0','1','category','','管理','','','','0','','','','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');
INSERT INTO pw_forums VALUES('12','11','0','0','forum','','社区管理','','','','0','','','0','0','0','1','1','3','0','1','','0','','','','','','','forum','0','0','','0','1','0','0','1','','0','');


INSERT INTO pw_forumsextra VALUES('12','','a:33:{s:4:\"link\";s:0:\"\";s:4:\"lock\";i:0;s:7:\"cutnums\";i:0;s:9:\"threadnum\";i:0;s:7:\"readnum\";i:0;s:7:\"newtime\";i:0;s:8:\"orderway\";s:8:\"lastpost\";s:3:\"asc\";s:4:\"DESC\";s:11:\"allowencode\";i:0;s:9:\"anonymous\";i:0;s:4:\"rate\";i:0;s:3:\"dig\";i:0;s:7:\"inspect\";i:0;s:9:\"watermark\";i:0;s:7:\"commend\";i:0;s:11:\"autocommend\";i:0;s:11:\"commendlist\";s:0:\"\";s:10:\"commendnum\";i:0;s:13:\"commendlength\";i:0;s:11:\"commendtime\";i:0;s:10:\"addtpctype\";i:0;s:9:\"ifrelated\";i:0;s:11:\"relatednums\";i:0;s:10:\"relatedcon\";s:7:\"ownpost\";s:13:\"relatedcustom\";a:0:{}s:8:\"rvrcneed\";i:0;s:9:\"moneyneed\";i:0;s:10:\"creditneed\";i:0;s:11:\"postnumneed\";i:0;s:9:\"sellprice\";a:0:{}s:9:\"uploadset\";s:9:\"money			0\";s:8:\"rewarddb\";s:3:\"			\";s:9:\"allowtime\";s:0:\"\";}','');



INSERT INTO pw_hack VALUES('bk_A','string','a:1:{s:10:\"rvrc_money\";a:6:{i:0;s:4:\"威望\";i:1;s:4:\"金钱\";i:2;s:1:\"2\";i:3;s:1:\"3\";i:4;s:1:\"1\";i:5;i:1;}}','');
INSERT INTO pw_hack VALUES('bk_ddate','string','10','');
INSERT INTO pw_hack VALUES('bk_drate','string','10','');
INSERT INTO pw_hack VALUES('bk_num','string','10','');
INSERT INTO pw_hack VALUES('bk_open','string','1','');
INSERT INTO pw_hack VALUES('bk_per','string','5','');
INSERT INTO pw_hack VALUES('bk_rate','string','5','');
INSERT INTO pw_hack VALUES('bk_timelimit','string','2','');
INSERT INTO pw_hack VALUES('bk_virelimit','string','10','');
INSERT INTO pw_hack VALUES('bk_virement','string','1','');
INSERT INTO pw_hack VALUES('bk_virerate','string','10','');
INSERT INTO pw_hack VALUES('currrate1','string','a:4:{s:4:\"rvrc\";i:100;s:5:\"money\";i:100;s:6:\"credit\";i:1;i:1;i:5;}','');
INSERT INTO pw_hack VALUES('currrate2','string','','');
INSERT INTO pw_hack VALUES('cn_open','string','1','');
INSERT INTO pw_hack VALUES('cn_remove','string','1','');
INSERT INTO pw_hack VALUES('cn_newcolony','string','1','');
INSERT INTO pw_hack VALUES('cn_createmoney','string','100','');
INSERT INTO pw_hack VALUES('cn_joinmoney','string','10','');
INSERT INTO pw_hack VALUES('cn_allowcreate','string','1','');
INSERT INTO pw_hack VALUES('cn_allowjoin','string','1','');
INSERT INTO pw_hack VALUES('cn_memberfull','string','50','');
INSERT INTO pw_hack VALUES('cn_imgsize','string','1048576','');
INSERT INTO pw_hack VALUES('cn_name','string','朋友圈','');
INSERT INTO pw_hack VALUES('cn_groups','string',',3,4,5,8,9,10,11,12,13,14,15,16,','');
INSERT INTO pw_hack VALUES('cn_imgwidth','string','200','');
INSERT INTO pw_hack VALUES('cn_imgheight','string','100','');
INSERT INTO pw_hack VALUES('cn_visittime','string','60','');
INSERT INTO pw_hack VALUES('cn_transfer','string','10','');
INSERT INTO pw_hack VALUES('inv_open','string','0','');
INSERT INTO pw_hack VALUES('inv_days','string','1','');
INSERT INTO pw_hack VALUES('inv_limitdays','string','0','');
INSERT INTO pw_hack VALUES('inv_costs','string','50','');
INSERT INTO pw_hack VALUES('inv_credit','string','currency','');
INSERT INTO pw_hack VALUES('inv_groups','string',',3,4,5,','');
INSERT INTO pw_hack VALUES('md_groups','string',',3,','');
INSERT INTO pw_hack VALUES('md_ifmsg','string','1','');
INSERT INTO pw_hack VALUES('md_ifopen','string','1','');
INSERT INTO pw_hack VALUES('o_camoney','string','0','');
INSERT INTO pw_hack VALUES('o_albumnum','string','5','');
INSERT INTO pw_hack VALUES('o_albumnum2','string','2','');
INSERT INTO pw_hack VALUES('o_maxphotonum','string','20','');
INSERT INTO pw_hack VALUES('o_mkdir','string','1','');
INSERT INTO pw_hack VALUES('o_maxfilesize','string','500','');
INSERT INTO pw_hack VALUES('o_shownum','string','500','');
INSERT INTO pw_hack VALUES('o_attachdir','string','2','');
INSERT INTO pw_hack VALUES('o_uploadsize','string','a:5:{s:3:\"jpg\";i:300;s:4:\"jpeg\";i:300;s:3:\"png\";i:400;s:3:\"gif\";i:400;s:3:\"bmp\";i:400;}','');
INSERT INTO pw_hack VALUES('o_classdb','array','a:1:{i:6;s:12:\"默认分类\";}','');
INSERT INTO pw_hack VALUES('o_remove','string','1','');
INSERT INTO pw_hack VALUES('o_newcolony','string','1','');
INSERT INTO pw_hack VALUES('md_ifapply','string','1','');
INSERT INTO pw_hack VALUES('md_appgroups','string','','');
INSERT INTO pw_hack VALUES('o_diary_gdcheck','string','0','');
INSERT INTO pw_hack VALUES('o_diary_qcheck','string','0','');
INSERT INTO pw_hack VALUES('o_diary_groups','string','','');
INSERT INTO pw_hack VALUES('o_diarylimit','string','0','');
INSERT INTO pw_hack VALUES('o_diarypertime','string','0','');
INSERT INTO pw_hack VALUES('o_groups_gdcheck','string','0','');
INSERT INTO pw_hack VALUES('o_groups_p_gdcheck','string','0','');
INSERT INTO pw_hack VALUES('o_groups_qcheck','string','0','');
INSERT INTO pw_hack VALUES('o_groups_p_qcheck','string','0','');
INSERT INTO pw_hack VALUES('o_share_groups','string','','');
INSERT INTO pw_hack VALUES('o_share_gdcheck','string','0','');
INSERT INTO pw_hack VALUES('o_share_qcheck','string','0','');
INSERT INTO pw_hack VALUES('o_photos_gdcheck','string','0','');
INSERT INTO pw_hack VALUES('o_photos_qcheck','string','0','');
INSERT INTO pw_hack VALUES('o_photos_groups','string','','');
INSERT INTO pw_hack VALUES('o_browseopen','string','1','');
INSERT INTO pw_hack VALUES('o_browse','string','511','');
INSERT INTO pw_hack VALUES('o_invite','string','1','');
INSERT INTO pw_hack VALUES('o_indexset','string','1023','');
INSERT INTO pw_hack VALUES('area_catetpl','string','default','');
INSERT INTO pw_hack VALUES('area_indextpl','string','eningjia','');
INSERT INTO pw_hack VALUES('o_hot_open','string','1','');
INSERT INTO pw_hack VALUES('o_hot_groups','string',',3,4,5,16,','');
INSERT INTO pw_hack VALUES('area_navinfo','array','a:5:{s:4:\"KEY1\";a:1:{s:4:\"html\";s:51:\"<a href=\"cate.php?cateid=1\" id=\"td_KEY1\">装修</a>\";}s:4:\"KEY4\";a:1:{s:4:\"html\";s:51:\"<a href=\"cate.php?cateid=4\" id=\"td_KEY4\">装修</a>\";}s:4:\"KEY5\";a:1:{s:4:\"html\";s:51:\"<a href=\"cate.php?cateid=5\" id=\"td_KEY5\">家居</a>\";}s:4:\"KEY6\";a:1:{s:4:\"html\";s:51:\"<a href=\"cate.php?cateid=6\" id=\"td_KEY6\">设计</a>\";}s:5:\"KEY11\";a:1:{s:4:\"html\";s:53:\"<a href=\"cate.php?cateid=11\" id=\"td_KEY11\">管理</a>\";}}','');
INSERT INTO pw_hack VALUES('o_navinfo','array','a:5:{s:8:\"KEYindex\";a:1:{s:4:\"html\";s:57:\"<a href=\"index.php?m=o\" id=\"td_KEYindex\">圈子首页</a>\";}s:7:\"KEYhome\";a:1:{s:4:\"html\";s:55:\"<a href=\"mode.php?m=o\" id=\"td_KEYhome\">我的首页</a>\";}s:7:\"KEYuser\";a:1:{s:4:\"html\";s:62:\"<a href=\"mode.php?m=o&q=user\" id=\"td_KEYuser\">个人空间</a>\";}s:9:\"KEYfriend\";a:1:{s:4:\"html\";s:60:\"<a href=\"mode.php?m=o&q=friend\" id=\"td_KEYfriend\">朋友</a>\";}s:9:\"KEYbrowse\";a:1:{s:4:\"html\";s:66:\"<a href=\"mode.php?m=o&q=browse\" id=\"td_KEYbrowse\">随便看看</a>\";}}','');
INSERT INTO pw_hack VALUES('area_static_next','string','0','');

INSERT INTO pw_help VALUES('1','0','0','','1','新手入门','','','0','1');
INSERT INTO pw_help VALUES('2','1','1','1','0','注册、登录','','注册方法：如果您还没有注册，是以游客状态浏览论坛的，在头部导航栏可以看到“您尚未登录&#160;注册”的字样，点击“注册”，填写相应的信息，就可以完成注册了。\n因站长设置的不同，游客的浏览及使用论坛的权限会受到很多限制，如果您喜欢这个论坛，建议您马上注册。\n登录方法：如果您已经注册了该论坛，可以在网站首页头部的登陆模块进行登陆，也可以在页面头部导航栏点击“登陆”，进入登陆页面进行登陆，在限制游客访问的页面，也会有登陆提示页面出现。','0','1');
INSERT INTO pw_help VALUES('3','1','1','1','0','忘记密码','','如果您忘记密码，请在登录页面点击“找回密码”并输入用户名，系统将自动发送密码到您的有效邮箱中。','0','1');
INSERT INTO pw_help VALUES('4','1','1','1','0','添加和编辑个人资料','','点击进入“控制面板”下的“编辑个人资料”，就可以对自己的资料信息进行修改了。','0','1');
INSERT INTO pw_help VALUES('5','1','1','1','0','选择风格','','点击进入“控制面板”下的“编辑个人资料”，找到“论坛可控制性数据”一栏，在该栏目下有“选择风格”的选项，在下拉列表里选择喜欢的风格，点击“提交”按钮，就可以了。','0','1');
INSERT INTO pw_help VALUES('6','1','1','1','0','选择默认编辑器','','点击进入“控制面板”下的“编辑个人资料”，找到“论坛可控制性数据”一栏，在该栏目下有“选择默认使用的编辑器”选项，选择习惯使用的编辑器，点击“提交”。','0','1');
INSERT INTO pw_help VALUES('7','1','1','1','0','接收邮件','','点击进入“控制面板”下的“编辑个人资料”，在“论坛可控制性数据”一栏最下边，找到“是否接受邮件”，选择“接收邮件”，点击“提交”。','0','1');
INSERT INTO pw_help VALUES('8','0','0','','1','发帖回帖','','','0','1');
INSERT INTO pw_help VALUES('9','8','1','8','0','发表主题','','在帖子列表页面和帖子阅读页面，可以看到“新帖”图标，点击即可进入主题帖发布页面，如果没有发帖权限，会有提示“本论坛只有特定用户组才能发表主题,请到其他版块发帖,以提高等级!”出现。\n如果用不到这样完全的发帖功能，也可以在帖子列表页面底部的快速发帖模块进行发帖操作。','0','1');
INSERT INTO pw_help VALUES('10','8','1','8','0','发表出售帖','','在帖子列表页面和帖子阅读页面，点击“新帖”图标进入主题帖发布页面，发帖时在帖子编辑器下方找到“出售此帖”，在前面的复选框理勾选（如果复选框呈灰色，说明该版块不允许发布交易帖或者您的权限不够），填写好会员读帖需要支付的金钱数量（注意不能超过支付最大值）。\n同样，也可以在帖子列表页面底部的快速发帖模块进行发帖操作时设置读帖需要支付的金钱数量。','0','1');
INSERT INTO pw_help VALUES('11','8','1','8','0','发表交易帖、悬赏帖和投票帖','','发表交易帖、悬赏帖和投票帖','0','1');
INSERT INTO pw_help VALUES('12','8','1','8','0','发表匿名帖','','在帖子列表页面和帖子阅读页面，点击“新帖”图标进入发帖页面，在发帖时勾选内容编辑器下面的匿名帖复选框，或者在快速发帖处勾选（如果复选框呈灰色，说明该版块不允许发布匿名帖或者您的权限不够）。','0','1');
INSERT INTO pw_help VALUES('13','8','1','8','0','发表回复','','在帖子阅读页面点击“回复”按钮进入回复页面回复主题帖，也可以在页面下方的快速发帖处进行回复。','0','1');
INSERT INTO pw_help VALUES('14','8','1','8','0','引用功能','','在需要引用的帖子楼层上点击引用，即可引用当前楼层内容，也可以用Wind Code代码进行引用，把需要引用的内容放入[quote] 您要引用的文字[/quote]中间即可。','0','1');
INSERT INTO pw_help VALUES('15','8','1','8','0','附件上传','','在发帖页面下的附件上传处点击浏览按钮，上传有效后缀类型的附件，同时可以在描述框对附件进行描述，并设置下载附件所需要的威望值。','0','1');
INSERT INTO pw_help VALUES('16','8','1','8','0','购买主题','','读一个出售帖时，首先要在点击“购买”按钮，如果金钱数大于购买帖子所需的数量，就会扣掉相应的金钱数，同时购买成功，可以阅读到帖子内容。','0','1');
INSERT INTO pw_help VALUES('17','8','1','8','0','我的主题','','在“控制面板”的“我的主题”下，可以查看我的主题，我的回复，我的精华，我的投票，我的交易等','0','1');
INSERT INTO pw_help VALUES('18','0','0','','1','常用功能','','','0','1');
INSERT INTO pw_help VALUES('19','18','1','18','0','收藏功能','','在帖子阅读页面，可以看到“打印 | 加为IE收藏 | 收藏主题 | 上一主题 | 下一主题”，点击“收藏主题”后，可以在“控制面板”下的“收藏夹”里看到收藏的主题，同时可以对收藏的主题进行分类管理。','0','1');
INSERT INTO pw_help VALUES('20','18','1','18','0','朋友圈功能','','朋友圈功能以插件形式存在，可以通过创建或加入已创建朋友圈，实现和同一朋友圈会员间更紧密的互动。','0','1');
INSERT INTO pw_help VALUES('21','18','1','18','0','短消息功能','','可以通过会员头像信息栏或者帖子楼层短消息按钮实现会员之间互发短消息。','0','1');
INSERT INTO pw_help VALUES('22','18','1','18','0','搜索功能','','点击导航栏的“搜索”链接进入搜索页面，在搜索页面下，可以通过关键词或用户名对帖子主题、回复以及精华按版块进行搜索。因级别不同和各论坛设置不同，搜索权限可能会受到限制。','0','1');
INSERT INTO pw_help VALUES('23','18','1','18','0','帖子举报功能','','协助站长进行帖子监控、举报不良帖子推荐优秀帖子的功能。在帖子楼层操作栏点击“举报”填写理由并提交就能实现了对当前楼层帖子举报的操作。','0','1');
INSERT INTO pw_help VALUES('24','18','1','18','0','社区插件','','是对论坛功能的一个重要补充。插件通过把程序文件上传到hack目录下，在后台“添加插件”处进行安装，并能在“插件管理”中对相应的插件进行编辑管理和卸载。插件安装好后并开启后通过设置下拉显示或直接显示，让插件链接显示在“社区服务”的下拉菜单中或者直接显示在导航栏上。','0','1');
INSERT INTO pw_help VALUES('25','18','1','18','0','道具使用','','对会员使用的道具在会员头像信息栏的头像按钮处选择，对帖子使用的道具在帖子操作栏的“使用道具”处选择。打开道具列表后可以看到自己存有的道具数量，如果数量为零需要购买才能使用。','0','1');
INSERT INTO pw_help VALUES('26','18','1','18','0','Rss聚合','','程序提供了几处常用的Rss订阅。首页的“Rss订阅本版面最新帖子”、分类页面下的“Rss订阅本版面最新帖子”和版块页面下的“Rss订阅本版面最新帖子”。','0','1');
INSERT INTO pw_help VALUES('27','18','1','18','0','Wind Code','','<table><tr class=\"tr3 tr\"><td><font color=\"#5a6633\" face=\"verdana\">[quote]</font>被引用的内容，主要作用是在发帖时引用并回复具体楼层的帖子<font color=\"#5a6633\" face=\"verdana\">[/quote]</font></td><td><table cellpadding=\"5\" cellspacing=\"1\" width=\"94%\" bgcolor=\"#000000\" align=\"center\"><tr><td class=\"f_one\">被引用的帖子和您的回复内容</td></tr></table></td></tr><tr class=\"tr3 tr\"><td><font color=\"#5a6633\" face=\"verdana\">[code]</font><font color=\"#5a6633\"></font><font face=\"courier\" color=\"#333333\"><br />echo \"PHPWind 欢迎您!\"\r</font><font color=\"#5a6633\" face=\"verdana\">[/code]</font></td><th><div class=\"tpc_content\" id=\"read_553959\"><h6 class=\"quote\">Copy code</h6><blockquote id=\"code1\">echo \"PHPWind 欢迎您!\"</blockquote></div></th></tr><tr class=\"tr3 tr\"><td><font face=\"verdana\" color=\"5a6633\">[url]</font><font face=\"verdana\">http://www.phpwind.net</font><font color=\"5a6633\">[/url] </font></td><td><a href=\"http://www.phpwind.net\" target=\"_blank\"><font color=\"#000066\">http://www.phpwind.net</font></a></td></tr><tr class=\"tr3 tr\"><td><font face=\"verdana\" color=\"5a6633\">[url=http://www.phpwind.net]</font><font face=\"verdana\">PHPwind</font><font color=\"5a6633\">[/url]</font></td><td><a href=\"http://www.phpwind.net\"><font color=\"000066\">PHPwind</font></a></font></td></tr><tr class=\"tr3 tr\"><td><font face=\"verdana\" color=\"5a6633\">[email]</font><font face=\"verdana\">fengyu@163.com</font><font color=\"5a6633\">[/email]</font></td><td><a href=\"mailto:fengyu@163.com\"><font color=\"000066\">fengyu@163.com</font></a></td></tr><tr class=\"tr3 tr\"><td><font face=\"verdana\" color=\"5a6633\">[email=fengyu@163.com]</font><font face=\"verdana\">email me</font><font color=\"5a6633\">[/email]</font></td><td><a href=\"mailto:fengyu@163.com\"><font color=\"000066\">email me</font></a></td></tr><tr class=\"tr3 tr\"> <td><font face=\"verdana\" color=\"5a6633\">[b]</font><font face=\"verdana\">粗体字</font><font color=\"5a6633\" face=\"verdana\">[/b]</font> </td><td><font face=\"verdana\"><b>粗体字</b></font> </td></tr><tr class=\"tr3 tr\"><td><font face=\"verdana\" color=\"5a6633\">[i]</font><font face=\"verdana\">斜体字<font color=\"5a6633\">[/i]</font> </font></td><td><font face=\"verdana\"><i>斜体字</i></font> </td></tr><tr class=\"tr3 tr\"><td><font face=\"verdana\" color=\"5a6633\">[u]</font><font face=\"verdana\">下划线</font><font color=\"5a6633\">[/u]</font></td><td><font face=\"verdana\"><u>下划线</u></font> </td></tr><tr class=\"tr3 tr\"> <td><font face=verdana color=5a6633>[align=center(可以是向左left，向右right)]</font>位于中间<font color=\"5a6633\">[/align]</font></td><td><font face=\"verdana\"><div align=\"center\">中间对齐</div></font></td></tr><tr class=\"tr3 tr\"> <td><font face=\"verdana\" color=\"5a6633\">[size=4]</font><font face=\"verdana\">改变字体大小<font color=\"5a6633\">[/size] </font> </font></td><td><font face=\"verdana\">改变字体大小 </font></td></tr><tr class=\"tr3 tr\"> <td><font face=\"verdana\" color=\"5a6633\">[font=</font><font color=\"5a6633\">楷体_gb2312<font face=\"verdana\">]</font></font><font face=\"verdana\">改变字体<font color=\"5a6633\">[/font] </font> </font></td><td><font face=\"verdana\"><font face=楷体_gb2312>改变字体</font> </font></td></tr><tr class=\"tr3 tr\"> <td><font face=\"verdana\" color=\"5a6633\">[color=red]</font><font face=\"verdana\">改变颜色<font color=\"5a6633\">[/color] </font> </font></td><td><font face=\"verdana\" color=\"red\">改变颜色</font><font face=\"verdana\"> </font></td></tr><tr class=\"tr3 tr\"> <td><font face=\"verdana\" color=\"5a6633\">[img]</font><font face=\"verdana\">http://www.phpwind.net/logo.gif<font color=\"5a6633\">[/img]</font> </font></td><td><img src=\"logo.gif\" /></font> </td></tr><tr class=\"tr3 tr\"> <td><font face=宋体 color=\"#333333\"><font color=\"#5a6633\">[fly]</font>飞行文字特效<font color=\"#5a6633\">[/fly]</font> </font></td><td><font face=宋体&nbsp; &nbsp; color=\"#333333\"><marquee scrollamount=\"3\" behavior=\"alternate\" width=\"90%\">飞行文字特效</marquee></font></td></tr><tr class=\"tr3 tr\"> <td><font face=宋体 color=\"#333333\"><font color=\"#5a6633\">[move]</font>滚动文字特效<font color=\"#5a6633\">[/move]</font> </font></td><td><font face=宋体 color=\"#333333\"> <marquee scrollamount=\"3\" width=\"90%\">滚动文字特效</marquee></font></td></tr><tr class=\"tr3 tr\"><td><font face=宋体 color=\"#333333\"><font color=\"#5a6633\">[flash=400,300]</font>http://www.phpwind.net/wind.swf<font color=\"#5a6633\">[/flash]</font> </font></td><td><font face=宋体 color=\"#333333\">将显示flash文件</font> </td></tr><tr class=\"tr3 tr\"><td><font face=宋体 color=\"#333333\"><font color=\"#5a6633\">[iframe]</font>http://www.phpwind.net<font color=\"#5a6633\">[/iframe]</font> </font></td><td><font face=宋体 color=\"#333333\">将在帖子中粘贴网页(后台默认关闭)</font> </td></tr><tr class=\"tr3 tr\"><td><font color=#5a6633>[glow=255(宽度),red(颜色),1(边界)]</font>要产生光晕效果的文字<font color=\"#5a6633\">[/glow]</font></td><td align=\"center\"><font face=宋体 color=\"#333333\"><table width=\"255\" style=\"filter:glow(color=red, direction=1)\"><tr><td align=\"center\">要产生彩色发光效果的文字</td></tr></table></font></td></tr></table>','0','1');


INSERT INTO pw_invoke VALUES('1','首页焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('2','首页焦点','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页焦点\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('26','首页社区热门','7','\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页社区热门\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /><p>$val[title]</p></a>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('10','首页循环版块','6','\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页循环版块\',\'图片模块\',$loopid);\r\nprint <<<EOT\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /><p>$val[title]</p></a>\r\nEOT;\r\n}print <<<EOT\r\n</th>\r\n<td>\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页循环版块\',\'帖子排行模块\',$loopid);\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" title=\"$val[title]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>\r\n</td>\r\n</tr></table>','1','','');
INSERT INTO pw_invoke VALUES('5','首页最新图片','7','\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页最新图片\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /><p>$val[title]</p></a>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('6','首页某版块调用1','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页某版块调用1\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('7','首页某版块调用2','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页某版块调用2\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('8','版块排行','8','\r\nEOT;\r\n$pwresult = pwTplGetData(\'版块排行\',\'版块模块\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span class=\"fr\">$val[value]</span><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('14','用户排行','12','\r\nEOT;\r\n$pwresult = pwTplGetData(\'用户排行\',\'用户模块\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span class=\"fr\">$val[value]</span><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('11','首页播放器','11','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页播放器\',\'播放器\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" />\r\n							<h1>$val[title]</h1></a>\r\n                        </div>\r\nEOT;\r\n}print <<<EOT\r\n					<div class=\"pwSlide-bg\"></div>\r\n					<ul id=\"SwitchNav\"></ul>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','0','','');
INSERT INTO pw_invoke VALUES('12','首页播放器下方','3','\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页播放器下方\',\'图片模块\');\r\nprint <<<EOT\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\nEOT;\r\n}print <<<EOT\r\n</th>\r\n<td>\r\nEOT;\r\n$pwresult = pwTplGetData(\'首页播放器下方\',\'帖子排行模块\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" title=\"$val[title]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>\r\n</td>\r\n</tr></table>','0','','');
INSERT INTO pw_invoke VALUES('81','频道页中部焦点_有作者','14','\r\nEOT;\r\n$pwresult = pwTplGetData(\'频道页中部焦点_有作者\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span class=\"fr\"><a href=\"u.php?action=show&username=$val[author]\" target=\"_blank\">$val[author]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('78','频道页本版热门','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'频道页本版热门\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('79','频道页页面中部焦点','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'频道页页面中部焦点\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('80','频道页中部焦点摘要图片','5','\r\nEOT;\r\n$pwresult = pwTplGetData(\'频道页中部焦点摘要图片\',\'图文模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('76','频道页焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'频道页焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('77','频道页焦点列表','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'频道页焦点列表\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('74','频道页播放器','11','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\nEOT;\r\n$pwresult = pwTplGetData(\'频道页播放器\',\'播放器\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"$val[url]\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"$val[image]\" />\r\n							<h1>$val[title]</h1></a>\r\n                        </div>\r\nEOT;\r\n}print <<<EOT\r\n					<ul id=\"SwitchNav\"></ul>\r\n					<div class=\"pwSlide-bg\"></div>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','0','','');
INSERT INTO pw_invoke VALUES('27','fun_焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'fun_焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('28','fun_焦点列表','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'fun_焦点列表\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('29','fun_本版热门','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'fun_本版热门\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('30','fun_播放器','11','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\nEOT;\r\n$pwresult = pwTplGetData(\'fun_播放器\',\'播放器\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"$val[url]\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"$val[image]\" />\r\n							<h1>$val[title]</h1></a>\r\n                        </div>\r\nEOT;\r\n}print <<<EOT\r\n					<ul id=\"SwitchNav\"></ul>\r\n					<div class=\"pwSlide-bg\"></div>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','0','','');
INSERT INTO pw_invoke VALUES('32','频道左侧站点推荐','7','\r\nEOT;\r\n$pwresult = pwTplGetData(\'频道左侧站点推荐\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /><p>$val[title]</p></a>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('33','fun_页面中部焦点','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'fun_页面中部焦点\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('36','fun_中部焦点摘要图片','5','\r\nEOT;\r\n$pwresult = pwTplGetData(\'fun_中部焦点摘要图片\',\'图文模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('40','fun_中部焦点_有作者','14','\r\nEOT;\r\n$pwresult = pwTplGetData(\'fun_中部焦点_有作者\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span class=\"fr\"><a href=\"u.php?action=show&username=$val[author]\" target=\"_blank\">$val[author]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('44','auto_播放器','11','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\nEOT;\r\n$pwresult = pwTplGetData(\'auto_播放器\',\'播放器\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"$val[url]\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"$val[image]\" />\r\n							<h1>$val[title]</h1></a>\r\n                        </div>\r\nEOT;\r\n}print <<<EOT\r\n					<ul id=\"SwitchNav\"></ul>\r\n					<div class=\"pwSlide-bg\"></div>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','0','','');
INSERT INTO pw_invoke VALUES('43','fun_频道页循环','15','\r\nEOT;\r\n$pwresult = pwTplGetData(\'fun_频道页循环\',\'图片模块\',$loopid);\r\nprint <<<EOT\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n</th>\r\n<td>\r\nEOT;\r\n$pwresult = pwTplGetData(\'fun_频道页循环\',\'帖子排行模块\',$loopid);\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"u.php?action=show&username=$val[author]\" class=\"fr\">$val[author]</a><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\" title=\"$val[title]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>\r\n</td>\r\n</tr></table>','1','','');
INSERT INTO pw_invoke VALUES('45','auto_焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'auto_焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('46','auto_焦点列表','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'auto_焦点列表\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('47','auto_本版热门','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'auto_本版热门\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('48','atuo_中部图片','16','\r\nEOT;\r\n$pwresult = pwTplGetData(\'atuo_中部图片\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('49','auto_中部焦点1','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'auto_中部焦点1\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('50','auto_中部焦点2','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'auto_中部焦点2\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('51','atuo_频道页循环','15','\r\nEOT;\r\n$pwresult = pwTplGetData(\'atuo_频道页循环\',\'图片模块\',$loopid);\r\nprint <<<EOT\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n</th>\r\n<td>\r\nEOT;\r\n$pwresult = pwTplGetData(\'atuo_频道页循环\',\'帖子排行模块\',$loopid);\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"u.php?action=show&username=$val[author]\" class=\"fr\">$val[author]</a><a href=\"$val[url]\" title=\"$val[title]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>\r\n</td>\r\n</tr></table>','1','','');
INSERT INTO pw_invoke VALUES('52','children_播放器','11','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\nEOT;\r\n$pwresult = pwTplGetData(\'children_播放器\',\'播放器\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"$val[url]\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"$val[image]\" />\r\n							<h1>$val[title]</h1></a>\r\n                        </div>\r\nEOT;\r\n}print <<<EOT\r\n					<ul id=\"SwitchNav\"></ul>\r\n					<div class=\"pwSlide-bg\"></div>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','0','','');
INSERT INTO pw_invoke VALUES('53','children_焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'children_焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('54','children_焦点列表','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'children_焦点列表\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('55','children_本版热门','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'children_本版热门\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('56','children_页面中部焦点','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'children_页面中部焦点\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('57','children_中部焦点摘要图片','5','\r\nEOT;\r\n$pwresult = pwTplGetData(\'children_中部焦点摘要图片\',\'图文模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('58','children_中部焦点_有作者','14','\r\nEOT;\r\n$pwresult = pwTplGetData(\'children_中部焦点_有作者\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span class=\"fr\"><a href=\"u.php?action=show&username=$val[author]\" target=\"_blank\">$val[author]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('59','children_频道页循环','15','\r\nEOT;\r\n$pwresult = pwTplGetData(\'children_频道页循环\',\'图片模块\',$loopid);\r\nprint <<<EOT\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n</th>\r\n<td>\r\nEOT;\r\n$pwresult = pwTplGetData(\'children_频道页循环\',\'帖子排行模块\',$loopid);\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"u.php?action=show&username=$val[author]\" class=\"fr\">$val[author]</a><a href=\"$val[url]\" title=\"$val[title]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>\r\n</td>\r\n</tr></table>','1','','');
INSERT INTO pw_invoke VALUES('60','jia_播放器','11','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\nEOT;\r\n$pwresult = pwTplGetData(\'jia_播放器\',\'播放器\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"$val[url]\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"$val[image]\" />\r\n							<h1>$val[title]</h1></a>\r\n                        </div>\r\nEOT;\r\n}print <<<EOT\r\n					<ul id=\"SwitchNav\"></ul>\r\n					<div class=\"pwSlide-bg\"></div>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','0','','');
INSERT INTO pw_invoke VALUES('61','jia_焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'jia_焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('62','jia_页面中部焦点','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'jia_页面中部焦点\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('63','jia_中部焦点摘要图片','5','\r\nEOT;\r\n$pwresult = pwTplGetData(\'jia_中部焦点摘要图片\',\'图文模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('64','jia_中部焦点_有作者','14','\r\nEOT;\r\n$pwresult = pwTplGetData(\'jia_中部焦点_有作者\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span class=\"fr\"><a href=\"u.php?action=show&username=$val[author]\" target=\"_blank\">$val[author]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('65','jia_频道页循环','15','\r\nEOT;\r\n$pwresult = pwTplGetData(\'jia_频道页循环\',\'图片模块\',$loopid);\r\nprint <<<EOT\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n</th>\r\n<td>\r\nEOT;\r\n$pwresult = pwTplGetData(\'jia_频道页循环\',\'帖子排行模块\',$loopid);\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"u.php?action=show&username=$val[author]\" class=\"fr\">$val[author]</a><a href=\"$val[url]\" title=\"$val[title]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>\r\n</td>\r\n</tr></table>','1','','');
INSERT INTO pw_invoke VALUES('66','women_播放器','11','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\nEOT;\r\n$pwresult = pwTplGetData(\'women_播放器\',\'播放器\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"$val[url]\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"$val[image]\" />\r\n							<h1>$val[title]</h1></a>\r\n                        </div>\r\nEOT;\r\n}print <<<EOT\r\n					<ul id=\"SwitchNav\"></ul>\r\n					<div class=\"pwSlide-bg\"></div>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','0','','');
INSERT INTO pw_invoke VALUES('67','women_焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'women_焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('68','women_焦点图片摘要','5','\r\nEOT;\r\n$pwresult = pwTplGetData(\'women_焦点图片摘要\',\'图文模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('69','women_本版热门','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'women_本版热门\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('70','women_页面中部焦点','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'women_页面中部焦点\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('71','women_中部焦点摘要图片','5','\r\nEOT;\r\n$pwresult = pwTplGetData(\'women_中部焦点摘要图片\',\'图文模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('72','women_中部焦点_有作者','14','\r\nEOT;\r\n$pwresult = pwTplGetData(\'women_中部焦点_有作者\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span class=\"fr\"><a href=\"u.php?action=show&username=$val[author]\" target=\"_blank\">$val[author]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('73','women_频道页循环','15','\r\nEOT;\r\n$pwresult = pwTplGetData(\'women_频道页循环\',\'图片模块\',$loopid);\r\nprint <<<EOT\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n</th>\r\n<td>\r\nEOT;\r\n$pwresult = pwTplGetData(\'women_频道页循环\',\'帖子排行模块\',$loopid);\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"u.php?action=show&username=$val[author]\" class=\"fr\">$val[author]</a><a href=\"$val[url]\" title=\"$val[title]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>\r\n</td>\r\n</tr></table>','1','','');
INSERT INTO pw_invoke VALUES('83','频道页循环','15','\r\nEOT;\r\n$pwresult = pwTplGetData(\'频道页循环\',\'图片模块\',$loopid);\r\nprint <<<EOT\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\n<div class=\"c\"></div>\r\nEOT;\r\n}print <<<EOT\r\n</th>\r\n<td>\r\nEOT;\r\n$pwresult = pwTplGetData(\'频道页循环\',\'帖子排行模块\',$loopid);\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"u.php?action=show&username=$val[author]\" class=\"fr\">$val[author]</a><a href=\"$val[url]\" title=\"$val[title]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>\r\n</td>\r\n</tr></table>','1','','');
INSERT INTO pw_invoke VALUES('84','home2_首页焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home2_首页焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('85','home2_首页播放器','11','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\nEOT;\r\n$pwresult = pwTplGetData(\'home2_首页播放器\',\'播放器\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"$val[url]\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"$val[image]\" />\r\n							<h1>$val[title]</h1></a>\r\n                        </div>\r\nEOT;\r\n}print <<<EOT\r\n					<ul id=\"SwitchNav\"></ul>\r\n					<div class=\"pwSlide-bg\"></div>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','0','','');
INSERT INTO pw_invoke VALUES('88','home2_首页焦点附说明','17','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home2_首页焦点附说明\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[forumurl]\"><span>[$val[forumname]]</span></a><a href=\"$val[url]\">$val[title]</a><span>&nbsp;$val[descrip]</span></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('89','home2_热门话题','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home2_热门话题\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('90','home2_中部图片','7','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home2_中部图片\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /><p>$val[title]</p></a>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('91','home2_中部焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home2_中部焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('92','home2_中部大图','16','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home2_中部大图\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('93','home2_中部帖子列表','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home2_中部帖子列表\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('94','home2_首页中部热门','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home2_首页中部热门\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('95','home2_首页循环版块','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home2_首页循环版块\',\'帖子列表\',$loopid);\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','1','a:2:{i:0;s:2:\"18\";i:1;s:2:\"39\";}','');
INSERT INTO pw_invoke VALUES('96','home1_首页焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('98','home1_首页头部左侧焦点','18','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页头部左侧焦点\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\nEOT;\r\n}print <<<EOT\r\n<div class=\"c\"></div>\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页头部左侧焦点\',\'帖子模块\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('99','home1_首页播放器','11','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页播放器\',\'播放器\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"$val[url]\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"$val[image]\" />\r\n							<h1>$val[title]</h1></a>\r\n                        </div>\r\nEOT;\r\n}print <<<EOT\r\n					<ul id=\"SwitchNav\"></ul>\r\n					<div class=\"pwSlide-bg\"></div>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','0','','');
INSERT INTO pw_invoke VALUES('100','home1_首页头部右侧焦点','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页头部右侧焦点\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('101','home1_首页中部帖子列表','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页中部帖子列表\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('103','home1_首页中部右侧','1','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页中部右侧\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\nEOT;\r\n}$pwresult = pwTplGetData(\'home1_首页中部右侧\',\'帖子排行模块\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" title=\"$val[title]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('105','home1_首页中部标签','19','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页中部标签\',\'标签模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\">$val[title]</a>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('106','home1_首页中部图片','7','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页中部图片\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /><p>$val[title]</p></a>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('107','home1_首页版块排行','8','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页版块排行\',\'版块模块\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span class=\"fr\">$val[value]</span><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('108','home1_首页版块循环','20','\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页版块循环\',\'图片模块\',$loopid);\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\nEOT;\r\n}print <<<EOT\r\n<div class=\"c\"></div>\r\nEOT;\r\n$pwresult = pwTplGetData(\'home1_首页版块循环\',\'帖子模块\',$loopid);\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','1','a:4:{i:0;s:2:\"18\";i:1;s:2:\"39\";i:2;s:1:\"2\";i:3;s:1:\"3\";}','');
INSERT INTO pw_invoke VALUES('109','category_频道页头部左侧焦点','18','\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页头部左侧焦点\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\nEOT;\r\n}print <<<EOT\r\n<div class=\"c\"></div>\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页头部左侧焦点\',\'帖子模块\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('110','category_频道页热门标签','19','\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页热门标签\',\'标签模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\">$val[title]</a>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('111','category_频道页版块排行','8','\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页版块排行\',\'版块模块\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span class=\"fr\">$val[value]</span><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('112','category_频道页焦点摘要','2','\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页焦点摘要\',\'帖子及摘要\');\r\nprint <<<EOT\r\n\r\n	\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n	<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n	<p>$val[descrip]</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	\r\nEOT;\r\nforeach($val[tagrelate] as $key_1=>$val_1){print <<<EOT\r\n<li><a href=\"$val_1[url]\" target=\"_blank\">$val_1[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n\r\n	</ul>\r\n	\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('113','category_频道页焦点列表','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页焦点列表\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('114','category_频道页播放器','11','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页播放器\',\'播放器\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"$val[url]\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"$val[image]\" />\r\n							<h1>$val[title]</h1></a>\r\n                        </div>\r\nEOT;\r\n}print <<<EOT\r\n					<ul id=\"SwitchNav\"></ul>\r\n					<div class=\"pwSlide-bg\"></div>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','0','','');
INSERT INTO pw_invoke VALUES('115','category_频道页中部焦点','13','\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页中部焦点\',\'帖子列表\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><span><a href=\"$val[forumurl]\" target=\"_blank\">[$val[forumname]]</a></span><a href=\"$val[url]\"  target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('116','category_频道页中部右侧','1','\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页中部右侧\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\nEOT;\r\n}$pwresult = pwTplGetData(\'category_频道页中部右侧\',\'帖子排行模块\');\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" title=\"$val[title]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('117','category_版块中部图片','7','\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_版块中部图片\',\'图片模块\');\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /><p>$val[title]</p></a>\r\nEOT;\r\n}print <<<EOT\r\n','0','','');
INSERT INTO pw_invoke VALUES('118','category_频道页版块循环','20','\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页版块循环\',\'图片模块\',$loopid);\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<a href=\"$val[url]\" target=\"_blank\"><img src=\"$val[image]\" class=\"fl\" /></a>\r\n<h4><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></h4>\r\n<p>$val[descrip]</p>\r\nEOT;\r\n}print <<<EOT\r\n<div class=\"c\"></div>\r\nEOT;\r\n$pwresult = pwTplGetData(\'category_频道页版块循环\',\'帖子模块\',$loopid);\r\nprint <<<EOT\r\n<ul>\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\nEOT;\r\n}print <<<EOT\r\n</ul>','1','a:4:{i:0;s:2:\"18\";i:1;s:2:\"39\";i:2;s:2:\"78\";i:3;s:2:\"65\";}','');
INSERT INTO pw_invoke VALUES('119','时尚家居','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'时尚家居\',\'帖子列表\');\r\nprint <<<EOT\r\n\r\n<ul>\r\n\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\n\r\nEOT;\r\n}print <<<EOT\r\n\r\n</ul>','0','','');
INSERT INTO pw_invoke VALUES('120','家装设计','4','\r\nEOT;\r\n$pwresult = pwTplGetData(\'家装设计\',\'帖子列表\');\r\nprint <<<EOT\r\n\r\n<ul>\r\n\r\nEOT;\r\nforeach($pwresult as $key=>$val){print <<<EOT\r\n\r\n<li><a href=\"$val[url]\" target=\"_blank\">$val[title]</a></li>\r\n\r\nEOT;\r\n}print <<<EOT\r\n\r\n</ul>','0','','');

INSERT INTO pw_invokepiece VALUES('142','首页焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('2','首页焦点','帖子列表','subject','newsubject','15','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','1800');
INSERT INTO pw_invokepiece VALUES('33','首页社区热门','图片模块','image','newpic','3','','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"20\";}','1700');
INSERT INTO pw_invokepiece VALUES('12','首页循环版块','帖子排行模块','subject','newsubject','12','0','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"45\";}','1800');
INSERT INTO pw_invokepiece VALUES('11','首页循环版块','图片模块','image','newpic','4','0','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:1:\"8\";}','1700');
INSERT INTO pw_invokepiece VALUES('6','首页最新图片','图片模块','image','newpic','6','','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"15\";}','1700');
INSERT INTO pw_invokepiece VALUES('7','首页某版块调用1','帖子列表','subject','newsubject','8','3','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','1800');
INSERT INTO pw_invokepiece VALUES('8','首页某版块调用2','帖子列表','subject','newsubject','8','8','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','1800');
INSERT INTO pw_invokepiece VALUES('9','版块排行','版块模块','forum','forumsort','12','topic','a:3:{s:5:\"value\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:7:\"default\";}','86400');
INSERT INTO pw_invokepiece VALUES('13','首页播放器','播放器','image','newpic','6','','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"288,200\";s:5:\"title\";s:2:\"36\";}','1700');
INSERT INTO pw_invokepiece VALUES('14','首页播放器下方','图片模块','image','newpic','2','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";}','1700');
INSERT INTO pw_invokepiece VALUES('15','首页播放器下方','帖子排行模块','subject','newsubject','10','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"30\";}','1800');
INSERT INTO pw_invokepiece VALUES('18','用户排行','用户模块','user','usersort','12','money','a:3:{s:5:\"value\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:7:\"default\";}','3000');
INSERT INTO pw_invokepiece VALUES('94','频道页中部焦点摘要图片','图文模块','image','newpic','1','fid','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"70\";}','9800');
INSERT INTO pw_invokepiece VALUES('93','频道页页面中部焦点','帖子列表','subject','newsubject','10','fid','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9800');
INSERT INTO pw_invokepiece VALUES('92','频道页本版热门','帖子列表','subject','newsubject','8','fid','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9800');
INSERT INTO pw_invokepiece VALUES('143','频道页焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('91','频道页焦点列表','帖子列表','subject','newsubject','5','fid','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9600');
INSERT INTO pw_invokepiece VALUES('88','频道页播放器','播放器','image','newpic','6','fid','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"288,320\";s:5:\"title\";s:2:\"36\";}','9800');
INSERT INTO pw_invokepiece VALUES('144','fun_焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('35','fun_焦点列表','帖子列表','subject','replysort','5','fid','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"50\";}','9600');
INSERT INTO pw_invokepiece VALUES('36','fun_本版热门','帖子列表','subject','hitsort','8','fid','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"30\";}','9600');
INSERT INTO pw_invokepiece VALUES('37','fun_播放器','播放器','image','newpic','6','fid','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"288,320\";s:5:\"title\";s:2:\"36\";}','1700');
INSERT INTO pw_invokepiece VALUES('39','频道左侧站点推荐','图片模块','image','newpic','5','','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"20\";}','1700');
INSERT INTO pw_invokepiece VALUES('40','fun_页面中部焦点','帖子列表','subject','newsubject','10','fid','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9000');
INSERT INTO pw_invokepiece VALUES('43','fun_中部焦点摘要图片','图文模块','image','newpic','1','fid','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','9000');
INSERT INTO pw_invokepiece VALUES('54','auto_播放器','播放器','image','newpic','6','fid','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"288,320\";s:5:\"title\";s:2:\"36\";}','9000');
INSERT INTO pw_invokepiece VALUES('53','fun_频道页循环','帖子排行模块','subject','newsubject','10','0','a:5:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"30\";s:6:\"author\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('47','fun_中部焦点_有作者','帖子列表','subject','newsubject','5','fid','a:3:{s:6:\"author\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"50\";}','9000');
INSERT INTO pw_invokepiece VALUES('52','fun_频道页循环','图片模块','image','newpic','2','0','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','9000');
INSERT INTO pw_invokepiece VALUES('145','auto_焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('56','auto_焦点列表','帖子列表','subject','newsubject','5','fid','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9000');
INSERT INTO pw_invokepiece VALUES('57','auto_本版热门','帖子列表','subject','newsubject','8','','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"30\";}','8000');
INSERT INTO pw_invokepiece VALUES('58','atuo_中部图片','图片模块','image','newpic','9','fid','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";}','9000');
INSERT INTO pw_invokepiece VALUES('59','auto_中部焦点1','帖子列表','subject','newsubject','5','fid','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9000');
INSERT INTO pw_invokepiece VALUES('60','auto_中部焦点2','帖子列表','subject','newsubject','5','','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9000');
INSERT INTO pw_invokepiece VALUES('61','atuo_频道页循环','图片模块','image','newpic','2','0','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','9000');
INSERT INTO pw_invokepiece VALUES('62','atuo_频道页循环','帖子排行模块','subject','newsubject','10','0','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"30\";s:6:\"author\";s:7:\"default\";}','9000');
INSERT INTO pw_invokepiece VALUES('63','children_播放器','播放器','image','newpic','6','fid','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"288,320\";s:5:\"title\";s:2:\"36\";}','1700');
INSERT INTO pw_invokepiece VALUES('146','children_焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('65','children_焦点列表','帖子列表','subject','newsubject','3','fid','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9000');
INSERT INTO pw_invokepiece VALUES('66','children_本版热门','帖子列表','subject','newsubject','8','','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9000');
INSERT INTO pw_invokepiece VALUES('67','children_页面中部焦点','帖子列表','subject','newsubject','10','fid','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"50\";}','9000');
INSERT INTO pw_invokepiece VALUES('68','children_中部焦点摘要图片','图文模块','image','newpic','1','fid','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','9000');
INSERT INTO pw_invokepiece VALUES('69','children_中部焦点_有作者','帖子列表','subject','newsubject','5','fid','a:3:{s:6:\"author\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9000');
INSERT INTO pw_invokepiece VALUES('70','children_频道页循环','图片模块','image','newpic','2','0','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','9000');
INSERT INTO pw_invokepiece VALUES('71','children_频道页循环','帖子排行模块','subject','newsubject','10','0','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"30\";s:6:\"author\";s:7:\"default\";}','9000');
INSERT INTO pw_invokepiece VALUES('72','jia_播放器','播放器','image','newpic','6','fid','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"288,390\";s:5:\"title\";s:2:\"36\";}','9000');
INSERT INTO pw_invokepiece VALUES('147','jia_焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('74','jia_页面中部焦点','帖子列表','subject','newsubject','10','fid','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9000');
INSERT INTO pw_invokepiece VALUES('75','jia_中部焦点摘要图片','图文模块','image','newpic','1','fid','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','9000');
INSERT INTO pw_invokepiece VALUES('76','jia_中部焦点_有作者','帖子列表','subject','newsubject','5','fid','a:3:{s:6:\"author\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9000');
INSERT INTO pw_invokepiece VALUES('77','jia_频道页循环','图片模块','image','newpic','2','0','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','9000');
INSERT INTO pw_invokepiece VALUES('78','jia_频道页循环','帖子排行模块','subject','newsubject','10','0','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"30\";s:6:\"author\";s:7:\"default\";}','9000');
INSERT INTO pw_invokepiece VALUES('79','women_播放器','播放器','image','newpic','6','fid','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"288,256\";s:5:\"title\";s:2:\"36\";}','9000');
INSERT INTO pw_invokepiece VALUES('148','women_焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('81','women_焦点图片摘要','图文模块','image','newpic','2','fid','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','9500');
INSERT INTO pw_invokepiece VALUES('82','women_本版热门','帖子列表','subject','newsubject','8','fid','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','8000');
INSERT INTO pw_invokepiece VALUES('83','women_页面中部焦点','帖子列表','subject','newsubject','10','fid','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','8000');
INSERT INTO pw_invokepiece VALUES('84','women_中部焦点摘要图片','图文模块','image','newpic','1','fid','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','9600');
INSERT INTO pw_invokepiece VALUES('85','women_中部焦点_有作者','帖子列表','subject','newsubject','5','fid','a:3:{s:6:\"author\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9600');
INSERT INTO pw_invokepiece VALUES('86','women_频道页循环','图片模块','image','newpic','2','0','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','9000');
INSERT INTO pw_invokepiece VALUES('87','women_频道页循环','帖子排行模块','subject','newsubject','10','0','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"30\";s:6:\"author\";s:7:\"default\";}','9000');
INSERT INTO pw_invokepiece VALUES('95','频道页中部焦点_有作者','帖子列表','subject','newsubject','5','fid','a:3:{s:6:\"author\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9900');
INSERT INTO pw_invokepiece VALUES('99','频道页循环','帖子排行模块','subject','newsubject','10','0','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"30\";s:6:\"author\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('98','频道页循环','图片模块','image','newpic','2','0','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"32\";s:7:\"descrip\";s:2:\"50\";}','1700');
INSERT INTO pw_invokepiece VALUES('149','home2_首页焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('101','home2_首页播放器','播放器','image','newpic','6','','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"280,480\";s:5:\"title\";s:2:\"36\";}','9700');
INSERT INTO pw_invokepiece VALUES('104','home2_首页焦点附说明','帖子列表','subject','digestsubject','10','','a:5:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"24\";s:7:\"descrip\";s:2:\"22\";}','9800');
INSERT INTO pw_invokepiece VALUES('105','home2_热门话题','帖子列表','subject','replysort','10','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9000');
INSERT INTO pw_invokepiece VALUES('106','home2_中部图片','图片模块','image','newpic','8','','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"16\";}','8000');
INSERT INTO pw_invokepiece VALUES('150','home2_中部焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('108','home2_中部大图','图片模块','image','newpic','1','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"220,235\";}','99999');
INSERT INTO pw_invokepiece VALUES('109','home2_中部帖子列表','帖子列表','subject','newsubject','10','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9999');
INSERT INTO pw_invokepiece VALUES('110','home2_首页中部热门','帖子列表','subject','hitsort','10','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','9800');
INSERT INTO pw_invokepiece VALUES('111','home2_首页循环版块','帖子列表','subject','newsubject','8','0','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"46\";}','9999');
INSERT INTO pw_invokepiece VALUES('151','home1_首页焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('116','home1_首页头部左侧焦点','帖子模块','subject','replysort','7','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"26\";}','3600');
INSERT INTO pw_invokepiece VALUES('115','home1_首页头部左侧焦点','图片模块','image','newpic','1','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"160,120\";}','1700');
INSERT INTO pw_invokepiece VALUES('117','home1_首页播放器','播放器','image','newpic','6','','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"340,338\";s:5:\"title\";s:2:\"36\";}','9800');
INSERT INTO pw_invokepiece VALUES('118','home1_首页头部右侧焦点','帖子列表','subject','replysort','8','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','6000');
INSERT INTO pw_invokepiece VALUES('119','home1_首页中部帖子列表','帖子列表','subject','newsubject','22','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','1800');
INSERT INTO pw_invokepiece VALUES('123','home1_首页中部右侧','帖子排行模块','subject','digestsubject','10','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"40\";}','9400');
INSERT INTO pw_invokepiece VALUES('122','home1_首页中部右侧','图片模块','image','newpic','1','','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"160,120\";}','9800');
INSERT INTO pw_invokepiece VALUES('124','home1_首页中部标签','标签模块','tag','gettags','10','hot','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:7:\"default\";}','86400');
INSERT INTO pw_invokepiece VALUES('125','home1_首页中部图片','图片模块','image','newpic','6','','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:1:\"8\";}','1700');
INSERT INTO pw_invokepiece VALUES('126','home1_首页版块排行','版块模块','forum','forumsort','20','topic','a:3:{s:5:\"value\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:7:\"default\";}','86400');
INSERT INTO pw_invokepiece VALUES('127','home1_首页版块循环','图片模块','image','newpic','1','0','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";s:5:\"title\";s:2:\"40\";s:7:\"descrip\";s:2:\"60\";}','1700');
INSERT INTO pw_invokepiece VALUES('128','home1_首页版块循环','帖子模块','subject','newsubject','7','0','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"40\";}','1800');
INSERT INTO pw_invokepiece VALUES('129','category_频道页头部左侧焦点','图片模块','image','newpic','3','fid','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"100,100\";}','1700');
INSERT INTO pw_invokepiece VALUES('130','category_频道页头部左侧焦点','帖子模块','subject','newsubject','7','fid','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"36\";}','1800');
INSERT INTO pw_invokepiece VALUES('131','category_频道页热门标签','标签模块','tag','gettags','10','hot','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:7:\"default\";}','86400');
INSERT INTO pw_invokepiece VALUES('132','category_频道页版块排行','版块模块','forum','forumsort','20','topic','a:3:{s:5:\"value\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:7:\"default\";}','86400');
INSERT INTO pw_invokepiece VALUES('152','category_频道页焦点摘要','帖子及摘要','subject','newsubject','3','','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"25\";s:7:\"descrip\";s:2:\"40\";s:9:\"tagrelate\";s:7:\"default\";}','1800');
INSERT INTO pw_invokepiece VALUES('134','category_频道页焦点列表','帖子列表','subject','newsubject','10','fid','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','1800');
INSERT INTO pw_invokepiece VALUES('135','category_频道页播放器','播放器','image','newpic','6','fid','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"340,280\";s:5:\"title\";s:2:\"36\";}','1700');
INSERT INTO pw_invokepiece VALUES('136','category_频道页中部焦点','帖子列表','subject','newsubject','12','fid','a:4:{s:8:\"forumurl\";s:7:\"default\";s:9:\"forumname\";s:7:\"default\";s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','1800');
INSERT INTO pw_invokepiece VALUES('137','category_频道页中部右侧','图片模块','image','newpic','1','fid','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"160,120\";}','1700');
INSERT INTO pw_invokepiece VALUES('138','category_频道页中部右侧','帖子排行模块','subject','newsubject','10','fid','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"30\";}','1800');
INSERT INTO pw_invokepiece VALUES('139','category_版块中部图片','图片模块','image','newpic','6','fid','a:3:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:7:\"118,118\";s:5:\"title\";s:2:\"16\";}','1700');
INSERT INTO pw_invokepiece VALUES('140','category_频道页版块循环','图片模块','image','newpic','1','0','a:4:{s:3:\"url\";s:7:\"default\";s:5:\"image\";s:6:\"126,92\";s:5:\"title\";s:2:\"40\";s:7:\"descrip\";s:2:\"60\";}','1700');
INSERT INTO pw_invokepiece VALUES('141','category_频道页版块循环','帖子模块','subject','newsubject','7','0','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"40\";}','1800');
INSERT INTO pw_invokepiece VALUES('153','时尚家居','帖子列表','subject','newsubject','8','9','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','1800');
INSERT INTO pw_invokepiece VALUES('154','家装设计','帖子列表','subject','newsubject','8','10','a:2:{s:3:\"url\";s:7:\"default\";s:5:\"title\";s:2:\"32\";}','1800');

INSERT INTO pw_ipstates VALUES('2009-9-13','2009-9','2');
INSERT INTO pw_ipstates VALUES('2009-9-19','2009-9','2');
INSERT INTO pw_ipstates VALUES('2009-9-21','2009-9','2');

INSERT INTO pw_medalinfo VALUES('1','终身成就奖','谢谢您为社区发展做出的不可磨灭的贡献!!','1.gif');
INSERT INTO pw_medalinfo VALUES('2','优秀斑竹奖','辛劳地为论坛付出劳动，收获快乐，感谢您!','2.gif');
INSERT INTO pw_medalinfo VALUES('3','宣传大使奖','谢谢您为社区积极宣传,特颁发此奖!','3.gif');
INSERT INTO pw_medalinfo VALUES('4','特殊贡献奖','您为论坛做出了特殊贡献,谢谢您!','4.gif');
INSERT INTO pw_medalinfo VALUES('5','金点子奖','为社区提出建设性的建议被采纳,特颁发此奖!','5.gif');
INSERT INTO pw_medalinfo VALUES('6','原创先锋奖','谢谢您积极发表原创作品,特颁发此奖!','6.gif');
INSERT INTO pw_medalinfo VALUES('7','贴图大师奖','帖图高手,堪称大师!','7.gif');
INSERT INTO pw_medalinfo VALUES('8','灌水天才奖','能够长期提供优质的社区水资源者,可得这个奖章!','8.gif');
INSERT INTO pw_medalinfo VALUES('9','新人进步奖','新人有很大的进步可以得到这个奖章!','9.gif');
INSERT INTO pw_medalinfo VALUES('10','幽默大师奖','您总是能给别人带来欢乐,谢谢您!','10.gif');




INSERT INTO pw_memberdata VALUES('1','63','0','10','179','0','0','1253525327','1253525327','1253369445','109605','596','39','40','1248326802','19','127.0.0.1|1253366291|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('2','1','0','10','1','0','0','1247448099','1248413507','1247034579','8780','5180','1','1','0','0','123.152.17.81 *|1247729382|4','0','','0','0','');
INSERT INTO pw_memberdata VALUES('3','15','0','0','19','0','0','1253366107','1253360714','1250576894','30956','0','1','5','1249803639','1','127.0.0.1|1253366107|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('4','2','0','10','2','0','0','1248832802','1248832802','1248832836','4498','4498','1','3','0','0','192.168.1.104|1247379771|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('5','3','0','0','3','0','0','1248419396','1248419396','1248420256','3308','3308','1','8','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('6','2','0','0','2','0','0','1248420539','1248420539','1248420555','6620','6620','1','7','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('7','5','0','10','4','0','0','1248745490','1248745490','1248745503','4788','4788','1','6','1247550370','18','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('8','2','0','10','2','0','0','1248338504','1248338504','1247380366','2160','2160','2','4','0','0','123.152.17.81|1247734729|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('9','2','0','10','2','0','0','1248578288','1248578288','1247548672','4220','4220','1','3','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('10','1','0','0','0','0','0','1248339329','1248339329','1248339342','5554','5554','1','4','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('11','6','0','10','6','0','0','1250139551','1250139551','1250139573','2647','390','1','1','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('12','2','0','0','2','0','0','1247727028','1247727028','1247551072','675','675','1','2','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('13','3','0','10','3','0','0','1248916284','1248916284','1248916373','2822','2822','1','3','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('14','4','0','0','4','0','0','1250299876','1250299876','1250299891','4951','2509','1','1','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('15','3','0','10','3','0','0','1248665998','1248665998','1248579206','608','608','2','4','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('16','4','0','0','4','0','0','1248420710','1248420710','1248420831','706','706','1','4','0','0','123.152.141.252|1247887439|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('17','2','0','0','2','0','0','1248491019','1248491019','1248491257','594','594','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('18','0','0','0','0','0','0','1247551361','1247551361','1247551831','63','63','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('19','3','0','0','7','0','0','1248578309','1248578309','1248579161','97','97','1','3','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('20','1','0','0','1','0','0','1248588951','1248588951','1248588961','444','444','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('21','2','0','10','4','0','0','1248590591','1248590591','1248588576','139','139','1','2','0','0','123.152.150.101|1248590591|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('22','3','0','10','3','0','0','1248335200','1248335200','1248335325','1344','1344','1','3','0','0','192.168.1.101|1247035450|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('23','1','0','10','1','0','0','1247034938','1247029768','1247035037','0','0','1','1','0','0','192.168.1.101|1247034938|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('24','7','0','10','13','0','0','1248916187','1248916187','1248916264','1005','1005','2','7','1248915697','1','123.152.154.43|1248916187|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('25','2','0','0','6','0','0','1248742806','1248742806','1248743095','102','102','1','2','1248743095','1','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('26','1','0','10','1','0','0','1248666086','1248666086','1247625883','418','418','1','1','1247627213','32','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('27','1','0','0','1','0','0','1248493374','1248493374','1248493580','305','305','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('28','1','0','0','1','0','0','1248744332','1248744332','1248744601','1526','1526','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('29','3','0','0','3','0','0','1248744621','1248744621','1248744875','532','532','1','3','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('30','1','0','0','1','0','0','1248420928','1248420928','1248420947','218','218','1','1','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('31','2','0','0','4','0','0','1248828904','1248828904','1248829000','287','287','2','3','0','0','123.152.10.140|1248828904|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('32','2','0','10','2','0','0','1248338629','1248338629','1248338669','988','988','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('33','5','0','0','5','0','0','1248746132','1248746132','1248746140','579','579','1','5','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('34','2','0','10','2','0','0','1248828632','1248823482','1248828838','32','32','1','2','0','0','192.168.1.101|1247288995|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('35','2','0','0','2','0','0','1247886315','1247886315','1247886323','284','284','1','3','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('36','2','0','0','4','0','0','1248491295','1248491295','1248493049','304','304','2','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('37','1','0','0','1','0','0','1247621440','1247621440','1247621734','106','106','1','3','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('38','5','0','10','7','0','0','1249174375','1249174375','1249018640','2960','171','1','5','0','0','123.152.152.79|1249018607|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('39','1','0','0','1','0','0','1248490538','1248490538','1248490863','213','213','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('40','1','0','0','1','0','0','1247288322','1247283584','1247288892','0','0','1','1','0','0','192.168.1.101|1247288322|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('41','5','0','0','11','0','0','1248487904','1248487904','1248488062','1036','1036','1','5','0','0','123.152.10.94|1248487904|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('42','2','0','10','2','0','0','1248337834','1248337834','1248337871','228','228','1','3','1247381763','9','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('43','3','0','0','3','0','0','1248593789','1248593789','1248593982','3345','3345','1','3','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('44','3','0','10','3','0','0','1248920727','1248920727','1248920755','1951','1951','1','3','0','0','123.152.141.252|1247887187|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('45','1','0','0','1','0','0','1248493069','1248493069','1248493354','1774','1774','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('46','2','0','0','2','0','0','1248313573','1248313573','1248313807','135','135','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('47','1','0','0','1','0','0','1248336133','1248336133','1248336552','124','124','1','1','0','0','192.168.1.101|1247293124|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('48','1','0','10','1','0','0','1248665685','1248665685','1247637974','749','749','1','2','1247384598','1','123.152.159.249|1247980985|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('49','2','0','10','2','0','0','1248746106','1248746106','1248746116','616','616','1','2','0','0','192.168.1.101|1247034863|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('50','2','0','10','4','0','0','1248329662','1248329662','1248330866','669','669','1','2','0','0','192.168.1.101|1247035187|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('51','4','0','0','6','0','0','1248338761','1248338761','1248338971','793','793','1','4','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('52','3','0','0','3','0','0','1248336576','1248336576','1248336692','648','648','1','3','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('53','2','0','0','4','0','0','1248828274','1248822943','1248490302','2720','2720','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('54','1','0','0','3','0','0','1248828250','1248828250','1248340552','759','759','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('55','1','0','0','1','0','0','1248494580','1248494580','1248494590','1206','1206','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('56','4','0','0','6','0','0','1248828154','1248828154','1248828172','318','318','2','4','0','0','123.152.10.140|1248828154|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('57','1','0','0','1','0','0','1247291960','1247286627','1247291989','0','0','1','1','0','0','192.168.1.101|1247291960|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('58','2','0','0','2','0','0','1248420971','1248420971','1248421122','43','43','1','2','0','0','192.168.1.101|1247293052|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('59','1','0','0','3','0','0','1248575504','1248575504','1248575590','253','253','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('60','3','0','0','3','0','0','1248333171','1248333171','1248333544','453','453','1','3','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('61','3','0','10','3','0','0','1247988245','1247988245','1247988449','725','725','2','4','0','0','123.152.159.249|1247988245|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('62','0','0','0','0','0','0','1247454200','1247454200','1247387335','24','24','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('63','1','0','0','3','0','0','1248166027','1248166027','1248166073','1268','1268','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('64','2','0','0','2','0','0','1248579930','1248579930','1248580068','951','951','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('65','1','0','0','3','0','0','1248917563','1248917563','1248917640','1122','1122','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('66','2','0','0','2','0','0','1248746195','1248746195','1248746443','2588','2588','1','3','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('67','2','0','0','4','0','0','1248829042','1248829042','1248829440','151','151','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('68','2','0','0','2','0','0','1248238163','1248238163','1248238386','65','65','1','2','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('69','2','0','10','2','0','0','1247987951','1247982830','1247988160','117','117','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('70','2','0','0','2','0','0','1248333038','1248333038','1248333084','2777','2777','1','2','0','0','127.0.0.1|1246418182|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('71','2','0','0','2','0','0','1248337217','1248337217','1248337373','252','252','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('72','2','0','0','4','0','0','1248333915','1248333915','1248335044','4418','4418','1','2','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('73','0','0','0','0','0','0','1246417344','1246417344','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('74','2','0','0','2','0','0','1248917667','1248917667','1248917868','354','354','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('75','0','0','0','0','0','0','1248829496','1248824368','0','454','454','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('76','1','0','0','3','0','0','1248243565','1248243565','1248243638','329','329','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('77','2','0','0','2','0','0','1248919173','1248919173','1248919192','1583','1583','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('78','1','0','0','1','0','0','1248827978','1248827978','1247732502','249','249','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('79','1','0','0','1','0','0','1248828087','1248822741','1247380748','131','131','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('80','6','0','0','6','0','0','1248745766','1248740476','1248745781','1389','1389','2','6','0','0','123.152.149.242|1248745766|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('81','1','0','0','1','0','0','1247625401','1247625401','1247625686','79','79','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('82','4','0','0','4','0','0','1248244342','1248244342','1248247466','569','569','2','4','0','0','192.168.1.101|1247289065|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('83','1','0','0','3','0','0','1248745997','1248745997','1248746020','24','24','1','1','0','0','123.152.149.242|1248745997|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('84','1','0','0','1','0','0','1247808415','1247808415','1247808450','123','123','1','4','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('85','1','0','0','1','0','0','1248916441','1248916441','1248916528','157','157','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('86','1','0','0','1','0','0','1248916213','1248916213','1248916362','153','153','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('87','0','0','0','0','0','0','1246418143','1246418143','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('88','0','0','0','0','0','0','1246418160','1246418160','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('89','1','0','0','1','0','0','1248828363','1248828363','1248828373','48','48','1','1','0','0','123.152.10.140|1248828363|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('90','2','0','10','2','0','0','1248243249','1248243249','1248243262','99','99','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('91','1','0','0','3','0','0','1248159599','1248159599','1248159737','46','46','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('92','4','0','0','4','0','0','1248593002','1248593002','1248593238','218','218','1','4','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('93','1','0','0','1','0','0','1247810500','1247810500','1247810521','782','782','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('94','2','0','0','2','0','0','1248593284','1248593284','1248593506','360','360','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('95','1','0','0','1','0','0','1247625322','1247625322','1247625371','2052','2052','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('96','2','0','10','5','0','0','1248594007','1248594007','1248594340','1001','1001','1','3','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('97','0','0','0','0','0','0','1246418342','1246418342','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('98','1','0','0','1','0','0','1247552054','1247552054','1247552062','34','34','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('99','4','0','10','4','0','0','1249096090','1249096090','1249096233','1218','377','2','2','1247622327','1','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('100','6','0','0','12','0','0','1248828946','1248828946','1248831575','3603','3603','3','7','1248242493','1','123.152.10.140|1248828946|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('101','3','0','10','3','0','0','1249540068','1249540068','1249540116','3466','2503','1','1','0','0','127.0.0.1|1247292227|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('102','5','0','0','7','0','0','1248745887','1248745887','1248745905','473','473','3','5','0','0','123.152.149.242|1248745887|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('103','3','0','0','3','0','0','1249453989','1249453989','1249454048','236','19','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('104','0','0','0','0','0','0','1248746170','1248746170','0','64','64','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('105','0','0','0','0','0','0','1247623824','1247623824','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('106','1','0','0','1','0','0','1248746967','1248746967','1248747076','30','30','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('107','0','0','0','0','0','0','1247624105','1247624105','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('108','3','0','10','3','0','0','1248747094','1248744993','1248747230','908','908','1','3','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('109','1','0','0','1','0','0','1248238964','1248238964','1248239022','547','547','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('110','2','0','0','2','0','0','1248828623','1248828623','1248828696','453','453','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('111','3','0','0','5','0','0','1248331410','1248331410','1248332907','656','656','2','3','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('112','2','0','10','2','0','0','1248238125','1248238125','1248238151','625','625','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('151','3','0','0','3','0','0','1250566226','1250566226','1250566282','3737','1818','1','1','0','0','123.152.10.94|1248492819|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('113','1','0','0','1','0','0','1248915739','1248910779','1248916153','854','854','1','1','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('114','1','0','0','3','0','0','1248746772','1248746772','1248746820','602','602','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('115','4','0','10','4','0','0','1249549875','1249549875','1249550368','1891','115','3','3','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('116','2','0','0','2','0','0','1249096560','1249096560','1249096602','2780','470','1','1','0','0','127.0.0.1','0','','0','0','');
INSERT INTO pw_memberdata VALUES('117','2','0','0','6','0','0','1250301666','1250301666','1250301726','2530','1790','1','1','1250301726','1','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('118','0','0','0','0','0','0','1247637125','1247637125','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('119','1','0','0','3','0','0','1248338376','1248338376','1248338435','542','542','1','1','1248338435','2','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('120','2','0','0','2','0','0','1248916845','1248916845','1248916893','403','403','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('121','2','0','0','4','0','0','1248337685','1248337685','1248337760','182','182','2','2','0','0','123.152.165.2|1248337685|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('122','2','0','0','2','0','0','1248242508','1248242508','1248242984','195','195','2','2','1248242984','2','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('123','0','0','0','0','0','0','1247637415','1247881042','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('124','0','0','0','0','0','0','1247637483','1247637483','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('125','0','0','0','0','0','0','1247637520','1247637520','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('126','1','0','0','3','0','0','1249537565','1249537565','1249537662','46','46','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('127','0','0','0','0','0','0','1247637605','1247637605','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('128','0','0','0','0','0','0','1247637637','1247637637','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('129','0','0','0','0','0','0','1247637718','1247727010','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('130','1','0','0','3','0','0','1248237989','1248237989','1248238093','19','19','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('131','1','0','0','3','0','0','1248240135','1248240135','1248240164','1171','1171','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('132','1','0','0','1','0','0','1249967038','1249967038','1249967069','2357','2357','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('133','0','0','0','0','0','0','1247638036','1247638036','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('134','1','0','0','1','0','0','1249456973','1249456973','1249457043','995','995','1','1','0','0','123.152.141.252 *|1247885997|4','0','','0','0','');
INSERT INTO pw_memberdata VALUES('135','1','0','0','1','0','0','1248422977','1248422977','1248423393','147','147','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('136','0','0','0','0','0','0','1247638316','1247638316','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('137','0','0','0','0','0','0','1247638597','1247638597','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('138','0','0','0','0','0','0','1248665596','1248665596','0','237','237','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('139','0','0','0','0','0','0','1247638820','1247726105','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('140','4','0','0','6','0','0','1249095713','1249095713','1249096030','4593','19','2','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('141','2','0','0','4','0','0','1248591054','1248591054','1248591280','1488','1488','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('142','0','0','0','0','0','0','1247639058','1247639058','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('143','0','0','0','0','0','0','1247639135','1247639135','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('144','1','0','0','1','0','0','1248665659','1248665659','1248665676','11','11','1','1','0','0','123.152.141.252 *|1247886080|3','0','','0','0','');
INSERT INTO pw_memberdata VALUES('145','0','0','0','0','0','0','1247639243','1247806758','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('146','2','0','10','2','0','0','1247980793','1247975570','1247734405','315','315','2','2','0','0','123.152.159.249|1247980793|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('147','0','0','0','0','0','0','1247639451','1247639451','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('148','2','0','10','2','0','0','1248250765','1248250765','1248250786','1694','1694','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('149','1','0','0','1','0','0','1247731532','1247731532','1247731565','13','13','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('150','2','0','0','2','0','0','1249284256','1249284256','1249285054','516','282','2','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('152','3','0','0','5','0','0','1249549680','1249549680','1249549714','418','287','1','1','0','0','123.152.143.95|1248418930|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('153','0','0','0','0','0','0','1247639551','1247639551','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('154','1','0','0','1','0','0','1247731697','1247731697','1247731721','165','165','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('155','0','0','0','0','0','0','1247639583','1247639583','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('156','2','0','0','4','0','0','1248921266','1248921266','1248921470','560','560','1','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('157','1','0','0','1','0','0','1248423581','1248423581','1247731768','656','656','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('158','0','0','0','0','0','0','1247639629','1247639629','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('159','1','0','0','1','0','0','1250303348','1250303348','1250303378','1682','1682','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('160','1','0','0','3','0','0','1248916060','1248916060','1248916158','438','438','1','1','1248916158','1','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('161','0','0','0','0','0','0','1247639672','1247639672','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('162','1','0','0','3','0','0','1248161196','1248161196','1248161232','1597','1597','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('163','1','0','0','1','0','0','1249174204','1249174204','1249174261','34','34','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('164','0','0','0','0','0','0','1247639713','1247639713','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('165','2','0','0','2','0','0','1247810701','1247807057','1247812438','0','0','2','2','0','0','123.152.141.210|1247810701|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('166','0','0','0','0','0','0','1247886118','1247886118','0','9','9','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('167','0','0','0','0','0','0','1247639759','1247639759','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('168','0','0','0','0','0','0','1247639773','1247639773','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('169','2','0','10','2','0','0','1247731263','1247731263','1247731637','853','853','2','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('170','3','0','0','3','0','0','1249455978','1249455978','1249456005','1990','1419','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('171','1','0','0','1','0','0','1247812386','1247812386','1247812195','0','0','1','1','0','0','123.152.141.210|1247812386|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('172','0','0','0','0','0','0','1247639823','1247639823','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('173','3','0','10','3','0','0','1248746559','1248746559','1248746565','82','82','1','3','0','0','123.152.141.210|1247808315|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('174','0','0','0','0','0','0','1247639851','1247639851','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('175','1','0','10','1','0','0','1247813721','1247813721','1247814097','0','0','1','1','1247814159','5','123.152.141.210|1247813721|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('176','1','0','10','1','0','0','1247727047','1247722666','1247728057','0','0','1','1','1247728057','1','123.152.17.81|1247727047|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('177','0','0','0','0','0','0','1247639899','1247639899','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('178','0','0','0','0','0','0','1247728571','1247728571','0','0','0','0','0','0','0','123.152.17.81|1247728571|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('179','3','0','0','5','0','0','1248492540','1248487406','1248492717','447','447','2','3','0','0','123.152.10.94|1248492540|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('180','2','0','0','2','0','0','1248161705','1248161705','1248162110','88','88','2','2','0','0','123.152.152.138|1248161705|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('181','0','0','0','0','0','0','1247639959','1247639959','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('182','0','0','0','0','0','0','1247726634','1247726634','0','0','0','0','0','0','0','123.152.17.81|1247726634|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('183','1','0','0','1','0','0','1247809040','1247809040','1247809369','87','87','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('184','0','0','0','0','0','0','1247640001','1247640001','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('185','1','0','10','1','0','0','1247732428','1247732428','1247732457','9','9','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('186','0','0','0','0','0','0','1247640029','1247640029','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('187','0','0','0','0','0','0','1247640045','1247640045','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('188','0','0','0','0','0','0','1247640060','1247640060','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('189','0','0','0','0','0','0','1247640074','1247640074','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('190','4','0','10','4','0','0','1248832016','1248832016','1248832149','405','405','1','4','0','0','123.152.141.210|1247812471|6','0','','0','0','');
INSERT INTO pw_memberdata VALUES('191','0','0','0','0','0','0','1247640099','1247640099','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('192','3','0','10','3','0','0','1247814523','1247814523','1247815118','1186','1186','1','3','1247815118','2','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('193','0','0','0','0','0','0','1247643897','1247641499','0','21','21','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('194','0','0','0','0','0','0','1247640140','1247640140','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('195','0','0','0','0','0','0','1247640154','1247640154','0','0','0','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('196','1','0','0','1','0','0','1248746597','1248746597','1248746666','38','38','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('197','1','0','0','1','0','0','1248590526','1248590526','1248590581','379','379','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('198','1','0','0','1','0','0','1248339137','1248339137','1248339291','143','143','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('199','2','0','0','4','0','0','1250150747','1250150747','1250150768','1035','59','1','1','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('200','2','0','0','2','0','0','1248589171','1248589171','1248589866','220','220','2','2','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('201','0','0','0','0','0','0','1248162306','1248162306','0','600','600','0','0','0','0','','0','','0','0','');
INSERT INTO pw_memberdata VALUES('202','0','0','0','0','0','0','1247726734','1247726734','0','0','0','0','0','0','0','123.152.17.81','0','','0','0','');
INSERT INTO pw_memberdata VALUES('203','0','0','0','0','0','0','1247726764','1247726764','0','0','0','0','0','0','0','123.152.17.81','0','','0','0','');
INSERT INTO pw_memberdata VALUES('204','0','0','0','0','0','0','1247726803','1247726803','0','0','0','0','0','0','0','123.152.17.81','0','','0','0','');
INSERT INTO pw_memberdata VALUES('205','0','0','0','0','0','0','1247728150','1247724122','0','0','0','0','0','0','0','123.152.17.81','0','','0','0','');


INSERT INTO pw_members VALUES('1','admin','6426ae583603f77d53c3f20564d1510a','','admin@admin.com','3','8','','','0','1246180364','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','5','','','','1216','');
INSERT INTO pw_members VALUES('2','lb05041301','d2269ef436d271d381608d8db1fec8d6','','liubin2guxiang@163.com','-1','8','','','0','1238404257','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('3','maddog','895d3838c00208f4c4a5a79be27c8548','','maddog@163.com','-1','8','','','0','1240641410','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('4','羽飞','895d3838c00208f4c4a5a79be27c8548','','yufei@163.com','-1','8','','','0','1244614675','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','1024','');
INSERT INTO pw_members VALUES('5','羊羔组合','895d3838c00208f4c4a5a79be27c8548','','yanggaozhuhe@163.com','-1','8','','','0','1241762013','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','5','','','','1024','');
INSERT INTO pw_members VALUES('6','乖乖布丁','895d3838c00208f4c4a5a79be27c8548','','guaiguai@163.com','-1','8','','','0','1243457276','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','5','','','','1024','');
INSERT INTO pw_members VALUES('7','玉米兔子','895d3838c00208f4c4a5a79be27c8548','','kenyumi@163.com','-1','8','','','0','1242144167','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','2','','','','1024','');
INSERT INTO pw_members VALUES('8','碧落','895d3838c00208f4c4a5a79be27c8548','','biluo@163.com','-1','8','','','0','1245103342','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','2','','','','1024','');
INSERT INTO pw_members VALUES('9','福尔牌摩丝','895d3838c00208f4c4a5a79be27c8548','','fuermosi@163.com','-1','8','','','0','1244805269','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','1024','');
INSERT INTO pw_members VALUES('10','奸饼裹子','895d3838c00208f4c4a5a79be27c8548','','jianbing@163.com','-1','8','','','0','1244675622','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','4','','','','1024','');
INSERT INTO pw_members VALUES('11','大哈无','895d3838c00208f4c4a5a79be27c8548','','dahawu@163.com','-1','8','','','0','1240634507','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','2','','','','1024','');
INSERT INTO pw_members VALUES('12','teabag','895d3838c00208f4c4a5a79be27c8548','','teabag@163.com','-1','8','','','0','1244870358','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('13','wawanaonao','895d3838c00208f4c4a5a79be27c8548','','wawanao@163.com','-1','8','','','0','1240542778','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('14','甬城小魔兽','895d3838c00208f4c4a5a79be27c8548','','xiaoemo@163.com','-1','8','','','0','1238592969','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','1024','');
INSERT INTO pw_members VALUES('15','haolala','895d3838c00208f4c4a5a79be27c8548','','haolala@163.com','-1','8','','','0','1244955496','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','0','');
INSERT INTO pw_members VALUES('16','靛蓝贝壳','895d3838c00208f4c4a5a79be27c8548','','dianlanbeike@163.com','-1','8','','','0','1244728761','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('17','月舞','895d3838c00208f4c4a5a79be27c8548','','yuewu@163.com','-1','8','','','0','1243455760','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('18','sunisland','895d3838c00208f4c4a5a79be27c8548','','sunisland@163.com','-1','8','','','0','1245672222','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','0','');
INSERT INTO pw_members VALUES('19','zixuan','895d3838c00208f4c4a5a79be27c8548','','zixuan@163.com','-1','8','','','0','1240153743','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('20','bb0504','895d3838c00208f4c4a5a79be27c8548','','l0001@163.com','-1','8','','','0','1243389800','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('21','jiangww','895d3838c00208f4c4a5a79be27c8548','','l0002@163.com','-1','8','','','0','1239007917','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('22','Q361783290','895d3838c00208f4c4a5a79be27c8548','','l0003@163.com','-1','8','','','0','1238313196','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('23','小不点','895d3838c00208f4c4a5a79be27c8548','','l0004@163.com','-1','8','','','0','1243318638','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('24','一直等你','895d3838c00208f4c4a5a79be27c8548','','l0005@163.com','-1','8','','','0','1243793859','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('25','zhweixiang','895d3838c00208f4c4a5a79be27c8548','','l0006@163.com','-1','8','','','0','1238513632','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('26','anunu','895d3838c00208f4c4a5a79be27c8548','','anunu@163.com','-1','8','','','0','1239395150','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('27','sunshine','895d3838c00208f4c4a5a79be27c8548','','l0007@163.com','-1','8','','','0','1244279677','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('28','沉沦','895d3838c00208f4c4a5a79be27c8548','','l0008@163.com','-1','8','','','0','1242051613','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('29','蝈蝈','895d3838c00208f4c4a5a79be27c8548','','l0009@163.com','-1','8','','','0','1242106243','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('30','黑山小狐狸','895d3838c00208f4c4a5a79be27c8548','','xiaohuli@163.com','-1','8','','','0','1243359482','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('31','不同凡响','895d3838c00208f4c4a5a79be27c8548','','l0011@163.com','-1','8','','','0','1240622798','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','0','');
INSERT INTO pw_members VALUES('32','装饰魔鬼','895d3838c00208f4c4a5a79be27c8548','','l0012@163.com','-1','8','','','0','1240911496','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('33','xuxingxing','895d3838c00208f4c4a5a79be27c8548','','xuxingxing@163.com','-1','8','','','0','1243583375','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('34','小高','895d3838c00208f4c4a5a79be27c8548','','l0013@163.com','-1','8','','','0','1243083844','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('35','男人也怕痛','895d3838c00208f4c4a5a79be27c8548','','nanrenpatong@163.com','-1','8','','','0','1239345807','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','1024','');
INSERT INTO pw_members VALUES('36','小土豆','895d3838c00208f4c4a5a79be27c8548','','l0014@163.com','-1','8','','','0','1239165023','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('37','歪弟弟','895d3838c00208f4c4a5a79be27c8548','','waididi@163.com','-1','8','','','0','1240360755','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','2','','','','0','');
INSERT INTO pw_members VALUES('38','243771619','895d3838c00208f4c4a5a79be27c8548','','l0015@163.com','-1','8','','','0','1243309611','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('39','宝贝蛋儿','895d3838c00208f4c4a5a79be27c8548','','l0016@163.com','-1','8','','','0','1246088002','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('40','偶然','895d3838c00208f4c4a5a79be27c8548','','l0017@163.com','-1','8','','','0','1238985660','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('41','16路车站','895d3838c00208f4c4a5a79be27c8548','','16lu@163.com','-1','8','','','0','1241804868','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('42','安全卫士','895d3838c00208f4c4a5a79be27c8548','','l0018@163.com','-1','8','','','0','1240542144','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','0','');
INSERT INTO pw_members VALUES('43','秋的种子','895d3838c00208f4c4a5a79be27c8548','','l0019@163.com','-1','8','','','0','1245675654','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('44','相奸何太急','895d3838c00208f4c4a5a79be27c8548','','xiangjian@163.com','-1','8','','','0','1244167283','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('45','家装2009','895d3838c00208f4c4a5a79be27c8548','','l0019@163.com','-1','8','','','0','1240954750','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('46','china','895d3838c00208f4c4a5a79be27c8548','','l0020@163.com','-1','8','','','0','1244450785','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('47','sky2009','895d3838c00208f4c4a5a79be27c8548','','l0021@163.com','-1','8','','','0','1242715680','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('48','图朵多','895d3838c00208f4c4a5a79be27c8548','','tuduoduo@163.com','-1','8','','','0','1238230146','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','0','');
INSERT INTO pw_members VALUES('49','蓝烟','895d3838c00208f4c4a5a79be27c8548','','l0022@163.com','-1','8','','','0','1243942643','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('50','Xiaoqin676','895d3838c00208f4c4a5a79be27c8548','','l0023@163.com','-1','8','','','0','1244689059','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('51','老衲心不老','895d3838c00208f4c4a5a79be27c8548','','laonabulao@163.com','-1','8','','','0','1243439582','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('52','开水无色','895d3838c00208f4c4a5a79be27c8548','','l0024@163.com','-1','8','','','0','1244770196','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('53','天荒地老','895d3838c00208f4c4a5a79be27c8548','','l0025@163.com','-1','8','','','0','1244821891','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('54','壹壹零玖','895d3838c00208f4c4a5a79be27c8548','','1109@163.com','-1','8','','','0','1240577856','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('55','千与千寻','895d3838c00208f4c4a5a79be27c8548','','l0026@163.com','-1','8','','','0','1242383691','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('56','手机对讲机','895d3838c00208f4c4a5a79be27c8548','','duijiangji@163.com','-1','8','','','0','1245155160','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('57','yj520','895d3838c00208f4c4a5a79be27c8548','','l0027@163.com','-1','8','','','0','1241792643','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('58','幸福接力','895d3838c00208f4c4a5a79be27c8548','','l0028@163.com','-1','8','','','0','1240483003','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('59','susuchun','895d3838c00208f4c4a5a79be27c8548','','susuchun@163.com','-1','8','','','0','1241026408','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('60','烟民','895d3838c00208f4c4a5a79be27c8548','','l0029@163.com','-1','8','','','0','1245718522','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('61','datou206','895d3838c00208f4c4a5a79be27c8548','','datou206@163.com','-1','8','','','0','1245662121','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','0','');
INSERT INTO pw_members VALUES('62','艺术人生','895d3838c00208f4c4a5a79be27c8548','','l0030@163.com','-1','8','','','0','1243468842','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','0','');
INSERT INTO pw_members VALUES('63','missmao','895d3838c00208f4c4a5a79be27c8548','','missmao@163.com','-1','8','','','0','1240449654','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('64','piaopiao911','895d3838c00208f4c4a5a79be27c8548','','piaopiao911@163.com','-1','8','','','0','1243065132','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('65','babydodo','895d3838c00208f4c4a5a79be27c8548','','babydodo@163.com','-1','8','','','0','1240372322','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('66','瞬间的百合','895d3838c00208f4c4a5a79be27c8548','','soonbaihe@163.com','-1','8','','','0','1241615098','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','1024','');
INSERT INTO pw_members VALUES('67','橘子盒子','895d3838c00208f4c4a5a79be27c8548','','juzihezi@163.com','-1','8','','','0','1244049792','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('68','国足欢迎您','895d3838c00208f4c4a5a79be27c8548','','guozuhuanyingnin@163.com','-1','8','','','0','1242552714','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('69','天一老太','895d3838c00208f4c4a5a79be27c8548','','tianyilaotai@163.com','-1','8','','','0','1238744344','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('70','江南摸摸茶','895d3838c00208f4c4a5a79be27c8548','','jnmomocai@163.com','-1','8','','','0','1243957429','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('71','jjyy2008','895d3838c00208f4c4a5a79be27c8548','','jjyy2008@163.com','-1','8','','','0','1243358010','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('72','放荡的烟头','895d3838c00208f4c4a5a79be27c8548','','yantou@163.com','-1','8','','','0','1242368849','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('73','叫花小鸭','895d3838c00208f4c4a5a79be27c8548','','xiaoyaya@163.com','-1','8','','','0','1238319209','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('74','洋葱女','895d3838c00208f4c4a5a79be27c8548','','yangchongnv@163.com','-1','8','','','0','1242853299','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('75','猪猡公主','895d3838c00208f4c4a5a79be27c8548','','zhuluogongzhu@163.com','-1','8','','','0','1240355767','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('76','shaniu31','895d3838c00208f4c4a5a79be27c8548','','shaniu31@163.com','-1','8','','','0','1241093596','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('77','飞鸟','895d3838c00208f4c4a5a79be27c8548','','feiniao@163.com','-1','8','','','0','1241123720','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('78','东疯破','895d3838c00208f4c4a5a79be27c8548','','dongfengpo@163.com','-1','8','','','0','1244891083','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('79','天蝎刺客','895d3838c00208f4c4a5a79be27c8548','','tianxiecike@163.com','-1','8','','','0','1241143378','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('80','伪装者0574','895d3838c00208f4c4a5a79be27c8548','','weizhuang0574@163.com','-1','8','','','0','1238885998','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('81','情迷小玉','895d3838c00208f4c4a5a79be27c8548','','miqingxiaoyu@163.com','-1','8','','','0','1243399777','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('82','土人','895d3838c00208f4c4a5a79be27c8548','','l0031@163.com','-1','8','','','0','1238402595','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('83','别样风情','895d3838c00208f4c4a5a79be27c8548','','l0032@163.com','-1','8','','','0','1245475831','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('84','总是被妞泡','895d3838c00208f4c4a5a79be27c8548','','beiniupao@163.com','-1','8','','','0','1242041304','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','3','','','','1024','');
INSERT INTO pw_members VALUES('85','简约生活','895d3838c00208f4c4a5a79be27c8548','','l0033@163.com','-1','8','','','0','1240800088','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('86','匠人','895d3838c00208f4c4a5a79be27c8548','','l0034@163.com','-1','8','','','0','1241679157','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('87','super','895d3838c00208f4c4a5a79be27c8548','','l0035@163.com','-1','8','','','0','1241016099','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('88','XX2453','895d3838c00208f4c4a5a79be27c8548','','l0036@163.com','-1','8','','','0','1244412367','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('89','街角','895d3838c00208f4c4a5a79be27c8548','','l0037@163.com','-1','8','','','0','1243981796','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('90','逝如风','895d3838c00208f4c4a5a79be27c8548','','l0039@163.com','-1','8','','','0','1243862144','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('91','lingling','895d3838c00208f4c4a5a79be27c8548','','l0040@163.com','-1','8','','','0','1243950525','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('92','xiaohua','895d3838c00208f4c4a5a79be27c8548','','l0041@163.com','-1','8','','','0','1243463553','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('93','xq1986','895d3838c00208f4c4a5a79be27c8548','','l0042@163.com','-1','8','','','0','1241150622','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('94','superdesign','895d3838c00208f4c4a5a79be27c8548','','l0043@163.com','-1','8','','','0','1238219815','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('95','六郎','895d3838c00208f4c4a5a79be27c8548','','l0044@163.com','-1','8','','','0','1240348320','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('96','li_p5','895d3838c00208f4c4a5a79be27c8548','','l0045@163.com','-1','8','','','0','1243342580','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('97','JJ1314','895d3838c00208f4c4a5a79be27c8548','','l0056@163.com','-1','8','','','0','1241654549','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('98','高层建筑','895d3838c00208f4c4a5a79be27c8548','','l0047@163.com','-1','8','','','0','1238217747','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('99','浅滩','895d3838c00208f4c4a5a79be27c8548','','l0048@163.com','-1','8','','','0','1239714929','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','0','');
INSERT INTO pw_members VALUES('100','lizil1000','895d3838c00208f4c4a5a79be27c8548','','l0049@163.com','-1','8','','','0','1242218530','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','1','','','','0','');
INSERT INTO pw_members VALUES('101','设计灵魂','895d3838c00208f4c4a5a79be27c8548','','l0050@163.com','-1','8','','','0','1243994813','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('102','瑶琴彩月','895d3838c00208f4c4a5a79be27c8548','','yqxy@163.com','-1','8','','','0','1244892575','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('103','寒江雪','895d3838c00208f4c4a5a79be27c8548','','hjx@163.com','-1','8','','','0','1238407014','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('104','水云烟','895d3838c00208f4c4a5a79be27c8548','','syy@163.com','-1','8','','','0','1244133658','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('105','花无颜','895d3838c00208f4c4a5a79be27c8548','','hwy@163.com','-1','8','','','0','1241565510','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('106','日光光','895d3838c00208f4c4a5a79be27c8548','','rgg@163.com','-1','8','','','0','1240582417','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('107','半点糖','895d3838c00208f4c4a5a79be27c8548','','bdt@163.com','-1','8','','','0','1239046889','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('108','糖心疯宝','895d3838c00208f4c4a5a79be27c8548','','txfb@163.com','-1','8','','','0','1244508867','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('109','地瓜妹','895d3838c00208f4c4a5a79be27c8548','','dgm@163.com','-1','8','','','0','1239293136','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('110','amingming','895d3838c00208f4c4a5a79be27c8548','','amingming@163.com','-1','8','','','0','1242009903','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('111','xiamigo','895d3838c00208f4c4a5a79be27c8548','','xiamigo@163.com','-1','8','','','0','1245214501','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('112','弹指一生','895d3838c00208f4c4a5a79be27c8548','','tzys@163.com','-1','8','','','0','1244512549','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('113','採姑娘的小蘑菇','895d3838c00208f4c4a5a79be27c8548','','cgndxmg@163.com','-1','8','','','0','1242232135','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('114','乖乖老东东','895d3838c00208f4c4a5a79be27c8548','','ggldd@163.com','-1','8','','','0','1244509967','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('115','谈感情伤钱','895d3838c00208f4c4a5a79be27c8548','','tgqsq@163.com','-1','8','','','0','1240373489','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('116','万女不挡之猛','895d3838c00208f4c4a5a79be27c8548','','wnbdzm@163.com','-1','8','','','0','1244851860','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('117','咪咪蚊','895d3838c00208f4c4a5a79be27c8548','','mmw@163.com','-1','8','','','0','1240008760','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('118','天空之城','895d3838c00208f4c4a5a79be27c8548','','tkzc@163.com','-1','8','','','0','1243209224','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('119','马大牙子','895d3838c00208f4c4a5a79be27c8548','','mdyz@163.com','-1','8','','','0','1243083862','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('120','shijigege','895d3838c00208f4c4a5a79be27c8548','','shijigege@163.com','-1','8','','','0','1245810192','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('121','qingmi1999','895d3838c00208f4c4a5a79be27c8548','','qingmi1999@gmail.com','-1','8','','','0','1240891004','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('122','yaoyao2009','895d3838c00208f4c4a5a79be27c8548','','yaoyao@gmail.com','-1','8','','','0','1240854023','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('123','鹤返辽阳','895d3838c00208f4c4a5a79be27c8548','','hefanly@gmail.com','-1','8','','','0','1243093380','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('124','20090213','895d3838c00208f4c4a5a79be27c8548','','20090213@live.com','-1','8','','','0','1243861262','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('125','远去的子龙','895d3838c00208f4c4a5a79be27c8548','','zilong@live.com','-1','8','','','0','1240893474','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('126','周胖猴','895d3838c00208f4c4a5a79be27c8548','','zhoupanghou@gmail.com','-1','8','','','0','1245261337','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('127','lichenglong','895d3838c00208f4c4a5a79be27c8548','','lichenglong@gmail.com','-1','8','','','0','1241023477','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('128','老狼','895d3838c00208f4c4a5a79be27c8548','','laolang@live.com','-1','8','','','0','1244367660','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('129','茶泡饭','895d3838c00208f4c4a5a79be27c8548','','chapaofan@163.com','-1','8','','','0','1245298720','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('130','只喝绿茶','895d3838c00208f4c4a5a79be27c8548','','greentea@live.com','-1','8','','','0','1242558043','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('131','厨房魔法师','895d3838c00208f4c4a5a79be27c8548','','cfmfs@sohu.com','-1','8','','','0','1240405826','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('132','寿司终结者','895d3838c00208f4c4a5a79be27c8548','','sszjz@yahoo.com.cn','-1','8','','','0','1243113168','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('133','食尚达人','895d3838c00208f4c4a5a79be27c8548','','shishangdaren@163.com','-1','8','','','0','1241270254','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('134','伏地馍','895d3838c00208f4c4a5a79be27c8548','','fudimo@sina.com','-1','8','','','0','1240632476','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('135','糖山大熊','895d3838c00208f4c4a5a79be27c8548','','tsdaxiong@163.com','-1','8','','','0','1241066462','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('136','风铃子','895d3838c00208f4c4a5a79be27c8548','','fenglingzi@live.com','-1','8','','','0','1244655401','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('137','只为健康','895d3838c00208f4c4a5a79be27c8548','','zhiweijiankang@163.com','-1','8','','','0','1243034530','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('138','宁愿低血糖','895d3838c00208f4c4a5a79be27c8548','','nydxt@gmail.com','-1','8','','','0','1241932987','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('139','长治久安','895d3838c00208f4c4a5a79be27c8548','','changzhi@gmail.com','-1','8','','','0','1242983903','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('140','戒烟n次','895d3838c00208f4c4a5a79be27c8548','','jieyann@live.com','-1','8','','','0','1244147302','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('141','清茶消渴','895d3838c00208f4c4a5a79be27c8548','','qingchaxiaoke@163.com','-1','8','','','0','1245762527','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('142','糖三胀','895d3838c00208f4c4a5a79be27c8548','','tang3zhang@gmail.com','-1','8','','','0','1242018040','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('143','水煮人生','895d3838c00208f4c4a5a79be27c8548','','shuizhurensheng@163.com','-1','8','','','0','1242479487','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('144','明州居士','895d3838c00208f4c4a5a79be27c8548','','mingzhoujushi@sina.com','-1','8','','','0','1241814298','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('145','落寞烟花','895d3838c00208f4c4a5a79be27c8548','','lmyanhua@live.com','-1','8','','','0','1240347643','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('146','五月天','895d3838c00208f4c4a5a79be27c8548','','a@163.com','-1','8','','','0','1244672612','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('147','完美装修','895d3838c00208f4c4a5a79be27c8548','','a1@163.com','-1','8','','','0','1240485793','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('148','老屋','895d3838c00208f4c4a5a79be27c8548','','a2@163.com','-1','8','','','0','1242176039','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('149','小鸟窝','895d3838c00208f4c4a5a79be27c8548','','a3@163.com','-1','8','','','0','1241701472','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('150','乌巢装修记','895d3838c00208f4c4a5a79be27c8548','','a4@163.com','-1','8','','','0','1245389291','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('151','家和万事兴','895d3838c00208f4c4a5a79be27c8548','','a5@163.com','-1','8','','','0','1241805867','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('152','红双喜','895d3838c00208f4c4a5a79be27c8548','','a6@163.com','-1','8','','','0','1244412112','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('153','老虎窝','895d3838c00208f4c4a5a79be27c8548','','a7@163.com','-1','8','','','0','1240062950','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('154','装修专家','895d3838c00208f4c4a5a79be27c8548','','a8@163.com','-1','8','','','0','1238718883','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('155','专制疑难杂症','895d3838c00208f4c4a5a79be27c8548','','a9@163.com','-1','8','','','0','1242093010','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('156','风动','895d3838c00208f4c4a5a79be27c8548','','a10@163.com','-1','8','','','0','1242776061','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('157','我是木工','895d3838c00208f4c4a5a79be27c8548','','a11@163.com','-1','8','','','0','1245799856','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('158','wsy911','895d3838c00208f4c4a5a79be27c8548','','a12@163.com','-1','8','','','0','1244936123','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('159','尤物','895d3838c00208f4c4a5a79be27c8548','','a13@163.com','-1','8','','','0','1240963357','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('160','zw3301','895d3838c00208f4c4a5a79be27c8548','','a14@163.com','-1','8','','','0','1244918212','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('161','ihhahj','895d3838c00208f4c4a5a79be27c8548','','a15@163.com','-1','8','','','0','1241313802','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('162','23号','895d3838c00208f4c4a5a79be27c8548','','a16@163.com','-1','8','','','0','1243188819','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('163','Euting','895d3838c00208f4c4a5a79be27c8548','','a17@163.com','-1','8','','','0','1241851015','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('164','迷途','895d3838c00208f4c4a5a79be27c8548','','a18@163.com','-1','8','','','0','1244403692','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('165','疯情万肿','895d3838c00208f4c4a5a79be27c8548','','a19@163.com','-1','8','','','0','1245640932','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('166','love2009','895d3838c00208f4c4a5a79be27c8548','','a20@163.com','-1','8','','','0','1244737113','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('167','chen0515','895d3838c00208f4c4a5a79be27c8548','','a21@163.com','-1','8','','','0','1242878729','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('168','无名','895d3838c00208f4c4a5a79be27c8548','','a21@163.com','-1','8','','','0','1242495097','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('169','夕阳武士','895d3838c00208f4c4a5a79be27c8548','','a22@163.com','-1','8','','','0','1240489736','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('170','snowcat','895d3838c00208f4c4a5a79be27c8548','','a23@163.com','-1','8','','','0','1239682267','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('171','十全十美','895d3838c00208f4c4a5a79be27c8548','','a24@163.com','-1','8','','','0','1240462035','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('172','yaorao1314','895d3838c00208f4c4a5a79be27c8548','','a25@163.com','-1','8','','','0','1240071898','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('173','tt开心','895d3838c00208f4c4a5a79be27c8548','','a26@163.com','-1','8','','','0','1243519943','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('174','咣当','895d3838c00208f4c4a5a79be27c8548','','a26@163.com','-1','8','','','0','1244761159','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('175','优哉游哉','895d3838c00208f4c4a5a79be27c8548','','a27@163.com','-1','8','','','0','1243705833','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('176','我没有头发','895d3838c00208f4c4a5a79be27c8548','','a28@163.com','-1','8','','','0','1245687222','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('177','小僧','895d3838c00208f4c4a5a79be27c8548','','a29@163.com','-1','8','','','0','1243253407','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('178','千年杀','895d3838c00208f4c4a5a79be27c8548','','a30@163.com','-1','8','','','0','1246011262','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('179','88cq','895d3838c00208f4c4a5a79be27c8548','','a31@163.com','-1','8','','','0','1241682897','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('180','abclan','895d3838c00208f4c4a5a79be27c8548','','a32@163.com','-1','8','','','0','1238774514','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('181','小鸟装饰','895d3838c00208f4c4a5a79be27c8548','','a33@163.com','-1','8','','','0','1245220189','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('182','完美答案','895d3838c00208f4c4a5a79be27c8548','','a34@163.com','-1','8','','','0','1245308400','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('183','粥猩池','895d3838c00208f4c4a5a79be27c8548','','a34@163.com','-1','8','','','0','1245006263','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('184','mengman','895d3838c00208f4c4a5a79be27c8548','','a35@163.com','-1','8','','','0','1239102774','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('185','得瑟','895d3838c00208f4c4a5a79be27c8548','','a36@163.com','-1','8','','','0','1245846919','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('186','xiao7','895d3838c00208f4c4a5a79be27c8548','','a38@163.com','-1','8','','','0','1240918908','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('187','考拉','895d3838c00208f4c4a5a79be27c8548','','a39@163.com','-1','8','','','0','1243698471','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('188','冰河世纪','895d3838c00208f4c4a5a79be27c8548','','a40@163.com','-1','8','','','0','1245466411','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('189','kav2009','895d3838c00208f4c4a5a79be27c8548','','a41@163.com','-1','8','','','0','1239674667','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('190','Xuee','895d3838c00208f4c4a5a79be27c8548','','a42@163.com','-1','8','','','0','1238481464','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('191','漂流','895d3838c00208f4c4a5a79be27c8548','','a43@163.com','-1','8','','','0','1244204258','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('192','一线牵','895d3838c00208f4c4a5a79be27c8548','','a44@163.com','-1','8','','','0','1242808105','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('193','双喜临门','895d3838c00208f4c4a5a79be27c8548','','a45@163.com','-1','8','','','0','1243489919','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('194','zhansh','895d3838c00208f4c4a5a79be27c8548','','a46@163.com','-1','8','','','0','1239874908','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('195','fg520','895d3838c00208f4c4a5a79be27c8548','','a47@163.com','-1','8','','','0','1241031433','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('196','不怕不怕了','895d3838c00208f4c4a5a79be27c8548','','bpbpl@live.com','-1','8','','','0','1242950486','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('197','雪枫','895d3838c00208f4c4a5a79be27c8548','','xuefeng@gmail.com','-1','8','','','0','1238431657','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('198','黛琰','895d3838c00208f4c4a5a79be27c8548','','daiyan@live.com','-1','8','','','0','1245729798','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('199','甜性涩药','895d3838c00208f4c4a5a79be27c8548','','tianxingseyao@gmail.com','-1','8','','','0','1239265219','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('200','燕虎龟','895d3838c00208f4c4a5a79be27c8548','','yanhugui@live.com','-1','8','','','0','1240741030','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('201','freeman','895d3838c00208f4c4a5a79be27c8548','','freeman@163.com','-1','8','','','0','1239231701','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','0','');
INSERT INTO pw_members VALUES('202','aaaa','895d3838c00208f4c4a5a79be27c8548','','a1111@163.com','-1','8','','','0','1247726734','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('203','aaaa01','895d3838c00208f4c4a5a79be27c8548','','a1121@163.com','-1','8','','','0','1247726764','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('204','abcfjkyhdcud','895d3838c00208f4c4a5a79be27c8548','','a112121@163.com','-1','8','','','0','1247726803','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');
INSERT INTO pw_members VALUES('205','小样儿','895d3838c00208f4c4a5a79be27c8548','','aa@163.com','-1','8','','','0','1247728150','','','','','','','','','','','0000-00-00','','1','','','','0','0','','0','0','','','','1024','');


INSERT INTO pw_modehot VALUES('1','0','1','memberHot','用户排行','N;','N;','1','1','');
INSERT INTO pw_modehot VALUES('2','1','1','memberOnLine','在线排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','1','1','');
INSERT INTO pw_modehot VALUES('3','1','2','memberCredit','积分排行','a:3:{s:7:\"current\";s:5:\"money\";s:7:\"filters\";a:5:{i:0;s:5:\"money\";i:1;s:4:\"rvrc\";i:2;s:6:\"credit\";i:3;s:8:\"currency\";i:4;i:4;}s:11:\"filterItems\";a:5:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";i:4;s:1:\"5\";}}','N;','1','1','');
INSERT INTO pw_modehot VALUES('4','1','3','memberFriend','好友排行','N;','N;','0','1','');
INSERT INTO pw_modehot VALUES('5','1','4','memberThread','发帖排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','0','1','');
INSERT INTO pw_modehot VALUES('6','1','6','memberShare','分享推荐排行','a:3:{s:7:\"current\";s:14:\"memberShareAll\";s:7:\"filters\";a:10:{i:0;s:17:\"memberShareThread\";i:1;s:16:\"memberShareDiary\";i:2;s:16:\"memberShareAlbum\";i:3;s:15:\"memberShareUser\";i:4;s:16:\"memberShareGroup\";i:5;s:14:\"memberSharePic\";i:6;s:15:\"memberShareLink\";i:7;s:16:\"memberShareVideo\";i:8;s:16:\"memberShareMusic\";i:9;s:14:\"memberShareAll\";}s:11:\"filterItems\";a:10:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";i:4;s:1:\"5\";i:5;s:1:\"5\";i:6;s:1:\"5\";i:7;s:1:\"5\";i:8;s:1:\"5\";i:9;s:1:\"5\";}}','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','0','1','');
INSERT INTO pw_modehot VALUES('8','0','2','threadHot','帖子排行','N;','N;','1','1','');
INSERT INTO pw_modehot VALUES('9','8','1','threadPost','回复排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','1','1','');
INSERT INTO pw_modehot VALUES('10','8','2','threadRate','评价排行','a:3:{s:7:\"current\";s:12:\"rateThread_1\";s:7:\"filters\";a:7:{i:0;s:12:\"rateThread_1\";i:1;s:12:\"rateThread_2\";i:2;s:12:\"rateThread_3\";i:3;s:12:\"rateThread_4\";i:4;s:12:\"rateThread_5\";i:5;s:12:\"rateThread_6\";i:6;s:12:\"rateThread_7\";}s:11:\"filterItems\";a:7:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";i:4;s:1:\"5\";i:5;s:1:\"5\";i:6;s:1:\"5\";}}','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','0','1','');
INSERT INTO pw_modehot VALUES('11','8','3','threadFav','收藏排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','1','1','');
INSERT INTO pw_modehot VALUES('12','8','4','threadShare','分享排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','0','1','');
INSERT INTO pw_modehot VALUES('13','0','3','diaryHot','日志排行','N;','N;','1','1','');
INSERT INTO pw_modehot VALUES('14','13','1','diaryComment','评论排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','1','1','');
INSERT INTO pw_modehot VALUES('15','13','2','diaryRate','评价排行','a:3:{s:7:\"current\";s:11:\"rateDiary_8\";s:7:\"filters\";a:7:{i:0;s:11:\"rateDiary_8\";i:1;s:11:\"rateDiary_9\";i:2;s:12:\"rateDiary_10\";i:3;s:12:\"rateDiary_11\";i:4;s:12:\"rateDiary_12\";i:5;s:12:\"rateDiary_13\";i:6;s:12:\"rateDiary_14\";}s:11:\"filterItems\";a:7:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";i:4;s:1:\"5\";i:5;s:1:\"5\";i:6;s:1:\"5\";}}','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','0','1','');
INSERT INTO pw_modehot VALUES('16','13','3','diaryFav','收藏排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','0','1','');
INSERT INTO pw_modehot VALUES('17','13','4','diaryShare','分享排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','0','1','');
INSERT INTO pw_modehot VALUES('18','0','4','picHot','照片排行','N;','N;','1','1','');
INSERT INTO pw_modehot VALUES('19','18','1','picComment','评论排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','1','1','');
INSERT INTO pw_modehot VALUES('20','18','2','picRate','评价排行','a:3:{s:7:\"current\";s:14:\"ratePicture_15\";s:7:\"filters\";a:8:{i:0;s:14:\"ratePicture_15\";i:1;s:14:\"ratePicture_16\";i:2;s:14:\"ratePicture_17\";i:3;s:14:\"ratePicture_18\";i:4;s:14:\"ratePicture_19\";i:5;s:14:\"ratePicture_20\";i:6;s:14:\"ratePicture_21\";i:7;s:14:\"ratePicture_22\";}s:11:\"filterItems\";a:8:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";i:4;s:1:\"5\";i:5;s:1:\"5\";i:6;s:1:\"5\";i:7;s:1:\"5\";}}','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','0','1','');
INSERT INTO pw_modehot VALUES('21','18','3','picFav','收藏排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','0','1','');
INSERT INTO pw_modehot VALUES('22','18','4','picShare','分享排行','N;','a:3:{s:7:\"current\";s:7:\"history\";s:7:\"filters\";a:4:{i:0;s:5:\"today\";i:1;s:4:\"week\";i:2;s:5:\"month\";i:3;s:7:\"history\";}s:11:\"filterItems\";a:4:{i:0;s:1:\"5\";i:1;s:1:\"5\";i:2;s:1:\"5\";i:3;s:1:\"5\";}}','0','1','');
INSERT INTO pw_modehot VALUES('23','0','5','forumHot','论坛版块排行','N;','N;','1','1','');
INSERT INTO pw_modehot VALUES('24','23','1','forumPost','今日发帖排行','N;','N;','1','1','');
INSERT INTO pw_modehot VALUES('25','23','2','forumTopic','主题排行','N;','N;','0','1','');
INSERT INTO pw_modehot VALUES('26','23','3','forumArticle','文章排行','N;','N;','0','1','');

INSERT INTO pw_mpageconfig VALUES('18','area','index','0','a:13:{i:0;s:15:\"首页播放器\";i:1;s:21:\"首页播放器下方\";i:2;s:18:\"首页焦点摘要\";i:3;s:12:\"首页焦点\";i:4;s:18:\"首页循环版块\";i:5;s:18:\"首页最新图片\";i:6;s:22:\"首页某版块调用1\";i:7;s:22:\"首页某版块调用2\";i:8;s:12:\"时尚家居\";i:9;s:12:\"家装设计\";i:10;s:18:\"首页社区热门\";i:11;s:12:\"版块排行\";i:12;s:12:\"用户排行\";}','a:15:{i:13;i:0;i:14;i:0;i:15;i:0;i:142;i:0;i:2;i:0;i:12;i:0;i:11;i:0;i:6;i:0;i:7;i:0;i:8;i:0;i:153;i:0;i:154;i:0;i:33;i:0;i:9;i:0;i:18;i:0;}');
INSERT INTO pw_mpageconfig VALUES('8','area','cate','0','a:9:{i:0;s:24:\"频道左侧站点推荐\";i:1;s:18:\"频道页播放器\";i:2;s:21:\"频道页焦点摘要\";i:3;s:21:\"频道页焦点列表\";i:4;s:21:\"频道页本版热门\";i:5;s:27:\"频道页页面中部焦点\";i:6;s:33:\"频道页中部焦点摘要图片\";i:7;s:31:\"频道页中部焦点_有作者\";i:8;s:15:\"频道页循环\";}','a:10:{i:39;i:0;i:88;i:1;i:143;i:0;i:91;i:1;i:92;i:1;i:93;i:1;i:94;i:1;i:95;i:1;i:99;i:0;i:98;i:0;}');




INSERT INTO pw_nav VALUES('4','sort','bbs_navinfo','统计排行','','sort.php','','','0','0','0','1');
INSERT INTO pw_nav VALUES('5','app','bbs_navinfo','社区应用','','','','','0','1','0','1');
INSERT INTO pw_nav VALUES('6','hack','bbs_navinfo','社区服务','','','','','0','2','0','1');
INSERT INTO pw_nav VALUES('7','member','bbs_navinfo','会员列表','','member.php','','','0','3','0','1');
INSERT INTO pw_nav VALUES('8','lastpost','bbs_navinfo','最新帖子','','search.php?sch_time=all&orderway=lastpost&asc=desc&newatc=1','','','0','4','0','1');
INSERT INTO pw_nav VALUES('9','digest','bbs_navinfo','精华区','','search.php?digest=1','','','0','5','0','1');
INSERT INTO pw_nav VALUES('10','search','bbs_navinfo','搜索','','search.php','','','0','6','0','1');
INSERT INTO pw_nav VALUES('11','faq','bbs_navinfo','帮助','','faq.php','','','0','7','0','1');
INSERT INTO pw_nav VALUES('12','sort_basic','bbs_navinfo','基本信息','','sort.php','','','0','8','4','1');
INSERT INTO pw_nav VALUES('13','sort_ipstate','bbs_navinfo','到访IP统计','','sort.php?action=ipstate','','','0','9','4','1');
INSERT INTO pw_nav VALUES('14','sort_team','bbs_navinfo','管理团队','','sort.php?action=team','','','0','10','4','1');
INSERT INTO pw_nav VALUES('15','sort_admin','bbs_navinfo','管理操作','','sort.php?action=admin','','','0','11','4','1');
INSERT INTO pw_nav VALUES('16','sort_online','bbs_navinfo','在线会员','','sort.php?action=online','','','0','12','4','1');
INSERT INTO pw_nav VALUES('17','sort_member','bbs_navinfo','会员排行','','sort.php?action=member','','','0','13','4','1');
INSERT INTO pw_nav VALUES('18','sort_forum','bbs_navinfo','版块排行','','sort.php?action=forum','','','0','14','4','1');
INSERT INTO pw_nav VALUES('19','sort_article','bbs_navinfo','帖子排行','','sort.php?action=article','','','0','15','4','1');
INSERT INTO pw_nav VALUES('20','sort_taglist','bbs_navinfo','标签排行','','job.php?action=taglist','','','0','16','4','1');
INSERT INTO pw_nav VALUES('21','index','o_navinfo','圈子首页','','index.php?m=o','','o','0','0','0','1');
INSERT INTO pw_nav VALUES('22','home','o_navinfo','我的首页','','mode.php?m=o','','o','0','1','0','1');
INSERT INTO pw_nav VALUES('23','user','o_navinfo','个人空间','','mode.php?m=o&q=user','','o','0','2','0','1');
INSERT INTO pw_nav VALUES('24','friend','o_navinfo','朋友','','mode.php?m=o&q=friend','','o','0','3','0','1');
INSERT INTO pw_nav VALUES('25','browse','o_navinfo','随便看看','','mode.php?m=o&q=browse','','o','0','4','0','1');
INSERT INTO pw_nav VALUES('26','bbs','main','论坛','','index.php?m=bbs','','bbs,area','0','2','0','1');
INSERT INTO pw_nav VALUES('27','area','main','门户','','./','','bbs,area','0','1','0','1');
INSERT INTO pw_nav VALUES('28','o','main','圈子','','index.php?m=o','','bbs,area','1','3','0','0');
INSERT INTO pw_nav VALUES('29','advert','bbs_navinfo','广告管理','','hack.php?H_name=advert','','bbs','0','0','6','0');
INSERT INTO pw_nav VALUES('30','bank','bbs_navinfo','银行','','hack.php?H_name=bank','','bbs','0','1','0','1');
INSERT INTO pw_nav VALUES('31','blog','bbs_navinfo','博客接口','','hack.php?H_name=blog','','bbs','0','2','6','0');
INSERT INTO pw_nav VALUES('32','invite','bbs_navinfo','邀请注册','','hack.php?H_name=invite','','bbs','0','3','6','0');
INSERT INTO pw_nav VALUES('33','medal','bbs_navinfo','勋章中心','','hack.php?H_name=medal','','bbs','0','4','6','0');
INSERT INTO pw_nav VALUES('34','toolcenter','bbs_navinfo','道具中心','','hack.php?H_name=toolcenter','','bbs','0','5','6','1');
INSERT INTO pw_nav VALUES('35','1','area_navinfo','装修','','cate.php?cateid=1','','area','0','0','0','1');
INSERT INTO pw_nav VALUES('37','4','area_navinfo','装修','','cate.php?cateid=4','','area','0','0','0','1');
INSERT INTO pw_nav VALUES('38','5','area_navinfo','家居','','cate.php?cateid=5','','area','0','0','0','1');
INSERT INTO pw_nav VALUES('39','6','area_navinfo','设计','','cate.php?cateid=6','','area','0','0','0','1');
INSERT INTO pw_nav VALUES('40','11','area_navinfo','管理','','cate.php?cateid=11','','area','0','0','0','1');



INSERT INTO pw_ouserdata VALUES('1','0','0','0','0','0','0','0','0','1','1','1','1','1','0','0','','','0','0','0','0','0','0','0','0','0','0');


INSERT INTO pw_pcfield VALUES('1','类别','pctype','1','1','radio','a:8:{i:0;s:11:\"1=婚庆类\";i:1;s:11:\"2=房产类\";i:2;s:11:\"3=汽车类\";i:3;s:11:\"4=家电类\";i:4;s:11:\"5=家装类\";i:5;s:14:\"6=生产原料\";i:6;s:11:\"7=食品类\";i:7;s:8:\"8=其他\";}','1','1','1','1','0','1','0','');
INSERT INTO pw_pcfield VALUES('2','发起时间','begintime','1','2','calendar','','1','1','1','0','1','1','0','');
INSERT INTO pw_pcfield VALUES('3','截止时间','endtime','1','3','calendar','','1','1','1','1','1','1','0','');
INSERT INTO pw_pcfield VALUES('4','人数限制','limitnum','1','4','number','a:2:{s:6:\"minnum\";s:1:\"1\";s:6:\"maxnum\";s:3:\"100\";}','1','0','0','1','0','1','0','人（不限制，请留空）');
INSERT INTO pw_pcfield VALUES('5','报名限制','objecter','1','5','radio','a:2:{i:0;s:14:\"1=所有用户\";i:1;s:11:\"2=仅好友\";}','1','0','1','0','0','1','0','');
INSERT INTO pw_pcfield VALUES('6','价格','price','1','6','text','','1','0','0','0','0','1','0','');
INSERT INTO pw_pcfield VALUES('7','押金','deposit','1','7','text','','1','0','0','0','0','1','0','（留空则无需支付押金）');
INSERT INTO pw_pcfield VALUES('8','支付方式','payway','1','8','radio','a:2:{i:0;s:17:\"1=支付宝支付\";i:1;s:14:\"2=现金支付\";}','1','0','1','0','0','1','0','');
INSERT INTO pw_pcfield VALUES('9','联系人','contacter','1','9','text','','1','1','0','0','1','1','0','');
INSERT INTO pw_pcfield VALUES('10','电话','tel','1','10','text','','1','0','0','0','0','1','4','');
INSERT INTO pw_pcfield VALUES('11','-','phone','1','10','text','','1','0','0','0','0','1','14','例如：0571-12345678');
INSERT INTO pw_pcfield VALUES('12','手机','mobile','1','11','text','','1','0','0','0','1','1','0','');
INSERT INTO pw_pcfield VALUES('13','图片上传','pcattach','1','13','upload','','1','0','0','0','0','1','0','');
INSERT INTO pw_pcfield VALUES('14','类别','pctype','2','1','radio','a:6:{i:0;s:8:\"1=出游\";i:1;s:9:\"2=聚餐 \";i:2;s:8:\"3=舞会\";i:3;s:8:\"4=户外\";i:4;s:8:\"5=烧烤\";i:5;s:8:\"6=其他\";}','1','1','1','1','0','1','0','');
INSERT INTO pw_pcfield VALUES('15','发起时间','begintime','2','2','calendar','','1','1','1','0','1','1','0','');
INSERT INTO pw_pcfield VALUES('16','过期时间','endtime','2','3','calendar','','1','1','1','1','1','1','0','');
INSERT INTO pw_pcfield VALUES('17','活动地点','address','2','4','text','','1','0','1','1','0','1','0','');
INSERT INTO pw_pcfield VALUES('18','人数限制','limitnum','2','5','number','a:2:{s:6:\"minnum\";s:1:\"1\";s:6:\"maxnum\";s:3:\"100\";}','1','0','0','0','0','1','0','人（不限制，请留空）');
INSERT INTO pw_pcfield VALUES('19','报名限制','objecter','2','6','radio','a:2:{i:0;s:14:\"1=所有用户\";i:1;s:11:\"2=仅好友\";}','1','0','1','0','0','1','0','');
INSERT INTO pw_pcfield VALUES('20','性别限制','gender','2','7','radio','a:3:{i:0;s:8:\"1=全部\";i:1;s:11:\"2=仅男生\";i:2;s:11:\"3=仅女生\";}','1','0','1','0','0','1','0','');
INSERT INTO pw_pcfield VALUES('21','活动经费','price','2','8','text','','1','0','0','0','0','1','0','元/人');
INSERT INTO pw_pcfield VALUES('22','支付方式','payway','2','9','radio','a:2:{i:0;s:17:\"1=支付宝支付\";i:1;s:14:\"2=现金支付\";}','1','0','1','0','0','1','0','');
INSERT INTO pw_pcfield VALUES('23','联系人','contacter','2','10','text','','1','0','0','0','1','1','0','');
INSERT INTO pw_pcfield VALUES('24','电话','tel','2','11','text','','1','0','0','0','0','1','4','');
INSERT INTO pw_pcfield VALUES('25','-','phone','2','11','text','','1','0','0','0','0','1','14','例如：0571-123456778');
INSERT INTO pw_pcfield VALUES('26','手机','mobile','2','12','text','','1','0','0','0','1','1','0','');
INSERT INTO pw_pcfield VALUES('27','图片上传','pcattach','2','13','upload','','1','0','0','0','0','1','0','');




INSERT INTO pw_permission VALUES('0','0','1','maxmsg','basic','30');
INSERT INTO pw_permission VALUES('0','0','1','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','1','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','1','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','1','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','1','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','1','postpertime','basic','3');
INSERT INTO pw_permission VALUES('0','0','1','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','1','signnum','basic','100');
INSERT INTO pw_permission VALUES('0','0','1','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','1','imgwidth','basic','');
INSERT INTO pw_permission VALUES('0','0','1','imgheight','basic','');
INSERT INTO pw_permission VALUES('0','0','1','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','1','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','1','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','1','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','markable','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','postlimit','basic','');
INSERT INTO pw_permission VALUES('0','0','1','uploadtype','basic','');
INSERT INTO pw_permission VALUES('0','0','1','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','1','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','1','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','1','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','1','fontsize','basic','');
INSERT INTO pw_permission VALUES('0','0','1','maxsendmsg','basic','');
INSERT INTO pw_permission VALUES('0','0','1','pergroup','basic','member');
INSERT INTO pw_permission VALUES('0','0','1','maxgraft','basic','5');
INSERT INTO pw_permission VALUES('0','0','1','pwdlimitime','basic','');
INSERT INTO pw_permission VALUES('0','0','1','maxcstyles','basic','');
INSERT INTO pw_permission VALUES('0','0','1','media','basic','');
INSERT INTO pw_permission VALUES('0','0','1','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:1:\"5\";s:9:\"marklimit\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','2','maxmsg','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','2','allowportait','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','upload','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowrp','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowhonor','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowdelatc','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowpost','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allownewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowactive','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowhidden','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowencode','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowsell','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowsearch','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowmember','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','2','allowreport','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowmessege','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowsort','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','alloworder','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowupload','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowdownload','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allownum','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','edittime','basic','1');
INSERT INTO pw_permission VALUES('0','0','2','postpertime','basic','10');
INSERT INTO pw_permission VALUES('0','0','2','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','2','signnum','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','show','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','imgwidth','basic','');
INSERT INTO pw_permission VALUES('0','0','2','imgheight','basic','');
INSERT INTO pw_permission VALUES('0','0','2','fontsize','basic','');
INSERT INTO pw_permission VALUES('0','0','2','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','2','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','atccheck','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','markable','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','postlimit','basic','');
INSERT INTO pw_permission VALUES('0','0','2','uploadtype','basic','');
INSERT INTO pw_permission VALUES('0','0','2','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','2','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','2','atclog','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','2','modifyvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowreward','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowgoods','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','allowdebate','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','dig','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','leaveword','basic','0');
INSERT INTO pw_permission VALUES('0','0','2','markset','basic','a:5:{s:5:\"money\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','3','maxmsg','basic','50');
INSERT INTO pw_permission VALUES('0','0','3','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','3','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','htmlcode','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','3','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allownum','basic','200');
INSERT INTO pw_permission VALUES('0','0','3','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','3','postpertime','basic','3');
INSERT INTO pw_permission VALUES('0','0','3','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','3','signnum','basic','200');
INSERT INTO pw_permission VALUES('0','0','3','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','viewipfrom','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','imgwidth','basic','');
INSERT INTO pw_permission VALUES('0','0','3','imgheight','basic','');
INSERT INTO pw_permission VALUES('0','0','3','fontsize','basic','');
INSERT INTO pw_permission VALUES('0','0','3','msggroup','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','3','viewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','markable','basic','2');
INSERT INTO pw_permission VALUES('0','0','3','postlimit','basic','');
INSERT INTO pw_permission VALUES('0','0','3','uploadtype','basic','');
INSERT INTO pw_permission VALUES('0','0','3','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','3','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','3','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowadmincp','system','1');
INSERT INTO pw_permission VALUES('0','0','3','delatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','moveatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','copyatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','digestadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','lockadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','pushadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','coloradmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','downadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','viewcheck','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','viewclose','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','delattach','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','viewip','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','banuser','systemforum','2');
INSERT INTO pw_permission VALUES('0','0','3','bantype','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','banmax','systemforum','30');
INSERT INTO pw_permission VALUES('0','0','3','posthide','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','sellhide','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','encodehide','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','anonyhide','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','postpers','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','replylock','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','modother','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','deltpcs','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','topped','systemforum','3');
INSERT INTO pw_permission VALUES('0','0','3','tpctype','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','tpccheck','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','allowtime','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','superright','system','1');
INSERT INTO pw_permission VALUES('0','0','3','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:3:\"100\";s:9:\"marklimit\";a:2:{i:0;s:2:\"-2\";i:1;s:1:\"5\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','3','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','3','maxsendmsg','basic','');
INSERT INTO pw_permission VALUES('0','0','3','pergroup','basic','member,system,special');
INSERT INTO pw_permission VALUES('0','0','3','maxgraft','basic','10');
INSERT INTO pw_permission VALUES('0','0','3','pwdlimitime','basic','');
INSERT INTO pw_permission VALUES('0','0','3','maxcstyles','basic','');
INSERT INTO pw_permission VALUES('0','0','3','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','media','basic','');
INSERT INTO pw_permission VALUES('0','0','3','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','3','shield','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','unite','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','remind','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','pingcp','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','3','inspect','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','maxmsg','basic','50');
INSERT INTO pw_permission VALUES('0','0','4','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','4','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','4','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','4','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allownum','basic','80');
INSERT INTO pw_permission VALUES('0','0','4','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','4','postpertime','basic','3');
INSERT INTO pw_permission VALUES('0','0','4','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','4','signnum','basic','200');
INSERT INTO pw_permission VALUES('0','0','4','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','viewipfrom','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','imgwidth','basic','');
INSERT INTO pw_permission VALUES('0','0','4','imgheight','basic','');
INSERT INTO pw_permission VALUES('0','0','4','fontsize','basic','');
INSERT INTO pw_permission VALUES('0','0','4','msggroup','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','4','viewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','markable','basic','2');
INSERT INTO pw_permission VALUES('0','0','4','postlimit','basic','');
INSERT INTO pw_permission VALUES('0','0','4','uploadtype','basic','');
INSERT INTO pw_permission VALUES('0','0','4','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','4','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','4','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowadmincp','system','1');
INSERT INTO pw_permission VALUES('0','0','4','delatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','moveatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','copyatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','digestadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','lockadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','pushadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','coloradmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','downadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','viewcheck','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','viewclose','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','delattach','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','viewip','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','banuser','systemforum','2');
INSERT INTO pw_permission VALUES('0','0','4','bantype','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','banmax','systemforum','20');
INSERT INTO pw_permission VALUES('0','0','4','posthide','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','sellhide','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','encodehide','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','anonyhide','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','postpers','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','replylock','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','modother','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','deltpcs','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','topped','systemforum','3');
INSERT INTO pw_permission VALUES('0','0','4','tpctype','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','tpccheck','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','allowtime','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','superright','system','1');
INSERT INTO pw_permission VALUES('0','0','4','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:2:\"80\";s:9:\"marklimit\";a:2:{i:0;s:2:\"-1\";i:1;s:1:\"3\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','4','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','4','maxsendmsg','basic','');
INSERT INTO pw_permission VALUES('0','0','4','pergroup','basic','member,system');
INSERT INTO pw_permission VALUES('0','0','4','maxgraft','basic','10');
INSERT INTO pw_permission VALUES('0','0','4','pwdlimitime','basic','');
INSERT INTO pw_permission VALUES('0','0','4','maxcstyles','basic','');
INSERT INTO pw_permission VALUES('0','0','4','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','media','basic','');
INSERT INTO pw_permission VALUES('0','0','4','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','4','shield','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','unite','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','remind','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','pingcp','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','4','inspect','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','maxmsg','basic','50');
INSERT INTO pw_permission VALUES('0','0','5','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','5','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','5','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','5','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allownum','basic','80');
INSERT INTO pw_permission VALUES('0','0','5','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','5','postpertime','basic','3');
INSERT INTO pw_permission VALUES('0','0','5','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','5','signnum','basic','200');
INSERT INTO pw_permission VALUES('0','0','5','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','viewipfrom','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','imgwidth','basic','');
INSERT INTO pw_permission VALUES('0','0','5','imgheight','basic','');
INSERT INTO pw_permission VALUES('0','0','5','fontsize','basic','');
INSERT INTO pw_permission VALUES('0','0','5','msggroup','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','5','viewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','markable','basic','2');
INSERT INTO pw_permission VALUES('0','0','5','postlimit','basic','');
INSERT INTO pw_permission VALUES('0','0','5','uploadtype','basic','');
INSERT INTO pw_permission VALUES('0','0','5','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','5','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','5','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowadmincp','system','1');
INSERT INTO pw_permission VALUES('0','0','5','delatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','moveatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','copyatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','digestadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','lockadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','pushadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','coloradmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','downadmin','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','viewcheck','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','viewclose','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','delattach','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','viewip','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','banuser','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','bantype','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','5','banmax','systemforum','10');
INSERT INTO pw_permission VALUES('0','0','5','posthide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','5','sellhide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','5','encodehide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','5','anonyhide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','5','postpers','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','5','replylock','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','modother','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','remind','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','shield','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','topped','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','tpccheck','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','tpctype','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','unite','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','deltpcs','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','allowtime','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','superright','system','0');
INSERT INTO pw_permission VALUES('0','0','5','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:2:\"80\";s:9:\"marklimit\";a:2:{i:0;s:2:\"-1\";i:1;s:1:\"3\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','5','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','5','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','5','pingcp','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','inspect','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','5','maxsendmsg','basic','');
INSERT INTO pw_permission VALUES('0','0','5','pergroup','basic','member,system,special');
INSERT INTO pw_permission VALUES('0','0','5','maxgraft','basic','10');
INSERT INTO pw_permission VALUES('0','0','5','pwdlimitime','basic','');
INSERT INTO pw_permission VALUES('0','0','5','maxcstyles','basic','');
INSERT INTO pw_permission VALUES('0','0','5','media','basic','');
INSERT INTO pw_permission VALUES('0','0','6','maxmsg','basic','10');
INSERT INTO pw_permission VALUES('0','0','6','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','6','allowportait','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','upload','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowrp','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowhonor','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowdelatc','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowpost','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allownewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowactive','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowhidden','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowencode','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowsell','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowsearch','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowmember','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','6','allowreport','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowmessege','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowsort','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','alloworder','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowupload','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowdownload','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','6','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','postpertime','basic','15');
INSERT INTO pw_permission VALUES('0','0','6','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','6','signnum','basic','100');
INSERT INTO pw_permission VALUES('0','0','6','show','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','imgwidth','basic','');
INSERT INTO pw_permission VALUES('0','0','6','imgheight','basic','');
INSERT INTO pw_permission VALUES('0','0','6','fontsize','basic','');
INSERT INTO pw_permission VALUES('0','0','6','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','6','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','atccheck','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','markable','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','postlimit','basic','');
INSERT INTO pw_permission VALUES('0','0','6','uploadtype','basic','');
INSERT INTO pw_permission VALUES('0','0','6','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','6','ifmemo','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','atclog','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','6','modifyvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowreward','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowgoods','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','allowdebate','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','dig','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','leaveword','basic','0');
INSERT INTO pw_permission VALUES('0','0','6','markset','basic','a:5:{s:5:\"money\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','7','maxmsg','basic','10');
INSERT INTO pw_permission VALUES('0','0','7','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','upload','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowhonor','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowactive','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowsearch','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowreport','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','allowmessege','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','allowsort','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','7','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','7','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','postpertime','basic','15');
INSERT INTO pw_permission VALUES('0','0','7','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','7','signnum','basic','100');
INSERT INTO pw_permission VALUES('0','0','7','show','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','imgwidth','basic','');
INSERT INTO pw_permission VALUES('0','0','7','imgheight','basic','');
INSERT INTO pw_permission VALUES('0','0','7','fontsize','basic','');
INSERT INTO pw_permission VALUES('0','0','7','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','7','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','atccheck','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','markable','basic','0');
INSERT INTO pw_permission VALUES('0','0','7','postlimit','basic','');
INSERT INTO pw_permission VALUES('0','0','7','uploadtype','basic','');
INSERT INTO pw_permission VALUES('0','0','7','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','7','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','maxmsg','basic','10');
INSERT INTO pw_permission VALUES('0','0','8','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allownewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','allowvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','allowactive','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowencode','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','allowsell','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','allowsearch','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowmember','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowsort','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','8','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','postpertime','basic','5');
INSERT INTO pw_permission VALUES('0','0','8','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','8','signnum','basic','30');
INSERT INTO pw_permission VALUES('0','0','8','show','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','imgwidth','basic','');
INSERT INTO pw_permission VALUES('0','0','8','imgheight','basic','');
INSERT INTO pw_permission VALUES('0','0','8','fontsize','basic','3');
INSERT INTO pw_permission VALUES('0','0','8','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','maxfavor','basic','50');
INSERT INTO pw_permission VALUES('0','0','8','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','atccheck','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','markable','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','postlimit','basic','');
INSERT INTO pw_permission VALUES('0','0','8','uploadtype','basic','');
INSERT INTO pw_permission VALUES('0','0','8','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','8','anonymous','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','8','atclog','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','8','modifyvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','allowreward','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','allowgoods','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','allowdebate','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','dig','basic','0');
INSERT INTO pw_permission VALUES('0','0','8','pergroup','basic','member');
INSERT INTO pw_permission VALUES('0','0','8','markset','basic','a:5:{s:5:\"money\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','8','maxgraft','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','maxmsg','basic','10');
INSERT INTO pw_permission VALUES('0','0','9','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','9','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','9','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowsearch','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','9','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','9','postpertime','basic','5');
INSERT INTO pw_permission VALUES('0','0','9','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','9','signnum','basic','50');
INSERT INTO pw_permission VALUES('0','0','9','markable','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','9','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','9','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','9','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:1:\"5\";s:9:\"marklimit\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','9','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','9','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','9','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','9','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','9','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','9','maxgraft','basic','2');
INSERT INTO pw_permission VALUES('0','0','9','pergroup','basic','member');
INSERT INTO pw_permission VALUES('0','0','10','pergroup','basic','member');
INSERT INTO pw_permission VALUES('0','0','11','pergroup','basic','member');
INSERT INTO pw_permission VALUES('0','0','12','pergroup','basic','member');
INSERT INTO pw_permission VALUES('0','0','13','pergroup','basic','member');
INSERT INTO pw_permission VALUES('0','0','14','pergroup','basic','member');
INSERT INTO pw_permission VALUES('0','0','15','pergroup','basic','member');
INSERT INTO pw_permission VALUES('0','0','10','maxmsg','basic','30');
INSERT INTO pw_permission VALUES('0','0','10','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','10','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','10','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','10','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','10','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','10','postpertime','basic','3');
INSERT INTO pw_permission VALUES('0','0','10','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','10','signnum','basic','100');
INSERT INTO pw_permission VALUES('0','0','10','markable','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','10','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','10','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','10','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:1:\"5\";s:9:\"marklimit\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','10','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','10','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','10','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','10','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','10','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','10','maxgraft','basic','5');
INSERT INTO pw_permission VALUES('0','0','11','maxmsg','basic','30');
INSERT INTO pw_permission VALUES('0','0','11','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','11','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','11','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','11','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','11','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','11','postpertime','basic','3');
INSERT INTO pw_permission VALUES('0','0','11','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','11','signnum','basic','150');
INSERT INTO pw_permission VALUES('0','0','11','markable','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','11','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','11','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','11','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:2:\"10\";s:9:\"marklimit\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','11','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','11','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','11','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','11','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','11','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','11','maxgraft','basic','5');
INSERT INTO pw_permission VALUES('0','0','12','maxmsg','basic','30');
INSERT INTO pw_permission VALUES('0','0','12','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','12','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','12','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','12','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','12','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','12','postpertime','basic','3');
INSERT INTO pw_permission VALUES('0','0','12','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','12','signnum','basic','200');
INSERT INTO pw_permission VALUES('0','0','12','markable','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','12','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','12','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','12','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:2:\"20\";s:9:\"marklimit\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','12','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','12','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','12','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','12','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','12','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','12','maxgraft','basic','5');
INSERT INTO pw_permission VALUES('0','0','13','maxmsg','basic','50');
INSERT INTO pw_permission VALUES('0','0','13','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','13','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','13','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','13','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','13','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','13','postpertime','basic','3');
INSERT INTO pw_permission VALUES('0','0','13','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','13','signnum','basic','200');
INSERT INTO pw_permission VALUES('0','0','13','markable','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','13','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','13','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','13','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:2:\"50\";s:9:\"marklimit\";a:2:{i:0;s:1:\"0\";i:1;s:1:\"2\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','13','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','13','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','13','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','13','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','13','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','13','maxgraft','basic','5');
INSERT INTO pw_permission VALUES('0','0','14','maxmsg','basic','50');
INSERT INTO pw_permission VALUES('0','0','14','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','14','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','14','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','14','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allownum','basic','80');
INSERT INTO pw_permission VALUES('0','0','14','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','14','postpertime','basic','3');
INSERT INTO pw_permission VALUES('0','0','14','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','14','signnum','basic','200');
INSERT INTO pw_permission VALUES('0','0','14','markable','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','14','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','14','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','14','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:2:\"80\";s:9:\"marklimit\";a:2:{i:0;s:2:\"-1\";i:1;s:1:\"3\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','14','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','14','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','14','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','14','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','14','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','14','maxgraft','basic','5');
INSERT INTO pw_permission VALUES('0','0','15','maxmsg','basic','50');
INSERT INTO pw_permission VALUES('0','0','15','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','15','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','15','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','15','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allownum','basic','100');
INSERT INTO pw_permission VALUES('0','0','15','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','15','postpertime','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','15','signnum','basic','200');
INSERT INTO pw_permission VALUES('0','0','15','markable','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','15','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','15','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','15','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:3:\"100\";s:9:\"marklimit\";a:2:{i:0;s:2:\"-2\";i:1;s:1:\"5\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','15','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','viewipfrom','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','15','msggroup','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','15','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','15','maxgraft','basic','10');
INSERT INTO pw_permission VALUES('0','0','16','maxmsg','basic','30');
INSERT INTO pw_permission VALUES('0','0','16','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','16','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','16','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','16','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','16','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','16','postpertime','basic','3');
INSERT INTO pw_permission VALUES('0','0','16','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','16','signnum','basic','100');
INSERT INTO pw_permission VALUES('0','0','16','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','16','imgwidth','basic','');
INSERT INTO pw_permission VALUES('0','0','16','imgheight','basic','');
INSERT INTO pw_permission VALUES('0','0','16','fontsize','basic','');
INSERT INTO pw_permission VALUES('0','0','16','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','16','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','16','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','16','atccheck','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','markable','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','postlimit','basic','');
INSERT INTO pw_permission VALUES('0','0','16','uploadtype','basic','');
INSERT INTO pw_permission VALUES('0','0','16','markdt','basic','');
INSERT INTO pw_permission VALUES('0','0','16','anonymous','basic','0');
INSERT INTO pw_permission VALUES('0','0','16','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowadmincp','system','0');
INSERT INTO pw_permission VALUES('0','0','16','delatc','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','moveatc','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','copyatc','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','digestadmin','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','lockadmin','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','pushadmin','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','coloradmin','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','downadmin','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','viewcheck','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','viewclose','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','delattach','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','viewip','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','banuser','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','bantype','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','banmax','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','posthide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','sellhide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','encodehide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','anonyhide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','postpers','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','replylock','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','modother','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','deltpcs','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','topped','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','tpctype','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','tpccheck','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','allowtime','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','16','superright','system','1');
INSERT INTO pw_permission VALUES('0','0','16','ifmemo','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:1:\"5\";s:9:\"marklimit\";a:2:{i:0;s:1:\"1\";i:1;s:1:\"2\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','16','atclog','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','16','maxsendmsg','basic','');
INSERT INTO pw_permission VALUES('0','0','16','pergroup','basic','member,special');
INSERT INTO pw_permission VALUES('0','0','16','maxgraft','basic','2');
INSERT INTO pw_permission VALUES('0','0','16','pwdlimitime','basic','');
INSERT INTO pw_permission VALUES('0','0','16','maxcstyles','basic','');
INSERT INTO pw_permission VALUES('0','0','16','modifyvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowreward','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowgoods','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','allowdebate','basic','1');
INSERT INTO pw_permission VALUES('0','0','16','media','basic','');
INSERT INTO pw_permission VALUES('0','0','16','dig','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowhide','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','allowread','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowsearch','basic','2');
INSERT INTO pw_permission VALUES('0','0','17','allowmember','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowprofile','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','atclog','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','show','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowreport','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','upload','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowportait','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowhonor','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowmessege','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowsort','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','alloworder','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','viewipfrom','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','schtime','basic','7776000');
INSERT INTO pw_permission VALUES('0','0','17','msggroup','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','ifmemo','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','pergroup','basic','');
INSERT INTO pw_permission VALUES('0','0','17','allowpost','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowrp','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allownewvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','modifyvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','allowvote','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','viewvote','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','allowactive','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowreward','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','allowgoods','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','allowdebate','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','htmlcode','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','media','basic','');
INSERT INTO pw_permission VALUES('0','0','17','allowhidden','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowsell','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowencode','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','anonymous','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','dig','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','leaveword','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowdelatc','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','atccheck','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','markable','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','markset','basic','a:5:{s:5:\"money\";a:4:{s:9:\"markctype\";s:5:\"money\";s:9:\"maxcredit\";s:2:\"50\";s:9:\"marklimit\";a:2:{i:0;s:2:\"-5\";i:1;s:1:\"5\";}s:6:\"markdt\";s:1:\"0\";}s:4:\"rvrc\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:6:\"credit\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}s:8:\"currency\";a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}i:1;a:3:{s:9:\"maxcredit\";s:0:\"\";s:9:\"marklimit\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:6:\"markdt\";s:1:\"0\";}}');
INSERT INTO pw_permission VALUES('0','0','17','allowupload','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowdownload','basic','1');
INSERT INTO pw_permission VALUES('0','0','17','allowadmincp','system','1');
INSERT INTO pw_permission VALUES('0','0','17','superright','system','1');
INSERT INTO pw_permission VALUES('0','0','17','posthide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','sellhide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','encodehide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','anonyhide','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','postpers','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','replylock','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','viewip','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','topped','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','digestadmin','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','lockadmin','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','pushadmin','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','coloradmin','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','downadmin','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','tpctype','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','tpccheck','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','delatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','moveatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','copyatc','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','modother','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','deltpcs','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','viewcheck','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','viewclose','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','delattach','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','shield','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','unite','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','remind','systemforum','1');
INSERT INTO pw_permission VALUES('0','0','17','pingcp','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','inspect','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','allowtime','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','banuser','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','bantype','systemforum','0');
INSERT INTO pw_permission VALUES('0','0','17','searchtime','basic','10');
INSERT INTO pw_permission VALUES('0','0','17','signnum','basic','500');
INSERT INTO pw_permission VALUES('0','0','17','imgwidth','basic','');
INSERT INTO pw_permission VALUES('0','0','17','imgheight','basic','');
INSERT INTO pw_permission VALUES('0','0','17','fontsize','basic','');
INSERT INTO pw_permission VALUES('0','0','17','maxmsg','basic','40');
INSERT INTO pw_permission VALUES('0','0','17','maxsendmsg','basic','');
INSERT INTO pw_permission VALUES('0','0','17','maxfavor','basic','100');
INSERT INTO pw_permission VALUES('0','0','17','maxgraft','basic','');
INSERT INTO pw_permission VALUES('0','0','17','pwdlimitime','basic','');
INSERT INTO pw_permission VALUES('0','0','17','maxcstyles','basic','');
INSERT INTO pw_permission VALUES('0','0','17','postlimit','basic','');
INSERT INTO pw_permission VALUES('0','0','17','postpertime','basic','10');
INSERT INTO pw_permission VALUES('0','0','17','edittime','basic','0');
INSERT INTO pw_permission VALUES('0','0','17','allownum','basic','50');
INSERT INTO pw_permission VALUES('0','0','17','uploadtype','basic','');
INSERT INTO pw_permission VALUES('0','0','17','banmax','systemforum','10');
INSERT INTO pw_permission VALUES('0','0','17','areapush','systemforum','1');

INSERT INTO pw_pidtmp VALUES('1');


INSERT INTO pw_plan VALUES('1','定时清理群发消息','*','6','1','*','0','0','1','0','cleardata','');
INSERT INTO pw_plan VALUES('2','自动解除禁言','*','*','20','30','0','0','0','0','freeban','');
INSERT INTO pw_plan VALUES('3','发送生日短消息','*','*','0','*','0','0','1','0','birthday','');
INSERT INTO pw_plan VALUES('4','悬赏帖到期通知','*','1','12','30','0','0','1','0','rewardmsg','');
INSERT INTO pw_plan VALUES('5','管理团队工资发放','15','*','2','*','0','0','0','0','team','a:3:{s:10:\"credittype\";s:6:\"credit\";s:6:\"credit\";a:3:{i:3;s:3:\"100\";i:4;s:2:\"60\";i:5;s:2:\"50\";}s:6:\"groups\";s:5:\"3,4,5\";}');
INSERT INTO pw_plan VALUES('6','勋章自动回收','16','*','18','30','0','0','0','0','medal','');
INSERT INTO pw_plan VALUES('7','限期头衔自动回收','*','*','22','*','0','0','0','0','extragroup','');


INSERT INTO pw_postcate VALUES('1','团购','1','0','','');
INSERT INTO pw_postcate VALUES('2','活动','1','0','','');






INSERT INTO pw_rateconfig VALUES('1','精彩','01.gif','1','1','1','-1','0','0','system','1251030975','admin','1251084720');
INSERT INTO pw_rateconfig VALUES('2','感动','02.gif','1','1','1','-1','0','0','system','1251030975','admin','1251084720');
INSERT INTO pw_rateconfig VALUES('3','搞笑','03.gif','1','1','1','-1','0','0','system','1251030975','admin','1251084720');
INSERT INTO pw_rateconfig VALUES('4','开心','04.gif','1','1','1','-1','0','0','system','1251030975','admin','1251084720');
INSERT INTO pw_rateconfig VALUES('5','愤怒','05.gif','1','1','1','-1','0','0','system','1251030975','admin','1251084720');
INSERT INTO pw_rateconfig VALUES('6','无聊','06.gif','1','1','1','-1','0','0','system','1251030975','admin','1251084720');
INSERT INTO pw_rateconfig VALUES('7','灌水','07.gif','1','1','1','-1','0','0','system','1251030975','admin','1251084720');
INSERT INTO pw_rateconfig VALUES('8','精彩','01.gif','1','1','2','-1','0','0','system','1251030975','admin','1251045629');
INSERT INTO pw_rateconfig VALUES('9','感动','02.gif','1','1','2','-1','0','0','system','1251030975','admin','1251045629');
INSERT INTO pw_rateconfig VALUES('10','搞笑','03.gif','1','1','2','-1','0','0','system','1251030975','admin','1251045629');
INSERT INTO pw_rateconfig VALUES('11','开心','04.gif','1','1','2','-1','0','0','system','1251030975','admin','1251045629');
INSERT INTO pw_rateconfig VALUES('12','愤怒','05.gif','1','1','2','-1','0','0','system','1251030975','admin','1251045629');
INSERT INTO pw_rateconfig VALUES('13','无聊','06.gif','1','1','2','-1','0','0','system','1251030975','admin','1251045629');
INSERT INTO pw_rateconfig VALUES('14','灌水','07.gif','1','1','2','-1','0','0','system','1251030975','admin','1251045629');
INSERT INTO pw_rateconfig VALUES('15','精彩','01.gif','1','1','3','-1','0','0','system','1251030975','admin','1251045649');
INSERT INTO pw_rateconfig VALUES('16','唯美','02.gif','1','1','3','-1','0','0','system','1251030975','admin','1251045649');
INSERT INTO pw_rateconfig VALUES('17','有趣','03.gif','1','1','3','-1','0','0','system','1251030975','admin','1251045649');
INSERT INTO pw_rateconfig VALUES('18','震惊','04.gif','1','1','3','-1','0','0','system','1251030975','admin','1251045649');
INSERT INTO pw_rateconfig VALUES('19','原创','05.gif','1','1','3','-1','0','0','system','1251030975','admin','1251045649');
INSERT INTO pw_rateconfig VALUES('20','专业','06.gif','1','1','3','-1','0','0','system','1251030975','admin','1251045649');
INSERT INTO pw_rateconfig VALUES('21','无聊','07.gif','1','1','3','-1','0','0','system','1251030975','admin','1251045649');
INSERT INTO pw_rateconfig VALUES('22','劣质','08.gif','1','1','3','-1','0','0','system','1251030975','admin','1251045649');






INSERT INTO pw_setform VALUES('1','出租信息','1','<table cellspacing=\"1\" cellpadding=\"1\" align=\"left\" width=\"100%\" style=\"background:#D4EFF7;text-align:left\"><tr><td width=\"30%\" align=\"center\" style=\"background:#fff;height:25px;\"><b>联  系 人:</b></td><td style=\"background:#fff;padding-left:5px\"><p contentEditable=true></p></td></tr><tr><td width=\"30%\" align=\"center\" style=\"background:#fff;height:25px;\"><b>联系方式:</b></td><td style=\"background:#fff;padding-left:5px\"><p contentEditable=true></p></td></tr><tr><td width=\"30%\" align=\"center\" style=\"background:#fff;height:25px;\"><b>房屋类型:</b></td><td style=\"background:#fff;padding-left:5px\"><p contentEditable=true></p></td></tr><tr><td width=\"30%\" align=\"center\" style=\"background:#fff;height:25px;\"><b>房屋位置:</b></td><td style=\"background:#fff;padding-left:5px\"><p contentEditable=true></p></td></tr><tr><td width=\"30%\" align=\"center\" style=\"background:#fff;height:25px;\"><b><font color=\"#ff3300\">出租</font>价格:</b></td><td style=\"background:#fff;padding-left:5px\"><p contentEditable=true></p></td></tr><tr><td width=\"30%\" align=\"center\" style=\"background:#fff;height:25px;\"><b>房屋层次:</b></td><td style=\"background:#fff;padding-left:5px\"><p contentEditable=true></p></td></tr><tr><td width=\"30%\" align=\"center\" style=\"background:#fff;height:25px;\"><b>房屋面积:</b></td><td style=\"background:#fff;padding-left:5px\"><p contentEditable=true></p></td></tr><tr><td width=\"30%\" align=\"center\" style=\"background:#fff;height:25px;\"><b>建造年份:</b></td><td style=\"background:#fff;padding-left:5px\"><p contentEditable=true></p></td></tr><tr><td width=\"30%\" align=\"center\" style=\"background:#fff;height:25px;\"><b>简单情况:</b></td><td style=\"background:#fff;padding-left:5px\"><p contentEditable=true></p></td></tr></table>');


INSERT INTO pw_sharelinks VALUES('1','0','PHPwind Board','http://www.phpwind.net','PHPwind官方论坛','logo.gif','1','');


INSERT INTO pw_smiles VALUES('1','default','默认表情','','1','0');
INSERT INTO pw_smiles VALUES('2','1.gif','','','0','1');
INSERT INTO pw_smiles VALUES('3','2.gif','','','0','1');
INSERT INTO pw_smiles VALUES('4','3.gif','','','0','1');
INSERT INTO pw_smiles VALUES('5','4.gif','','','0','1');
INSERT INTO pw_smiles VALUES('6','5.gif','','','0','1');
INSERT INTO pw_smiles VALUES('7','6.gif','','','0','1');
INSERT INTO pw_smiles VALUES('8','7.gif','','','0','1');
INSERT INTO pw_smiles VALUES('9','8.gif','','','0','1');
INSERT INTO pw_smiles VALUES('10','9.gif','','','0','1');
INSERT INTO pw_smiles VALUES('11','10.gif','','','0','1');
INSERT INTO pw_smiles VALUES('12','11.gif','','','0','1');
INSERT INTO pw_smiles VALUES('13','12.gif','','','0','1');
INSERT INTO pw_smiles VALUES('14','13.gif','','','0','1');
INSERT INTO pw_smiles VALUES('15','14.gif','','','0','1');


INSERT INTO pw_stamp VALUES('1','贴子排行','subject','1','1','1');
INSERT INTO pw_stamp VALUES('2','用户排行','user','6','1','0');
INSERT INTO pw_stamp VALUES('3','版块排行','forum','9','1','0');
INSERT INTO pw_stamp VALUES('4','标签排行','tag','11','1','0');
INSERT INTO pw_stamp VALUES('5','图片','image','13','1','1');
INSERT INTO pw_stamp VALUES('6','活动','active','41','1','1');


INSERT INTO pw_stopicblock VALUES('1','帖子列表','<ul>\r\n<loop>\r\n<li><a href=\"{url}\" target=\"_blank\">{title}</a></li>\r\n</loop>\r\n</ul>','<ul>\r\n','\r\n<li><a href=\"{url}\" target=\"_blank\">{title}</a></li>\r\n','\r\n</ul>','a:2:{i:0;s:3:\"url\";i:1;s:5:\"title\";}','a:2:{i:0;s:5:\"{url}\";i:1;s:7:\"{title}\";}');
INSERT INTO pw_stopicblock VALUES('2','帖子及摘要','<loop>\r\n<h2><a href=\"{url}\" target=\"_blank\">{title}</a></h2>\r\n<p>{descrip}</p>\r\n</loop>','','\r\n<h2><a href=\"{url}\" target=\"_blank\">{title}</a></h2>\r\n<p>{descrip}</p>\r\n','','a:3:{i:0;s:3:\"url\";i:1;s:5:\"title\";i:2;s:7:\"descrip\";}','a:3:{i:0;s:5:\"{url}\";i:1;s:7:\"{title}\";i:2;s:9:\"{descrip}\";}');
INSERT INTO pw_stopicblock VALUES('3','图片','<ul class=\"list-img-a\">\r\n<loop>\r\n<li><a href=\"{url}\" target=\"_blank\"><img src=\"{image}\" /></a></li>\r\n</loop>\r\n</ul>','<ul class=\"list-img-a\">\r\n','\r\n<li><a href=\"{url}\" target=\"_blank\"><img src=\"{image}\" /></a></li>\r\n','\r\n</ul>','a:2:{i:0;s:3:\"url\";i:1;s:5:\"image\";}','a:2:{i:0;s:5:\"{url}\";i:1;s:7:\"{image}\";}');
INSERT INTO pw_stopicblock VALUES('4','图片标题','<ul class=\"list-img-a\">\r\n<loop>\r\n<li><a href=\"{url}\" target=\"_blank\"><img src=\"{image}\" /></a><p><a href=\"{url}\" target=\"_blank\">{title}</a></p></li>\r\n</loop>\r\n</ul>','<ul class=\"list-img-a\">\r\n','\r\n<li><a href=\"{url}\" target=\"_blank\"><img src=\"{image}\" /></a><p><a href=\"{url}\" target=\"_blank\">{title}</a></p></li>\r\n','\r\n</ul>','a:3:{i:0;s:3:\"url\";i:1;s:5:\"image\";i:2;s:5:\"title\";}','a:3:{i:0;s:5:\"{url}\";i:1;s:7:\"{image}\";i:2;s:7:\"{title}\";}');
INSERT INTO pw_stopicblock VALUES('5','图文','<table width=\"100%\">\r\n<loop>\r\n<tr>\r\n<th><div><a href=\"{url}\" target=\"_blank\"><img src=\"{image}\" /></a></div></th>\r\n<td><h4><a href=\"{url}\" target=\"_blank\">{title}</a></h4>\r\n<p>{descrip}</p></td>\r\n</tr>\r\n</loop>\r\n</table>','<table width=\"100%\">\r\n','\r\n<tr>\r\n<th><div><a href=\"{url}\" target=\"_blank\"><img src=\"{image}\" /></a></div></th>\r\n<td><h4><a href=\"{url}\" target=\"_blank\">{title}</a></h4>\r\n<p>{descrip}</p></td>\r\n</tr>\r\n','\r\n</table>','a:4:{i:0;s:3:\"url\";i:1;s:5:\"image\";i:2;s:5:\"title\";i:3;s:7:\"descrip\";}','a:4:{i:0;s:5:\"{url}\";i:1;s:7:\"{image}\";i:2;s:7:\"{title}\";i:3;s:9:\"{descrip}\";}');
INSERT INTO pw_stopicblock VALUES('6','自定义html','<loop>\r\n{html}\r\n</loop>','','\r\n{html}\r\n','','a:1:{i:0;s:4:\"html\";}','a:1:{i:0;s:6:\"{html}\";}');
INSERT INTO pw_stopicblock VALUES('7','图片播放器','<style type=\"text/css\">\r\n.pwSlide {background:#fff;position:relative;width:100%;height:240px;overflow:hidden;text-align:left;}\r\n.pwSlide a:hover{text-decoration:none;}\r\n.pwSlide .bg {position:absolute;left:0;bottom:0;width:100%;height:40px;background:#333333;filter:alpha(opacity=39);-moz-opacity:0.39;opacity:0.39;}\r\n.pwSlide h4 {position:absolute;left:10px;bottom:15px;_bottom:1px;width:95%;height:20px;line-height:16px;z-index:2;color:#fff;}\r\n.pwSlide ul {margin:0;padding:0;position:absolute;right:5px;bottom:5px;_bottom:2px;z-index:2;}\r\n.pwSlide ul li {list-style:none;float:left;width:18px;height:13px;line-height:15px;text-align:center;margin-left:1px;}\r\n.pwSlide ul li a {display:block;width:18px;height:13px;line-height:13px;font-size:10px;font-family:Tahoma;color:#000;background:#f7f7f7;}\r\n.pwSlide ul li a:hover, .pwSlide ul li a.sel {color:#fff;text-decoration:none;background:#ff6600;color:#fff;}\r\n</style>\r\n<div id=\"pwSlidePlayer\" class=\"pwSlide\">\r\n<loop>\r\n<div class=\"tac\" style=\"display:none;\">\r\n<a href=\"{url}\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"{image}\" title=\"{title}\" height=\"240\" width=\"100%\" />\r\n<h4 class=\"fn f12 tal\">{title}</h4></a>\r\n</div>\r\n</loop>\r\n<ul id=\"SwitchNav\"></ul>\r\n<div class=\"bg\"></div>\r\n</div>\r\n<script language=\"JavaScript\" src=\"js/picplayer.js\"></script>\r\n<script language=\"JavaScript\">pwSlidePlayer(\"play\",1);</script>','<style type=\"text/css\">\r\n.pwSlide {background:#fff;position:relative;width:100%;height:240px;overflow:hidden;text-align:left;}\r\n.pwSlide a:hover{text-decoration:none;}\r\n.pwSlide .bg {position:absolute;left:0;bottom:0;width:100%;height:40px;background:#333333;filter:alpha(opacity=39);-moz-opacity:0.39;opacity:0.39;}\r\n.pwSlide h4 {position:absolute;left:10px;bottom:15px;_bottom:1px;width:95%;height:20px;line-height:16px;z-index:2;color:#fff;}\r\n.pwSlide ul {margin:0;padding:0;position:absolute;right:5px;bottom:5px;_bottom:2px;z-index:2;}\r\n.pwSlide ul li {list-style:none;float:left;width:18px;height:13px;line-height:15px;text-align:center;margin-left:1px;}\r\n.pwSlide ul li a {display:block;width:18px;height:13px;line-height:13px;font-size:10px;font-family:Tahoma;color:#000;background:#f7f7f7;}\r\n.pwSlide ul li a:hover, .pwSlide ul li a.sel {color:#fff;text-decoration:none;background:#ff6600;color:#fff;}\r\n</style>\r\n<div id=\"pwSlidePlayer\" class=\"pwSlide\">\r\n','\r\n<div class=\"tac\" style=\"display:none;\">\r\n<a href=\"{url}\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"{image}\" title=\"{title}\" height=\"240\" width=\"100%\" />\r\n<h4 class=\"fn f12 tal\">{title}</h4></a>\r\n</div>\r\n','\r\n<ul id=\"SwitchNav\"></ul>\r\n<div class=\"bg\"></div>\r\n</div>\r\n<script language=\"JavaScript\" src=\"js/picplayer.js\"></script>\r\n<script language=\"JavaScript\">pwSlidePlayer(\"play\",1);</script>','a:3:{i:0;s:3:\"url\";i:1;s:5:\"image\";i:2;s:5:\"title\";}','a:3:{i:0;s:5:\"{url}\";i:1;s:7:\"{image}\";i:2;s:7:\"{title}\";}');

INSERT INTO pw_stopiccategory VALUES('1','房产','1','0','admin','1250759842');
INSERT INTO pw_stopiccategory VALUES('2','汽车','1','0','admin','1250759842');
INSERT INTO pw_stopiccategory VALUES('3','婚庆','1','0','admin','1250759842');
INSERT INTO pw_stopiccategory VALUES('4','母婴','1','0','admin','1250759842');
INSERT INTO pw_stopiccategory VALUES('5','团购','1','0','admin','1250759842');



INSERT INTO pw_styles VALUES('1','0','wind','<font color=#3366cc>■wind</font>','0','0','1','wind','wind','0','#fcfcf3','#333333','#9fb7e7','#d5e6ed','960px','960px','#e8f5fb','#abc8ea','#3366cc','#3366cc','#ffffff','#c5d8e8','#888888','#ffffff','#f3f9fb','');
INSERT INTO pw_styles VALUES('2','0','wind_green','<font color=green>■green</font>','0','0','1','wind_green','wind','0','#eff5e8','#333333','#b8db7e','#ebfad3','960px','960px','#e8f5fb','#b8db7e','#659b05','#659b05','#ffffff','#ebfad3','#888888','#ffffff','#f4ffe8','');
INSERT INTO pw_styles VALUES('3','0','wind_orange','<font color=orange>■orange</font>','0','0','1','wind_orange','wind','0','#f8fcf3','#333333','#f6cb84','#ffe6bc','960px','960px','#e8f5fb','#f6cb85','#e67b1b','#e67b1b','#ffffff','#ffe6bc','#888888','#ffffff','#fef8eb','');
INSERT INTO pw_styles VALUES('4','0','wind_purple','<font color=purple>■purple</font>','0','0','1','wind_purple','wind','0','#f7f2ff','#333333','#d9c0fc','#f3eafe','960px','960px','#ede3fb','#d9c0fc','#a04fec','#a04fec','#ffffff','#f3eafe','#888888','#ffffff','#fbf8ff','');
INSERT INTO pw_styles VALUES('5','0','wind_red','<font color=red>■red</font>','0','0','1','wind_red','wind','0','#FBF6EB','#333333','#f4c6ca','#ffe6e8','960px','960px','#e8f5fb','#f4c6ca','#db3228','#d75353','#ffffff','#ffe4e6','#888888','#ffffff','#fdf8f8','');



INSERT INTO pw_threads VALUES('1','8','0','','admin','1','装修中瓷砖的种类及挑选方法详解','','','1','0','1253367993','1253367993','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('2','8','0','','admin','1','厨房装修的12个要点分析','','','1','0','1253368029','1253368029','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('3','8','0','','admin','1','怎样延长复合地板的使用寿命','','','1','0','1253368067','1253368067','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('4','8','0','','admin','1','移门选购要点谈','','','1','0','1253368102','1253368102','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('5','8','0','','admin','1','橱柜行业骗局多，伪洋品牌何其多！','','','1','0','1253368129','1253368129','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('6','8','0','','admin','1','定制化地板销售，行业期待创新','','','1','0','1253368189','1253368189','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('7','8','0','','admin','1','装修中如何选购不易卷边的装饰壁纸','','','1','0','1253368226','1253368226','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('8','8','0','','admin','1','如何解决外墙渗漏的问题','','','1','0','1253368256','1253368256','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('9','9','0','','admin','1','家居风水之“三要”与“三运”','','','1','0','1253368293','1253368293','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('10','8','0','','admin','1','你了解大理石吗？浅谈装修中大理石采购要点','','','1','0','1253368327','1253368327','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('11','8','0','','admin','1','装修材料中乳胶漆的选购要点','','','1','0','1253368354','1253368354','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('12','8','0','','admin','1','宁波装修新潮流之卫浴、地板、橱柜','','','1','0','1253368407','1253368407','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('13','8','0','','admin','1','小空间，大讲究，详解小卫浴装修要领','','','1','0','1253368444','1253368444','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('14','9','0','','admin','1','收纳的创意！如何给宝宝一个合适的空间','','','1','0','1253368473','1253368473','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('15','9','0','','admin','1','家居风水知多少','','','1','0','1253368503','1253368503','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('16','8','0','','admin','1','如何判断橱柜的优劣','','','1','0','1253368552','1253368552','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('17','8','0','','admin','1','详解石材的表面处理','','','1','0','1253368586','1253368586','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('18','9','0','','admin','1','家居装饰中风水设计的流程','','','1','0','1253368611','1253368611','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('19','9','0','','admin','1','宝宝卧室装修的风水讲究','','','1','0','1253368640','1253368640','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('20','8','0','','admin','1','阳台装修有学问之材料篇','','','1','0','1253368666','1253368666','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('21','8','0','','admin','1','简装房刷墙漆的学问','','','1','0','1253368692','1253368692','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('22','9','0','','admin','1','酷暑盛夏中家电如何保养','','','1','0','1253368713','1253368713','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('23','10','0','','admin','1','装饰的艺术——墙绘的前世今生','','','1','0','1253368781','1253368781','admin','3','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('24','8','0','','admin','1','装修中各种瓷砖的挑选方法','','','1','0','1253368827','1253368827','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('25','8','0','','admin','1','选购绿色环保安全的涂料之注意事项','','','1','0','1253368855','1253368855','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('26','8','0','','admin','1','家装业如何适应人口老龄化的社会现状','','','1','0','1253368879','1253368879','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('27','9','0','','admin','1','去除装修污染有帮手，绿色植物来帮忙','','','1','0','1253368962','1253368962','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('28','8','0','','admin','1','环保装修之十大要点','','','1','0','1253368995','1253368995','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('29','8','0','','admin','1','橱柜安装之4大重点','','','1','0','1253369023','1253369023','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('30','8','0','','admin','1','详解装修面积如何算','','','1','0','1253369042','1253369042','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('31','9','0','','admin','1','风水之谈：办公室里如何摆鲜花或植物','','','1','0','1253369065','1253369065','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('32','9','0','','admin','1','浅析“绿色家具”','','','1','0','1253369104','1253369104','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('33','8','0','','admin','1','装修省钱宝典','','','1','0','1253369128','1253369128','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('34','8','0','','admin','1','业主如何当监工，装修中不易发现的漏洞','','','1','0','1253369148','1253369148','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('35','8','0','','admin','1','何时买建材 掌握合适的采购建材时机','','','1','0','1253369187','1253369187','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('36','10','0','','admin','1','装修设计之十种武器','','','1','0','1253369214','1253369214','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('37','8','0','','admin','1','德国研发新工具，解决地板安装难题','','','1','0','1253369330','1253369330','admin','3','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('38','8','0','','admin','1','水磨石地面装饰施工及修补磨光工艺','','','1','0','1253369362','1253369362','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');
INSERT INTO pw_threads VALUES('39','8','0','','admin','1','装饰装修石材如何选，几大要点须牢记','','','1','0','1253369445','1253369445','admin','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','0','0','0');

INSERT INTO pw_tmsgs VALUES('1','0','127.0.0.1','1','','本机地址\r','','','	','1','1','挑选合适的瓷砖不仅会让墙面、地面在满足美观、易清洁等基本需求，还能营造家里浪漫、时尚或复古的多种感觉。学会挑选瓷砖的几个小窍门，可以让发挥不可忽视的作用。\n按照使用功能，可以分为外墙砖、地砖、墙砖、花片、腰线、广场砖和踢脚线等。按照制作工艺，可以分为釉面砖、通体砖、抛光砖、玻化砖和锦砖等。\n　\n●釉面砖：这是在砖表面烧有釉层的。这种砖分为两大类：一是用陶土烧制的，因吸水率较高而必须烧釉，因此强度较低，现在很少使用；另一种是用瓷土烧制的，为了追求装饰效果，也烧了釉，价格比陶土烧制的稍高。瓷土烧制的釉面砖广泛使用于家庭。\n●通体砖：这是一种不上釉的瓷质砖，正反面的材质和色泽一致的砖，通体砖有很好的防滑性和耐磨性。一般我们所说的“防滑地砖”，大部分是通体砖，由于这种砖价位适中，所以深受人们欢迎。\n●抛光砖：通体砖经抛光后就成为抛光砖，这种砖的硬度很高，所以非常耐磨。\n●玻化砖：这是一种高温烧制的瓷质砖，是所有中最硬的。有的抛光砖会被剐出划痕，但玻化砖不会。\n●锦砖：俗称马赛克，一般由数十块小砖组成一片，小巧玲珑、色彩斑斓，被广泛使用于室内小面积墙地面，主要分马赛克、大理石马赛克和玻璃马赛克等。\n消费者可以根据自己的预算和喜好选择不同的品牌，并根据居室的设计要求选择不同风格的地砖。色彩明快的玻化砖，可以装饰现代的；沉稳古朴的釉面砖，可以放在中式、欧式风格的房间里，马赛克的不同材质、不同拼接运用，可以为居室添加万种风情；而创意新颖、气质不俗的花砖，则可以为起到画龙点睛的作用。在购买方面，专家建议：首先要选择大厂家或名牌的产品，虽然价钱高些，但产品质量上有信誉保障。其次，是要检验质量，应注意两个方面：\n一、外观\n1．看尺度。长、宽、厚误差要小。办法是拿几块砖在地上排一下，严丝合缝的证明误差很小，质量不错。2．看角度。对角线不能大于1毫米。3．看平整度：两砖相扣，应无缝隙等现象。4．看光泽度。抛光砖能照出人影。5．看光洁度。3米之内应看不见砖上有针眼、瑕疵。6．看色差。几块砖平铺之后，颜色应一致。\n二、内在品质\n1．看吸水率。滴一滴水在砖上，看水渗透快慢。好的砖，水珠会在砖上滚动。2．听声音。好的，声音脆响，说明瓷质含量高。如果声音“嗒嗒”带破裂声，说明砖内藏有裂纹。\n','','','','');
INSERT INTO pw_tmsgs VALUES('2','0','127.0.0.1','1','','本机地址\r','','','	','1','1','厨房是家居生活的重点之一。原来购买橱柜，也许过于在乎面板的材质和颜色，忽略了很多细节，因而在日后的使用过程中经常遇到不便。当你再次准备购置橱柜时，不妨看看我们给出的提示和建议，希望能令你因厨房而爱上做饭。\n　　1.营造中心工作台\n　　水槽、灶台和冰箱，三角工作区曾经被视为厨房设计的黄金法则，现在，这个概念正在被打破。首先，烤箱、微波炉等厨房设备的增加，令我们根本无法遵循三角工作动线，而厨房的开放，更向三角形提出了挑战。孩子、亲密的朋友、大厨老师，我们要一起动手，共同分享其中的乐趣。中心工作台，至少可以集合储物、备餐、烹饪区，边做饭边交流，自然而亲切。\n给孩子留些空间 \n　　2.给孩子留些空间\n　　父母做饭的时候，让孩子也一同进入厨房。可以给他们配置桌子，方便写作业，或者让他们也参与下厨劳动，认识五谷杂粮、学会简单的家务劳动。孩子进入厨房，安全问题需要格外重视。保护灶台的隔离板、防止磕碰的柜角安全贴、存放刀具的抽屉锁、电源保护等都是必需的装备。\n好用的早餐台 \n　　3.好用的早餐台\n　　在橱柜中增加早餐台的配置，用处十分广泛。除去吃早餐，做饭间隙在这里休息、作为备餐台的补充、采购回来在这里整理食物，早餐台让你在厨房里变得更从容。\n设计多层次照明 \n　　4.设计多层次照明\n　　吊柜下方、吊柜和地柜内部、天花、烹饪区都应该安装照明设备，不要为了节省电路改造费用而舍弃这些照明，否则会带来极大不便。天花照明容易在某一区域留下阴影，从而影响人做饭时的操作，如果是切菜区域，还存在极大的危险。吊柜下方的照明最好能调节角度，适合不同做饭人的身高和视线角度。柜子内部灯的开关应该和柜门开合相连，使用起来更方便。\n采取分类收纳措施 \n　　5.采取分类收纳措施\n　　厨房永远有收拾不尽的物品。最好的方法就是进行分类收纳。先分好区域，再考虑抽屉或者柜子内部的分类，使用拉篮、分隔件，类别分得越细致查找时越容易。调料盒、盘子托等特殊的分隔件是一笔不小的花销，不过为了日后使用方便，还是不能吝惜。\n转角的魅力 \n　　6.转角的魅力\n　　橱柜遇到转角位置，内部的空间很难再放东西。只有安装转盘或者可伸缩的拉篮，才能将空间完全利用。圆盘拉篮是最理想的解决方案，同时需要将橱柜也设计成圆弧形，既美观，又实用。\n按需配置专业设备 \n　　7.按需配置专业设备\n　　喜欢烹饪的人和乐于在家中宴请朋友的人，应该按照需求增加专业的厨房设备。比如家里经常来很多人吃饭，安装在橱柜台面下面的加热盘就很有必要，保证每一道菜上桌时都是热腾腾的。能折叠收起的绞肉机、带有电子秤的备餐盘都是方便快捷、提升烹饪质量的好帮手。相反，如果你很少在家吃饭，那么也完全没必要去配备那些复杂的设备，以免造成浪费。\n实现个性化装饰 \n　　8.实现个性化装饰\n　　即使再花心思去挑选面板材质和颜色，可选的毕竟有限。不妨试着将自己的个性元素印制在橱柜面板上，可以是孩子的照片，或者是自己特别钟爱的纹样，制造出完全属于自己的橱柜外表。\n利用每一寸空间 \n图为 利用每一寸空间\n　　9.利用每一寸空间\n　　吊柜上方、地柜最底层、油烟机的上方、水槽下面，只要通过有效的工具，所有的空隙都能被利用。使用收纳筐可以把不经常用的厨具放在吊柜顶上，或者直接摆几个装饰盘，效果也不错。梯子能藏在地柜下面，还有宠物们的碗盘。油烟机上方可以摆放调料瓶和一些马上食用的蔬菜水果。水槽下面的垃圾桶和清洁剂存放位置也不能忽视。\n注意劳动舒适度 \n　　10.注意劳动舒适度\n　　橱柜台面的高度要根据使用者的身高来确定，不同区域的台面，高度也应该有所不同。烹饪区要比备餐区和洗涤区矮。如果家里橱柜使用者的身高差异比较大，还可以选用可升降的橱柜单元。带阻尼的滑轨能减少抽屉开合产生的噪音、只用很小力气就能开启的吊柜五金件，都让做饭变得更省力。\n提高可拓展性 \n　　11.提高可拓展性\n　　做饭时需要的空间往往很难预料，有时准备一个大菜，光是调料就要摆满整个台面，能临时抽取的小桌板、可移动的备餐车在这个时候能提供宝贵的台面空间，避免在烹饪时出现手忙脚乱忘记哪种调料或者放错的问题。收纳区域也一样，隔板、分隔件全部要灵活可移动、可随时增减的，不要让橱柜限制了物品的摆放。\n留意开放式厨房过渡地带 \n　　12.留意开放式厨房过渡地带\n　　越来越多的人家开始打开厨房的隔断墙，将厨房和起居室融为一体。开放式厨房与起居室的过渡地带，成为设计的重点。直接摆放餐桌、安装大型储物柜、放置展示收纳功能兼顾的搁架、或者是制作两面都可以使用的橱柜作为隔断。除去功能上的过渡，表面材质和色彩也要衔接厨房和起居室的装饰色调。 \n','','','','');
INSERT INTO pw_tmsgs VALUES('3','0','127.0.0.1','1','','本机地址\r','','','	','1','1','经济实用的复合木地板已成为百姓居室地面装饰的主选。恰当地使用和注意保养可延长复合木地板的寿命。\n保养复合木地板的方法很简单。平时可以用吸尘器或扫帚清扫表面灰尘，再用浸湿后拧干至不滴水的抹布或拖把擦拭地板表面。拖地后最好打开门窗，让空气流通，尽快将地板吹干。 \n复合木地板耐磨层若受损将使地板的防潮功能和光亮度受影响，因此，在地板上行走时，应尽量穿布拖鞋，最好赤脚。给家具的脚都贴上软底防护垫，避免家具的脚刮花地板耐磨层，别让很重的物品砸坏耐磨层。不能使用砂纸、打磨器、钢刷、强力去污粉或金属工具清理复合木地板。如果家中养猫，要想办法解决猫爪的破坏。 \n这里介绍一个清洁浅色复合木地板的小窍门：用抹布蘸取淘米水直接在地板上擦拭，或将淘米水均匀喷洒在木地板上（不宜太多），5分钟用干抹布擦拭，地板会洁净许多。 \n特殊污渍的清理：油渍、油漆、油墨可使用专用去渍油擦拭；血迹、果汁、红酒、啤酒等残渍用湿抹布或用抹布蘸上适量的地板清洁剂擦拭；蜡和口香糖，用冰块放在上面一会儿，使之冷冻收缩，然后轻轻刮起，再用湿抹布或用抹布蘸上适量的地板清洁剂擦拭。不可用强力酸碱液体清理复合木地板。\n','','','','');
INSERT INTO pw_tmsgs VALUES('4','0','127.0.0.1','1','','本机地址\r','','','	','1','1','最近几年在宁波地区，移门在家居的装饰中应用得越来越广泛。产品种类也越来越多，为消费者提供了更多的选择余地，但良莠不齐却会给消费者造成不同程度的损失。为此，我饰我家网总结了一些业内人士传授的选购技巧提供给大家。\n首先是滑轮，这也是最容易损坏的部位。\n一般装在移门底部。一个滑轮大概分两部分，一部分为轴承，另一部分为轴承外包层。轴承的好坏对移门的耐久性起关键作用，好的移门都采用进口轻钢滚珠轴承，且轴承上标明厂家及产品型号，轴承边上有标记的，外面那个钢套也应该有自己公司的一个标志。差的滚轮刚装时拉起来效果和好的也差不多(一般人感觉不出来)，但过了半年后就有明显区别。现在还有一种中心未采用轴承的滑轮，只是靠涂抹润滑油，通过机械磨擦来达到滑动效果，这样不但容易沾染灰尘，一旦油脂干燥，便会出现阻塞，无法滑动的现象。\n其次是边框的型材。\n边框型材厚度一般要达到1.2mm~1.5mm，这样移门最高可以做到2.8米，而且不会摇晃，比较稳固，壁厚如果小于1..2mm，如有些只有0.8mm或1.0mm的则最高只可做到2米以内，太高会摇晃，极易出现问题。\n最后要关注一下品牌。\n现在很多移门经销商都打着某某国进口，某某国技术的口号，让消费者目不暇接。这里特别强调，不要轻信所谓推荐产品，要看发证机关是否权威，尽量向商家索要检测报告，报告上应印有CMA国家认证的标志。\n好的移门如何判断呢，好的移门拉起来平滑，没有噪音，没有杂质，沉稳但轻滑，差的则有噪声，有种跳动感，可以多拉几扇门看看。\n','','','','');
INSERT INTO pw_tmsgs VALUES('5','0','127.0.0.1','1','','本机地址\r','','','	','1','1','橱柜行业目前也存在诸多 “ 伪洋品牌 ” 。更有业内行家大爆内幕，3种方法即可炮制出1个冠冕堂皇的洋家具品牌。\n标上了英文名字并且宣称是国外家具品牌后，一个本土生产的产品标价就可以飙升2倍！建材行业近期曝光的欧典地板事件曾引起业内强烈反响。\n调查：橱柜市场洋品牌满天飞\n  绝大多数家具品牌有着靓丽的洋名字，标榜进口的更不在少数：源自 “ 意大利 ” 美国 ” 西班牙 ” 德国 ” 等国家。而同一材质的产品差价，最大竟达到每延米 5000 元以上，整体厨房的差价更是高达 2 万～ 3 万元，尤其在外乡家具品牌与标榜 “ 进口 ” 家具品牌之间。延米是一个立体概念， 1 延米一般包括 700 厘米高的吊柜和 850 厘米高的地柜各 1 米。\n记者见到抽油烟机和燃气具都是某个从没听过的全英文品牌，一家整体厨房专卖店。价格均在 5000 元以上，促销员介绍说是欧洲排名第二的品牌，记者问排名第一的哪个，该促销员说：不知道，只关心这个品牌。\n内幕： 3种方法炮制“伪洋名牌 ”，目前一些橱柜的洋品牌通过以下几种手法在国内炮制进去的。\n方法一：局部进口代替全部进口\n一些橱柜号称 “ 全部进口 ” 实际上只是样品为进口产品，国内某品牌橱柜负责人陈先生透露。这类手法十分罕见。其实国外橱柜原材料由中国供货的不在少数，但一些商家却为获取更多利润而进行模仿。\n一些橱柜经销商竟利用名牌的存货做样品，据世界厨房博览会组委会相关负责人杜先生介绍。做少许改动欺骗消费者。由于品牌橱柜目前价格最低的也是每套3万元左右，其中的利润空间难以想象。\n杜先生透露，除此以外还有一些企业，从其他国家进口的产品也打出意大利、德国等橱柜强国的品牌。记者在一家没有标明进口地方的专卖店仔细检查，发现一款促销员宣称来自意大利的橱柜，打开柜门却发现有异味、柜门内面粗糙，没有烤漆。\n方法二：欧洲中低端产品在华就当“名牌”\n目前市面上部分所谓 “ 一流高档品牌 ” 欧洲是名不见经传的或者说是定位在中低档次的。\n许多所谓的国外“著名橱柜品牌”有两种手法：第一，花数千美元委托专业注册公司，德国、意大利等国注册一个空壳公司而已，其所有生产销售都在国内完成；第二，连注册的国外商标也没有，只是国内建个厂，引进一些设备，按国外某个规范生产，就宣称是原装进口”以高价出售。\n方法三：配件标个英文名价格竟可过万\n由于目前厨卫五金件市场洋品牌当道，一位经营过瑞士弗兰卡、德国铂浪高等国际知名厨卫五金件的商家负责人杜先生透露。人们崇洋心态仍然很严重，局部商家将普通配件谎称为进口品牌，这在高端厨房市场上格外严重。国内的一些知名品牌的配件如水槽、水龙头，据介绍。一般报价几百元，多者也不过上千元。但是洋品牌都是几千元，有的甚至上万元。目前市面上一个从欧洲进来的最低档次品牌的嵌入式冰箱，据透露。一个也能卖到4万～5万元。而抽油烟机标榜为意大利某名牌后，价格就升到 2 万多元。随着整体厨房概念的普及，据悉。目前很多消费者购买橱柜时，往往会让橱柜商协助配上电器、水槽、冰箱、水龙头等等。这类消费群已占到近 50% 急剧扩大厨房市场空间的同时，也在不知不觉中给配件牟取暴利者一个机会。\n国内橱柜品牌企业在努力提高实力，目前。例如科宝全面免费升级 E0 级，欧派积极建议制定行业规范等；大家电品牌诸如海尔、樱花、帅康、方太、华帝等也相继进入厨房产业。而且国内橱柜制造工艺逐渐与国际接轨。原创设计等方面，不过。国内品牌的确与国际水平还有一段距离。而且，有实力的橱柜厂家不多，能买得起高端设备更少，也吸引不了高素质人才为其创新。事实上，目前橱柜企业在香港特别行政区，乃至国外注册的不可胜数。一位企业老板无奈地告诉记者，因为很多政策对这些注册的企业是倾斜的橱柜行业出现 “ 造假 ” 很难避免的。一位国内橱柜行家认为。国内橱柜业在短期内很难跟上意大利的尖端设计和德国的精湛工艺，而为之 “ 买单 ” 无可防止的但这必将带动整个橱柜业的发展。\n好的烤漆资料换算过来也只是一延米 400 欧元 ( 约合人民币 4000 元 ) 但同样产品移到国内却能卖到最低 1.2 万元人民币每延米；而外乡品牌特高档次的同类产品也只在 5000 元人民币左右。国内某品牌橱柜广州负责人陈先生向记者算了一笔账：国外橱柜一般按柜体来算价格，许多橱柜品牌都并不追求规模生产，有些甚至限量生产，家庭作坊式很多，所以品牌也很多，比如意大利有特点的品牌就有近 3000 个，这也给了国内一些不良商家一个很好的冒充机会。 \n因此，宁波家居装修网在此提醒广大业主，在选购洋品牌的橱柜时要三思而行，量力而为。\n','','','','');
INSERT INTO pw_tmsgs VALUES('6','0','127.0.0.1','1','','本机地址\r','','','	','1','1','        地板市场的竞争越来越激烈，如何把握消费者的需求成为关键。以消费需求为出发点的定制化地板应运而生。\n\n　　国内地板经过25年的快速发展，市场不断趋向稳定与成熟，行业内的市场细分日益明显。价格上，从低端、中端到高端；风格上，从现代、时尚到仿古、简约；用途上，从儿童房地板、书房地板到桑拿房地板；功能上，从运动地板、静音地板到地热地板、生态地板等。可以说几乎在每一块细分市场内，都已经有地板品牌或是相应的产品，企业要想找出一块“空白市场”变得更加艰难。\n\n　　随着竞争的加剧，产品同质化，迫使地板企业寻求品牌的差异化定位，实行市场细分策略。福克斯营销专家认为：一个企业的资源是有限的，只有选择明确的消费群体作为目标市场（细分市场），进行合理地宣传推广，才能实现有效的营销突破。\n\n　　目标市场的细分，可以突破企业的营销瓶颈，发现新的利益增长点，并与其他品牌形成错位经营、差异化经营。福克斯首席咨询师柏林先生提出：“做品牌就是做差异”，有了差异，才可能在消费者心中逐渐树立品牌。目标细分市场的定位，前提条件是消费群体的特点和需求存在共性，并将这个共性进行归类、定义。市场细分可大可小，比如大自然的儿童地板，相对整个地板市场来说是细分产品，儿童地板又划分出童心、童画、童趣等更细分、更多个二级细分产品。但由于每一个地板消费者的需求各不相同，即便是有更多的细分市场，细分产品也将难以与日渐个性化的消费需求相匹配。由此，定制营销应运而生。定制营销，其实是企业实行市场细分的“终极版本”。\n\n　　在定制营销中，细分已经达到极限，每一位顾客都是一个细分市场，消费者根据自己的要求来设计想要的地板，企业根据消费者的设计要求来制造出个人的专属地板。\n\n地板定制的优势与局限\n\n　　西服定制、首饰定制、家具定制、跑车定制……定制化服务在欧美上流社会早已成为一种传统的服务方式。量身定制过去更多地适用于高档奢侈品，成为权力和富贵人士彰显身份的象征。不过现在，定制早已不是奢侈行业所特有。小到手机服务、纪念礼品，大到家具、住宅，定制营销逐渐渗透到各行各业，成为一种新的营销趋势。那么，定制营销对地板企业来说意义何在？\n\n　　首先，能有效减少企业库存积压。传统营销模式下，地板企业为了追求利润最大化，通过大规模生产来降低产品成本。一旦市场需求判断失误，必然导致产品的大规模滞销或积压，给企业带来巨大压力。定制营销是根据消费者的订单进行生产，实现“即需即供”，几乎没有库存，加速资金周转。\n\n　　其次，能满足消费者的个性需求。“地板市场将呈现由功能化逐步转向个性化发展的趋势，产品质量、耐磨性、防水性等技术手段已经非常成熟，地板逐步向设计风格、生活品位转变。”面对日渐多样化、个性化的消费需求，地板企业不可能无限延伸自己的产品线。定制营销，则让每个消费者的个性需求都得到满足，解决产品“销不对路”的问题。\n\n　　另外，能提高地板产品利润。销量可观，利润却很低，恶性竞争使行业利润急剧下滑。如何提高产品利润是危机下企业生存的关键。量身定制的地板产品，独一无二，真正切合顾客内心所需，寄托消费者的情感需求和个性化主张。因此，定制产品更适合于高端市场，并能为企业创造比常规产品更大的利润空间。\n\n　　与地板业相似的家具行业，其定制营销已有10年之久，消费者对定制家具的接受程度越来越高，市场前景巨大。在地板领域，定制营销还是一个新鲜话题。定制营销是否适用于地板行业？其适用的空间到底有多大？\n\n　　据悉，大自然推出的个性定制地板，其目标消费群体并不是高端消费人群，而是80后年轻消费者和儿童。究其原因，大自然认为，只有年轻人和儿童会去接受印有各种个性图案的地板。年长的人不会有这样新奇的尝试。因为在多数消费者眼中，地板只是一种地面铺装材料，而不是家居装饰的组成部分，因此也就不需要有个性化的元素。这种消费观念阻碍了地板行业定制营销的发展。\n\n　　相对于家具行业，地板定制营销的空间局限很大。消费者要个性化定制地板，企业需要从地板表面的图案花色和工艺进行创新。大自然的精彩地板，最大的卖点也就是为消费者量身定制地板表面的花色图案。地板毕竟不像立体化时尚家具产品，可以从颜色、材料、规格、空间等多角度、多层面提供个性化设计的构想。\n\n地板定制考验企业实力\n\n　　耗时两年、耗费3000万元，大自然地板的定制营销策略，似乎是志在必赢。即便是地板定制的市场接受程度不高，也存在一定的局限性。但假如大自然重磅推出的“精彩地板”，能够赢得“80后”和儿童消费市场，其商业潜力同样不可小觑，更何况“80后”以及儿童地板这个细分市场领域，目前并没有其它强势品牌深度进入。\n\n　　福克斯市场营销专家认为，地板定制营销最大的障碍，并不是市场本身的问题。定制营销需要企业从标准化生产向非标准化生产转型，带来生产方式、营销方式、管理方式的变革。\n\n　　规模化定制需要企业建立全新的经营管理模式，有别于标准化、流水线生产的传统经营管理模式。做少量定制地板，非常容易，但当企业要处理成千上万个不相同的定制产品时，就会变得非常复杂。\n\n　　定制营销要保证效率，缩短交货时间，假如顾客需要等待很长时间，定制营销的优势可能会大打折扣。定制服务可能会创造可观的利润，前提条件是企业要做好单位产品在原料、时间、人力等方面的成本控制。对于定制营销的企业来说，要兼顾好成本与效率的科学性和合理性。\n\n　　当企业得到大规模的定制订单，顾客的数据管理就提上日程，面积大小、规格尺寸、花色图案、拼接技术、交货时间，在数量庞杂的订单中，每一个消费者订单的信息都是不相同的，都是同等重要的。企业如何高效处理顾客需求信息，并优化自己的生产、管理与服务流程，是规模化订单生产企业的最大障碍。\n\n　　家具业走上定制营销的成功案例，可以为致力于定制服务的地板企业提供有益的参考。作为“定制家具”代表品牌的玛格，用三年时间开发出信息一体化管理体系，突破国内定制家具行业销售、设计、生产管理的瓶颈。亚洲最大的橱柜制造商欧派，就是定制营销模式的成功实践者，企业运用现代信息技术，使橱柜的生产和经营管理更加科学化和专业化，采购、订单、下单、生产、仓储、运输、销售、售后服务全部实现信息化。\n\n宁波的定制化地板才刚刚登场，未来的路还很长。','','','','');
INSERT INTO pw_tmsgs VALUES('7','0','127.0.0.1','1','','本机地址\r','','','	','1','1','壁纸卷边是很让人烦恼的一件事，那么有没有办法解决呢？其实选购壁纸时依据其材质，我们可以挑选出相对不易卷边的壁纸——\n\n\n不卷边壁纸的关键是材质，壁纸的材质主要分为两大类：PVC材料和纯纸材料的壁纸。一般情况下，PVC材料的壁纸比较容易卷边。 \n这是因为PVC材料的壁纸是由PVC材料和纸基组成，这种壁纸触摸起来有较强的质感，但因为它是分层的，纸基由于各种原因，在粘贴到墙上后会部分膨胀，而纸面的PVC材料不会因水而膨胀，于是，纸基向外膨胀而纸面不同时膨胀，因此就容易引起卷边。 \n同时，PVC材料的壁纸随温度的变化而伸缩性比较大，而纸基随温度的变化比较小，这也容易造成PVC材料的卷边。另外，由于PVC材料的壁纸不透气，墙体和施工过程中的水分都捂在了里面，就像穿了一件塑料衣服，一旦条件合适就容易产生气泡和霉变。 \n纯天然材料的加强木浆和木纤维壁纸，其纸面和纸基都是由木材和木纤维组成，其随水和温度的变化一致，而且这种材质的壁纸透气性能也相当好，能将墙体和施工过程中的水分自然地排到外面而燥，因此不容易卷边，而且也不会因为天气潮湿而产生气泡和霉变。\n','','','','');
INSERT INTO pw_tmsgs VALUES('8','0','127.0.0.1','1','','本机地址\r','','','	','1','1','  外墙是建筑物最外层起围护和承重作用的结构。随着框架结构的普遍应用，其围护作用越来越突出。通过在外墙表面涂刷彩色建筑、粘贴饰面或铺挂石材面层等方法，可使建筑物具有和美化环境的作用。近几年来，我国建筑物外墙渗漏水问题呈上升趋势，造成了多方面的影响。外墙渗漏水治理也成为摆在我们面前的一个急待解决的问题。　 \n\n  外墙渗漏严重降低工程结构的耐久性、安全性，其原因是砼中存在空隙裂缝，砌体的块材和砂浆中也存在空隙和裂缝，外墙渗漏后，水进入其中，如遇气温降至零度以下，则水结成冰，其体积膨胀约90%，将直接挤压材料，致使材料表层剥蚀；同时内部剩余水被挤压，使材料内部也产生压应力，从而引发裂缝，或致使裂缝进一步扩展，这种现象称之为冻蚀。材料的孔隙率越大、裂缝越多、含水量越大及湿度越低，则冻蚀越严重。随着使用年限的增加，冻蚀也越来越严重。冻蚀的结果导致材料的截面不断减小及裂缝不断增多增宽增长，材料的承载能力也不断下降。　 \n外墙渗漏根据其渗漏原因可划分为两种：　 \n（－）设计因素导致的渗漏　 \n1）很多设计人员不重视细部大样设计，如窗台坡度、鹰嘴、滴水槽、穿墙管、外墙预埋管件、、幕墙与墙体间的接缝等，在这些方面设计时简而化之。　 \n2）为美观而将外墙饰面砖（小型）设计成细缝拼接，使砖与砖之间不能嵌填密封材料，导致漏水。　 \n3）设计中忽略了不同材料界面连接。如外墙设计层层线条，且线条顶部标高与梁顶标高相同，由于外墙面砖与砼梁的湿度膨胀系数相差很大，极易产生裂缝，从而使线条上部渗水。同样原因，女儿墙根部往往也较易开裂渗水。　 \n4）高层建筑非承重墙用的砌筑、找平砂浆标号，一般低于承重墙用的设计标号，强度虽能满足设计要求，但透水性增大。　 \n5）建筑师在设计中对外墙防水不重视，外墙装门面设计没有防水概念及功能设定，从而对建筑物的功能系数大打折扣。　 \n（二）材料因素导致渗漏　 \n  块材质量差、翘曲、变形，防水、防水密封材料等质量不合格，饰面材料缺角破损，铝合金材质不合格、加工制作质量差等，直接影响工程质量。','','','','');
INSERT INTO pw_tmsgs VALUES('9','0','127.0.0.1','1','','本机地址\r','','','	','1','1','八宅基阳宅三要分为门、主、灶。\nA、门：是指宅的大门，门乃进出之路，气口也，以小太极论之。房门、厨房门、厕所门等，所有的门皆有动气，故影响人生之祸福。因为风水重点论述吉与凶重于动、吉者动则吉上加吉、凶者动则凶祸更烈！\nB、主：是指宅主居住的卧房，及客厅。而有些派别则是以宅命，即是宅的坐山宫位为主。\nC、灶：是指厨房的位置。不是仅以厨房的灶位而言之。\n总论：阳宅先看大门，次看主房门，至于厨灶乃养生之所，所关甚大，第一与门相生，其次与业主主相生。须要门主灶三者，各得其所，生主，主生灶，灶生门，三者互生无克或相比和又合宅主之生命之福元，则人丁大寿，福寿双全。如阳宅三要门主灶宫位五行呈相克者，此阳宅则易遭，凶而不吉。\n三运：天运、地运、人运，无论风水调整、预测咨询、择日用事、起名改运都是以人为中心，即人运，按照“三运五步” 全套风水设计，结合天/地/人三运，进行的五步设计，从选地（装修准备）开始，一直到搬家入住结束。\n','','','','');
INSERT INTO pw_tmsgs VALUES('10','0','127.0.0.1','1','','本机地址\r','','','	','2','1','[align=left]  大理石是一种高档的装饰材料，选购时必须慎重，以免浪费金钱。而稍有经验的石材从业人员都知道，石材作为一种天然材料，受到地球物理及化学变化的影响，加上开采加工等诸多因素的影响，同种产品的质量差别较大，相对对其它传统行业产品而言，现场评估十分重要。而鉴别大理石外观质量可从下面几项从手。 [/align][align=left]（1）判定花纹色调 [/align][align=left]　　在光线充足的条件下，将已选好的板材和同一批其它要选购 的大理石板材同时平放在地上，站在距离它们1．5m处仔细目测。 要求同一批大理石板材的花纹色调应基本调和。 [/align][align=left]（2）检查表面缺陷 [/align][align=left]　　在光线充足的条件下，将板材平放在地面上，站在距离大理石板材lm处观察看不见的缺陷认为没有缺陷；站在距板材lm处可见而在1．5m处不明显的缺陷为无明显缺陷；站在距板材1.5m处明显见的缺陷认为有缺陷。 [/align][align=left]　　具体观察的缺陷有板材翘曲；板材表面上有无裂纹、砂眼、异色斑点、污点及凹陷现象存在。若判定以上几种缺陷没有则板材为优等品，同时板材正面不许有缺棱掉角缺陷；如果以上各项缺陷不明显同时也没有明显的缺棱掉角，那么可以认定这块板材为一级品；如果有那几项缺陷但又不影响使用，并且板材正面只有1处长不大于8mm，宽不大于3mm缺棱或长、宽都不大于3mm掉角，则可判断该板材为合格品。 [/align][align=left]　　板材在运输、装卸过程中而碰坏的，可以进行粘结（针对破裂 板材）或修补（针对棱角缺陷、表面的坑洼或麻点）。但是粘结、修补后正面不允许有明显痕迹，颜色要与正面花色接近。 [/align][align=left]（3）查看标记 [/align][align=left]　　大理石板材的标记顺序为：命名、分类、规格尺寸、等级、标准 [/align][align=left]　　大理石板材命名顺序为：荒料产地地名、花纹色调特征名称、 大理石（代号为M）。 [/align]　　大理石板材分为两大类：普型板材（代号为N）：为正方形或长方形板材；异型板材（代号为S）：为其它形状的板材。 大理石板材有三个等级：优等品（代号为A），一等品（代号为 B）和合格品（代号为C）。等级划分依据是板材的规格尺寸允许偏差、平面度允许极限公差、角度允许极限公差、外观质量和镜面光泽度。 例如用北京房山的白色大理石荒料生产的普型规格尺寸为 600mmX 400mmX 20mm的一等品板材的命名为：房山汉白玉大理石，标记为：房山汉白玉（M）N 600X400X20BJC79 大理石板材在出厂时应注明：生产厂名、商标、标记。 所以通过查看标记，可以对板材的总体外观质量有所了解。 ','','','','');
INSERT INTO pw_tmsgs VALUES('11','0','127.0.0.1','1','','本机地址\r','','','	','1','1','近年来，墙壁装饰材料中的乳胶漆越来越受到消费者的欢迎。市面上各式各样的乳胶漆品牌非常多，令消费者面对林林总总的乳胶漆一时不知如何挑选。于是厂家在广告宣传方面各显神通，有的标榜自己是环保产品；有的声称可兑水超过１００％；有的宣传自己产品附着力超强，无须进行底材处理可直接涂刷；也有的以自己的产品耐洗刷超过多少次作为卖点……个别厂家甚至不惜误导消费者选购自己的产品。那怎样挑选到品质好的乳胶漆呢？ \n\n其实，选择乳胶漆有几个关键点： \n\n首先，是可洗擦。因为墙面容易弄脏，有小孩的家庭更会为涂鸦而伤透脑筋。含防水配方的乳胶漆在干透后，会自然形成一层致密的防水漆面。您用清水或温和的清洁剂，就能非常轻易地把污渍抹洗干净，而又不会抹掉漆膜本身。市面上出售的乳胶漆，只要是正规厂家生产、符合国标规定的防水乳胶漆就有这一功能。有些厂家特别提出耐洗刷次数超过国家标准数倍，其实这对于一般家庭没有多大意义，国家标准的规定已经完全能满足家庭装修的要求。 \n\n其次，是乳胶漆的防潮防霉功能。您家里的墙面有否发生因为过于潮湿而导致的长霉的情形。在地下室、浴室中，或者在潮湿天气时这点尤其突出。防霉、防潮配方的乳胶漆能有效阻隔水分对墙体及墙面的侵袭，防止水分渗透，杜绝霉菌滋长。 \n\n漆面持久不易褪色、脱落，是消费者在挑选乳胶漆时应该注意的又一项要点，一般来说，乳胶漆能保持３—５年崭新亮丽，就比较符合家庭的要求。\n\n另外，大家最关心的是乳胶漆是否真正无毒、安全和环保。这里可以告诉大家乳胶漆的主要成分是无毒性的树脂和水，不含铅、汞成分。在涂刷过程中不会产生刺激性气味，不会对人体、生物及周围环境造成危害。不过您一定要购买那些标有生产厂家、生产日期和保质期，以及注明无铅无汞标识的乳胶漆产品。\n\n最后，提醒大家在挑选购买乳胶漆的时候，不要过于迷信一些厂家宣传的技术指标，只要是符合国家标准的产品，能适合您在施工、颜色方面的需要，就能对您的家居墙体起装饰美化作用。','','','','');
INSERT INTO pw_tmsgs VALUES('12','0','127.0.0.1','1','','本机地址\r','','','	','2','1','[b]高科技卫浴渐入佳境[/b]\n一些陶瓷国际大牌在强化其设计的优势外，今年将继续在功能上凸显科技含量，其中节水性能便是竞争的重点。而本土一些领先洁具企业则在五金配件、淋浴房、浴室家具等其他配套产品上满足人们多层次的需求。如倡导“休闲卫浴文化”的某品牌发布多款2008时尚新品，智能型触摸式LCD、按摩浴缸、恒温技术花洒以及外置万向TV系统，让人充分感受洁具的享乐性。\n[b]木地板浅色系唱主角[/b]\n“2009年的木地板将会以浅色系为主，来自俄罗斯的枫木和橡木会更多出现在各大品牌的新品中。”据某知名地板品牌一位负责人介绍，随着木材资源的稀缺，原先来自南美洲的香脂木豆、重蚁木和来自非洲的圆盘豆、非洲格木等价格一路走高，中深色系的木地板出现减少趋势。“以前木地板的颜色取决装修风格，现在可能出现原材料改变装修风格。”\n而基于成本和稳定性考虑，原来在宁波最盛行的实木地板也将由原来18厘厚减至9厘厚。此外，具有凹凸浮雕效果的拉丝或手工制成复古地板，因迎合自然回归的心态将继续受到市场的青睐。在同种木材产品，各大品牌地板将在加工、铺装上更强调艺术性的表现，如营销以多变的造型和图案的拼花设计以及凸显耐磨、耐刮的环保油漆。\n[b]橱柜功能配件增多[/b]\n紧张的生活使人们要求生活简单、明净，因此简约成为人们青睐的风格。流畅的直线条、去掉所有不需要的装饰，呈现出明快、现代、含蓄却有力的表现很好地迎合了人们的心理需求。此外，“有如近几年服装中出现混搭、中性等多种元素综合的潮流，极简之后，复古的风潮会越来越盛。”某知名橱柜品牌负责人认为， “在年轻古典成为厨柜风格流行亮点后，2009年古典元素会越来越成为人们青睐的风格。”\n“厨房中高科技的亮点会越来越成为人们对厨房完美化的支点。”设计师对五金、电器的巧思构想，使厨房更具娱乐性、趣味性，也是展示自己创意空间的舞台。就像节省厨房空间的拉篮，造型独特的水龙头、便捷人性化的水盆、沥水篮、垃圾处理器等。“电器的智能化、创意不断的小家电等，都将成为2009年厨房中各商家大显身手的阵地。”厨房已不再局限于厨柜，它已变成脱离裹腹之外的生活娱乐空间。\n','','','','');
INSERT INTO pw_tmsgs VALUES('13','0','127.0.0.1','1','','本机地址\r','','','	','2','1','玻璃搁板很重要，质量一定要好。\n双杆毛巾架不实用，首先不要买双杆毛巾架，买的时候可能觉得双杆的好看，而且挂的毛巾也可以多两条，但实际用起来并不是这么回事，不同用途的毛巾不能挂在一起，也就是说一个毛巾架上也就是挂两条毛巾，多出来的另一根杆用不着，还是一根杆的实用。\n洗脸盆和龙头的尺寸要配套，否则后患无穷。\n卫生间中放化妆品的玻璃搁板要买质量好的，否则洗澡时，沐浴露放在玻璃上，玻璃的夹子质量差松掉的话，玻璃会整个砸了下来。卫生间的柜子可以到橱具公司定做，不过要做下面有金属脚悬空的，否则以后漏水了不好修，平时打扫也方便。卫生间一定要做防水，包括地面、墙壁。\n\n腰线和花砖要事先想好卫[color=#000000]生间瓷砖有腰线和花砖的要事先想好[/color]，将来其他东西装好了不要挡住或冲突。如果是在尺寸没量好的情况下铺装的，装台盆时才发现腰线贴低了，只好把台盆的腿锯短。\n坡度大些水能迅速跑干净不要因为卫生间是小地方就不重视地面，一定要铺好的瓷砖。卫生间地面的坡度要在铺砖之前考虑好，按照国标的坡度并不能够达到迅速排水的效果，而且如果你用了防臭地漏或者超薄地漏，将会大大增加排水的困难。\n瓷砖添缝剂用色粉配颜色的话最好先调试一点看一下，再决定用量，否则不是太浅就是太深。\n','','','','');
INSERT INTO pw_tmsgs VALUES('14','0','127.0.0.1','1','','本机地址\r','','','	','2','1','[b]全方位创意收纳\n[/b]\n利用一切可利用的角落，创造灵活多变的收纳空间，是这一阶段儿童房设计侧重的方向。创造整洁的空间环境，既可以加深孩子收纳的意识，又给予了他们更多自由嬉戏的空间。\n \n[b]收纳靠墙 玩乐居中\n[/b]\n尽一切努力提高空间的使用率，给宝宝充足的地面玩乐空间，而不要让大床占据房间的中心位置。为了达成这一目标，主人定做了一张稍大的单人床，贴墙放在窗户的遮阳棚下方。具有多层收纳格的储藏柜则放在床的两端，合适的高度还可使其充当床头柜，床下面是大而深的抽屉，给衣服和玩具充足的收纳空间。\n\n[b]建筑边角 巧设柜橱\n[/b]\n折叠双开门和入墙式设计，使曾经不太好用的阁楼角落变得具有个性且功能强大。门把手是漂亮的天蓝色陶瓷材质，富有童趣。在窗前还量身定制了一个靠窗的座椅，配上同花色的窗帘和坐垫，给收纳间增加了休憩的功能。座位下是两个深抽屉，强大的收纳空间。上下平行的高低挂衣杆，充分利用纵向空间收纳。\n[b]细节亮点：\n[/b]\n1.玩具般的置物架\n \n模拟厨房灶台的置物架让人分不清是玩具还是家具，但满足孩子过家家的兴致，也能帮助孩子学习如何把玩具归类。\n \n2.布料储物篮\n \n柔软面料的储物篮，细心呵护孩子的衣物，篮筐外侧附上可爱的标识牌，吸引孩子自己收纳整理的兴趣。\n \n3.一物两用的抽屉\n \n定制的床架最大的特点就是抽屉为独立的带滑轮装置，将床下进深较大这部分空间高效合理地利用起来。将抽屉整个外拉放上床垫，就是一张机动的客床。\n','','','','');
INSERT INTO pw_tmsgs VALUES('15','0','127.0.0.1','1','','本机地址\r','','','	','1','1','一、建筑装修吉凶划分影响\n1、户门[伏位]位置吉祥，布局合格，利财运，此处冲起官非，不利男性工作；\n2、东北[天医]卧室位置吉祥，床靠东北摆设；\n3、东南[祸害]卧室位置凶煞，不利女性健康，易有肝胆方面病应；\n4、厨房[伏位]位置吉祥，不利男性健康，头部易有病，注意控制安灶时间；\n5、客厅[延年]位置吉祥，重点布局，收门口财气息为用；\n6、其他区域参考立极图及下面说明，此处略。\n[生气]丁财两旺，身体健康，家庭和顺，事业发达，男聪女秀。\n[延年]丁财两旺，身体健康，多利老人，少女少男，延年益寿。\n[天乙]天医之意，身体健康，心地慈善，最利财禄，后丁不续。\n[绝命]横伤人命，横祸怪灾，邪魔为殃，绝症重病，不利婚姻。\n[五鬼]生而得势，发凶最快。失火失盗，官司牢狱，重则伤人。\n[六煞]水主流荡，漂移不稳。不务正业，口舌争执，作风不好。\n[祸害]冰冻之土，阴盛阳衰，不利生育，易生疾病，孤寡贫穷。\n伏位不论吉凶，绝命最霸道，五鬼发凶最快。六煞状态不稳定，祸害不发展。\n\n二、家居风水设计颜色喜好\n1、红色椭圆表示此范围装修喜用红色；\n2、蓝色椭圆表示此范围装修喜用蓝色；\n3、黄色椭圆表示此范围装修喜用黄色；\n4、绿色椭圆表示此范围装修喜用绿色；\n5、黑色椭圆表示此范围装修喜用白色。\n\n三、财、官、文贵位\n财位：维护利于财运，放置植物/根雕等物品；\n官位：维护利于工作，放置植物/根雕等物品；\n文昌：维护利于读书，放置水晶/玉石等物品。\n备注：此仅是依据平面，寻得贵位，其维护，需要放置植物/水晶/金属装饰物品等，视不同情况来定。\n','','','','');
INSERT INTO pw_tmsgs VALUES('16','0','127.0.0.1','1','','本机地址\r','','','	','1','1','1、看宣传资料：正规的公司宣传资料是一本以装订本形式的开拓录。它有标准的LOGO及注册商标R。一般包括整个公司的厂房介绍、生产设备介绍、生产能力、设计能力、样品展示、材料种类及其性能的介绍、服务承诺等，最主要的是对公司的橱柜根据各个档次价格公开，真正做到“公开报价，明白消费”。\n2、看外表质感：门板必须无高低起伏状态，门缝必须整齐划一，间隙大小统一。门板开启自如。抽屉进出无噪音。台面颜色无色差，无拼缝。\n3、看是否有爆边：看门板有无爆边现象。打开柜门看层板是否有调节孔，层板的调节孔一般整齐划一，孔的四周无爆口现象。正规厂家备有专业开槽机，槽口两边光滑整洁，无爆边现象。\n4、看侧面修边部分：侧面修边部分颜色是否与正面一致、封边部分有没有油性擦过的痕迹，因为劣质封边条修出来的边，如果用油擦过就会封闭细孔。\n5、看吊柜吊码：一般要询问吊柜吊码是否可调节，正规厂家都是采用吊码安装法，柜体装上之后，高低及左右都可以适当调节。柜体拆卸，螺钉一扣就了事，而且柜体内也相当整洁。\n','','','','');
INSERT INTO pw_tmsgs VALUES('17','0','127.0.0.1','1','','本机地址\r','','','	','2','1','[align=left]现今石材有很多类型，石材在订购后即加工为某种类型。以下例出石材表面的六种主要类型： [/align][align=left]1.研磨[/align][align=left]　　表面平整，有细微光泽，可选择不同的光泽度。表面非常平滑，但是多孔。在人行很多的地方这种表面很常见。因为研磨的地板孔径大，应总是使用渗透密封剂。研磨石材的颜色不如抛光表面鲜明。[/align][align=left]2.抛光[/align][align=left]　　表面有光泽，经过一段时间就会因行人太多和养护不当而失去光泽。这种表面平滑而少孔。抛光后晶体的反射产生绚丽色彩，显现出天然石材的矿物颗粒，光泽就是来自于石材晶体的自然反射。在生产中使用抛光砖和抛光粉而形成抛光面，光泽不是涂料产生的。[/align][align=left]3.火烧[/align][align=left]　　表面粗糙，在高温下形成。生产时对石材加热，晶体爆裂，因而表面粗糙。表面多孔，必须用渗透密封剂。[/align][align=left]4.翻滚[/align][align=left]　　表面有点粗糙，通过将大理石、石灰石有时还有花岗岩的碎片在容器内翻滚，变成古旧的样子。经常需要使用石材增色剂使颜色更鲜明。[/align][align=left]5.喷砂[/align][align=left]　　用砂和水的高压射流将砂子喷到石材上，形成有光泽但不光滑的表面。[/align][align=left]6.剁斧[/align][align=left]　　通过锤打，形成表面纹理，可选择粗糙程度。 [/align]','','','','');
INSERT INTO pw_tmsgs VALUES('18','0','127.0.0.1','1','','本机地址\r','','','	','1','1','1、家居风水设计程序\n提供资料（现场勘察）→核兑资料→设计[主]方案→装修准备阶段风水设计→资料装修过程风水设计→搬家入火风水设计→提供流年崔旺避煞布局（连续9年）\n2、家居风水设计内容\n第一步：八卦预测\n《求真》云“古人卜宅卜吉，先谋人事后行”古师看地用事之前，都会起卦预测，先预知事情吉凶及问题所在的[枢纽点]，而后在进行现场勘察。\n本步主要依据古法先天易数结合星卦流年，起卦预测，对福主进行本年流年解析，详析本年整体运势及注意化解要点，预测住宅吉凶，做好布局做准备工作；\n第二步：行峦详析\n“体无用则不验，用无体则不查”，说明周围环境和气息变化要点，“理气无真，形峦无假”一句说破风水布局关键点所在——周围环境好坏的至关作用。\n详析周围环境形式，辨明砂水生旺休囚，详析外面环境理法，分解砂水旺衰运退，详析建筑位置关系，找到布局关键提要；\n第三步：四柱八字\n“有人识得其中妙，朝是凡人暮是仙”，其中四柱八字作为古文化之精髓，已经逐步被现代人认识和接受。\n本步骤依据福主四柱八字，对运势进行剖析，并提出改善运势合理建议（每案一例）；\n第四步：名字解析\n好马需要配好鞍，好命仍需好名伴，本步骤结合“一义三理”理论，根据福主基础资料，进行姓名解析，分析姓名中缺点和不足（每案一例）。\n第五步：风水设计\n1、风水设计；\n2、煞位调整；\n3、贵位维护；\n4、择日用事；\n5、流年布局。','','','','');
INSERT INTO pw_tmsgs VALUES('19','0','127.0.0.1','1','','本机地址\r','','','	','1','1','  随着近些年生活条件的改善，生活质量的提高，一个孩子拥有一间属于自己的卧室，已成为寻常的现象。然而，对于卧室内的陈设，很多父母并不清楚怎样放置更妥当。，俗话说，福人居福地。每个家长都希望自己的子女有“福气”，成为“福人”。\n\n\n那么，就卧室内的陈设而言，到底应当如何安置呢？现在就告诉你这个“风水秘籍”：\n1.孩子床位、书桌不可放在阳台水池假山之下--读书不专心；\n2.孩子床位不可放在神厅、神位之正下方--易做噩梦；\n3.孩子床位、书桌之右方不可有马达转动--书读不下去；\n4.孩子之床头上不可有冷气、抽风机在转动--头晕耳痛；\n5.孩子之床头不可靠在厕所马桶之前后--在家待不住；\n6.孩子之书桌椅子的坐位不可靠坐在厕所马桶前后--易多梦；\n7.孩子之书桌前最好不要有高物压迫--头痛；\n8.孩子卧室光线应该充足，不可昏暗--书才读得好；\n9.孩子卧室窗帘颜色忌粉红、大红、深黑色--读书不专心、多幻想；\n10.孩子床位脚部不可正冲门--脚容易酸疼； \n11.孩子床位脚部不可正冲马桶--易看色情书；\n12.孩子床位头部不正冲、左右冲房门--睡不安宁；\n13.孩子书桌不可正向屋外屋脊或电杆、壁刀角--头痛或开刀；\n14.孩子书桌不可面向屋外巷冲路或冲水塔--读书不专心；\n15.孩子书桌、床位不可在水塔之下方--居家不安、待不住； \n16.孩子书桌、床位不可在马达机器转动之处--主头疼、没精神；\n17.孩子卧室墙壁不可贴太花乱的壁纸--喜爱玩乐；\n18.孩子卧室墙壁不可贴奇形怪状的动物画像--易做怪梦；\n19.孩子卧室墙壁不可贴武士战斗之图--避免孩子心灵上产生好斗、狠恨之心态；\n20.孩子我是地板不可铺深红色地毯--好动不安、暴躁；\n21.孩子卧室地板不可铺长毛地毯--易染支气管疾病或皮肤过敏；\n22.孩子卧室墙上不可漆粉红色--导致个性暴躁不安、易看色情物；\n23.孩子卧室应尽量整理清洁整齐--否则易养成散乱之习性；\n24.孩子书桌背后及左右不可冲门--不爱读书；\n25.孩子书桌不可面向厕所--书读不下去；\n26.孩子卧室之动物、玩偶的眼睛如有损坏应丢弃--易中邪；\n27.孩子我是天花板应以乳白色为佳，不可暗--若暗，则无精神，多损耗；\n28.孩子卧室天花板不可装潢纵横木--眼花缭乱；\n29.孩子卧室天花板不可悬吊各种怪饰物--半夜惊吓；\n30.孩子卧室不可悬挂太多风铃--易使精神衰弱。\n以上仅供各位家长参考，根据自己家的实际情况来来布置孩子的卧室风水吧。\n','','','','');
INSERT INTO pw_tmsgs VALUES('20','0','127.0.0.1','1','','本机地址\r','','','	','1','1','阳台是很多业主在装修时不太重视的一块，其实它是建筑物装饰室内的延伸，是室内空间与外部空间相联系的重要空间，是主人娱乐、晾晒衣物、观赏风景、栽种盆景的其中的一个地方。足不出户，就能与大自然交流情感。这一方小小天地，我们应该很好的利用和美化。\n装修阳台到底有什么关键点呢？材料上有什么特点呢？\n首先，是阳台装修的封装材料。阳台封装的材料主要有两种：一种是铝合金，一种是塑钢型材。铝合金是目前装饰装修中采用较多的材料，产品质量很好，装饰施工工艺比较成熟和方便。塑钢型材是刚刚兴起的一种装饰装修材料，相比较而言，塑钢门窗其保温隔热性能以及隔音降噪性能比铝合金的都要高出很多，而成本却只有铝合金材料的10%左右。使用密闭性能好的塑钢门窗，可以节省接近一半的能源，并可以使室内噪音降三分之一，维持在30分贝左右。\n其次，是阳台装修的地面材料。如果阳台不做封装，可以使用防水性能好的防滑瓷砖；如果封装了阳台，就可以使用同室内一样地面装饰材料不过还是建议首选防滑地砖，因为可以方便在阳台晾晒衣服。\n最后，是阳台装饰装修的墙壁和吊顶材料。如果阳台不封装，则可以使用外墙涂料；如果阳台要封装，就可以使用内墙乳胶漆涂料。此外，装饰阳台时，应特别注意安全。阳台一般是悬挑于楼外的，经不起太大的重量和猛烈的撞击，不能在阳台上堆放过于笨重的杂物。不要在阳台上作过激烈，或者过于频繁的运动，一面有危险发生。\n','','','','');
INSERT INTO pw_tmsgs VALUES('21','0','127.0.0.1','1','','本机地址\r','','','	','1','1','经常有装修业主问我们：在装修简装房是，刷墙漆时要不要先刮掉原有的墙面？\n首先要明确什么是简装房，它就是我们通常说的四白落地，安装了开关，以及简单的灯具和暖气等。\n目前有更多的业主买的新房就是简装房，开发商已经给刮了瓷，但是有些业主想在墙上装修刷墙漆，然而，还用不用把瓷去掉，在刮腻子啊？有的说不用刮，有的说得刮去，最后搞的业主都不知道怎么装修好了。\n那么最合适的做法是怎样的呢？\n第一，要判断墙要不要刮，你先用手摸一下原墙面的涂料，如果说有很多涂料会沾在手上或者掉落非常明显的（最常见的就是你穿着衣服擦着墙，就蹭到衣服上了，搞的衣服很脏，而且不好洗的这种情况），那可以肯定的说，这是一定需要刮掉原墙涂层的。如果没有这些状况的话，则可以按照装修业主自己喜好决定。\n但是，问题是，如果在装修的时候，原墙面不刮除的话，那么装修后，在对于墙面的保养、保质等方面来说是有很大影响的。在以后的居住生活中墙面有可能会脱落。所以，建议刮掉原墙面涂层。\n但是，刮掉也是很不容易，专业人士建议你将原墙面打毛后再刮腻子，可以事半功倍。','','','','');
INSERT INTO pw_tmsgs VALUES('22','0','127.0.0.1','1','','本机地址\r','','','	','1','1','高温天气来临，家用电器损坏率明显提高。最近几年电视机、空调器的损坏率大幅增长，主要就是于在炎热天气下使用不当，导致家电积热元件老化造成的。\n空调器：空调器制冷范围在20℃～28℃之间，白天气温较高，不宜多用。这样可以减轻空调器的工作强度。空调器安装距地面1.8米为宜，以保证空气通畅散热。此外，有些用户为空调器外机安装雨棚，甚至为遮风避雨，把出风口挡掉一部分，也会影响空调散热。\n电视机：夏季不宜长时间收看，否则易造成热量堆积，加快元件老化。一般来说，收看3.5小时，就该关机0.5小时，让电视机休息。同时不要频繁地开头电视机，要定期给电视机除尘。\n\n电冰箱：多次开门会造成压缩机频繁启动，使电机电流高于额定值5-7倍，以致损坏压缩机。同时要注意让冰箱保持与墙壁不少于0.5米的间距，以保证箱体周围空气流畅并利于冰箱散热。电风扇：使用电风扇，应常在油眼中加入数滴机油，以保证润滑转动。电风扇在通风干燥处，可防止潮湿导致绝缘性能下降，造成不安全隐患。\n','','','','');
INSERT INTO pw_tmsgs VALUES('23','0','127.0.0.1','1','','本机地址\r','','','	','1','1','       也许你挥不出铿锵有力的书法，也许你描不出五彩斑斓的画面，也许你谱不出沁人心脾的旋律，也许你舞不出柔美轻盈的步伐，也许你刻不出巧夺天工雕塑。但，你可以拥有只属于自己的海市蜃楼。 \n　　大约在十四、五世纪初期时，伴随着宗教的发展，出现了在墙壁上绘制了各类宗教图案类的绘画方式，这种方式所绘制的图案一般都是宗教的题材，以装饰教堂等教会所属的建筑，从而增加建筑和环境的严肃和神圣性。在古埃及，艺术家会在墙壁和柱子上雕刻各种的花纹作为装饰，其中这些装饰很多是记录居所主人的生平，以及记录各种神话故事，为埃及最初的墙绘艺术。 \n　　在中国的西藏，人们把佛祖绘制在墙上以及唐卡（一种以牛皮制作的装饰物）上，以驱除邪恶祈求平安。在各国家各宗教中，都有在墙壁上雕刻，绘画的记录，这些记录着宗教和当时生活情况的壁画，便是现今的墙绘艺术品。上世纪60年代，美国的费城和宾夕法尼亚州出现涂鸦文化（graffiti），从简单地书写tag和门牌等字母与数字的组合，到上世纪70年代前期开始在字型、效果等的钻研，近40年的发展已经让涂鸦走出美国的墙角，成为全球性的艺术创作。\n　　当涂鸦风靡全球，成为一种时尚的时候，这股风潮开始席卷家居领域，比较常见有手绘的家具、瓷砖、饰品、布艺。现在墙绘开始在家居装饰中频频上演。现代生活中，我们越来越追求优雅的姿态和高尚的品位，我们呼唤自由不羁，彰显个性。墙绘让我们的墙面不再拘泥于某一种整体风格，它的表现方式多种多样。卫生间想要卡通？厨房想要写实？卧室想要写意？客厅想要古风？墙绘艺术通通帮你一一实现。如今已经有更多的人接受这种艺术，甚至亲自动手，实现别具一格，个性十足的美好家园。','','','','');
INSERT INTO pw_tmsgs VALUES('24','0','127.0.0.1','1','','本机地址\r','','','	','1','1','装修时如何挑选玻化抛光砖？\n首先，敲击瓷砖后听其发出的声音：如果声音清脆的，表示瓷砖的质地密度高；\n其次，检查是否有边角缺损和色差，砂眼等。\n第三，同样重量的玻化砖从侧面看砖体比较薄的质量好。\n还有就是质量好的玻化砖亮度比较高，最后还要看它的吸水率，品质高的瓷砖，吸水率很低，可以用水滴在瓷砖的背面，数分钟后观察水滴的扩散程度。瓷砖不吸水，即表示吸水率低，品质较佳。\n \n亚光砖的选购方法比较简单，掂一下砖的轻重，同样尺寸的砖，重的要比轻的好。好砖的手感也比较好，砖面细腻、光滑，而不好的砖，表面粗糙，完全可以用手感觉得到。\n另外，现在市场上流行的仿古砖，也有其特殊的选购方法：用铁钉在砖的表面划一下，质量好的砖不会留下痕迹，但是不要拿钥匙划，因为它含有铝，会产生反效果。然后，把四块砖平放在地面上进行拼合，看是否有缝隙，是否平整。还要看它的尺寸和颜色是否符合标准，一般来说，颜色正的仿古砖，质量要比较好。\n','','','','');
INSERT INTO pw_tmsgs VALUES('25','0','127.0.0.1','1','','本机地址\r','','','	','1','1','首先，不要轻信一些涂料厂商宣传的“无苯”涂料之说，即使是国家认证的“达标涂料”、“环保涂料”或“绿色涂料”，也含有VOC等物质，但是只要在限量范围之内，就不足以对人体造成太大的伤害，所以，消费者心中应该清楚国家关于有害物质的限量标准。\n其次，不要迷信涂料包装上的“绿色”二字，要认真看清楚产品的质量合格检测报告；观察铁桶的接缝处有没有锈蚀、渗漏现象；注意铁桶上的明示标志是否齐全。对于进口涂料，最好选择有中文标志及说明的产品。\n另外，非环保型的涂料，由于VOC、甲醛等有害物质超标，大多有刺鼻的异味，使人恶心、头晕等，因此，消费者购买时如果闻到刺激性气味，那么就需要谨慎选择。\n最后，购买涂料时不要贪图便宜，一定要选择知名品牌的产品，这样才能保证自身和家人的使用安全。也不要购买添加了香精的涂料，因为添加剂本身就是一种化工产品，很难环保。','','','','');
INSERT INTO pw_tmsgs VALUES('26','0','127.0.0.1','1','','本机地址\r','','','	','1','1','  根据有关研究机构的最新调查结果，全球人口老龄化趋势正在加速。当前，全球65岁以上老年人口的数量快速增加，预计到2040年，总数将超过14亿，占世界人口的比重从目前的7%，增加到14%。我国也将面临同样的问题，由于人口出生率大幅下降，到2040年，老年人口的比重将从目前的8.3%，迅速增长到22.6%。\n  我国人口老龄化问题日益严峻，是一个不争的事实。老年人口日趋增长的趋势，也给家具行业带来了新一轮的营销发展点。目前，我国每年老年人的离退休金、再就业收入、亲朋好友的资助可达3000至4000亿元，预计到2025年和2050年，老年人潜在的市场购买力可望达到14000亿元和50000亿元，面对如此庞大的消费力，家具企业如何抓住这一营销点就显得尤为重要，家具企业在产品开发、营销策略、品牌建设上都需要有针对性的规划。\n产品研发\n由于老年人的生活习惯不同于年轻人，在家里生活的时间大大高于年轻人，所以在家具的使用功能上要求更高。家具企业在老年家具产品研发时应注重产品的功能，如有按摩功能的座椅、沙发，有磁疗功能的床品等等。在产品设计上更应该突出老年家具产品的：安全性、舒适性、轻便性、环保性，实惠性等等。我国虽然拥有世界上最大的老年人市场，老年人的收入也在不断地提高，但与发达国家相比，我们的老年产业才刚处于发展。由于人到老年身心发生变化，老年人家具产品功能造型便形成了自身的特点。因此，只有遵循其本身所固有的原则，把形式、结构和功能有机的结合起来，才能设计出真正属于老年人的家具。\n营销策略\n老年人在家具消费时注重于企业的历史和热情、周到、详尽的服务。老年人消费者往往会花钱购买更好的家具产品，高档躺椅在老年人群中的热销就是一个很好的例子。为家具企业开辟针对老年辅助性家具产品的销售市场创造了有利的条件。企业要想使营销策略在实际的营销活动中获得良好的效果，就要在研究老年消费者心理上下功夫，采用老年消费者喜闻乐见的营销方式，尽量满足老年消费者的心理需求。所以，对老年家具的营销，就要尽量使营销策略满足老年消费者的心理需求。\n渠道管理\n渠道是企业市场营销的重要一环。良好的营销渠道将是企业核心竞争力的体现，企业之竞争就在于营销渠道的建设上，而所谓“适当而良好”的关键仍然在于针对目标顾客的特点来进行设计。根据老年消费者的有就近消费的习惯，企业在建设营销渠道时就应该选择在老年消费者居住相对集中的地区。渠道形式可以是在大商场中设立一定的卖场，既方便老年消费者购买，也便于提供售后服务。\n品牌建设\n对于老年家具产品品牌建设，运用广告策略的作用毋庸置疑。广告是产品进入市场、打开销路的最有效手段。同样对待老年消费者这个特殊群体，开发老年家具市场同样也需要广告攻势，尤其是在老年消费者观念发生重大变化、消费心态年轻化的今天，广告起着市场成功开发的决定性作用。在老年家具产品的广告营销上应做到这几点：1、广告的制作方式应当符合老年人的生理特点。2、广告的内容应符合老年人的心理。3、广告媒体的选择要有针对性。\n','','','','');
INSERT INTO pw_tmsgs VALUES('27','0','127.0.0.1','1','','本机地址\r','','','	','1','1','首先,装修时要选环保材料，其次装修后最好半年以后入住新房。装修完成后，在新房了放置环保植物：\n\n吊兰  \n特性：养殖容易，适应性强，最为传统的居室垂挂植物之一。它叶片细长柔软，从叶腋中抽生出小植株，由盆沿向下垂，舒展散垂，似花朵，四季常绿。  \n 功效：可吸收室内80%以上的有害气体，吸收甲醛的能力超强。一般房间养l～2盆吊兰，空气中有毒气体即可吸收殆尽，故吊兰又有“绿色净化器”之美称。\n\n\n\n虎尾兰\n\n特性：叶簇生，剑叶刚直立，叶全缘，表面乳白、淡黄、深绿相间，呈横带斑纹。常见的家庭盆栽品种，耐干旱，喜阳光温暖，也耐阴，忌水涝。\n\n功效：可吸收室内80%以上的有害气体，吸收甲醛的能力超强。\n\n\n\n长春藤\n\n特性：是最理想的室内外垂直绿化品种，常绿藤本，枝蔓细弱而柔软，具气生根，能攀援在其他物体上。叶互生，叶片三角状卵形，盆栽需要量日渐增多。它典型的阴性植物，能生长在全光照的环境中，在温暖湿润的气候条件下生长良好，不耐寒。\n\n功效：强盗除甲醛。能分解两种有害物质，即存在于地毯，绝缘材料、胶合板中的甲醛和隐匿于壁纸中对肾脏有害的二甲苯。\n\n\n\n芦荟\n\n多年生常绿多肉植物，茎节较短，直立，叶肥厚，多汁，披针形。喜温暖、干燥气候，耐寒能力不强，不耐荫。\n\n它不仅是吸收甲醛的好手，而且具有很强的药用价值，如杀菌、美容的功效。现已经开发出不少盆栽品种，具有很强的观赏性，可用于装饰居室。\n\n\n\n龙舌兰\n\n多年生常绿植物，植株高大，叶色灰绿或蓝灰，叶缘有刺，花黄绿色。喜温暖、光线充足的环境，耐旱性极强。这种植物也是吸收甲醛的好手。此外还可用于酿酒，用其配制的龙舌兰酒是非常有名的。\n\n\n\n扶郎花\n\n菊科宿根草本，花径较大，花色丰富，四季常开。喜温暖、阳光充足和空气流通的环境，属半耐寒性花卉，喜肥沃疏松，富含腐殖质的沙质壤土。\n\n这种植物不仅是吸收甲醛的好手，而且具有很强的观赏性，有不少品种更可用于切花材。\n\n\n\n菊花\n\n多年生宿根草本花卉，我国传统品种。茎直立或半蔓性，茎上有柔毛，多分枝。单叶互生，叶缘有锯齿，花为头状花序，着生茎顶，花形丰富，花色多样。\n\n菊花能分解两种有害物质，即存在于地毯，绝缘材料、胶合板中的甲醛和隐匿于壁纸中对肾脏有害的二甲苯。不仅如此，它还具有很强的观赏性，盆栽品种或陆地花卉都有很多可供选择。此外，其花瓣、根茎还能入药。\n\n\n\n绿萝\n\n天南星科喜林芋属植物，属于攀藤观叶花卉。性喜温暖、潮湿环境，藤长可达数米，节间有气根，叶片会越长越大，叶互生，常绿。萝茎细软，叶片娇秀。\n\n这种植物是很好的吸收甲醛的好手，而且具有很高观赏价值，蔓茎自然下垂，既能净化空气，又能充分利用了空间，为呆板的柜面增加活泼的线条、明快的色彩。\n\n\n\n秋海棠\n\n多年生常绿草本花木。其花色艳丽，花形多姿，叶色妖嫩柔媚、苍翠欲滴。性喜温暖、湿润、荫蔽的环境，怕强光直射，要求排水良好的沙性土壤。\n\n它不仅吸收甲醛的好手，而且花、叶、茎、根均可入药，具有清热消肿、活血散瘀、凉血止血、调经止痛等功效，可治疗咽喉肿痛、吐血、月经不调和胃溃疡等，并具有不错的食用效果。\n\n\n\n鸭跖草\n\n鸭跖草属常绿植物，生长强健，茎叶光滑，茎基部分枝匍匐，上部分枝向上斜生，常在节处生根。叶片披针形至卵状披针形，花深蓝色。性喜温暖、湿润、耐荫和通风环境，疏松、肥沃土壤。\n\n这种植物不仅是吸收甲醛的好手，而且是良好的室内观叶植物，可布置窗台几架，也可放于阴蔽处。同时，植株还可入药，具有清热泻火、解毒的功效，还可用于咽喉肿痛，毒蛇咬伤等。\n\n\n','','','','');
INSERT INTO pw_tmsgs VALUES('28','0','127.0.0.1','1','','本机地址\r','','','	','1','1','环保装修之十大要点\n　　第1.谋定后动——必需订立明确的设计及施工方案，否则您便不能给予施工队清楚的工作指示，装修结果出了问题也将无从追究；\n　　第2.功能规划清晰，装修随即配合——例如，酒店的行政酒廊是要为客人提供一个可以放松休息、吃、喝、交谊或者进行工作会议的舒适环境，因此这个区域需设有迎宾区、让客人回复电邮的设备、舒适的座椅、还要有可供看电视及摆放厨房设施的地方；\n　　第3.一动不如一静——在装修期间，很多人有冲动临时改变最初方案或不时有新点子涌现，就算最轻微的改动也会牵一发而动全身，造成成本增加及延误进度；\n　　第4.忆苦思甜，画梅止渴——把装修效果图放在显眼的地方，当出现装修烦躁情绪时，她的激励作用就会非常有效；\n　　第5.厨房装修——首先您要决定在这里放置哪种食物和需要哪些厨具，不要把冰箱（冷的）摆在烤箱（热的）旁边，并且确保东西放在所能拿到的范围之内，以自己为中心，提供最大的便利；\n　　第6.卧室装修——如果想要淋浴，最好装一个手动喷头。它不仅要适合你的身高，而且喷头还要能随时拆下来清洁浴缸；\n　　第7.慎选用材——在选择墙面地面材料时一定要小心。比如目前最为流行的石灰岩地板，这种材料易吸水，需要较长时间去晾干。又比如大理石，其光亮的表面需要定期处理打蜡。在酒店里，由花岗岩制成的浴室台就可以避免弄脏。大理石光洁的墙面易变黯淡（尤其使用酸性清洗剂），若是使用较温和的清洗剂就没有问题；\n　　第8.顺序清洁——清洗时要遵循一定程序。以一点开始，逐步扩大，每次清洁一个表面，一个衣;\n　　第9.最后一个工序——吸尘。直到清洁卧床后才清扫灰尘，因为通常床是灰尘最多的；\n　　第10.清洗剂的选用——在清洁表面时应该格外小心，因为任何化学清洗剂，抛光措施都会使表面变粘和晦暗。对于木质表面最好使用沾有肥皂水的湿布，对于镜子玻璃表面最好使用含有少量醋的温湿布。\n','','','','');
INSERT INTO pw_tmsgs VALUES('29','0','127.0.0.1','1','','本机地址\r','','','	','1','1','橱柜是家庭装修的必备项目之一，好的橱柜不仅外形美观，而且能充分利用空间，内部格架可根据个性要求采用多种组合方式，现代居室的理想选择。想拥有一套可心的壁柜，除了选择有质量保证的壁柜门家具品牌外，一些必要的准备工作还需留意，宁波家居装修网在此给大家列出了几点 :\n1.壁柜的丈量。壁柜的柜体既可以是墙体，也可以是夹层。这样既保证有效利用空间，又不变形。但一定要做到顶部与底部水平、两侧垂直，如有误差，则要求洞口左右两侧高度差小于 5mm 壁柜门的底轮可以通过调试系统弥补误差。\n2.隔架的安装。家居柜体一般都有抽屉设计，为不影响使用，设计抽屉的位置时要注意：做三扇推拉门时应避开两门相交处；做两扇推拉门时应置于一扇门体一侧；做折叠门时抽屉距侧壁应有17cm空隙。\n3.轨道的安装。做柜体时需为轨道预留尺寸，上下轨道预留尺寸为折门8cm、推拉门10cm。\n4.壁柜门的装置，其步骤是首先固定顶轨。专业有保障的壁柜门装置一般由专业人员完成。轨道前饰面与柜橱表面在同一平面，上下轨平放于预留位置；然后将两扇门装入轨道内，用水平尺或直尺丈量门体垂直度，调整上下轨位置并固定好；再次检查门体是否与两侧平行，可通过调节底轮来调节门体，达到边框与两侧水平；最后将防跳装置固定好，并出示质量维护书。用户可根据此安装程序，检验所选壁柜门品牌是否专业。 \n\n','','','','');
INSERT INTO pw_tmsgs VALUES('30','0','127.0.0.1','1','','本机地址\r','','','	','1','1','在家庭装修中，最直接触及消费者个人利益的就是工程造价。其实影响工程造价的因素有很多，如材料的价格差异，施工工艺的难易程度，还有施工的工程面积的多少等等。计算施工面积的方法是有章可循而且比较简单的。\n   家庭装修中所涉及的项目大致分为墙面、天棚、地面、门、窗及家具等几个部分。\n   计算墙面面积\n   墙面(包括柱面)的装饰材料一般包括：涂料、石材、墙砖、壁纸、软包、护墙板、踢脚线等。计算面积时，材料不同，计算方法也不同。涂料、壁纸、软包、护墙板的面积按长度乘以高度，单位以“平方米”计算。长度按主墙面的净长计算；高度：无墙裙者从室内地面算至楼板底面，有墙裙者从墙裙顶点算至楼板底面；有吊顶天棚的从室内地面(或墙裙顶点)算至天棚下沿再加20cm。门、窗所占面积应扣除(1／2)，但不扣除踢脚线、挂镜线、单个面积在0.3平方米以内的孔洞面积和梁头与墙面交接的面积。镶贴石材和墙砖时，按实铺面积以“平方米”计算，安装踢脚板面积按房屋内墙的净周长计算，单位为米。\n   计算顶面面积\n   天棚(包括梁)的装饰材料一般包括涂料、吊顶、顶角线(装饰角花)及采光顶棚等。天棚施工的面积均按墙与墙之间的净面积以“平方米”计算，不扣除间壁墙、穿过天棚的柱、垛和附墙烟囱等所占面积。顶角线长度按房屋内墙的净周长以“米”计算。\n   计算地面面积\n   地面的装饰材料一般包括：木地板、地砖(或石材)、地毯、楼梯踏步及扶手等。地面面积按墙与墙间的净面积以“平方米”计算，不扣除间壁墙、穿过地面的柱、垛和附墙烟囱等所占面积。楼梯踏步的面积按实际展开面积以“平方米”计算，不扣除宽度在30cm以内的楼梯井所占面积；楼梯扶手和栏杆的长度可按其全部水平投影长度(不包括墙内部分)乘以系数1.15以“延长米”计算。\n   其他栏杆及扶手长度直接按“延长米”计算。对家具的面积计算没有固定的要求，一般以各装饰公司报价中的习惯做法为准：用“延长米”、“平方米”或“项”为单位来统计。但需要注意的是，每种家具的计量单位应该保持一致，例如，做两个衣柜，不能出现一个以“平方米”为计量单位，另一个则以“项”为计量单位的现象。\n','','','','');
INSERT INTO pw_tmsgs VALUES('31','0','127.0.0.1','1','','本机地址\r','','','	','1','1','您懂得如何符合风水的植物摆放方式吗？下面请看:\n1、东方五行属木，震卦，紫气东来:东方摆放红色的花对文案策划、编辑人员以及所有&quot;动脑&quot;工作的人员有利。\n2、西方五行属金，兑卦，西方摆白、黄颜色的花可增加以“口”为生人员的&quot;锐气&quot;，比如如律师、销售、艺术家等有一定的帮助。\n3、南方五行属火，离卦。南方摆放绿色植物可令办公室的女姓提高个人美感和魅力;此方位摆红花则对投资者或弹性收入者有一定的催财旺财功效。\n4、北方五行属水，坎卦，可摆放白色花，Z博士提醒，此举可有效改变员工之间以及上下级之间的紧张关系。\n5、东南方五行属木，巽卦，是一个影响人际关系、恋爱和结婚运的方位，所以首选花卉颜色为粉色。\n6、西南方五行属土，坤卦，办公室女领导的方位，最适宜放鲜艳的红色花;处于亚健康状态的人员可在此方摆放黄色花试试。\n7、东北方五行属土，艮卦，该方位适合部门里的小字辈，今年又恰逢三碧星所在位置，因此摆放黄色的花有利于防止口舌是非发生。\n8、西北五行属金，乾卦，是部门最高领导的方位，适合摆放白色和黄色的花卉，能提高领导威信和全体员工同心同德。\n上述是办公室的摆放鲜花的通用原则，如果需要仔细有个性化的摆放鲜花，那么，则需要考虑办公室人员的命理和办公室具体位理来进行，可谓是有的放矢吧。同时要注意的是，在办公室的风水布局里，千万不要使用假花，因为其象征死亡与没落。\n\n如果在办公室中你觉得犯小人，老是有小人捣鬼，那么，郑博士建议你在办公桌左侧摆放或悬挂红色的鲜花或盆栽(仙人掌、仙人球为宜)，注意，鲜花要以3朵为宜。另外，办公桌右侧最好少摆放办公用品，因为是白虎位，需要谨慎。\n鲜花的寿命都很短，大多在一周之内，夏天会更短。尤其是象郁金香这样的鲜花两天左右就会凋谢。怎样能使鲜花保持的时间长一些呢?郑博士给出建议，朋友们不妨试试:\n1)首先鲜花的根部要斜着剪口，这样吸水的部位大，能够更多地吸收水分;\n2)其次，要每天剪去一些，保证能够更好的吸收水分;\n3)还有，花的叶子不要泡在水里，这样叶子会烂掉，所以一定要把浸在水里的叶子摘掉;\n4)每天要换水。如果是夏天，为了保持水温不升高，还可以往花瓶里放几块冰;同时，花瓶里的水最好放满，这样不仅能使水的温度保持得长久些，还可以增加花瓶底部的重量，保证花瓶的稳定性。\n5)为了使鲜花开的时间长一些，还可以往花瓶里放少许啤酒，或者将两片阿司匹林研成末放进去。可延长鲜花的寿命。\n6)在一般家庭常买的几种鲜花中，郁金香的寿命最短，康乃馨的寿命最长。如果你的主人是又想漂亮又比较节约的人，你就要少买郁金香，多买康乃馨。尤其是夏天，郁金香很快就会枯萎。\n7)还要注意一点，家庭中一般不要买菊花。因为菊花一般是用来上供的。\n8)买几支绢花，与鲜花混合插入花瓶中，会使鲜花显得多而豪华。不同的绢花可与不同的鲜花相配反复使用。\n','','','','');
INSERT INTO pw_tmsgs VALUES('32','0','127.0.0.1','1','','本机地址\r','','','	','1','1','绿色家具知多少\n不少的朋友都发现新买的家总是有一股有机物的异味，这也促使绿色家具的流行，消费者对新家具的污染的日益关注。实际上在05年，有关部门对全国上万个新装修住宅的室内空气状况进行随机装修污染检测，未达标的新居竟高达95%，其中家具污染成为继建筑污染、装修污染之后的另一污染源。此外，近两年消协收到的关于家具污染的投诉呈明显上升趋势。\n“绿色家具”鱼龙混杂\n在消费者投诉中，有不少是买了贴有“绿色”标签的家具，但经测试仍污染超标。“由于消费者越来越关注‘绿色家具’，很多厂商就打出绿色、环保的口号，但其前后的产品并没有进行调整。现在商家很多打‘绿色标旗’，但真正做到环保的很少，大部分还停留在宣传手段上。”业内人士对此如是表示。目前仍然存在这样的状况：一些家具厂商为迎合消费者的需求，在无质检报告的情况下，大肆宣传其所出售的产品是“生态家具”、“绿色家具”。\n此外，有业内人士透露，由于国内外对家具的安全认证标准不统一，且管理混乱，甚至有“用钱买证”的现象，也造成了市场上“绿色家具”鱼龙混杂的局面。\n消费者应谨慎选择才能去除装修污染\n　　消费者如何才能选择到真正的“绿色家具”呢？首先在选购家具时，应该去信誉好、规模较大的家具卖场，最好签购买合同。此外，买家具时，最好问清板材的来源。一般来说，大的厂家都有林业部的许可证，技术水准较高，技监部门还会定期抽查，产品质量问题不大。而如果家具有异味等问题，就要谨慎选择。\n　　业内人士还指出，虽然绿色、环保家具认证不统一，但有些认证还是具有权威性，可以作为选购的依据之一，如中国环境标志产品认证、“绿色选择”产品标志、中国Ⅱ型环境标志、品质验证，以及国际通用的ISO14000环境体系认证等。\n现在装修对健康的影响已经成为业主们非常重视的一个方面，希望绿色家具可以在一定程度上缓解这个问题。\n\n','','','','');
INSERT INTO pw_tmsgs VALUES('33','0','127.0.0.1','1','','本机地址\r','','','	','1','1','对于大多数朋友而言，装修绝对是相当大的一个负担，下面就提几个装修省钱的好办法。\n1.厨房设备用国货    厨房要省钱一定得要从厨具及磁砖下手，考量到预算，全部采用国产用品。\n2.展示柜不作壁板    木板要省钱也可以从壁板动脑筋。柜子钉壁板除了有防潮的功能外，还有受重的考量。若壁面没有渗水的问题，没有放置重物，可以不要钉柜子的壁板。    主卧展示柜，主要是要放置个人收藏品及化妆品，没有钉上壁板，这样既省钱又有美感。\n3.玄关隔屏用鞋柜取代    屋主一直希望入门处能作玄关隔屏。考量到实用及预算，设计师建议用鞋柜代替。虽然鞋柜的价格比玄关隔屏来得贵，但却比较实用，最重要也省了玄关隔屏的费用。\n4.格子玻璃取代格子落地门    通往后阳台的落地门，屋主本来希望能作格子状的落地铝门较有变化，但预算实在不足，设计师便用格子玻璃来代替，一样有格子落地门的效果，价格却省了1半以上。\n5.抛光石英砖取代大理石地板    喜欢大理石光滑的质感，屋主一直希望客厅的地板能铺上大理石。但因为大理石不含施工，光材料就很贵，预算不允许。设计师便建议采用60×60的抛光石英砖代替，当然就省也不少钱。\n6.三面铝窗造型最省钱    铝窗省钱的作法，就是用三面铝窗，搭配5mm厚的强化玻璃，若是用格子的造型铝窗，价格得多1倍。\n7.柜子用木作搭配系统家具门片    装修要省钱，一定得要从木作动脑筋。一般木作柜子的计价方式，除了木工施作柜体及五金配件的价格外，还包括了门片油漆的费用。为了省钱，设计师便用请木工钉作作柜子的桶身，再用系统柜的门片，这样不但省了门片油漆的费用，再加上系统柜的价格本来就比木作柜子便宜，就可以省下不少钱。\n基本上有得必有失，因此在装修时到底选用怎么样的省钱方法，还是要看个人的审美、品味及承受能力等综合考虑。\n','','','','');
INSERT INTO pw_tmsgs VALUES('34','0','127.0.0.1','1','','本机地址\r','','','	','1','1','在装修现场有些问题是要仔细查看的，否则后患无穷——\n查看一：防水工程\n    对于隐蔽性的防水工程，最主要的是施工要做到细致入微。首先，装修前，施工人员要做24小时闭水试验，在确定没有渗漏现象后，再清理地面杂物，铲掉松动部分，然后用水泥沙浆把坑洼不平的地方抹平，再对整个大面进行平整。闭水试验也可起到分清、确定防水工程责任的作用，有渗漏现象责任在开发商；无渗漏现象装修后再有渗漏，责任在装修公司。\n    如做卫生间防水，洗浴时水会溅到邻近的墙上，如没有防水层的保护，隔壁墙和对顶角墙易潮湿发生霉变，所以一定要在铺墙面瓷砖之前，做好墙面防水，一般情况下墙面要做30厘米高的防水处理，但是非承重的轻体墙，就要将整面墙做防水，至少也要做到1.8米高。特别要注意边角，严格防止其发生滴漏，实际上大多数防水层漏水都是边角部位，所以只要把这些地方做好了，出现渗漏的可能性就会减少。\n查看二：墙面与龙骨\n    假如墙面与龙骨违反了操作规程也轻易发现不了。比如因顶棚整体或局部塌落，吊顶就变成了“掉顶”。\n查看三：吊顶\n    吊顶与楼板以及龙骨与饰面板结合不好，或承重过大，易造成“掉顶”。\n    按规定，吊顶龙骨不得扭曲、变形，安装好的龙骨应该牢固、可靠，四周水平偏差不得超过5毫米；超过3公斤重的吊灯或吊扇都不能悬挂在吊顶龙骨上，而应该另设吊钩。如果吊顶使用石膏板做饰面板，其厚度应该在9毫米左右。\n','','','','');
INSERT INTO pw_tmsgs VALUES('35','0','127.0.0.1','1','','本机地址\r','','','	','1','1','建材归纳分类大致有如下几种：电线(强电线、弱电线)；给水管道(冷水管、热水管)；木材(木方材、木板材)；瓷砖(墙砖、地砖；外墙砖、内墙砖)；油漆、涂料；家电(灶具、灯饰、智能设备、空调等)；部品设备(厨房、卫生间器具)；紧固件材料(化学黏结剂、五金紧固件)；装饰五金配件、玻璃、镜面等。\n　　购买建材是装修的一大任务，有些业主以为提前购买会节省时间，或趁商家节日促销时定下建材。但其实，很多建材家具须与装修过程相匹配，或者等施工到某个程度才能定具体型号，提前与设计师沟通，不然会带来后期与整个装修风格不搭或者因为不适用而需更改型号或退换货，影响家装流程。记者请教了设计师，制定了详细的建材购买时间表，希望能对您家装修带来些启发和提醒。\n\n\n前期开工前可购买\n　　地采暖：由于地采暖需要四至五天的工期，而在地采暖施工时，装修工程无法进行，因此，建议对地采暖产品比较了解的业主可在装修之前就将地采暖施工完毕，这样可节省时间。\n　　中央空调：开工之前最好能先定下。\n　　橱柜：主要是功能分区的设计，初步需要在水电改造之前定下橱柜厂家，让厂家来进行初步测量，确定橱柜的位置、使用方式以及电器和水电路的位置。等贴完砖后，橱柜厂家进行第二次测量，这时再与设计师沟通，确定橱柜颜色款式及各种方式。\n　　推荐购买时间：水电改造开工前。\n　　暖气：如果房间结构或者面积发生变化，则所需的暖气片数量也会相应发生变化。所以前期定制暖气易与整个房间需求不符。\n　　推荐购买时间：设计方案确定之后。\n　　中期与施工同步购买\n　　瓷砖：应该结合房屋的整体规划购买。如果确定房屋的户型结构不会改变，可以提前预订瓷砖，甚至可以具体到瓷砖型号;但如果后期发生结构改造，瓷砖很有可能因为房屋面积的改变而不能使用。\n　　如一间3.6平方米的房间，业主自己订了600×600的砖，倘若后期设计师对空间进行改造，房间面积变成了4平方米，那使用800×800的砖更恰当。在这种情况下，业主需要更换瓷砖。\n　　推荐购买时间：结构改造方案确定后。\n　　洁具：据阔达装饰资深设计师耿保印介绍，坐便器、手盆、木柜的长度宽度都需要依据卫生间的空间实际比例来定。虽然业主可以自己测量得知坑距、长宽等具体数据，但很多业主往往只考虑到木柜的长度而忽视了宽度。例如，木柜大多放在卫生间进门处，很多业主忽视了门套线会占用一定的宽度，如果木柜宽度与进门处宽度一致，包完门套后无法安装木柜，需要退换货。\n　　坐便器的长度也易与淋浴区位置发生冲突，没有经验的业主最好不要贸然去定制产品，否则即使尺寸上可以安装，也有可能导致卫生间内洁具摆放比例失调，达不到完美的装饰效果。\n　　推荐购买时间：家具平面布置图出台后。\n地板：一般业主只考虑地板的耐磨度等指标，很少考虑厚度问题。如果不同房间内有铺砖也有铺地板的情况，由于砖通常较厚，如果地板厚度不够，很容易造成整个空间过渡时高度不一，地面不平，给生活带来不便。虽然可以通过地面找平或者加龙骨的方式使地面保持在同一个高度，但增加了工序既费钱又误时。\n　　推荐购买时间：贴砖以后。\n　　铝扣板：建议购买集成吊顶，整个风格统一而且比较安全。具体款式和颜色需等贴完墙砖后再听设计师建议。\n　　壁柜门：壁柜都是厂家定做，可提前做，但是壁柜门与地面平整程度相关，如果没考虑地面高度，壁柜门很有可能无法安装。即使知道地板的厚度，由于整个房间的地面要在一个水平面上，可能地面还需找平，高度无法确定，因此不能贸然定制。\n　　推荐购买时间：等地面找平做完以后再测量所需壁柜门的尺寸。\n　　门：各个厂家生产的门的尺寸不同，因此需要让厂家先行测量，告诉施工工人应将洞口扩大或者缩小至固定尺寸，厂家二次测量之后再确定门的款式颜色等。\n　　推荐购买时间：结构改造方案出台后。\n　　后期结合整体风格购买\n　　五金锁具：一般门的厂家都有配套锁具，有些业主为了节省会选择自己配制锁具，由于锁具也是整个装饰工程的一部分，其质地与表面配套直接相关，建议业主直接购买配套锁具，如果要单买也需到后期，整体风格确定后，与设计师沟通锁具的颜色款式。\n　　开关面板：开关面板也是装饰的一部分，现在的开关面板风格多样，需要等整个装修完成后，考虑整体风格再购买，有利于整个风格的协调统一。\n　　窗帘、壁纸：窗帘和壁纸属于装饰部分，在整个装修过程中，设计方案可能有变，或者设计师有新的灵感，装完之后才有整个的感觉，因此完工之后购买最适宜。\n　　楼梯：对于别墅而言，如果各楼的风格不同，则需要设计师依据整体风格来与厂家研究定制。\n　　家具：后期依据家装风格与设计师一起选购。\n','','','','');
INSERT INTO pw_tmsgs VALUES('36','0','127.0.0.1','1','','本机地址\r','','','	','1','1','室内设计是在以人为本的前提下，满足其功能实用，运用形式语言来表现题材、主题、情感和意境，形式语言与形式美则可通过以下方式表现出来。\n　　一、对比。对比是艺术设计的基本定型技巧，把两种不同的事物、形体、色彩等作对照就称为对比。把两个明显对立的元素放在同一空间中，使其既对立又和谐，既矛盾又统一，在强烈反差中获得鲜明的对比，求得互补和满足的效果。\n　　二、和谐。和谐包含谐调之意。它是在满足功能要求的前提下，使各种室内物体的形、色、光、质等组合得到协调，成为一个非常和谐统一的整体。和谐还可分为环境及造型的和谐、材料质感的和谐、色调的和谐、风格样式的和谐等。\n　　三、对称。对称是形式美的传统技法，是人类最早掌握的形式美法则。对称又分为绝对对称和相对对称。对称给人感受秩序、庄重、整齐、和谐之美。\n　　四、均衡。生活中金鸡独立，演员走钢丝，从力的均衡上给人稳定的视觉艺术享受，使人获得视觉均衡心理，均衡是依中轴线、中心点不等形而等量的形体、构件、色彩相配置。均衡和对称形式相比较，有活泼、生动、和谐、优美之韵味。\n　　五、层次。一幅装饰构图，要分清层次，使画面具有深度、广度而更加丰富。缺少层次，则感到平庸，室内设计同样要追求空间层次感。如色彩从冷到暖，明度从亮到暗，纹理从复杂到简单，造型从大到小、从方到圆，构图从聚到散，质地单一到多样等，都可以看成是富有层次的变化。层次变化可以取得极其丰富的视觉效果。\n　　六、呼应。呼应如同形影相伴，在室内设计中，顶棚与地面桌面与其他部位，采用呼应的手法，形体的处理，会起到对应的作用。呼应属于均衡的形式美，是各种艺术常用的手法，呼应也有“相应对称”、“相对对称”之说，一般运用形象对应、虚实气势等手法求得呼应的艺术效果。\n　　七、延续。延续是指连续伸延。人们常用“形象”一词指一切物体的外表形状。如果将一个形象有规律地向上或向下，向左或向右连续下去就是延续。这种延续手法运用在空间之中，使空间获得扩张感或导向作用，甚至可以加深人们对环境中重点景物的印象。\n　　八、简洁。简洁或称简练，指室内环境中没有华丽的修饰和多余的附加物。以少而精的原则，把室内装饰减少到最小程度。以为“少就是多，简洁就是丰富”。简洁是室内设计中特别值得提倡的手法之一，也是近年来十分流行的趋势。\n　　九、独特。独特也称特异。独特是突破原有规律，标新立异引人注目。在大自然中，“万绿丛中一点红，荒漠中的绿地”，都是独特的体现。独特是在陪衬中产生出来的，是相互比较而存在的。在室内设计中特别推崇有突破的想像力，以创造个性和特色。\n　　十、色调。色彩是构成造型艺术设计的重要因素之一。不同颜色能引起人视觉上不同的色彩感觉。如红、橙、黄温暖感很热烈，被称作暖色系，青蓝绿具有寒冷、沉静的感觉，称作冷色系。在室内设计中，可选用各类色调构成，色调有很多种，一般可归纳为“同一色调，同类色调、邻近色调，对比色调”等，在使用时可根据环境不同灵活运用。','','','','');
INSERT INTO pw_tmsgs VALUES('37','0','127.0.0.1','1','','本机地址\r','','','	','1','1','据有关方面统计，地板铺装后产生质量问题，百分之七十是由于木龙骨安装有问题引起的。一种新型的德国慧鱼敲击式尼龙锚拴能够大大提高龙骨的安装质量，为地板生产商和消费者解决了难题。\n\n传统安装地板龙骨的方法存在难以克服的弊端，比如用木榫加铁钉，有两个很大的缺陷，木榫在相对潮湿、有震动和冲击的情况下容易腐蚀、变形、松脱，铁钉容易生锈，使龙骨变形，最终导致地板变形、开裂，发出咯吱声。而采用金属穿透式安装的膨胀螺丝，很容易损伤木质的龙骨，使龙骨开裂，采用塑料做套管的膨胀螺丝固定，塑料套管容易老化开裂，达不到牢固的要求。慧鱼敲击式尼龙锚拴采用高强尼龙颗粒聚酰胺材料做套管，具有耐腐蚀、耐冲击和抗震动、抗老化等特点，','','','','');
INSERT INTO pw_tmsgs VALUES('38','0','127.0.0.1','1','','本机地址\r','','','	','1','1','水磨石是一种常用的建筑装饰材料。因其原材料来源丰富，价格较低，装饰效果好，施工工艺简单等优点，获得较为广泛的应用。水磨石也是一种人造石，用水泥做胶结料，掺入不同色彩，不同粒径的大理石或花岗石碎石。经过搅拌、成型、养护、研磨等工序，制成一种具有一定装饰效果的人造石材。\n　　1．施工操作程序如下\n　　找平层施工——固定分格条——抹面灰——磨光——打蜡\n2．操作要点\n　　（1）找平层施工\n水泥砂浆找平层施工工艺主要控制以下几个问题。\nA．基层的清理。水磨石地面的空鼓，粘结不牢，很多是由于基层清理不够，有影响粘结的杂物造成。所以，在工序安排上，应将清理基层作为一道工序完成，也就是说，不进行基层清理不能进行下道工序。\n　　B．水泥砂浆稠度要适当，搅拌要均匀，现场分堆搅拌，人工拌合，就地分摊的办法不宜提倡。如果有排水坡度要求，特别要注意泛水的走向及地漏的位置与标高，在找平层施工中应准确完成。那种找平层不认真，面层再去找坡的做法，是不妥的。为了更好控制排水坡度，在找平层完成后，如能增加一道检查的工序，发现不妥，及时处理，就能较好的解决坡度问题，同时也应注意，在加强土建工种施工的同时，还需同设备工种做好配合，解决好两个工种的工期与进度、标高与保护的问题。\n　　C．注意检查结构的质量情况，如楼板的裂缝问题。如果发现裂缝，应提请有关单位注意，并要做出判定及处理意见。在近年来的水磨石地面中，经常因楼板裂缝而影响水磨石面层（其他面层也会遇到类似情况）。需要处理的裂缝最好在找平层施工前处理完毕，如果在面层做好后再去处理，势必影响面层色彩的整体性及造成接槎的痕迹。对于经常流水的地面，如卫生间、厨房等地面，还需注意地漏的抹口及穿楼板洞的堵洞工作，因为这些部位一旦渗透水，一定要返修。返修就要破坏局部面层，虽然可以修复，但前后施工的接槎，是比较明显的。在做找平层前，应特别注意这些问题。找平层施工完毕，24小时后应洒水养护，养护2～3天，即可做面层施工。\n','','','','');
INSERT INTO pw_tmsgs VALUES('39','0','127.0.0.1','1','','本机地址\r','','','	','1','1','在现今的装饰装修中，石材是很重的一种装饰材料，石材与其他的材料 相比，最大优点就是它是天\n然矿产，在许多方面，比如：质感、花色、施工以及材料的获得等各方面都有其独特的条件；因\n此，在选用时一定要按照它的性能来判断。整体而言，石材选用应注意一下几个方面：\n\n\n1.成本的预算　　\n    石材属于天然装饰材料，不同的石材由于其品质、数量、等不同，导致其在价格上往往也会有\n显著的差异，因此，业主与设计师在初期选用时，应该对它有相当熟悉的了解。\n\n\n2.美学的表达\n  　石材的花纹、颜色以及质感等因素在选择时是比较感官的，用肉眼就能够分辨出来的，往往经\n常因为业主与设计师的喜好而有所不同，出现一些问题。但是如果对装饰石材有了比较深的认识\n后，你们，设计师在设计上就会有更出色的设计。\n　　矿石形成的分类主要有火成岩、沉积岩与变质岩三种，本地常用之营建石材主要则以大理石类\n（变质岩）与花岗石类（火成岩）为主；一般而言，大理石类的石材具有较丰富的颜色与花纹，质\n感上的表现以光滑与柔和为主，而花岗石类虽然在\n色彩与花纹上变化较少，但在质感方面却有较灵活的表现，另外，花岗石在整体的感觉上显得较为\n庄严而古典。\n\n\n3.石材品质的掌握\na.材质的均一与完整：　　\n   应尽量避免暗裂、黑疤与色差等问题。\nb.石材的成份：\n　　(１)避免石材内含有过高的硫化铁、盐份、氧化铁、炭质与黏土等有害物质。\n　　(２)避免石材含辐射成份。\n　　(３)避免石材内含有过高的热膨胀系数、以避免裂纹、导热及导电率的矿物成分,导热与导电的危险。\n\n\n','','','','');


INSERT INTO pw_tools VALUES('1','威望工具','reputation','可将自已负威望清零','1','1.gif','1','100','money','10.00','2','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('2','清零卡','credit','可将自已所有负分清零,包括金钱,威望,贡献值,积分。','2','2.gif','1','100','money','10.00','2','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('3','醒目卡','colortitle','可以将自己的帖子标题加亮显示','3','3.gif','1','200','money','20.00','1','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('4','置顶I','top','可将自己发表的帖子在版块中置顶，置顶时间为6小时。','4','4.gif','1','200','money','20.00','1','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('5','置顶II','top2','可将自己发表的帖子在分类中置顶，置顶时间为6小时。','5','5.gif','1','500','money','50.00','1','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('6','置顶III','top3','可将自己发表的帖子在整个论坛中置顶，置顶时间为6小时。','6','6.gif','1','1000','money','100.00','1','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('7','提前帖子','upread','可以把自己发表的帖子提前到帖子所在版块的第一页','7','7.gif','1','100','money','10.00','1','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('8','改名卡','changename','可更改自已在论坛的用户名','8','8.gif','1','1000','money','100.00','2','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('9','精华I','digest','可以将自己的帖子加为精华I','9','9.gif','0','100','currency','0.00','1','100','a:1:{s:6:\"credit\";a:7:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;i:2;i:0;}}');
INSERT INTO pw_tools VALUES('10','精华II','digest2','可以将自己的帖子加为精华II','10','10.gif','0','200','currency','0.00','1','100','a:1:{s:6:\"credit\";a:7:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;i:2;i:0;}}');
INSERT INTO pw_tools VALUES('11','锁定帖子','lock','可以将自己发表的帖子锁定，不让其他会员回复此帖。','11','11.gif','0','100','currency','0.00','1','100','a:1:{s:6:\"credit\";a:7:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;i:2;i:0;}}');
INSERT INTO pw_tools VALUES('12','解除锁定','unlock','可以解除自己被帖子锁定，让其他会员可以回复此帖。','12','12.gif','0','100','currency','0.00','1','100','a:1:{s:6:\"credit\";a:7:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;i:2;i:0;}}');
INSERT INTO pw_tools VALUES('13','鲜花','flower','可以给帖子增加推荐数','13','13.gif','1','10','money','1.00','1','1000','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('14','鸡蛋','egg','可以给帖子减少推荐数','14','14.gif','1','10','money','1.00','1','1000','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('15','运气卡','luck','使用后随机加减交易币(-100,100)。','15','','0','10','currency','0.00','2','100','a:2:{s:4:\"luck\";a:3:{s:6:\"range1\";s:4:\"-100\";s:6:\"range2\";s:3:\"100\";s:8:\"lucktype\";s:8:\"currency\";}s:6:\"credit\";a:7:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('16','生日卡','birth','以短消息方式发送给好友，祝好友生日快乐！','16','','1','50','money','5.00','2','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('17','沉淀卡','backdown','帖子中使用，每用一次让帖子丢到12小时前．','17','','0','10','currency','0.00','1','100','a:1:{s:6:\"credit\";a:7:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;i:2;i:0;}}');
INSERT INTO pw_tools VALUES('18','猪头术','pig','使用后让对方头像变为猪头，此效果持续24小时或到对方使用清洗卡为止','18','','1','200','money','20.00','2','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('19','还原卡','clear','清除猪头卡的效果','19','','1','200','money','20.00','2','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('20','透视镜','mirror','对用户使用 查看用户IP','20','','0','10','currency','0.00','2','100','a:1:{s:6:\"credit\";a:7:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;i:2;i:0;}}');
INSERT INTO pw_tools VALUES('21','护身符','defend','使用后，不能对该用户实现猪头术效果，48小时内有效。','21','','1','100','money','10.00','2','100','a:1:{s:6:\"credit\";a:6:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;}}');
INSERT INTO pw_tools VALUES('22','时空卡','backup','帖子中使用，让帖子发布到12小时后。','22','','0','10','currency','0.00','1','100','a:1:{s:6:\"credit\";a:7:{s:7:\"postnum\";i:0;s:7:\"digests\";i:0;s:4:\"rvrc\";i:0;s:5:\"money\";i:0;s:6:\"credit\";i:0;i:1;i:0;i:2;i:0;}}');

INSERT INTO pw_topiccate VALUES('1','房屋交易','1','4','1');
INSERT INTO pw_topiccate VALUES('2','美食分类','1','2','1');
INSERT INTO pw_topiccate VALUES('3','婚庆婚介','1','3','1');
INSERT INTO pw_topiccate VALUES('4','母婴分类','1','1','1');
INSERT INTO pw_topiccate VALUES('5','汽车交易','1','5','1');

INSERT INTO pw_topicfield VALUES('1','楼盘名称','field1','1','1','text','b:0;','1','1','1','1','1','50','');
INSERT INTO pw_topicfield VALUES('2','区域','field2','1','4','select','a:7:{i:0;s:8:\"1=杭州\";i:1;s:11:\"2=西湖区\";i:2;s:11:\"3=拱墅区\";i:3;s:11:\"4=下城区\";i:4;s:11:\"5=上城区\";i:5;s:11:\"6=下沙区\";i:6;s:11:\"7=滨江区\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('3','价格','field3','1','3','text','a:2:{s:6:\"minnum\";s:1:\"1\";s:6:\"maxnum\";s:9:\"100000000\";}','1','0','0','1','1','10','元（人民币）');
INSERT INTO pw_topicfield VALUES('4','房屋类型','field4','1','2','radio','a:5:{i:0;s:8:\"1=住宅\";i:1;s:8:\"2=民房\";i:2;s:8:\"3=别墅\";i:3;s:8:\"4=商铺\";i:4;s:17:\"5=经济适用房\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('5','租赁类型','field5','1','5','select','a:4:{i:0;s:8:\"1=全部\";i:1;s:8:\"2=整租\";i:2;s:8:\"3=合租\";i:3;s:8:\"4=短租\";}','1','0','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('6','来源','field6','1','6','radio','a:2:{i:0;s:8:\"1=个人\";i:1;s:8:\"2=中介\";}','1','0','1','0','1','0','');
INSERT INTO pw_topicfield VALUES('7','楼层','field7','1','7','number','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('8','/','field8','1','7','number','b:0;','1','0','0','0','0','0','例如：2/6，表示第2层，总共6层。');
INSERT INTO pw_topicfield VALUES('9','建筑面积','field9','1','8','number','a:2:{s:6:\"minnum\";s:1:\"1\";s:6:\"maxnum\";s:5:\"10000\";}','1','0','0','0','0','0','平方米');
INSERT INTO pw_topicfield VALUES('10','建筑年代','field10','1','9','select','a:19:{i:0;s:6:\"1=1991\";i:1;s:6:\"2=1992\";i:2;s:6:\"3=1993\";i:3;s:6:\"4=1994\";i:4;s:6:\"5=1995\";i:5;s:6:\"6=1996\";i:6;s:6:\"7=1997\";i:7;s:6:\"8=1998\";i:8;s:6:\"9=1999\";i:9;s:7:\"10=2000\";i:10;s:7:\"11=2001\";i:11;s:7:\"12=2002\";i:12;s:7:\"13=2003\";i:13;s:7:\"14=2004\";i:14;s:7:\"15=2005\";i:15;s:7:\"16=2006\";i:16;s:7:\"17=2007\";i:17;s:7:\"18=2008\";i:18;s:7:\"19=2009\";}','1','0','1','0','0','0','年');
INSERT INTO pw_topicfield VALUES('11','特色房屋','field11','1','11','radio','a:8:{i:0;s:11:\"1=地铁房\";i:1;s:11:\"2=学区房\";i:2;s:8:\"3=婚房\";i:3;s:11:\"4=海景房\";i:4;s:11:\"5=湖景房\";i:5;s:11:\"6=江景房\";i:6;s:11:\"7=赡老房\";i:7;s:8:\"8=其他\";}','1','0','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('12','装修情况','field12','1','12','radio','a:5:{i:0;s:8:\"1=全部\";i:1;s:8:\"2=毛胚\";i:2;s:8:\"3=简装\";i:3;s:8:\"4=中装\";i:4;s:8:\"5=精装\";}','1','1','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('13','电话','field13','1','14','text','b:0;','1','0','0','0','0','10','');
INSERT INTO pw_topicfield VALUES('14','-','field14','1','14','text','b:0;','1','0','0','0','0','20','例如：0571-12345678');
INSERT INTO pw_topicfield VALUES('15','手机','field15','1','15','text','b:0;','1','0','0','0','0','0','例如：13812345678');
INSERT INTO pw_topicfield VALUES('16','地址','field16','1','16','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('17','有效期','field17','1','17','select','a:7:{i:0;s:11:\"1=一星期\";i:1;s:11:\"2=半个月\";i:2;s:11:\"3=一个月\";i:3;s:11:\"4=三个月\";i:4;s:8:\"5=半年\";i:5;s:8:\"6=一年\";i:6;s:8:\"7=长期\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('18','房屋图片','field18','1','18','upload','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('19','最短租期','field19','1','10','select','a:5:{i:0;s:8:\"1=一月\";i:1;s:8:\"2=二月\";i:2;s:8:\"3=三月\";i:3;s:8:\"4=半年\";i:4;s:8:\"5=一年\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('20','户型{#}室','field20','1','13','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('21','{#}厅','field21','1','13','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('22','{#}卫','field22','1','13','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('23','{#}阳台','field23','1','13','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('24','区域','field24','2','2','select','a:7:{i:0;s:8:\"1=杭州\";i:1;s:11:\"2=西湖区\";i:2;s:11:\"3=拱墅区\";i:3;s:11:\"4=下城区\";i:4;s:11:\"5=上城区\";i:5;s:11:\"6=下沙区\";i:6;s:11:\"7=滨江区\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('25','楼盘名称','field25','2','1','text','b:0;','1','0','1','1','1','50','');
INSERT INTO pw_topicfield VALUES('26','价格','field26','2','3','text','a:2:{s:6:\"minnum\";s:1:\"1\";s:6:\"maxnum\";s:9:\"100000000\";}','1','0','0','1','1','0','元（人民币）');
INSERT INTO pw_topicfield VALUES('27','房屋类型','field27','2','4','radio','a:5:{i:0;s:8:\"1=住宅\";i:1;s:8:\"2=民房\";i:2;s:8:\"3=别墅\";i:3;s:8:\"4=商铺\";i:4;s:17:\"5=经济适用房\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('28','来源','field28','2','6','radio','a:2:{i:0;s:8:\"1=个人\";i:1;s:8:\"2=中介\";}','1','0','1','0','1','0','');
INSERT INTO pw_topicfield VALUES('29','楼层','field29','2','7','number','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('30','/','field30','2','7','number','b:0;','1','0','0','0','0','0','例如：2/6，表示第2层，总共6层。');
INSERT INTO pw_topicfield VALUES('31','房屋状态','field31','2','5','select','a:3:{i:0;s:8:\"1=现房\";i:1;s:8:\"2=期房\";i:2;s:8:\"3=尾房\";}','1','1','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('32','建筑面积','field32','2','8','number','a:2:{s:6:\"minnum\";s:1:\"1\";s:6:\"maxnum\";s:5:\"10000\";}','1','0','0','0','1','0','平方米');
INSERT INTO pw_topicfield VALUES('33','建筑年代','field33','2','9','select','a:19:{i:0;s:6:\"1=1991\";i:1;s:6:\"2=1992\";i:2;s:6:\"3=1993\";i:3;s:6:\"4=1994\";i:4;s:6:\"5=1995\";i:5;s:6:\"6=1996\";i:6;s:6:\"7=1997\";i:7;s:6:\"8=1998\";i:8;s:6:\"9=1999\";i:9;s:7:\"10=2000\";i:10;s:7:\"11=2001\";i:11;s:7:\"12=2002\";i:12;s:7:\"13=2003\";i:13;s:7:\"14=2004\";i:14;s:7:\"15=2005\";i:15;s:7:\"16=2006\";i:16;s:7:\"17=2007\";i:17;s:7:\"18=2008\";i:18;s:7:\"19=2009\";}','1','0','0','0','0','0','年');
INSERT INTO pw_topicfield VALUES('34','特色房屋','field34','2','10','radio','a:8:{i:0;s:11:\"1=地铁房\";i:1;s:11:\"2=学区房\";i:2;s:8:\"3=婚房\";i:3;s:11:\"4=海景房\";i:4;s:11:\"5=湖景房\";i:5;s:11:\"6=江景房\";i:6;s:11:\"7=赡老房\";i:7;s:8:\"8=其他\";}','1','0','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('35','装修情况','field35','2','11','radio','a:5:{i:0;s:8:\"1=全部\";i:1;s:8:\"2=毛胚\";i:2;s:8:\"3=简装\";i:3;s:8:\"4=中装\";i:4;s:8:\"5=精装\";}','1','1','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('36','电话','field36','2','13','number','b:0;','1','0','0','0','0','10','');
INSERT INTO pw_topicfield VALUES('37','-','field37','2','13','number','b:0;','1','0','0','0','0','20','例如：0571-12345678');
INSERT INTO pw_topicfield VALUES('38','手机','field38','2','14','text','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('39','地址','field39','2','15','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('40','有效期','field40','2','16','select','a:7:{i:0;s:11:\"1=一星期\";i:1;s:11:\"2=半个月\";i:2;s:11:\"3=一个月\";i:3;s:11:\"4=三个月\";i:4;s:8:\"5=半年\";i:5;s:8:\"6=一年\";i:6;s:8:\"7=长期\";}','1','0','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('41','房屋图片','field41','2','17','upload','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('42','户型{#}室','field42','2','12','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('43','{#}厅','field43','2','12','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('44','{#}卫','field44','2','12','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('45','{#}阳台','field45','2','12','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('46','区域','field46','3','2','select','a:7:{i:0;s:8:\"1=杭州\";i:1;s:11:\"2=西湖区\";i:2;s:11:\"3=拱墅区\";i:3;s:11:\"4=下城区\";i:4;s:11:\"5=上城区\";i:5;s:11:\"6=下沙区\";i:6;s:11:\"7=滨江区\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('47','楼盘名称','field47','3','1','text','b:0;','1','1','1','1','1','50','');
INSERT INTO pw_topicfield VALUES('48','价格','field48','3','3','text','a:2:{s:6:\"minnum\";s:1:\"1\";s:6:\"maxnum\";s:9:\"100000000\";}','1','0','0','1','1','0','元（人民币）');
INSERT INTO pw_topicfield VALUES('49','房屋类型','field49','3','4','radio','a:5:{i:0;s:8:\"1=住宅\";i:1;s:8:\"2=民房\";i:2;s:8:\"3=别墅\";i:3;s:8:\"4=商铺\";i:4;s:17:\"5=经济适用房\";}','1','1','1','0','1','0','');
INSERT INTO pw_topicfield VALUES('50','来源','field50','3','6','radio','a:2:{i:0;s:8:\"1=个人\";i:1;s:8:\"2=中介\";}','1','0','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('51','楼层','field51','3','7','number','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('52','/','field52','3','7','number','b:0;','1','0','0','0','0','0','例如：2/6，表示第2层，总共6层。');
INSERT INTO pw_topicfield VALUES('53','房屋状态','field53','3','5','select','a:3:{i:0;s:8:\"1=现房\";i:1;s:8:\"2=期房\";i:2;s:8:\"3=尾房\";}','1','1','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('54','建筑面积','field54','3','8','number','a:2:{s:6:\"minnum\";s:1:\"1\";s:6:\"maxnum\";s:5:\"10000\";}','1','0','0','1','1','0','平方米');
INSERT INTO pw_topicfield VALUES('55','建筑年代','field55','3','9','select','a:19:{i:0;s:6:\"1=1991\";i:1;s:6:\"2=1992\";i:2;s:6:\"3=1993\";i:3;s:6:\"4=1994\";i:4;s:6:\"5=1995\";i:5;s:6:\"6=1996\";i:6;s:6:\"7=1997\";i:7;s:6:\"8=1998\";i:8;s:6:\"9=1999\";i:9;s:7:\"10=2000\";i:10;s:7:\"11=2001\";i:11;s:7:\"12=2002\";i:12;s:7:\"13=2003\";i:13;s:7:\"14=2004\";i:14;s:7:\"15=2005\";i:15;s:7:\"16=2006\";i:16;s:7:\"17=2007\";i:17;s:7:\"18=2008\";i:18;s:7:\"19=2009\";}','1','0','1','0','0','0','年');
INSERT INTO pw_topicfield VALUES('56','特色房屋','field56','3','10','radio','a:8:{i:0;s:11:\"1=地铁房\";i:1;s:11:\"2=学区房\";i:2;s:8:\"3=婚房\";i:3;s:11:\"4=海景房\";i:4;s:11:\"5=湖景房\";i:5;s:11:\"6=江景房\";i:6;s:11:\"7=赡老房\";i:7;s:8:\"8=其他\";}','1','0','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('57','装修情况','field57','3','11','radio','a:5:{i:0;s:8:\"1=全部\";i:1;s:8:\"2=毛胚\";i:2;s:8:\"3=简装\";i:3;s:8:\"4=中装\";i:4;s:8:\"5=精装\";}','1','0','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('58','户型{#}室','field58','3','12','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('59','{#}厅','field59','3','12','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('60','{#}卫','field60','3','12','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('61','{#}阳台','field61','3','12','select','a:7:{i:0;s:3:\"1=0\";i:1;s:3:\"2=1\";i:2;s:3:\"3=2\";i:3;s:3:\"4=3\";i:4;s:3:\"5=4\";i:5;s:3:\"6=5\";i:6;s:3:\"7=6\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('62','电话','field62','3','13','number','b:0;','1','0','0','0','0','10','');
INSERT INTO pw_topicfield VALUES('63','-','field63','3','13','number','b:0;','1','0','0','0','0','20','例如：0571-12345678');
INSERT INTO pw_topicfield VALUES('64','手机','field64','3','14','text','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('65','地址','field65','3','15','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('66','有效期','field66','3','16','select','a:7:{i:0;s:11:\"1=一星期\";i:1;s:11:\"2=半个月\";i:2;s:11:\"3=一个月\";i:3;s:11:\"4=三个月\";i:4;s:8:\"5=半年\";i:5;s:8:\"6=一年\";i:6;s:8:\"7=长期\";}','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('67','房屋图片','field67','3','17','upload','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('68','店名','field68','4','1','text','b:0;','1','1','1','1','1','50','');
INSERT INTO pw_topicfield VALUES('69','经营性质','field69','4','2','radio','a:5:{i:0;s:9:\"1=中餐 \";i:1;s:9:\"2=西餐 \";i:2;s:9:\"3=快餐 \";i:3;s:8:\"4=小吃\";i:4;s:8:\"5=其它\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('70','美食分类','field70','4','3','radio','a:16:{i:0;s:11:\"1=江浙菜\";i:1;s:8:\"2=川菜\";i:2;s:8:\"3=湘菜\";i:3;s:8:\"4=粤菜\";i:4;s:11:\"5=东北菜\";i:5;s:11:\"6=日韩菜\";i:6;s:11:\"7=特色菜\";i:7;s:9:\"8=西餐 \";i:8;s:9:\"9=快餐 \";i:9;s:9:\"10=海鲜\";i:10;s:9:\"11=烧烤\";i:11;s:9:\"12=火锅\";i:12;s:9:\"13=清真\";i:13;s:9:\"14=小吃\";i:14;s:15:\"15=蛋糕面包\";i:15;s:15:\"16=甜点饮料\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('71','区域','field71','4','4','select','a:7:{i:0;s:8:\"1=杭州\";i:1;s:11:\"2=西湖区\";i:2;s:11:\"3=拱墅区\";i:3;s:11:\"4=下城区\";i:4;s:11:\"5=上城区\";i:5;s:11:\"6=下沙区\";i:6;s:11:\"7=滨江区\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('72','电话','field72','4','5','text','b:0;','1','0','0','0','0','10','');
INSERT INTO pw_topicfield VALUES('73','-','field73','4','5','text','b:0;','1','0','0','0','0','20','例如：0571-12345678');
INSERT INTO pw_topicfield VALUES('74','地址','field74','4','7','text','b:0;','1','0','1','0','0','50','');
INSERT INTO pw_topicfield VALUES('75','公交','field75','4','8','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('76','车位','field76','4','9','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('77','营业时间','field77','4','10','text','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('78','-','field78','4','10','text','b:0;','1','0','0','0','0','0','例如：上午9点-晚上10点');
INSERT INTO pw_topicfield VALUES('79','营业状态','field79','4','12','radio','a:2:{i:0;s:11:\"1=营业中\";i:1;s:11:\"2=已歇业\";}','1','0','1','0','1','0','');
INSERT INTO pw_topicfield VALUES('80','图片上传','field80','4','13','upload','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('81','店名','field81','5','1','text','b:0;','1','1','1','1','1','50','');
INSERT INTO pw_topicfield VALUES('82','经营性质','field82','5','2','radio','a:2:{i:0;s:14:\"1=婚介交友\";i:1;s:14:\"2=婚庆服务\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('83','区域','field83','5','3','select','a:7:{i:0;s:8:\"1=杭州\";i:1;s:11:\"2=西湖区\";i:2;s:11:\"3=拱墅区\";i:3;s:11:\"4=下城区\";i:4;s:11:\"5=上城区\";i:5;s:11:\"6=下沙区\";i:6;s:11:\"7=滨江区\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('84','电话','field84','5','4','text','b:0;','1','0','0','0','0','10','');
INSERT INTO pw_topicfield VALUES('85','-','field85','5','4','text','b:0;','1','0','0','0','0','20','例如，0571-12345678');
INSERT INTO pw_topicfield VALUES('86','地址','field86','5','6','text','b:0;','1','0','1','0','0','50','');
INSERT INTO pw_topicfield VALUES('87','公交','field87','5','7','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('88','车位','field88','5','8','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('89','营业时间','field89','5','9','text','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('90','-','field90','5','9','text','b:0;','1','0','0','0','0','0','例如：上午9点-晚上10点');
INSERT INTO pw_topicfield VALUES('91','营业状态','field91','5','11','radio','a:2:{i:0;s:11:\"1=营业中\";i:1;s:11:\"2=已歇业\";}','1','0','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('92','图片上传','field92','5','12','upload','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('93','店名','field93','6','1','text','b:0;','1','1','1','1','1','50','');
INSERT INTO pw_topicfield VALUES('94','经营性质','field94','6','2','radio','a:7:{i:0;s:14:\"1=母婴产品\";i:1;s:14:\"2=儿童服装\";i:2;s:14:\"3=美容美体\";i:3;s:14:\"4=早教机构\";i:4;s:14:\"5=出行游乐\";i:5;s:14:\"6=婴儿摄影\";i:6;s:14:\"7=家政月嫂\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('95','区域','field95','6','3','select','a:7:{i:0;s:8:\"1=杭州\";i:1;s:11:\"2=西湖区\";i:2;s:11:\"3=拱墅区\";i:3;s:11:\"4=下城区\";i:4;s:11:\"5=上城区\";i:5;s:11:\"6=下沙区\";i:6;s:11:\"7=滨江区\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('96','电话','field96','6','4','text','b:0;','1','0','0','0','0','10','');
INSERT INTO pw_topicfield VALUES('97','-','field97','6','4','text','b:0;','1','0','0','0','0','20','例如，0571-12345678');
INSERT INTO pw_topicfield VALUES('98','地址','field98','6','6','text','b:0;','1','0','1','0','0','50','');
INSERT INTO pw_topicfield VALUES('99','公交','field99','6','7','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('100','车位','field100','6','8','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('101','营业时间','field101','6','9','text','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('102','-','field102','6','9','text','b:0;','1','0','0','0','0','0','例如：上午9点-晚上10点');
INSERT INTO pw_topicfield VALUES('103','营业状态','field103','6','11','radio','a:2:{i:0;s:11:\"1=营业中\";i:1;s:11:\"2=已歇业\";}','1','0','1','0','0','0','');
INSERT INTO pw_topicfield VALUES('104','图片上传','field104','6','12','upload','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('105','卖家身份','field105','7','1','radio','a:2:{i:0;s:8:\"1=个人\";i:1;s:14:\"2=出租公司\";}','1','1','1','0','1','0','');
INSERT INTO pw_topicfield VALUES('106','车辆类型','field106','7','2','checkbox','a:15:{i:0;s:11:\"1=微型车\";i:1;s:14:\"2=小型轿车\";i:2;s:17:\"3=紧凑型轿车\";i:3;s:14:\"4=中型轿车\";i:4;s:17:\"5=豪华型轿车\";i:5;s:11:\"6=面包车\";i:6;s:11:\"7=越野车\";i:7;s:8:\"8=跑车\";i:8;s:9:\"9=SUV/SRV\";i:9;s:6:\"10=MPV\";i:10;s:16:\"11=客车/中巴\";i:11;s:16:\"12=货车/皮卡\";i:12;s:15:\"13=厢式货车\";i:13;s:15:\"14=工程车辆\";i:14;s:9:\"15=其他\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('107','车辆型号','field107','7','3','text','b:0;','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('108','新旧程度','field108','7','4','select','a:7:{i:0;s:8:\"1=全新\";i:1;s:6:\"2=9成\";i:2;s:6:\"3=8成\";i:3;s:6:\"4=7成\";i:4;s:6:\"5=6成\";i:5;s:6:\"6=5成\";i:6;s:12:\"7=5成以下\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('109','预售价位','field109','7','5','number','a:2:{s:6:\"minnum\";s:1:\"1\";s:6:\"maxnum\";s:8:\"10000000\";}','1','0','0','0','1','0','元');
INSERT INTO pw_topicfield VALUES('110','电话','field110','7','6','text','b:0;','1','0','0','0','0','10','');
INSERT INTO pw_topicfield VALUES('111','-','field111','7','6','text','b:0;','1','0','0','0','0','20','例如：0571-12345678');
INSERT INTO pw_topicfield VALUES('112','手机','field112','7','7','text','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('113','地址','field113','7','8','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('114','联系人','field114','7','9','text','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('115','车辆图片','field115','7','10','upload','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('116','出租者身份','field116','8','1','radio','a:2:{i:0;s:8:\"1=个人\";i:1;s:14:\"2=出租公司\";}','1','1','1','0','1','0','');
INSERT INTO pw_topicfield VALUES('117','车辆类型','field117','8','2','checkbox','a:15:{i:0;s:11:\"1=微型车\";i:1;s:14:\"2=小型轿车\";i:2;s:17:\"3=紧凑型轿车\";i:3;s:14:\"4=中型轿车\";i:4;s:17:\"5=豪华型轿车\";i:5;s:11:\"6=面包车\";i:6;s:11:\"7=越野车\";i:7;s:8:\"8=跑车\";i:8;s:9:\"9=SUV/SRV\";i:9;s:6:\"10=MPV\";i:10;s:16:\"11=客车/中巴\";i:11;s:16:\"12=货车/皮卡\";i:12;s:15:\"13=厢式货车\";i:13;s:15:\"14=工程车辆\";i:14;s:9:\"15=其他\";}','1','1','1','0','1','0','');
INSERT INTO pw_topicfield VALUES('118','车辆型号','field118','8','3','text','b:0;','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('119','出租价格','field119','8','5','text','a:2:{s:6:\"minnum\";s:1:\"1\";s:6:\"maxnum\";s:8:\"10000000\";}','1','0','0','1','1','0','元/天');
INSERT INTO pw_topicfield VALUES('120','电话','field120','8','8','text','b:0;','1','0','0','0','0','10','');
INSERT INTO pw_topicfield VALUES('121','-','field121','8','8','text','b:0;','1','0','0','0','0','20','例如，0571-12345678');
INSERT INTO pw_topicfield VALUES('122','手机','field122','8','9','text','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('123','地址','field123','8','10','text','b:0;','1','0','0','0','0','50','');
INSERT INTO pw_topicfield VALUES('124','联系人','field124','8','11','text','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('125','车辆图片','field125','8','12','upload','b:0;','1','0','0','0','0','0','');
INSERT INTO pw_topicfield VALUES('126','服务内容','field126','8','4','checkbox','a:7:{i:0;s:14:\"1=班车接送\";i:1;s:26:\"2=个人单位长租短包\";i:2;s:14:\"3=会展服务\";i:3;s:14:\"4=婚庆服务\";i:4;s:14:\"5=机场接送\";i:5;s:14:\"6=商务旅游\";i:6;s:8:\"7=其他\";}','1','1','1','1','1','0','');
INSERT INTO pw_topicfield VALUES('127','押金','field127','8','6','text','b:0;','1','0','0','0','0','0','元');
INSERT INTO pw_topicfield VALUES('128','里程限制','field128','8','7','text','b:0;','1','0','0','0','0','0','公里');

INSERT INTO pw_topicmodel VALUES('1','出租','1','1','1');
INSERT INTO pw_topicmodel VALUES('2','出售','1','1','2');
INSERT INTO pw_topicmodel VALUES('3','求购','1','1','4');
INSERT INTO pw_topicmodel VALUES('4','美食','2','1','0');
INSERT INTO pw_topicmodel VALUES('5','婚庆婚介','3','1','0');
INSERT INTO pw_topicmodel VALUES('6','母婴','4','1','0');
INSERT INTO pw_topicmodel VALUES('7','出售','5','1','0');
INSERT INTO pw_topicmodel VALUES('8','出租','5','1','0');










INSERT INTO pw_tpl VALUES('1','subject','帖子列表1','由一张图片和若干帖子列表组成','<list action=\"image\" num=\"1\" title=\"图片模块\" />\r\n<loop>\r\n<a href=\"{url}\" target=\"_blank\"><img src=\"{image,100,100}\" class=\"fl\" /></a>\r\n</loop>\r\n<list action=\"subject\" num=\"10\" title=\"帖子排行模块\" />\r\n<ul>\r\n<loop>\r\n<li><a href=\"{url}\" title=\"{title}\" target=\"_blank\">{title,30}</a></li>\r\n</loop>\r\n</ul>','1.jpg');
INSERT INTO pw_tpl VALUES('2','subject','帖子列表2','由标题和摘要组成','<list action=\"subject\" num=\"3\" title=\"帖子及摘要\" />\r\n	<loop>\r\n	<h4><a href=\"{url}\" target=\"_blank\">{title,25}</a></h4>\r\n	<p>{descrip,40}</p>\r\n	<ul class=\"cc area-list-tree\">\r\n	{tagrelate}\r\n	</ul>\r\n	</loop>','2.jpg');
INSERT INTO pw_tpl VALUES('3','subject','帖子列表3','由若干图片和若干帖子列表组成，图片在帖子列表的左侧','<list action=\"image\" num=\"2\" title=\"图片模块\" />\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\n<loop>\r\n<a href=\"{url}\" target=\"_blank\"><img src=\"{image,100,100}\" class=\"fl\" /></a>\r\n</loop>\r\n</th>\r\n<td>\r\n<list action=\"subject\" num=\"10\" title=\"帖子排行模块\" />\r\n<ul>\r\n<loop>\r\n<li><a href=\"{url}\" title=\"{title}\" target=\"_blank\">{title,30}</a></li>\r\n</loop>\r\n</ul>\r\n</td>\r\n</tr></table>','3.jpg');
INSERT INTO pw_tpl VALUES('4','subject','帖子列表4','只由帖子列表组成','<list action=\"subject\" num=\"8\" title=\"帖子列表\" />\r\n<ul>\r\n<loop>\r\n<li><a href=\"{url}\" target=\"_blank\">{title,32}</a></li>\r\n</loop>\r\n</ul>','4.jpg');
INSERT INTO pw_tpl VALUES('5','image','图文混合','由图片和帖子列表，及摘早组成','<list action=\"image\" num=\"3\" title=\"图文模块\" />\r\n<loop>\r\n<a href=\"{url}\" target=\"_blank\"><img src=\"{image,100,100}\" class=\"fl\" /></a>\r\n<h4><a href=\"{url}\" target=\"_blank\">{title,32}</a></h4>\r\n<p>{descrip,50}</p>\r\n<div class=\"c\"></div>\r\n</loop>','5.jpg');
INSERT INTO pw_tpl VALUES('6','subject','帖子列表6','由若干图片和若干帖子列表组成，图片在帖子列表的左侧,且图片带有标题','<list action=\"image\" num=\"4\" title=\"图片模块\" />\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\n<loop>\r\n<a href=\"{url}\" target=\"_blank\"><img src=\"{image,100,100}\" class=\"fl\" /><p>{title,8}</p></a>\r\n</loop>\r\n</th>\r\n<td>\r\n<list action=\"subject\" num=\"12\" title=\"帖子排行模块\" />\r\n<ul>\r\n<loop>\r\n<li><a href=\"{url}\" title=\"{title}\" target=\"_blank\">{title,30}</a></li>\r\n</loop>\r\n</ul>\r\n</td>\r\n</tr></table>','6.jpg');
INSERT INTO pw_tpl VALUES('7','image','最新图片','包括图片，和图片所在的帖子名称','<list action=\"image\" num=\"6\" title=\"图片模块\" />\r\n<loop>\r\n<a href=\"{url}\" target=\"_blank\"><img src=\"{image,100,100}\" class=\"fl\" /><p>{title,8}</p></a>\r\n</loop>','7.jpg');
INSERT INTO pw_tpl VALUES('8','forum','版块排行','版块排行列表','<list action=\"forum\" num=\"12\" title=\"版块模块\" />\r\n<ul>\r\n<loop>\r\n<li><span class=\"fr\">{value}</span><a href=\"{url}\" target=\"_blank\">{title}</a></li>\r\n</loop>\r\n</ul>','8.jpg');
INSERT INTO pw_tpl VALUES('9','user','用户排行','版块排行列表','<list action=\"user\" num=\"12\" title=\"用户模块\" />\r\n<ul>\r\n<loop>\r\n<li><span>{value}</span><img src=\"{image,40,40}\" align=\"absmiddle\" /> <a href=\"{url}\" target=\"_blank\">{title}</a></li>\r\n</loop>\r\n</ul>','9.jpg');
INSERT INTO pw_tpl VALUES('11','player','播放器1','播放器','<div id=\"pwSlidePlayer\" class=\"pwSlide cc\" onmouseover=\"pwSlidePlayer(\'pause\');\" onmouseout=\"pwSlidePlayer(\'goon\');\">\r\n<!--#\r\n	$tmpCount=0;\r\n#-->\r\n					<list action=\"image\" num=\"6\" title=\"播放器\" />\r\n					<loop>\r\n<!--#\r\n	$tmpStyle = $tmpCount ? \'style=\"display:none;\"\' : \'\';\r\n	$tmpCount++;\r\n#-->\r\n                        <div id=\"Switch_$key\" $tmpStyle>\r\n                            <a href=\"{url}\" target=\"_blank\"><img class=\"pwSlideFilter\" src=\"{image,288,198}\" />\r\n							<h1>{title,36}</h1></a>\r\n                        </div>\r\n                        </loop>\r\n					<ul id=\"SwitchNav\"></ul>\r\n					<div class=\"pwSlide-bg\"></div>\r\n				</div>\r\n				<div class=\"c\"></div>\r\n				<script type=\"text/javascript\" src=\"js/picplayer.js\"></script>\r\n				<script language=\"JavaScript\">pwSlidePlayer(\'play\',1,$tmpCount);</script>','10.jpg');
INSERT INTO pw_tpl VALUES('12','user','用户排行2','不包括头像','<list action=\"user\" num=\"12\" title=\"用户模块\" />\r\n<ul>\r\n<loop>\r\n<li><span class=\"fr\">{value}</span><a href=\"{url}\" target=\"_blank\">{title}</a></li>\r\n</loop>\r\n</ul>','11.jpg');
INSERT INTO pw_tpl VALUES('13','subject','帖子列表5','包括帖子所在的版块','<list action=\"subject\" num=\"12\" title=\"帖子列表\" />\r\n<ul>\r\n<loop>\r\n<li><span><a href=\"{forumurl}\" target=\"_blank\">[{forumname}]</a></span><a href=\"{url}\"  target=\"_blank\">{title,32}</a></li>\r\n</loop>\r\n</ul>','12.jpg');
INSERT INTO pw_tpl VALUES('14','subject','帖子列表7','包括帖子标题和作者','<list action=\"subject\" num=\"12\" title=\"帖子列表\" />\r\n<ul>\r\n<loop>\r\n<li><span class=\"fr\"><a href=\"u.php?action=show&username={author}\" target=\"_blank\">{author}</a></span><a href=\"{url}\"  target=\"_blank\">{title,32}</a></li>\r\n</loop>\r\n</ul>','13.jpg');
INSERT INTO pw_tpl VALUES('15','subject','帖子图片复合','由一个图片有标题模块和帖子模块组成','<list action=\"image\" num=\"2\" title=\"图片模块\" />\r\n<table width=\"100%\">\r\n<tr>\r\n<th>\r\n<loop>\r\n<a href=\"{url}\" target=\"_blank\"><img src=\"{image,100,100}\" class=\"fl\" /></a>\r\n<h4><a href=\"{url}\" target=\"_blank\">{title,32}</a></h4>\r\n<p>{descrip,50}</p>\r\n<div class=\"c\"></div>\r\n</loop>\r\n</th>\r\n<td>\r\n<list action=\"subject\" num=\"10\" title=\"帖子排行模块\" />\r\n<ul>\r\n<loop>\r\n<li><a href=\"u.php?action=show&username={author}\" class=\"fr\">{author}</a><a href=\"{url}\" title=\"{title}\" target=\"_blank\">{title,30}</a></li>\r\n</loop>\r\n</ul>\r\n</td>\r\n</tr></table>','14.jpg');
INSERT INTO pw_tpl VALUES('16','image','图片列表','只包括图片','<list action=\"image\" num=\"6\" title=\"图片模块\" />\r\n<loop>\r\n<a href=\"{url}\" target=\"_blank\"><img src=\"{image,100,100}\" class=\"fl\" /></a>\r\n</loop>','15.jpg');
INSERT INTO pw_tpl VALUES('17','subject','帖子列表及说明','包括版块名称帖子及摘要说明','<list action=\"subject\" num=\"10\" title=\"帖子列表\" />\r\n<ul>\r\n<loop>\r\n<li><a href=\"{forumurl}\"><span>[{forumname}]</span></a><a href=\"{url}\" target=\"_blank\">{title,28}</a><span>&nbsp;{descrip,22}</span></li>\r\n</loop>\r\n</ul>','16.jpg');
INSERT INTO pw_tpl VALUES('18','subject','帖子及图片复合','由图片模块和帖子模块组成','<list action=\"image\" num=\"3\" title=\"图片模块\" />\r\n<loop>\r\n<a href=\"{url}\" target=\"_blank\"><img src=\"{image,100,100}\" class=\"fl\" /></a>\r\n</loop>\r\n<div class=\"c\"></div>\r\n<list action=\"subject\" num=\"7\" title=\"帖子模块\" />\r\n<ul>\r\n<loop>\r\n<li><a href=\"{url}\" target=\"_blank\">{title,36}</a></li>\r\n</loop>\r\n</ul>','17.jpg');
INSERT INTO pw_tpl VALUES('19','tag','标签模块','标签列表','<list action=\"tag\" num=\"10\" title=\"标签模块\" />\r\n<loop>\r\n<a href=\"{url}\" target=\"_blank\">{title}</a>\r\n</loop>','18.jpg');
INSERT INTO pw_tpl VALUES('20','subject','帖子及图片复合2','由图片模块和帖子模块组成','<list action=\"image\" num=\"1\" title=\"图片模块\" />\r\n<loop>\r\n<a href=\"{url}\" target=\"_blank\"><img src=\"{image,100,100}\" class=\"fl\" /></a>\r\n<h4><a href=\"{url}\" target=\"_blank\">{title,40}</a></h4>\r\n<p>{descrip,60}</p>\r\n</loop>\r\n<div class=\"c\"></div>\r\n<list action=\"subject\" num=\"7\" title=\"帖子模块\" />\r\n<ul>\r\n<loop>\r\n<li><a href=\"{url}\" target=\"_blank\">{title,40}</a></li>\r\n</loop>\r\n</ul>','19.jpg');

INSERT INTO pw_tpltype VALUES('1','subject','贴子类');
INSERT INTO pw_tpltype VALUES('2','image','图片类');
INSERT INTO pw_tpltype VALUES('3','forum','版块类');
INSERT INTO pw_tpltype VALUES('4','user','用户类');
INSERT INTO pw_tpltype VALUES('5','tag','标签类');
INSERT INTO pw_tpltype VALUES('6','player','播放器');







INSERT INTO pw_usergroups VALUES('1','default','default','8','0','1');
INSERT INTO pw_usergroups VALUES('2','default','游客','8','0','0');
INSERT INTO pw_usergroups VALUES('3','system','管理员','3','0','0');
INSERT INTO pw_usergroups VALUES('4','system','总版主','4','0','0');
INSERT INTO pw_usergroups VALUES('5','system','论坛版主','5','0','0');
INSERT INTO pw_usergroups VALUES('6','default','禁止发言','8','0','0');
INSERT INTO pw_usergroups VALUES('7','default','未验证会员','8','0','0');
INSERT INTO pw_usergroups VALUES('8','member','新手上路','8','0','0');
INSERT INTO pw_usergroups VALUES('9','member','侠客','9','100','0');
INSERT INTO pw_usergroups VALUES('10','member','骑士','10','300','0');
INSERT INTO pw_usergroups VALUES('11','member','圣骑士','11','600','0');
INSERT INTO pw_usergroups VALUES('12','member','精灵王','12','1000','0');
INSERT INTO pw_usergroups VALUES('13','member','风云使者','13','5000','0');
INSERT INTO pw_usergroups VALUES('14','member','光明使者','14','10000','0');
INSERT INTO pw_usergroups VALUES('15','member','天使','14','50000','0');
INSERT INTO pw_usergroups VALUES('16','special','荣誉会员','5','0','0');
INSERT INTO pw_usergroups VALUES('17','system','门户编辑','5','0','1');





