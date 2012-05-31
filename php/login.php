<?php
include("connection.php");

if (isset($_POST['login']))
{  
	echo "ffff";

	$flag=0;
	$userName=$_POST["userName"]; 
	$password = $_POST["password"] ; 
	if($userName=="" || $password=="") 
	{
		$flag=0;
	}
	
	if($userName!="" || $password!="") 
	{
		$query1 = "SELECT * FROM user";
		$result1 = mysql_query($query1) or die("query failed");
		while($row1= mysql_fetch_array($result1))

		{
			if(($userName==$row1[0]) && ($password==$row1[1]))
			{

				$userID=$row1[	0];
				header("location:availBed.php?userID=$userID");
				//$url = "serviceCounter.php?name=" . $serviceProviderID . "&userID=" . $userID . ""; 
				//header("Location: " . $url); 						
				$flag+=1;		
				
			}	
			else 
			{	
					
			}
		}
		if($flag!=0)
		{
			// header( 'Location: http://www.trendwiseanalytics.com/');
	
		}
		else
		{
		?>
			
			<font size="5"color="red">You are not a registered Admin</font>
		<?php			
		}	
	}
	else
	{
	?>			
		<font size="5"color="red">You are not a registered Admin</font>
	<?php	
	}	

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
<form method="POST" action="login.php" name="login">
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
<h1 style="color:black">  </h1>

<br>
<table> 


<tr>
<td align="center">  

<font size="5" color="black"> Login  </font>
</td>
</tr>

</table	>

<table>

	<tr>
		<td colspan="2" align="center">
			<h2><font color="red	">  </font></h2>	
		</td>
	<tr>		
	<tr>
		<td align="right">
			<font size="4" color="black">User Name:</font>
		</td>
		<td>
		<input type="textbox" name="userName" value="" >	
		</td>
	<tr>
	<tr>
		<td align="right">
			<font size="4" color="black">Password</font>
		</td>
		<td>
		<input type="password" name="password" value="" >	
		</td>
	<tr>
	<tr>
		<td>
		</td>
		<td>
		<input type="submit" name="login" value="Login" />		
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
</form>
</body>
</html>
