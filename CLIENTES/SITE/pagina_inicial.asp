<%
pagina_atual = pagina("pagina_inicial") 
If pagina_atual <> empty then
	pagina_atual = replace(pagina_atual, "&#39;", "'")
	pagina_atual = replace(pagina_atual, "&#34;", """")
	
	'Altera os enderecos errados temporariamente. Quando entrar na página pelo administrador corrigirá no banco
	For each endereco in endereco_errado
		pagina_atual = replace(pagina_atual, endereco, endereco_virtual)
	Next
	pagina_atual = replace(pagina_atual, "idfam=", "id=")

	'Transforma os anexos em clicáveis
	pagina_atual = replace(pagina_atual, "/menu_lateral.asp?", "/menu_lateral.asp?clicavel=true&")
	pagina_atual = replace(pagina_atual, "/ultimas.asp?", "/ultimas.asp?clicavel=true&")
	pagina_atual = replace(pagina_atual, "/busca.asp?", "/busca.asp?clicavel=true&")
	pagina_atual = replace(pagina_atual, "/tabela.asp?", "/tabela.asp?clicavel=true&")
	
	'Correção de Bug do site antigo
	pagina_atual = replace(pagina_atual, "/home_noticias", "/home")
	pagina_atual = replace(pagina_atual, "http://jean/net10/novo/clientes/" & cliente & "/", lcase(endereco_cliente))
	pagina_atual = replace(pagina_atual, lcase("site/" & cliente & "/" & cliente & "/"), lcase("site/home/clientes/" & cliente & "/"))
	pagina_atual = replace(pagina_atual, "home/ADM/editoru.asp?id_grupo=", "default.asp?cliente=" & cliente & "&id=")

	Set re = new RegExp
	re.global = true
	re.IgnoreCase = true
	re.pattern = "//"
	Set CM = re.replace(pagina_atual, "/")
	'pagina_atual = CM.value
	
'	Do while instr(pagina_atual, "/") > 0
	'	pagina_atual = replace(pagina_atual, "//", "/")
'	Loop
	'pagina_atual = replace(pagina_atual, "http:/", "http://")
	'pagina_atual = replace(pagina_atual, "///", "//")
'	For each m in cm
	%>
	<%= pagina_atual %>.
	<%
	'Next
end if
Response.Write("<!--      Desenvolvido por Viasulnet LTDA ")
Response.Write("Fone: (+51 43) 3328 1212 Londrina/PR      -->")
If pagina("principal") then
	Response.Write("<p><a href='#' onclick='javascript:window.open(""home/adm/default.asp?cliente=" & cliente & """,""_blank"",""scrollbars=yes, status=yes, left=0, top=30, Width=795, Height=480, menubar=yes"")' target='_self'><img src='imagens/chave.gif' alt='Entrar no Administrador do site' border='0' class='imagensAdm'></a><br><a href='http://www.viasulnet.com.br' target='_blank'><img src='imagens/sobre.gif' alt='Sobre o NET10' border='0' class='imagensAdm'></a></p>")
End if
%>
