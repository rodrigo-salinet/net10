<%
		Function arvore(nivel)
			Set arv = Conexao_Banco.Execute("Select * From nivel where subfam=" & nivel & " order by ordem")
			Response.Write("<ul>")
			Do while not arv.EOF
				%>
				<li lang='af' type="square" class='tabela'><a href="<%= endereco_virtual %>default.asp?cliente=<%= Session("cliente") %>&idfam=<%= arv("id") %>"><%= arv("nivel") %></a></li>
<%
				call arvore(arv("id"))
				arv.movenext
			Loop
			Response.Write("</ul>")
		End Function
%>