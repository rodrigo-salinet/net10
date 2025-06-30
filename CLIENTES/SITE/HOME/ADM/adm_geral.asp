<%
Set fso = CreateObject("Scripting.FileSystemObject")
anome=Request.Form("anome")
asenha=Request.Form("asenha")
nome=Request.Form("nome")
senha=Request.Form("senha")
cliente = Request.Form("cliente")
alterar = Request.QueryString("alterar")
id = Request.QueryString("id")
cliente = cliente


	%>
	<html>
	<head>
	<title>Administrador Geral</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	</head>
	
	<body>
<%
	if cliente <> empty then
	%>
<!-- #include file="../conexao.asp" --><!-- #include file="conexao_ADM.asp" -->

<%
If anome = "Viasulnet" and asenha = "kbfa9kjs" then
	If alterar then
		If id <> empty then
			Conexao_adm.Execute("Update usuario set nome='" & nome & "', senha='" & senha & "'" & "where id=" & id)
			%>Alterado.<%
		Else
			Conexao_adm.Execute("Insert Into usuario(nome, senha, geral) values('" & nome & "', '" & senha & "', true)")
			%>Inserido.<%
		End if
	End if
		Set rs = Conexao_adm.Execute("Select * From usuario where geral=true")
		If not rs.EOF then
			id = rs("id")
			nome = rs("nome")
			senha = rs("senha")
		Else
			nome = "default"
			senha = "default"
		End if
		%>
	<form name="form1" method="post" action="adm_geral.asp?alterar=true&id=<%= id %>">
	 <table border="1" cellspacing="0" cellpadding="0">
	  <tr> 
	   <td height="20" bordercolor="#FFFFFF">Nome de usu&aacute;rio:&nbsp;</td>
	  </tr>
	  <tr> 
	   <td bordercolor="#FFFFFF">
	<input type="text" name="nome" value="<%= nome %>">
		&nbsp;</td>
	  </tr>
	  <tr> 
	   <td bordercolor="#FFFFFF">Senha:</td>
	  </tr>
	  <tr> 
	   <td bordercolor="#FFFFFF">
	<input type="text" name="senha" value="<%= senha %>">
		&nbsp;</td>
	  </tr>
	  <tr>
	   <td align="right" bordercolor="#FFFFFF"> 
		<input type="submit" name="Submit" value="Enviar">
	   </td>
	  </tr>
	 </table>
	 <input type="hidden" value="<%= anome %>" name="anome">
	 <input type="hidden" value="<%= asenha %>" name="asenha">
	 <input type="hidden" value="<%= cliente %>" name="cliente">
</form>
	<%
	End if
Else
%>
	
<form name="form1" method="post" action="adm_geral.asp?cliente=<%=cliente%>">
 <%
	Set pasta = fso.GetFolder(Server.MapPath("../../../dados"))
		%><select name="cliente">
		<%	For each spasta in pasta.subfolders
%>
		<option value="<%= spasta.name %>"><%= spasta.name %></option>
			<%
		Next
		%>
		</select>
	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	   <td><input name="anome" type="text" id="anome">
		<input name="asenha" type="password" id="asenha">
   <input type="submit" name="Submit2" value="Enviar"></td>
	  </tr>
	 </table>
	 </form>

<%
End if 
%>
</body>
	</html>
<!-- #include file="../fechaconexoes.asp" -->
