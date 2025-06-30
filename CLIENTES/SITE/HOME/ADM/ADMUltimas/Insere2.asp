<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../../CONEXAO_ULTIMAS.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
If tc < 100 then
%>

<%
desc = Request.Form("desc")
desturl =  Request.Form("desturl")
id = replace(Request.Form("link"), "insere.asp?id=", "")
tipo = Request.Form("tipo")
If tipo = "banco" then
	Set nome = Conexao_banco.Execute("Select * From nivel where id=" & id)
'	desc = texto_imagem("texto", nome("nivel"))
'	desturl = endereco_virtual & "/default.asp?cliente=" & cliente & "&id=" & id
'	str2 = "Insert into Ultimas ([desc], desturl) values (' ','')"
'	Conexao_Ultimas.Execute(str2)
	
	
	Conexao_ultimas.Execute("insert into ultimas([desc], desturl, font, textcolor, loadwhere) values('Leia mais...    ', '" & caminho_virtual & "default.asp?id=" & id & "&cliente=" & cliente & "', 'Verdana,plain,10', '100,0,0', '_parent')")
	Conexao_ultimas.Execute("insert into ultimas([desc], delay, font) values('" & texto_imagem("texto", nome("nivel")) & "    ', '1000', 'Verdana,bold,14')")
	Conexao_ultimas.Execute("insert into ultimas([desc]) values(' ')")

	
	
Else
	str = "Insert into Ultimas ([desc], desturl) values ('" & desc & "','" & desturl & "')"
	'Response.Write(str)
	Conexao_Ultimas.Execute(str)

End if

Response.Redirect("default.asp?cliente=" & cliente & "&msg=Inserido.")
%><%
  else
  %>
<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= msg_cheia %><br>
<a href="javascript:history.go(-1)"><font size="2">Clique aqui para voltar.</font></a></strong></font> 
<%
  End if
  %><!-- #include file="../../fechaconexoes.asp" -->
