<?php
include("lang/lang_engine.php");

session_start();
?>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<?php

if (!isset($_SESSION['custguid'])) {
	header("Location:index.php?reason=timeout") ;
	exit();
}
?>
  
  <title><?php echo Translator::translate('title_launchpad',$lang);?></title>
	  
  <link href="css/reset.css" rel="stylesheet" type="text/css"/>
  <?php if ($_SESSION['is_admin']) { ?>
	  <link href="css/layout2.css" rel="stylesheet" type="text/css"/>
  <?php } else { ?>
	  <link href="css/layout.css" rel="stylesheet" type="text/css"/>
  <?php } ?>
	  
  <script src="js/ajax_master.js" type="text/javascript"></script>
  <script src="js/validate.js" type="text/javascript"></script>
  <script> <!--
	function open_ccenter(guid,lang) {
		var wn_props = "left=0,top=0,fullscreen=1,toolbar=0,location=0,directories=no,status=no,menubar=0,scrollbars=0,resizable=no" ;
		wn_props += ",width="+screen.width ;
		wn_props += ",height="+screen.height ;
		lang = lang.toLowerCase() ;
		window.open('cc_run.php?lang='+lang+'&centguid='+guid,'',wn_props);
  	}
  -->
  </script>
</head>
<body>

<!-- Header Panel Start -->
<div class="header">
<table>
  <tr>
	<td><div class="logo" style="background:url(./images/admincoy.jpg) no-repeat;">&nbsp;</div></td>
	<td><div class="title"><center><h1> <?php echo Translator::translate('title_launchpad',$lang);?> </h1></center> </div></td>
	<td><div class="advert"> <i> Insert an advertisement here</i> </div></td>	
  <tr>
</table>
</div>
<!-- Header Panel End -->

<!-- Banner Panel Start -->
<?php include ('inc_banner.php');?>
<!-- Middle Panel Start -->

<div class="middle">
<table><tr>
	<td>
		<H3> <?php echo Translator::translate('list_ccenter_header',$lang);?></H3>
		<?php echo Translator::translate('list_create_new',$lang);?>:	
			<input type="button" class="newbutton" name="butNewClient" id="butNewClient" 
					onclick="validate_data('new','');" />
	</td>
</tr></table>
<table>
	<tr class="listing">
		<th><?php echo Translator::translate('list_tabhead_serial',$lang);?></th>
		<th> <?php echo Translator::translate('list_tabhead_logo',$lang);?> </th>
		<th> <?php echo Translator::translate('list_tabhead_display',$lang);?></th>
		<th> <?php echo Translator::translate('list_tabhead_toemail',$lang);?></th>
		<th><?php echo Translator::translate('list_tabhead_ccemail',$lang);?></th>
		<th> <?php echo Translator::translate('list_tabhead_lang',$lang);?></th>
		<th> <?php echo Translator::translate('list_tabhead_action',$lang);?></th>
	</tr>
<?php
include("connection.php");

//get the customer details 	
	$isadmin = @$_SESSION['is_admin'];
	
	if ($isadmin)
		$query="select centguid, custguid, logoextn, disptitl,to_email,cc_email,lang from cc_center";
	else
		$query="select centguid, custguid, logoextn, disptitl,to_email,cc_email,lang from cc_center where custguid='". $_SESSION['custguid'] ."'" ;
	$result = mysql_query($query) or die ("query failed 0");
	$count = 0;
	while($row = mysql_fetch_array($result)) {
		echo "<tr>";
		echo  "<td><center>".++$count."</center></td>" ;
		for ($i = 2; $i < 7; $i++) {
			if ($i == 2) {
				$dataval = $row[0] . $row[$i] ;
?>
	<td>
		<img src='./images/<?echo $dataval;?>')>
		</img>
	</td>
<?php
				
			}  else {
				$dataval = $row[$i] ;
?>
<td>
	<a 	href='' 
		onclick="open_ccenter('<?echo $row[0];?>','<?echo $row[6];?>');">
		<?echo $dataval;?>
	</a>
</td>
<?php
			}//endif
		}//endfor ?>
<td>
	<input type="button" class="viewbutton" name="butViewClient" id="butViewClient" onclick="validate_data('view','<?echo $row[0];?>');"/>
	<input type="button" class="edtbutton" name="butEditClient" id="butEditClient" onclick="validate_data('edit','<?echo $row[0];?>');"/>
	<input type="button" class="delbutton" name="butDeleteClient" id="butDeleteClient" onclick="validate_data('delete','<?echo $row[0];?>');"/>
</td>

<?php		} //endwhile	
?>
</tr></table>

</div> <!-- listing -->

<!-- Middle Panel End -->

<!-- Footer Panel Start -->

<div class="footer">
<ul class="footerContact">

</ul>
</div>
<!-- Footer Panel End -->


<!-- Copyright Start -->
<?php 
	include('inc_copyright.php');
	mysql_close();
?>
<!--  Copyright End -->


</body>
</html>
