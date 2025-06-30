<!-- #include file="home/conexao.asp" -->
<!-- #include file="home/conexao_configuracoes.asp" -->
<!-- #include file="home/CONEXAO_ULTIMAS.asp" -->
<%
idfam = Request.QueryString("idfam")
abre_em = Request.Form("abre_em")

tipo = Request.QueryString("tipo")
sehorizontal = Request.QueryString("Horizontal")
If sehorizontal then
	horizontal =  " where id_config=3"
End if
if idfam = empty then idfam = 0

Set rs = Conexao_banco.Execute("Select * From nivel  where subfam=" & idfam & " order by ordem")

str = "Select * From ultimas order by id_ultimas desc"
Set ultimas = Conexao_ultimas.Execute(str)
Set conf_ultimas = Conexao_ultimas.Execute("Select * From config" & horizontal)
Set c_ultimas = Conexao_conf.Execute("Select * From topo where tipo='ultimas'")
	For i = 0 to c_ultimas.fields.count -1
		nome_campo = c_ultimas.fields(i).name
		if nome_campo <> "id_topo" and nome_campo <> "TIPO" then
			script = script & "document.all.topo." & Replace(nome_campo, "_",  ".") & "=""" & c_ultimas(nome_campo)  & """;" & vbcrlf
		End if
	Next

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="<%= rs("fundo") %>" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
      <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="ULTIMAS"><%
	  If conf_ultimas("titulo") <> empty then
	  %>
        <tr> 
          <td width="100%" height="22" id="topo">
<table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="<%= conf_ultimas("cor_borda") %>" bgcolor="<%= conf_ultimas("cor_fundo") %>">
	<tr>
	 <td><%= conf_ultimas("titulo") %> </td>
	</tr>
   </table></td>
        </tr>
        <tr> 
		<%
		End if
		%>
          <td align="center" valign="middle">
		  <applet code="<%
		  If sehorizontal then
		  %>hscroll<%
		  Else
		  %>OCVscroll<%
		  End if
		  %>" codebase="<%= endereco_virtual %>" width="100%" height="100%" hspace="0" vspace="0" align="baseline" id="un" name="un">
              <%
			For ni = 0 to conf_ultimas.fields.count-1
				nome = conf_ultimas.fields(ni).name
				valor = conf_ultimas.fields(ni).value

				If lcase(nome) <> "id_config" and  lcase(nome) <> "data" and lcase(nome) <> "titulo" and lcase(nome) <> "total" and lcase(nome) <> "borda" and valor <> "" then

					%><param name="<%= nome %><%= total %>" value="<%= valor %>">
              <%
				End if
			Next
		%>
		  
              <%
		total = 0
		Do while not ultimas.EOF and total <= conf_ultimas("total")

			For ni = 0 to ultimas.fields.count-1
				nome = ultimas.fields(ni).name
				valor = ultimas.fields(ni).value
			'	valor = trim(valor)
				if instr(nome, "font") then
					On error resume next
					fonte = split(valor, ",")
					fface = trim(fonte(0))
					fbold = trim(fonte(1))
					fsize = trim(fonte(2))
					If fface = "" then fface = "System"
					If fbold = "" then fbold = "plain"
					If fsize = "" then fsize = "12"

					valor = fface & ", " & fbold & ", " & fsize

				End if
				If instr(nome,  "desc")>0 and valor = empty then valor = " "
				If nome <> "id_ultimas" and  nome <> "data" and valor <> "" then
					%><param name="<%= nome %><%= total %>" value="<%= valor %>">
              <%
				End if
			Next
			ultimas.Movenext
			total = total + 1
		Loop
		%>
            </applet></td>
        </tr>
      </table>
	</body>
</html><!-- #include file="home/fechaconexoes.asp" -->
