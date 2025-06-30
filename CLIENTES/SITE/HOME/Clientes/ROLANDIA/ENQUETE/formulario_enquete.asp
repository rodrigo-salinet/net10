<%
'Criando objeto 

Set FSO = Server.CreateObject("Scripting.FileSystemObject")

arquivo = "dados/enquete.mdb"
caminho = ""


'Achando arquivo - INICIO
if (FSO.FileExists(arquivo) <> true) then
	While NOT(FSO.FileExists(arquivo2))
		caminho = "../" & caminho
		arquivo2 = Server.MapPath(caminho & arquivo)
	Wend
	whichFN = arquivo2
Else
	whichFN = arquivo
End if


'Achando arquivo - FIM
contxt = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&whichFN&";"
Set Conexao = CreateObject("Adodb.Connection")
Conexao.open contxt
%>
<html>
<head>
<title>Formul&aacute;rio Enquete</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="css/styles.css">
<script>
function checkEmail() 
{
	//if(form1.nome.value=="")
	//{
	//	alert("Por favor preencha seu nome.")
	//}
	//else
	//{
		//if((form1.email.value=="")||((/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form1.email.value))))
		//{
		//	alert("Por favor preencha seu E-mail!")
		//}
		//else
		//{
			form1.submit();
		//}
	//}
}
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="50%" border="0" align=center class=enquete>
<tr> 
    <td colspan=3 class=nav align=center> <font size="2" color="#CCCCCC">Confirma&ccedil;&atilde;o 
      de dados</font><br>
      <%
			sql="SELECT * FROM enquete_pergunta where id_enquete="&Request.QueryString("id_p")&" ORDER BY data "
			set perguntas=conexao.execute(sql)
			sql="SELECT * FROM enquete_respostas where id_resposta="&Request.form("resposta")
			Set resposta = conexao.execute(sql)
		%>
      <%= perguntas("pergunta") %><br>
<font color="#99FFFF">Reposta: <%= resposta("respostas")%> </font></td>
</tr>
<tr> 
<td colspan=3 class=enquete>
<form name="form1" method="post" action="send_enquete.asp">
<table width="100%" border="0" cellspacing="0">
<tr> 
<td>Nome: </td>
<td>
<input type="text" name="nome">
            </td>
</tr>
<tr> 
<td>E-mail: </td>
<td>
<input type="text" name="email">
            </td>
</tr>
<tr>
<td>Telefone: </td>
<td>
<input type="text" name="telefone">
</td>
</tr>
</table>
<p align="center"> 
<input type="button" name="Button" value="Enviar Resposta" onClick=checkEmail()>
<input type="reset" name="Submit2" value="Cancelar e Voltar" onClick="javascript:history.go(-1)">
<input type="hidden" name="resposta" value="<%= Request.form("resposta") %>">
</p>
</form>
</td>
</tr>
</table>

</body>
</html>
