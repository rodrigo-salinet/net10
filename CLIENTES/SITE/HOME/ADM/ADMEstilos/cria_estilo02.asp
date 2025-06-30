<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
on error goto 0

quebra =  vbcrlf
arquivo = Request.QueryString("arquivo")
visualizar = Request.QueryString("visualizar")


Sub SingleSorter( byRef arrArray )

  For i = 0 To UBound( arrArray ) - 1
      'Take a snapshot of the first element
      'in the array because if there is a 
      'smaller value elsewhere in the array 
      'we'll need to do a swap.
      smallest_value = arrArray ( i )
      rememberkey = arrArray ( i )
      rememberval = arrArray ( i )
      swap_pos = i
		
      For x = i + 1 to UBound( arrArray )
        'Start inner loop.
          If arrArray ( x ) < smallest_value Then
          'This is now the lowest number - 
          'remember it's position.
              swap_pos = x
              smallest_value = arrArray ( x )
              smallest_key = arrArray ( x )
          End If
      Next
	
      If swap_pos <> i Then
        'If we get here then we are about to do a swap
        'within the array.		
          arrArray ( swap_pos ) = rememberkey
          arrArray ( swap_pos ) = rememberval
          arrArray ( i ) = smallest_key
          arrArray ( i ) = smallest_value
      End If	
  Next
End Sub



For each campo in Request.Form()
	valor = trim(Request.Form(campo))
	IF valor <> empty then
		pos_under = instr(campo, "_")
		If pos_under > 0 then
			tag = left(campo, pos_under-1)
		End if
		If instr(todos_nomes, tag)=0 then
			todos_nomes = todos_nomes & "|" & tag
		End if	
		If instr(valor, "http://") = 1 then valor = "url(" & valor & ")"
		todos_campos = todos_campos & campo & ": " & valor & ";|"
	End if
'	Response.Write("<font color=green>" &  campo & ": " & valor & ";|" & "</font><hr>")
Next
todos_campos = split(todos_campos, "|")
SingleSorter todos_campos


For each campos in todos_campos
	REsponse.Write(campos & "<hr>")
	If instr(campos, "_") > 0 then
		array_campos = split(campos, "_")
		obj = trim(array_campos(0))
		IF ubound(array_campos) > 1 then
			For u = 1 to ubound(array_campos)
				objeto = objeto & "_" & array_campos(u)
			Next
		Else
			objeto = trim(array_campos(1)) 
		End if

		objetos = objetos & objeto & quebra
	
		If ultimo_obj = empty then 
			ultimo_obj = obj
		End if
		
		If obj <> ultimo_obj then
			css = css & quebra & ultimo_obj & "{" & quebra & objetos
		End if
		
		
		If obj <> ultimo_obj then
			css = css &  "}" & quebra & quebra
			objetos = ""
		End if
		ultimo_obj = obj

		
	End if
Next
css = css & quebra & ultimo_obj & "{" & quebra & objetos
css = css &  "}" & quebra & quebra



'RESPONSE.End()


If visualizar then
	temp = "/temp"
	Redir = "modelo/default.asp?arquivo=" & arquivo & "&cliente=" & cliente & "&subcam=temp"
Else
	redir = "cria_estilo01.asp?arquivo=" & arquivo & "&cliente=" & cliente
End if

caminho = Server.MapPath("../../clientes/" & cliente & "/estilos" & temp)
arquivo = arquivo & ".css"
Set estilo_css = fso.CreateTextFile(caminho & "\" & arquivo)
estilo_css.Write(css)
REsponse.Write(css)
'Response.Redirect(redir)

Response.End()



quebra = vbcrlf
visualizar = Request.QueryString("visualizar")
arquivo = Request.QueryString("arquivo")
nome_todos = ""
For each campo in Request.Form
	valor = Request.Form(campo)
	p_under = instr(campo, "_") - 1
	If p_under > 0 then
		nome = left(campo, p_under)
		If not instr(nome_todos, "|" & nome)>0 then
			tudo =  tudo & "}" & quebra & nome & "{" & quebra
			nome_todos = nome_todos & "|" & nome
		End if
		propriedade = replace(campo, nome & "_", "")
		If instr(valor, "http://") = 1 then valor = "url(" & valor & ")"
		tudo = tudo & propriedade & ": " & valor & ";" & quebra
	End if
Next
tudo = mid(tudo, 2, len(tudo)-2) & "}"

Set fso = CreateObject("Scripting.FileSystemObject")
'Set estilo_css = fso.CreateTextFile(Server.MapPath(arquivo))
'estilo_css.Write(tudo)

If visualizar then
	temp = "/temp"
	Redir = "modelo/default.asp?arquivo=" & arquivo & "&cliente=" & cliente & "&subcam=temp"
Else
	redir = "cria_estilo01.asp?arquivo=" & arquivo & "&cliente=" & cliente
End if

caminho = Server.MapPath("../../clientes/" & cliente & "/estilos" & temp)
arquivo = arquivo & ".css"
Set estilo_css = fso.CreateTextFile(caminho & "\" & arquivo)
estilo_css.Write(tudo)
'REsponse.Write(caminho & "\" & arquivo)
Response.Redirect(redir)
%><!-- #include file="../../fechaconexoes.asp" -->
