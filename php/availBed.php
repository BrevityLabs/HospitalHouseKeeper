<?php 
session_start();

include("connection.php");


if(isset($_REQUEST['name']))
{
	$name = $_GET['name'];
	
	if($name=='display')
	{
		$id = $_GET['id'];
	
		$query3 = "select * from patientdetails where bedID=$id";
		$result3 = mysql_query($query3) or die("query failed");
		$row3=mysql_fetch_array($result3);
		
		$_SESSION[displayID] = $id;
		echo $_SESSION[displayID];
		
	}

	else 
	{		
		
		$id = $_GET['id'];	
			
		$query2="select status from bedinformation where id=$id";
		$result2 = mysql_query($query2) or die("query failed");
		$row2=mysql_fetch_array($result2);
		if($row2[0]==1)
		{	
			$query1="update bedinformation set status=2 where id=$id";
			$result1 = mysql_query($query1) or die("query failed");
		}
		else if($row2[0]==2)
		{	
			$query1="update bedinformation set status=3 where id=$id";
			$result1 = mysql_query($query1) or die("query failed");
		}
		else if($row2[0]==3)
		{
			$query1="update bedinformation set status=1 where id=$id";
			$result1 = mysql_query($query1) or die("query failed");
		}	
	}
}




?>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

  <title>Customer Comment Center&#153</title>
	
	
	<script type="text/javascript" src="js/index.js"></script> 
	  
  <link href="css/reset.css" rel="stylesheet" type="text/css"/>
  <link href="css/layout.css" rel="stylesheet" type="text/css"/>
</head>



<body>
<form name="availBed">

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
<h1 style="color:black">Availability of Beds</h1>

<br>


<table>
<tr>

<?php 

$query="select * from bedinformation";
$result = mysql_query($query) or die("query failed");
$num=mysql_num_rows($result);


	
/*

while($row = mysql_fetch_array($result))
{
	if($row[2]==2)
	{
		$color="red";		
	}
	else if($row[2]==3)
	{
		$color="	00FF00";		
	}
	else 
	{
		$color="white";		
	}
	
//SHOWING BED PICTURE
	
	if($row[2]==1)
	{
	
?>	

<td bgcolor="<?php echo $color; ?>" align="center" bgcolor=""> <font size="5" color="black"> <?php echo $row[1]; ?>  <br><br> 1 </font> <br><br><br><br> <a href="availBed.php?name=<?php echo $row[1];?>&id=<?php echo $row[0]; ?>  "> <br><br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Discharge</a></td>

	
<?php 	
	}
	
	else if($row[2]==2)
	{
		?>	
	 	
	<td bgcolor="<?php echo $color; ?>" align="center" bgcolor=""> <font size="5" color="white"> <?php echo $row[1]; ?>  <br><br>  <br><br> &nbsp;&nbsp;&nbsp; </font>  <a href="availBed.php?name=<?php echo $row[1];?>&id=<?php echo $row[0]; ?>  "> <br><br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="white">Cleaning</font> </a></td>
		
		<?php
		
	}
	else 
	{
	
		?>
	
	<td bgcolor="<?php echo $color; ?>" align="center" bgcolor=""> <font size="5" color="black"> <?php echo $row[1]; ?>  <br><br>  </font> <br><br><br><br> <a href="patientRegistration.php?name=<?php echo $row[1];?>&id=<?php echo $row[0]; ?>  "> <br><br><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </a></td>
	
	
	<?php
	}

	
}

*/


$range = ($num/4);
$range = (int)$range;
$rem = $num%4;


//while($row = mysql_fetch_array($result))
	//{

for($i=0;$i<$range;$i++)
{
	?>


<tr>

<?php

for($j=0;$j<4;$j++)
{
	$row = mysql_fetch_array($result);
	
	
	if($row[2]==2)
	{
		$color="red";
	}
	else if($row[2]==3)
	{
		$color="	00FF00";
	}
	else
	{
		$color="white";
	}
	


//SHOWING BED PICTURE

if($row[2]==1)
{
	$displayID = $_SESSION[displayID];		
		
	
	
	if($row[0]==$displayID)
	{
		//showTable();
	}
		
	
	
	

?>

<td bgcolor="<?php echo $color; ?>" align="center" bgcolor=""> <a href="availBed.php?name=display&id=<?php echo $row[0]; ?>" >  <font size="5" color="black"> <?php echo $row[1]; ?> </a>
  <br><br>  <img src="images/bed1.png" width=55px height=30px Title="<?php echo "name ="; echo $row[1];?>" > </font> <br> <a href="availBed.php?name=<?php echo $row[1] ; ?>&id=<?php echo $row[0]; ?>"  ">   Discharge </a></td>


<?php
	
}


else if($row[2]==2)
{
?>

<td bgcolor="<?php echo $color; ?>" align="center" bgcolor=""> <font size="5" color="white"> <?php echo $row[1]; ?>   </font> <br><br><br><br> &nbsp;  <a href="availBed.php?name=<?php echo $row[1];?>&id=<?php echo $row[0]; ?>  ">  <font color="white">Cleaning</font> </a></td>

<?php

}
else
{

?>

<td bgcolor="<?php echo $color; ?>" align="center" bgcolor=""> <font size="5" color="black"> <?php echo $row[1]; ?>    </font> <br><br><br><br> &nbsp; <a href="patientRegistration.php?name=<?php echo $row[1];?>&id=<?php echo $row[0]; ?>  "> Register  </a></td>


<?php
}
?>


<?php

}//for(4)
?>
</tr>


<?php

}

?>

<tr>
<?php
for($i=0;$i<$rem;$i++)
{

$row = mysql_fetch_array($result);


if($row[2]==2)
{
	$color="red";
}
else if($row[2]==3)
{
	$color="	00FF00";
}
else
{
	$color="white";
}



//SHOWING BED PICTURE

if($row[2]==1)
{

	?>

<td bgcolor="<?php echo $color; ?>" align="center" bgcolor=""> <font size="5" color="black"> <?php echo $row[1]; ?>  <br><br>  <img src="images/bed1.png" width=55px height=30px> </font> <br> <a href="availBed.php?name=<?php echo $row[1];?>&id=<?php echo $row[0]; ?>">   Discharge </a></td>


<?php
}


else if($row[2]==2)
{
?>

<td bgcolor="<?php echo $color; ?>" align="center" bgcolor=""> <font size="5" color="white"> <?php echo $row[1]; ?>  <br><br> </font> <br><br><br><br> &nbsp;  <a href="availBed.php?name=<?php echo $row[1];?>&id=<?php echo $row[0]; ?>  ">  <font color="white">Cleaning</font> </a></td>

<?php

}
else
{

?>

<td bgcolor="<?php echo $color; ?>" align="center" bgcolor=""> <font size="5" color="black"> <?php echo $row[1]; ?>  <br><br>  </font> <br><br><br><br> &nbsp; <a href="patientRegistration.php?name=<?php echo $row[1];?>&id=<?php echo $row[0]; ?>  "> Register  </a></td>


<?php
}

}


?>


</table>
</div>

<!-- Middle Panel End -->

<!-- Footer Panel Start -->
<div class="footer">
</div>
<!-- Footer Panel End -->

<!-- Copyright Start 
<?php 
	include('inc_copyright.php');
	session_destroy();
	mysql_close();
?>
	 Copyright End -->


</form>
</body>
</html>
