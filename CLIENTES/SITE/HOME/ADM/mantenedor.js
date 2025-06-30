// JavaScript Document
//function mantem()
//{
//	window.open("mantem.asp", "_blank","left=1500, top=1500")
//	window.setTimeout("mantem()", 20000)
//}

//window.close()
function mantem()
{
	mantenedor.window.history.go(0);
	setTimeout("mantem()", 5000)
}
