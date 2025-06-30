<!--#include file="conexao.asp"-->
<%
Set login = Conexao.Execute("Select * From Login")
If Request.Form("usuario") = login("usuario") and Request.Form("senha") = login("senha") then
	Session("usuario") = Request.Form("usuario")
	Session("senha") = Request.Form("senha")
End if
Response.Redirect("admin.asp")
%>