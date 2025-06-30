<!--#include file="home/conexao.asp" -->
<!--#include file="home/tira_html.asp" -->
<%
'Pegar as variáveis em QueryString
clicavel = Request.QueryString("clicavel")
cliente = Request.QueryString("cliente")
abre_em = Request.QueryString("abre_em")
id = Request.QueryString("id")

'Abrir na mesma janela, em outra, etc.
If abre_em = "" then abre_em = "_parent"

'Se não há nenhum id, ou se for a página inicial
If id = empty then id = 0
Set testa_id = Conexao_banco.Execute("Select * From nivel where id=" & id)
if not testa_id.EOF then If testa_id("principal") then id = 0

sql_menu = "Select * From nivel where subfam=" & id & " order by ordem"
%>
<html>
<head>
<style>
.CLICAVEL {
	cursor: hand;
}
</style>
<link href="home/clientes/<%= cliente %>/estilos/<%= Request.QueryString("subcam") %>/menu_lateral.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="<%= Request.QueryString("fundo") %>">
<table<%
If clicavel then
%> class="CLICAVEL"<%
End if
%>><%

Set menu = Conexao_banco.Execute(sql_menu)
Do while not menu.EOF
	propriedades_celula = " onMouseOver=""javascript:this.className='sobre'"" onMouseOut=""javascript:this.className=''"""
	If clicavel then propriedades_celula = propriedades_celula & " onCLick=""javascript:window.open('default.asp?id=" & menu("id") & "&cliente=" & cliente & "','" & abre_em & "')"""
	%>
	<tr>
		<td<%= propriedades_celula %>>
		<%= texto_imagem("imagem", menu("nivel")) %>
		</td>
	</tr>
	<%
menu.movenext
Loop
%>
</table>
</body>
</html>