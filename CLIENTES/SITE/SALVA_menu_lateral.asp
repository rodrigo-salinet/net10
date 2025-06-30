<!--#include file="home/conexao.asp" -->
<!--#include file="home/tira_html.asp" -->
<%
  idfam = Session("idfam")
	If idfam = empty or idfam = "29" then
		str = "Select * From nivel where subfam=0 order by ordem"
		Set atual = Conexao_banco.Execute("Select * From nivel where ordem=-1")
	Else
		str = "Select * From nivel where subfam=" & cint(idfam) & " order by ordem"
		Set atual = Conexao_banco.Execute("Select * From nivel where id=" & cint(idfam))
	End if
	
	'cor = atual("fundo")
	clicavel = Request.QueryString("clicavel")
	If lcase(clicavel) = "true, true" then
		clicavel = true
	End if
%>
<html>
<head>
<style>
.CLICAVEL {
	cursor: hand;
}

</style>

<script>
abre_em = '<%= Request.QueryString("abre_em")%>'
if(abre_em==""){
abre_em = '_parent'
}

function sobre(l,fundo)
{
	l.background = fundo;
}
function fora(l,fundo)
{
	if(fundo!="")
	{
	l.background = fundo;
	}
}
function muda_fundo()
{
//	document.body.bgColor = parent.document.body.bgColor;
}
</script>

<link href="home/clientes/<%= Session("cliente") %>/estilos/<%= Request.QueryString("subcam") %>/menu_lateral.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="<%= Request.QueryString("fundo") %>" onLoad="muda_fundo()">
<%
Set rs_fam = Conexao_banco.Execute(str)
Do while not rs_fam.EOF
	If not rs_fam("principal") then
	%>      
<table border="1" id="tabela<%= rs_fam("id") %>" width="100%" cellpadding="0" cellspacing="1" class="CLICAVEL">
 <tr> 
  <td onMouseOver="javascript:this.className='sobre'" onMouseOut="javascript:this.className=''" id="link" <% If clicavel then %>onClick="javascript:window.open('default.asp?idfam=<%= rs_fam("id") %>&cliente=<%= Session("cliente") %>',abre_em)"<% End if %>> 
   <%
   tem_imagem = texto_imagem("imagem", rs_fam("nivel"))
	Response.Write(tem_imagem)
     %><br>
<img src="home/Imagens/transparent.gif" width="1" height="1"></td>
 </tr>
</table>
<%
	End if
	rs_fam.movenext
loop
%>
</body>
</html><!-- #include file="home/fechaconexoes.asp" -->
