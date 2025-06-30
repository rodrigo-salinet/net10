<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../../CONEXAO_ULTIMAS.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
id = Request.Querystring("id")

str = "Delete * From ultimas where id_ultimas=" & id
Conexao_Ultimas.Execute(str)

Response.Redirect("default.asp?cliente=" & cliente & "&msg=Excluído com sucesso.")
%><!-- #include file="../../fechaconexoes.asp" -->
