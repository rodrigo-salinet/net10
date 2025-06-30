<!--#include file="home/conexao.asp" -->
<!--#include file="home/conexao_configuracoes.asp" -->
<!--#include file="home/tira_html.asp" -->
<!-- #include file="arvore.asp" -->
<%
busca = Request.QueryString("busca")
		idfam = Request.QueryString("idfam")
		clicavel = true

		%>
<html>
<head>
<script>

window.status='Bem vindo(a) a <%= Ucase(Session("Cliente")) %>!';
</script>
<script>
function abrearquivo(arquivo, janela){
	window.open(arquivo, janela);
	//history.go(-1);
}
</script>
<title><%= Ucase(Session("cliente")) %></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<style>
.CLICAVEL {
	cursor: hand;
	border: #FFFFFF;

}
</style>

<style type="text/css">
<!--
.fonte {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
}
-->
</style>
</head>
<%
subfam = idfam
If idfam <> empty then
	nid = idfam
End if

If idfam = Empty then
	str = "SELECT nivel.* FROM  nivel where nivel.principal=true"
Else
	str = "SELECT nivel.* FROM  nivel where nivel.id=" & idfam
End if
	Set nivel = Conexao_banco.Execute(str)
	cliente = session("cliente")
%>
<body bgcolor="<% If not nivel.EOF then Response.Write(nivel("fundo")) %>" background="<%= nivel("fundo_imagem") %>" leftmargin="2" topmargin="0" bgproperties="fixed" marginwidth="2" marginheight="0"<% If nivel("fundo_fixo") then %><% End if %>>
<%
If Session("ultimas_fixa") = empty then Session("ultimas_fixa") = Request.QueryString("ultimas_fixa")
If Session("ultimas_fixa") then
	%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			 <tr valign="top"> 
			  <td width="63%" align="left" valign="top" bgcolor="#FFFFFF"> <strong><font color="#000000" size="2" face="Verdana">&Uacute;LTIMAS 
			   NOT&Iacute;CIAS: 
			   <IFRAME id=rotativas marginWidth=0 marginHeight=0 src="http://www.net10.com.br/clientes/site/ultimas.asp?cliente=rolandia&horizontal=true" frameBorder=0 width=400 scrolling=no height=18 allowTransparency atomicSelection="true"></IFRAME>
			   </font></strong></td>
			 </tr>
			</table>
	<%
End if
%>

			
<!-- #include file="cabecalho.asp" --><%
Set menu = Conexao_conf.Execute("Select * From TAGS Where aplica_a='menu_inicial'")
If menu("posicao_v") = "topo" then
	%><!--#include file="paginacao.asp" --><%
End if

Set onde = Conexao_conf.Execute("Select * From TAGS Where aplica_a='onde'")
If onde("mostrar") then

	%><!--#include file="localizacao.asp" --><%
End if
%>
<font size="3" face="Verdana, Arial, Helvetica, sans-serif">
<%
		Set rs = Conexao_banco.Execute("Select * From nivel where pagina_inicial like '%" & busca & "%' or  nivel like '%" & busca & "%' order by ordem")
If rs.EOF then
%>
<center>Nada foi encontrado para a consulta <strong><%= busca %></strong>.</center>
<%
Else
%>
<center>Resultado para a consulta <strong><%= busca %></strong>:</center>
<ul><%
If pagina = "" then
	If Request.QueryString("idfam") = empty then idfam = 0
		Do while not rs.EOF
			%><li><a href="<%= endereco_virtual %>default.asp?cliente=<%= Session("cliente") %>&idfam=<%= rs("id") %>"><%= texto_imagem("texto", rs("nivel")) %></a><br><% 
			pagina = rs("pagina_inicial")
			if pagina = "undefined" then
				pagina = ""
			End if
			if pagina <> empty then
				conta = conta + 1
			End if
			 %></li><br>


<%
			'call arvore(rs("id"))
			rs.movenext
		Loop
		%></ul>
<%
  Else
  %>
<%= pagina %> 
<%
  End if
End if
  %></font>
<table border="0" align="center" cellpadding="0" cellspacing="0">
 <tr> 
  <td width="1" align="right"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong></strong></font></td>
  <td width="750" align="right"><%
If menu("posicao_v") = "baixo" then
	%> <!--#include file="paginacao.asp" --> <%
End if
%></td>
  <td width="1" align="right" valign="bottom"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="home/ADM/DEFAULT.ASP?cliente=<%= Session("cliente")%>" target="_blank"><img src="home/Imagens/chave.gif" width="10" height="10" border="0"></a></strong></font></td>
 </tr>
</table><!--</td></tr></table>-->
</body>
</html>
<!-- #include file="home/fechaconexoes.asp" -->
