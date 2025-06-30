<!-- #include file="home/conexao.asp" -->
<!-- #include file="home/conexao_configuracoes.asp" -->
<!-- #include file="home/tira_html.asp" -->
<!-- #include file="arvore.asp" -->
<%
  clicavel = Request.QueryString("clicavel")
  id = Request.QueryString("id")
  numero = Request.QueryString("numero")
  if id=empty or id=0 then
    id=29
  End if
  inicio = Request.QueryString("inicio")
  fim = Request.QueryString("fim")
  texto_inicial = Request.QueryString("texto_inicial")
  texto_final = Request.QueryString("texto_final")
  msg = Request.QueryString("msg")
  Set rs = Conexao_banco.Execute("Select * From nivel where id=" & id)
  pagina_inicial = rs("pagina_inicial")
  pagina_inicial = tira_html(pagina_inicial, 0)
  if inicio = "" then inicio = 1
  if fim = "" then fim = len(pagina_inicial)
  pagina_inicial = mid(pagina_inicial, inicio, fim)
  imagem = Request.QueryString("imagem")
  ialign = Request.QueryString("ialign")
  ilargura = Request.QueryString("ilargura")
  ialtura = Request.QueryString("ialtura")
  ialt = Request.QueryString("ialt")
  %><html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="home/clientes/<%= Session("cliente") %>/estilos/tabela.css" rel="stylesheet" type="text/css">
<script>
var idnivel = '<%= id %>';
</script>
<script language="JavaScript" type="text/javascript" src="tabela.js"></script>
<style type="text/css">
<!--
table {
	cursor: hand;
}
-->
</style>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="<% If not clicavel then %>inicia(this, idnivel)<% End if %>">
<table
 width="100%" height="100%" id="tabela">
 <tr id="linha"> 
  <td id="celula" onMouseOut="fora(this, idnivel)" onMouseOver="sobre(this, idnivel)"<% If clicavel then %> onMouseDown="clica(this, idnivel)"<% End if %>>
  <% If imagem <> empty then %>
  <img src="<%= imagem %>" align="<%= ialign %>" border="0" <% if ialtura <> empty then %> height="<%= ialtura %>" <% End if %><% if ilargura <> empty then %> width="<%= ilargura %>" <% End if %> alt="<%= ialt %>">
    <% End if %>
  <%= texto_inicial %>
<%= left(tira_html(pagina_inicial, 0), numero) %><%= texto_final %>
</td>
 </tr>
</table>
</body>
</html>
<!-- #include file="home/fechaconexoes.asp" -->
