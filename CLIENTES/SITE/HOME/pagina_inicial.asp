<%
pagina = nivel("pagina_inicial")
pagina = replace(pagina, lcase(endereco_virtual1), lcase(endereco_virtual))
pagina = replace(pagina, lcase(endereco_virtual2), lcase(endereco_virtual))
pagina = replace(pagina, lcase(endereco_virtual3), lcase(endereco_virtual))
pagina = replace(pagina, lcase(endereco_virtual4), lcase(endereco_virtual))
pagina = replace(pagina, lcase(endereco_virtual & "home/clientes"), lcase(endereco_cliente))


If instr(pagina,  "&#" & asc("""") & ";")>0 then
	pagina = replace(pagina,  "&#" & asc("""") & ";", """")
End if
If instr(pagina,  "&#" & asc("'") & ";")>0 then
	pagina = replace(pagina,  "&#" & asc("'") & ";", "'")
End if
If instr(pagina, endereco_virtual & "menu_lateral.asp?")>0 then
	pagina = replace(pagina, endereco_virtual & "menu_lateral.asp?", endereco_virtual & "menu_lateral.asp?clicavel=" & clicavel & "&")
End if
If instr(pagina, endereco_virtual & "busca.asp?")>0 then
	pagina = replace(pagina, endereco_virtual & "busca.asp?", endereco_virtual & "busca.asp?clicavel=" & clicavel & "&")
End if
If instr(pagina, endereco_virtual & "ultimas.asp?")>0 then
	pagina = replace(pagina, endereco_virtual & "ultimas.asp?", endereco_virtual & "ultimas.asp?clicavel=" & clicavel & "&")
End if
If instr(pagina, endereco_virtual & "tabela.asp?")>0 then
	pagina = replace(pagina, endereco_virtual & "tabela.asp?", endereco_virtual & "tabela.asp?clicavel=" & clicavel & "&")
End if
If instr(lcase(pagina), "home_noticias")>0 then
	pagina = replace(pagina, "home_noticias", "home")
End if



if pagina = "undefined" then
	pagina = ""
End if
If pagina = "" then
	If Request.QueryString("idfam") = empty then idfam = 0
		Set rs = Conexao_banco.Execute("Select * From nivel where subfam=" & idfam & " order by ordem")
		Do while not rs.EOF
			%>
			<a style="background: FFFFFF" href="<%= endereco_virtual %>default.asp?cliente=<%= cliente %>&idfam=<%= rs("id") %>">
			  <%= rs("nivel")%>
			</a>
			<br>
			<% 
			pagina = rs("pagina_inicial")
			if pagina <> empty then
				Response.Write(tira_html(pagina) & " ")
			End if
			 %>
			<br>
			<%
			'call arvore(rs("id"))
			rs.movenext
		Loop
		%>
<%
Else
	%>
	<%= pagina %> 
	<%
End if
%><br>

<img src="home/Imagens/transparent.gif" width="1" height="1"> 