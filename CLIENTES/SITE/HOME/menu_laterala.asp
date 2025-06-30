<!--#include file="home_noticias/conexao.asp" -->
<!--#include file="home_noticias/tira_html.asp" -->
<%
  idfam = Session("idfam")
	If idfam = empty then
		str = "Select * From nivel where subfam=0 order by ordem"
		Set atual = Conexao_banco.Execute("Select * From nivel where ordem=-1")
	Else
		str = "Select * From nivel where subfam=" & cint(idfam) & " order by ordem"
		Set atual = Conexao_banco.Execute("Select * From nivel where id=" & cint(idfam))
	End if
	
	cor = atual("fundo")
	clicavel = Request.QueryString("clicavel")
%>
<html>
<head>
<style>
.CLICAVEL {
	cursor: hand;
}

</style>
<script>
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
</script>

<link href="home_noticias/clientes/<%= Session("cliente") %>/menu_lateral.css" rel="stylesheet" type="text/css">
<link href="teste.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%
Set rs_fam = Conexao_banco.Execute(str)
Do while not rs_fam.EOF
	If not rs_fam("principal") then
	%>      
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="CLICAVEL" id="tabela<%= rs_fam("id") %>">
 <tr> 
          <td id="link" align="center" valign="middle" class="fundo" background="<%= endereco_virtual %>home_noticias/clientes/<%= Session("cliente") %>/imagens/botao_normal.gif" <% If clicavel then %>onClick="javascript:window.open('default.asp?idfam=<%= rs_fam("id") %>&cliente=<%= Session("cliente") %>','_parent')"<% End if %> onMouseOver="javascript:sobre(this, '<%= endereco_virtual %>home_noticias/clientes/<%= Session("cliente") %>/imagens/botao_sobre.gif')" onMouseOut="javascript:fora(this, '<%= endereco_virtual %>home_noticias/clientes/<%= Session("cliente") %>/imagens/botao_normal.gif')">
		  <table width="100%" border="1" cellpadding="0" cellspacing="0">
	<tr> 
                <td align="center"><%= rs_fam("nivel") %></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          
  <td height="8" align="center" valign="middle"><img src="home_noticias/Imagens/transparent.gif" width="1" height="5"></td>
        </tr>
      </table>
        <%
	End if
	rs_fam.movenext
loop
%>
</body>
</html>