<?php

class mailmodel {

	var $base;
	var $db;
	var $setting;

	function __construct(&$base) {
		$this->mailmodel($base);
	}

	function mailmodel(&$base) {
		$this->base = $base;
		$this->db = $base->db;
		$this->setting = $this->base->init_cache();
	}

	function send($toemail, $subject, $message, $fromemail = '') {
		$mapp = $this->base->load('app');
		$thisapp = $mapp->applist($this->base->appid);
		$appname = $thisapp['name'];
		$charset = $this->setting['charset'];
                $fromemail = $fromemail ? $fromemail : $this->setting['mailfrom'];

		if ($this->setting['mailsend'] == 1 || $this->setting['mailsend'] == 3) {
			$subject = "=?$charset?B?".base64_encode(str_replace(array("\r","\n"), array('',' '),$subject)).'?=';
			$message = chunk_split(base64_encode(str_replace("\r\n.", " \r\n..", str_replace("\n", "\r\n", str_replace("\r", "\n", str_replace("\r\n", "\n", str_replace("\n\r", "\r", $message)))))));
			
			$email_from = ($fromemail == '') ? '=?'.$charset.'?B?'.base64_encode($appname)."?= <{$this->setting[maildefault]}>" : (preg_match('/^(.+?) \<(.+?)\>$/',$fromemail, $from) ? '=?'.$charset.'?B?'.base64_encode($from[1])."?= <$from[2]>" : $fromemail);

			$headers = "From: $email_from\r\nX-Mailer: PHPWind Mail\r\nMIME-Version: 1.0\r\nContent-type: text/".($this->setting['htmlon'] ? 'html' : 'plain')."; charset=$charset\r\nContent-Transfer-Encoding: base64";
		}
		if ($this->setting['mailsend'] == 1) {
			return @mail($toemail, $subject ,$send_message, $headers);
		} elseif ($this->setting['mailsend'] == 2) {
			require("mail/class.phpmailer.php");
			$mailClass = new PHPMailer();
			$mailClass->IsSMTP(); 
			$mailClass->Host = $this->setting['mailserver'];
			$mailClass->Port = $this->setting['mailport'];
			$mailClass->CharSet=$charset ? $charset : 'gb2312';  				//"utf-8";   //   = 'iso-8859-1'; 
			$mailClass->SMTPAuth = true; 					// 设置为安全验证方式 
			$mailClass->Username = $this->setting['mailauth_username'];
			$mailClass->Password = $this->setting['mailauth_password'];
			preg_match('/^(.+?) \<(.+?)\>$/',$fromemail, $from);
			$mailClass->From = $from[2] ? $from[2] : $this->setting[maildefault];
			$mailClass->FromName = $from[1] ? $from[1] : $appname;
			$mailClass->AddAddress($toemail);
			//$mailClass->AddAddress("youxihu@qq.com");
			$mailClass->WordWrap = 50;   				// 50字折行
			//$mailClass->AddAttachment("/var/tmp/file.tar.gz");     			// 加附件
			//$mailClass->AddAttachment("/tmp/image.jpg", "new.jpg");  			// 附件，也可选加命名附件
			$mailClass->IsHTML(true);				// 设置邮件格式为 HTML
			$mailClass->Subject = $subject;  
			$mailClass->Body = $message;
			return $mailClass->Send();
		} elseif ($this->setting['mailsend'] == 3) {
			ini_set('SMTP', $this->setting['mailserver']);
			ini_set('smtp_port', $this->setting['mailport']);
			ini_set('sendmail_from', $email_from);
			return @mail($toemail, $subject, $message, $headers);
		}
	}
}
?>
