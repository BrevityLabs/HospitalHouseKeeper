<?php 
include("connection.php");


if (isset($_POST['register']))
{

	$patientName = $_POST['patientName'];
	$address = $_POST['address'];
	$cellphone = $_POST['cellphone'];	
	$assignBedNo = $_POST['assignBedNo'];		
	
//GUID CREATION	
	
	
	function guid(){
		if (function_exists('com_create_guid')){
			return trim(com_create_guid(), '{}');
		}
		else{
			mt_srand((double)microtime()*10000);//optional for php 4.2.0 and up.
			$charid = strtoupper(md5(uniqid(rand(), true)));
			$hyphen = chr(45);// "-"
			$uuid = chr(123)// "{"
			.substr($charid, 0, 8).$hyphen
			.substr($charid, 8, 4).$hyphen
			.substr($charid,12, 4).$hyphen
			.substr($charid,16, 4).$hyphen
			.substr($charid,20,12)
			.chr(125);// "}"
			return trim($uuid, '{}');
		}
	}
	
	
	$guid=guid();
	echo "guid =";	
		
	$query2 = "insert into patientdetails values('$guid','$patientName',
			'$address','$cellphone',$assignBedNo)";
	echo $query2;
		
	
	$result2=mysql_query($query2) or  die ("query failed");		
	$query3 = "update bedinformation set status=1 where id=$assignBedNo";
	
	$result2=mysql_query($query3) or  die ("query failed 1");;		
	header('Location:availBed.php');
		
}

?>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Customer Comment Center&#153</title>	  
  <link href="css/reset.css" rel="stylesheet" type="text/css"/>
  <link href="css/layout.css" rel="stylesheet" type="text/css"/>
</head>

<body>
<form method="POST" action="patientRegistration.php" name="patientRegistration">

<div class='outermost'>
<div class='outermost'>

<!-- Header Panel Start -->
<div class="header">
<table>
  <tr>
	
<!-- 	<td><div class='logo'>&nbsp;</div></td>   -->
	
	<td><div class="title" style="text-align: center">
	
		<br><br>		
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="images/logo.jpg" width=100px height=45px><br/>					
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;
				
	<font size="6"> Hospital Management </font>
	
	
	 </div></td>
	<td><div class="advert"> <i></i> </div></td>
  <tr>
</table>

</div>
<!-- Header Panel End -->


<!-- Banner Panel Start -->
<!-- div class="banner">
	<i>< ?php echo Translator::translate('all_banner',$lang);? ></i>
</div-->

<!-- Middle Panel Start -->
<div class="middle" style="text-align:center">
<br>
<h1 style="color:black"> </h1>

<br>

<table align="center" bgcolor="meroon" height="35%" width="35%">

<tr>
		<td colspan="2" align="center">
			<h2><font color="black"> <u>Patient Registration </font></h2>	
		</td>
	<tr>	
		
	<tr>
		<td align="right">
			<font size="3" color="black">Name:</font>
		</td>
		<td>
		<input type="textbox" name="patientName" value="<?php echo $userRegistration["userName"]; ?>" onkeyup="validateUserName()" onblur="checkAvailability()">		
		<!--</br> align="center"<input type="submit" name="avail" style="height: 30px; width: 150px" value="check availability"> -->	

		<?php
		
/*****************************availability checking****************************************/

if (isset($_POST['avail']))
{
	$f=0;
	//$userName=$_POST["userName"]; 
	$userName = mysql_real_escape_string($_POST['userName']);
	$len=strlen($userName);

	if($len>=4)
	{
		$query="select * from login where role=0";
		$result=mysql_query($query) or  die ("query failed");
		while($row=mysql_fetch_array($result))		
		{
			if (strcasecmp($userName, $row[1]) == 0)					
			{
			$f=$f+1;
			}
		}

		if($f!=0)
		{?>
		    <br><span id="userNameID" style=" background-color:red;"><font color="black"><b>&nbsp;Not available </font></span>
		<?php 
		}
		else
		{ ?>
	     <br><span id="userNameID" style=" background-color:red;"><font color="black"><b>&nbsp;OK </font></span>
		<?php 

		}
	}
	else
	{?>
	     <br><span id="userNameID" style=" background-color:red;"><font color="black"><b>&nbsp;minimum 4 characters </font></span>
		<?php 
	}
}
/*************************************************************************************************************/

		?>
		</td>
	
	<tr>
	<tr>
		<td align="right">
			<font size="3" color="black"> Address:</font>
		</td>
		<td>
<textarea name="address" rows="3" cols="20"></textarea>
		<br><span id="passwordID"></span>
		</td>
	<tr>
	<tr>
		<td align="right">
			<font size="3" color="black">Cellphone No:</font>
		</td>
		<td>
		<input type="text" name="cellphone" value="" onkeyup="validateConformPassword()" onKeyPress="return submitenter(this,event)">
		<br><span id="conformPasswordID"></span>
		</td>
	<tr>
	
	
	
		<tr>
		<td align="right">
			<font size="3" color="black"> Assign to Bed:</font>
		</td>
		<td>
		<select name="assignBedNo">
		<option value="select"> Select Bed No:</option>
		
		<?php 
		$f=0;
		$query1="select * from bedinformation where status=0 OR status=3";
		$result1=mysql_query($query1) or  die ("query failed");
		while($row1=mysql_fetch_array($result1))
		{
		?>				
		<option value="<?php echo $row1[0]; ?>"><?php echo $row1[1];?></option>
	
		<?php 
		}
		?>
		
		
		</select>
		</td>
	<tr>
		
	<tr>
		<td>
		</td>
		<td align="center">
		<input id="enter" type="submit" name="register" value="Register" />		
		<input type="reset" name="reset" value="Reset" />
		</td>		
	<tr>
	
		
</table>

<!-- Middle Panel End -->

<!-- Footer Panel Start -->
<div class="footer">
</div>
<!-- Footer Panel End -->

<!-- Copyright Start 
<?php 
	include('inc_copyright.php');
	mysql_close();
?>
	 Copyright End -->

</div>
</div>


</form>
</body>
</html>
