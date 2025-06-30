<%
Set menu_topo = Conexao_conf.Execute("Select * From menu where tipo_menu='topo'")

menu_tag_abre = menu("tag_abre")
menu_tag_fecha = menu("tag_fecha")


Set inicio = Conexao_banco.Execute("Select * From nivel where subfam=0 order by ordem")
do while not inicio.EOF

		c_inicial = c_inicial + 1
		id_inicio = inicio("id")
		If inicio("principal") then
			id_inicio = ""
		End if

		If cstr(inicio("visualizar")) <> cstr("false") or cstr(inicio("visualizar"))="" then

			inicial = inicial & "<a href='" & endereco_virtual & "default.asp?idfam=" & id_inicio & "&cliente=" & Session("cliente") & "' style='text-decoration: none'>" 
			inicial = inicial & menu_topo("inicio") & "<strong>"
			inicial = inicial & texto_imagem("texto", inicio("nivel")) & "</strong>" & menu_topo("fim") & "</a> &nbsp;&nbsp;"
			%><!-- <%= inicio("visualizar") %> --><%
	
			if c_inicial = 5 then
				inicial = inicial & "<br>"
				c_inicial = 0
			End if

		End if
	inicio.movenext
Loop
inical = "" & inicial & ""

%>
<table width="99%" class="tabela">
 <tr> 
  <td> <%= menu_tag_abre %> <%= inicial %> <%= menu_tag_fecha %> <img src="home/Imagens/transparent.gif" width="1" height="1"> 
  </td>
 </tr>
</table>
