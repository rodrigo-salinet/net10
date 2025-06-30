<%
onde_tag_abre = onde("tag_abre")
onde_tag_fecha = onde("tag_fecha")
If subfam <> empty then
	Do while cint(subfam) > 0 
		Set nivel_a = Conexao_banco.Execute("Select * From nivel where id=" & subfam)
		todas_fam = "<a href='" & endereco_virtual & "default.asp?idfam=" & nivel_a("id") & "&cliente=" & Session("cliente") & "'>" & texto_imagem("texto", nivel_a("nivel")) & "</a> > " & todas_fam
		If nivel_a.EOF <> true then
			If nivel_a("subfam") > 0 then
				subfam = nivel_a("subfam")
			Else
				subfam = 0
			End if
		Else
			subfam = 0
		End if
	Loop
	If todas_fam <> empty then
		todas_fam = left(todas_fam, len(todas_fam)-2)
	End if
End if
Set inic = Conexao_banco.Execute("Select * From nivel where principal=true")
todas_fam = "<a href='" & endereco_virtual & "default.asp?cliente=" & Session("cliente") & "'>" & texto_imagem("texto", inic("nivel")) & "</a> > " & todas_fam
If todas_fam <> empty then
	todas_fam = "Você está aqui:&nbsp;&nbsp;&nbsp;" & todas_fam & " "
	%><table width="100%">
  <tr>
    <td>
	   <font face=arial size=1><%'= onde_tag_abre %><%= todas_fam %><%'= onde_tag_fecha %><img src="home/Imagens/transparent.gif" width="1" height="1">
	</font></td>
  </tr>
  <tr>
    <td>
	  <img src="home/Imagens/transparent.gif" width="1" height="1">
	</td>
  </tr>
</table><%
End if
%>