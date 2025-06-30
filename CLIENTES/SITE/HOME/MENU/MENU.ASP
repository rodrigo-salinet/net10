<!--#include file="../conexao.asp" -->
<!--#include file="../conexao_configuracoes.asp" -->
<HTML>
<%
'on error goto 0
function niveis(nivel)
	'REsponse.Write(nivel & vbcrlf)
	str = "Select * From nivel where subfam=" & nivel
	'REsponse.Write(str & vbcrlf)
	Set rs = conexao_banco.Execute(str)
	
	If not rs.EOF then
		Do while not rs.EOF
		
			id = rs("id")
			If id = 29 then 
				oid = "i0"
			Else
				oid = "i" & id
			End if
			If rs("subfam") = 0 then
				asubfam = ""
			Else
				asubfam = "i" & rs("subfam")
			End if
			Response.Write("menu_superior.awBmnbspM('" & oid & "','" & asubfam & "','"& rs("nivel") & "','#','_self',80,30,'','','#FFFFFF','#FFFFFF','#000000','#000080','');" & vbcrlf)
			call niveis(rs("id"))
			rs.movenext
		Loop
	End if
End function

%>
<body>
<!-- PLEASE INSERT THESE CODES BETWEEN <BODY> ... </BODY> TAGS! -->
<!-- START Javascript Menu Builder GOLD 1.0 config parameters. Don't modify these codes by yourself -->
<script type='text/javascript' src='awjsmenugold10trial.js'></script>
<script type='text/javascript'>
var awbMNBSpm=new awbmnbspm();
menu_superior=new TJSMenuType2('menu_superior','',1,1,0,0,0,0,0,1000,2,'arial,helvetica,times new roman',8,1,0,1,'#004080',40,20,1,5,1,'progid:DXImageTransform.Microsoft.GradientWipe(duration=0.5,wipeStyle=1)');
<%
call niveis(0)
%>
menu_superior.awBmNBspm();
</script>
<noscript>Your browser does not support Javascript!</noscript>
<!-- END Javascript Menu Builder GOLD 1.0 config parameters -->
<!-- PLEASE INSERT THESE CODES BETWEEN <BODY> ... </BODY> TAGS! -->
</body>
</HTML>
