<font size="3" face="Verdana, Arial, Helvetica, sans-serif"> </font> 
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
 <tr>
  <td><font size="3" face="Verdana, Arial, Helvetica, sans-serif">
   <%
   
   	str = "Select * From nivel where (pagina_inicial like '%" & busca & "%' or  nivel like '%" & busca & "%')"'" and (id=" & id & " or subfam="&id&") order by ordem"
	
Set rs = Conexao_banco.Execute(str)
If rs.EOF then
%>
   <center>
	Nada foi encontrado para a consulta <strong><%= busca %></strong>. 
   </center>
   <%
Else

%>
   <center>
	Resultado para a consulta <strong><%= busca %></strong>: 
   </center>
   <ul>
	<%
	If Request.QueryString("id") = empty then id = 0
		Do while not rs.EOF
		em = id
		if em = 29 then em = 0
		If relaciona(rs("id"), em) then
			%>
			<li><a href="<%= endereco_virtual %>default.asp?cliente=<%= cliente %>&id=<%= rs("id") %>"><%= texto_imagem("texto", rs("nivel")) %></a><br>
			 <% 
			pagina = rs("pagina_inicial")
			if pagina = "undefined" then
				pagina = ""
			End if
			if pagina <> empty then
				conta = conta + 1
			End if
			 %>
			</li>
			<br>
			<%
		end if
			
			rs.movenext
		Loop
		%>
   </ul>
   <%
End if
  %>
   </font></td>
 </tr>
</table>
