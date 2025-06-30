<!-- #include file="home/conexao.asp" -->
<!-- #include file="home/conexao_configuracoes.asp" -->
<!-- #include file="home/tira_html.asp" -->
<!-- #include file="arvore.asp" -->
<%

cam_online = Server.MapPath("home/clientes/" & cliente & "/online.txt")

'Response.Write(cam_online & "*")
If fso.FileExists(cam_online) then
	Set cam_online1 = fso.OpenTextFile(cam_online)
	total_online = cint(cam_online1.readall)
	Set cam_online = fso.OpenTextFile(cam_online, 2)
else
	Set cam_online = fso.CreateTextFile(cam_online)
	total_online = 1
End if
if cint(total_online) <= 0 then total_online = 1
cam_online.write(total_online + 1)



Session.LCID = 1046
idfam = Request.QueryString("idfam")
clicavel = "true"
if idfam = 29 then idfam = 0

subfam = idfam
If idfam <> empty then
	nid = idfam
End if
If idfam = Empty or idfam = 0 then
	str = "SELECT nivel.* FROM  nivel where nivel.principal=true"
	Set nivel = Conexao_banco.Execute(str)
	idfam = nivel("id")
Else
	str = "SELECT nivel.* FROM  nivel where nivel.id=" & idfam
	Set nivel = Conexao_banco.Execute(str)
End if
	cliente = cliente
	

camstatus = Server.MapPath("home/clientes/" & cliente & "/status.txt")

If fso.FileExists(camstatus) then
	Set arqStatus = fso.OpenTextFile(camstatus)
	txtstatus = arqStatus.Readall
Else
	txtstatus = "Bem vindo(a) a " & Ucase(cliente) & "!"
End if
estilo = nivel("estilo")
%>
<html>
<head>
<script>
window.status='<%= txtstatus %>';
</script>
<script>
<!--
function abrearquivo(arquivo, janela){
	window.open(arquivo, janela);
	if(janela != "_self")
	history.go(-1);
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<title><%= Ucase(cliente) %></title>
<link href="home/clientes/<%= cliente %>/css/estilo<%= idfam %>.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<% 
If nivel.fields.count > 10 then 
head = nivel("head")
If instr(head,  "&#" & asc("""") & ";")>0 then
	head = replace(head,  "&#" & asc("""") & ";", "'")
End if
If instr(head,  "&#" & asc("'") & ";")>0 then
	head = replace(head,  "&#" & asc("'") & ";", "'")
End if

%>
<%= head %> 
<% End if %>
<style type="text/css">
<!--
.fonte {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
}

.fontepequena {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 8px;
}
-->
</style>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<link href="<%= estilo %>" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<% If not nivel.EOF then Response.Write(nivel("fundo")) %>" background="<%= nivel("fundo_imagem") %>" leftmargin="2" topmargin="0" marginwidth="2" marginheight="0" onunload="MM_openBrWindow('fecha.asp?cliente=<%= cliente %>','Fecha','width=2,height=2, left=2000, top=2000')"<% If nivel("fundo_fixo") then %> bgproperties="fixed"<% End if %>>
<%
If Session("ultimas_fixa") = empty then Session("ultimas_fixa") = Request.QueryString("ultimas_fixa")
If Session("ultimas_fixa") then
	%>
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			 <tr valign="top"> 
			  <td width="63%" align="left" valign="top" bgcolor="#FFFFFF"> <strong><font color="#000000" size="2" face="Verdana">&Uacute;LTIMAS 
			   NOT&Iacute;CIAS: 
			   <IFRAME id=rotativas marginWidth=0 marginHeight=0 src="<%= endereco_virtual %>/ultimas.asp?cliente=<%= cliente %>&horizontal=true" frameBorder=0 width=400 scrolling=no height=18 allowTransparency atomicSelection="true"></IFRAME>
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


If restringe_tamanho then
	%>
	<table align="left" width="779"><tr><td>
	<%
End if

Busca = Request.QueryString("busca")
If len(busca)>0 then
	%>
	<!--#include file="pagina_busca.asp" -->
	<%
Else
	%>
	<!--#include file="pagina_inicial.asp" -->
	<%
End if
If restringe_tamanho then
	%></td></tr><tr><td><%
End if
%>
  <%
If menu("posicao_v") = "baixo" and menu("mostrar") then
	%>
   <!--#include file="paginacao.asp" --> <%
End if
%>
   <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
  <td align="right">&nbsp;</td>
  <td align="center" class="fontepequena"><font color="#009900"><%= "By <a href='http://www.viasulnet.com.br' target='_blank'>Viasulnet</a>" %></font></td>
  <td align="right" valign="bottom"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="home/ADM/DEFAULT.ASP?cliente=<%= cliente%>" target="_blank"><img src="home/Imagens/chave.gif" width="10" height="10" border="0"></a></strong></font></td>
 </tr>
</table>
<%
If restringe_tamanho then
	%></td></tr></table><%
End if
%>

<input name="clicavel" type="hidden" id="clicavel" value="true">
<%
IF Request.QueryString("mostra_online") then
	%>
	Há <%= total_online %> usuário(s) on-line no momento.
	<%
End if
%>
</body>
</html>
<!-- #include file="home/fechaconexoes.asp" -->
