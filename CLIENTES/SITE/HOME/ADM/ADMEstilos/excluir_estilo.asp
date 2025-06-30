<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
arquivo = Request.QueryString("arquivo")
if arquivo = empty then
	arquivo = request.Form("arquivo")
End if
nome_do_css = Server.MapPath("../../clientes/" & cliente & "/estilos/" & arquivo & ".css")
If fso.FileExists(nome_do_css) then
	fso.deletefile(nome_do_css)
End if
Response.Redirect("default.asp?msg=Excluído com sucesso.&cliente=" & cliente)
%>
<!-- #include file="../../fechaconexoes.asp" -->
