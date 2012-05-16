<?php


/*
$connection = mysql_connect("localhost","root","asha123")  ;
if (!$connection) {
	die("connection failed" . mysql_error());
} 
$database = mysql_select_db("reservation",$connection) or die("database connection failed");

*/




$connection = mysql_connect("localhost","root","asha123")  ;
if (!$connection) {
	die("connection failed" . mysql_error());
}
$database = mysql_select_db("hospital",$connection) or die("database connection failed");




?>
