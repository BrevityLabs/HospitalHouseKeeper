<?php	
$page_name = "index.php";
include("inc_login.php");
include("lang/lang_engine.php");
?>

<html><head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <title><?php echo Translator::translate('title_launchpad',$lang);?></title>
	  
  <link href="css/reset.css" rel="stylesheet" type="text/css"/>
  <link href="css/layout.css" rel="stylesheet" type="text/css"/>
 
</head>

<body>

<!-- Header Panel Start -->
<div class="header">
<table>
  <tr>
	<td><div class="logo" style="background:url(./images/admincoy.jpg) no-repeat;">&nbsp;</div></td>
	<td><div class="title" style="text-align:center;"><h1> <?php echo Translator::translate('index_subtitle',$lang);?> </h1> </div></td>
	<td><div class="advert"> <i><?php echo Translator::translate('all_advert',$lang);?></i> </div></td>
  <tr>
</table>
</div>
<!-- Header Panel End -->

<!-- Banner Panel Start -->
<div class="banner">
	<i><?php echo Translator::translate('all_banner',$lang);?></i>
</div>

<!-- Middle Panel Start -->

<div class="middle">
<H3> <?php echo Translator::translate('index_what_ccenter',$lang);?></H3>
<?php echo Translator::translate('index_ccenter_defn',$lang);?> <br/>
<?php echo Translator::translate('index_exist_user',$lang);?> <a href="cp_register.php?act=new"><?php echo Translator::translate('index_new_user',$lang);?></a>
<br/><br/>

<?php
	if($error_message != '')
		echo $error_message;
	else
		echo "<br/>";
?>

<ul class="footerContact">
<form name="login" action="index.php" method="POST"> 
    <table style="width:500px;border:10px;margin:0 200px auto;">
        <tr>
          <td style="width:150px;border:0px;padding:10px 0px 13px 10px;"><?php echo Translator::translate('index_label_login',$lang);?>:</td>
          <td style="border:0px;">
			 <input class="textfield" name="userName" type="text" value="deborah"/>
          </td>
        </tr>
        <tr>
          <td  style="border:0px;padding:10px 0px 13px 10px;"><?php echo Translator::translate('index_label_password',$lang);?>:</td>
          <td  style="border:0px;">
			<input class="passwordfield" name="password" type="password" value="password"/>
		</td>
        </tr>
	</table>
	<div style="width:802px;margin:20px 50px auto;padding-bottom:5px;border:0px;text-align:center">
		<input name="login" class="send" value="" type="submit" />
		<input name="reset" class="reset" value="" type="reset" /> 
	</div>
</form>
</ul>
</div>
<!-- Middle Panel End -->

<!-- Footer Panel Start -->
<div class="footer">
<ul class="footerContact">
<a href="admin.php"><?php echo Translator::translate('index_admin_login',$lang);?> </a>
</ul>
</div>
<!-- Footer Panel End -->

<!-- Copyright Start 
<?php 
	include('inc_copyright.php');
	mysql_close();
?>
	 Copyright End -->

</body>
</html>
