



function bubble() {

	var name=document.forms["availBed"]["txtName"].value;
	var ck_name = /^[A-Za-z ]{1,20}$/;

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
