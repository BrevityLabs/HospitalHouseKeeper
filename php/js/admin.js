

function validateTitle() {	
	
	var name=document.forms["admin"]["txtDisplayTitle"].value;	
	
	var ck_name = /^[A-Za-z 0-9]{1,20}$/;
	if (!ck_name.test(name)) 
	{	
		document.getElementById('name_hidden').style.background = "yellow";
		txt="Enter valid name";
		document.getElementById("name_hidden").innerHTML = txt.fontcolor("red");		
		//name.focus();
		return false;	
	}
	else
	{
	document.getElementById("name_hidden").innerHTML = "";
	return true;
	}

	if(name=="")
	{
		document.getElementById('name_hidden').style.background = "yellow";
		txt="Enter valid name";
		document.getElementById("name_hidden").innerHTML = txt.fontcolor("red");		
		return false;
	}
	 else
	{
		document.getElementById("name_hidden").innerHTML = "";
		return true;
	}
}

function validateFile()  {	
	
		
	var ffile=document.forms["admin"]["file"].value;	
	if(ffile=="")  {		
		
		document.getElementById('file_hidden').style.background = "yellow";
		txt="Select a file";
		document.getElementById("file_hidden").innerHTML = txt.fontcolor("red");		
		//name.focus();
		return false;	
		
	}	
	else  {		
		document.getElementById('file_hidden').style.background = "white";
		txt="";
		document.getElementById("file_hidden").innerHTML = txt.fontcolor("red");		
		return true;			
	}	
}

function validateForm()
{
		
	if(validateFile() && validateTitle())
	{	
		return true;
	}
	else
	{	
		return false;
	}

}

