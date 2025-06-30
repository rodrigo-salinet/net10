<!--#include file="home/conexao.asp" -->
<!--#include file="home/tira_html.asp" -->
<html>
<style>
.CLICAVEL {
	cursor: hand;
	border: #FFFFFF;

}
</style>

<body>
<%
  id = Session("id")
	If id = empty then
		str = "Select * From nivel where subfam=0 order by ordem"
	Else
		str = "Select * From nivel where subfam=" & cint(id) & " order by ordem"
		
	End if
	
Set rs_fam = Conexao_banco.Execute(str)
Do while not rs_fam.EOF
	If not rs_fam("principal") then
	%>      <table width="100%" border="0" cellpadding="0" cellspacing="0">

        <tr> 
          <td align="center" valign="middle" onClick="javascript:window.open('default.asp?id=<%= rs_fam("id") %>&cliente=<%= cliente %>','_parent')" onMouseOver="javascript:<%= config("mouseover") %>" onMouseOut="javascript:<%= config("mouseout") %>"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="<%= config("mini_borda") %>" bgcolor="<%= config("mini_fundo") %>" class="CLICAVEL">
              <tr> 
                <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" color="#000000" size="2"><b><%= rs_fam("nivel") %></b></font></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td align="center" valign="middle"><img src="home/Imagens/transparent.gif" width="1" height="5"></td>
        </tr>
      </table>
        <%
	End if
	rs_fam.movenext
loop
%>
</body>
</html><!-- #include file="../fechaconexoes.asp" -->
