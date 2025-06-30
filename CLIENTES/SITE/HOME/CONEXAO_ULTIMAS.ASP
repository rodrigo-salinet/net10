<%
Caminho_ultimas = caminho_dados & "\ultimas.mdb"
Set conexao_ultimas = CreateObject("ADODB.Connection")
Conexao_ultimas.open "DBQ=" & Caminho_ultimas & ";Driver={Microsoft Access Driver (*.mdb)}"
Function cores(cor)
	cor = split(cor, ",")
	'Response.Write()
	cor1 = hex(cor(0))
	cor2 = hex(cor(1))
	cor3 = hex(cor(2))
	If len(cor1) = 1 then cor1 = cor1 & "0" 
	If len(cor2) = 1 then cor2 = cor2 & "0" 
	If len(cor3) = 1 then cor3 = cor3 & "0" 
	cores = "#" & cor1 & cor2 & cor3
End function

Function cores2(valor)
	if len(valor)<6 then valor = valor & "00"
	valor = replace(valor, "#", "")
	v1 = mid(valor, 1, 2)
	If v1 <> empty then Nv1 = clng("&h" & v1)
	v2 = mid(valor, 3, 2)
	Nv2 = clng("&h" & v2)
	v3 = mid(valor, 5, 2)
	Nv3 = clng("&h" & v3)
	If nv1 = "" then nv1 = "0"
	If nv2 = "" then nv2 = "0"
	If nv3 = "" then nv3 = "0"
	valor = nv1 & ", " & nv2 & ", " & nv3
	cores = "#" & cor1 & cor2 & cor3
End function

%>
