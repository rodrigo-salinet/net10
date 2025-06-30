<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<%
Session("Autorizado") = ""
Session("nome") = Request.Form("nome")
Session("senha") = Request.Form("senha")

Response.Redirect("administrador.asp?cliente=" & Request.QueryString("cliente"))
%><!-- #include file="../fechaconexoes.asp" -->
