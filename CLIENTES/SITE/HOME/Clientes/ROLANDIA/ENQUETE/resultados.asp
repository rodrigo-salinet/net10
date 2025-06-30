<%
'Criando objeto 

Set FSO = Server.CreateObject("Scripting.FileSystemObject")

arquivo = "dados/enquete.mdb"
caminho = ""


'Achando arquivo - INICIO
if (FSO.FileExists(arquivo) <> true) then
	While NOT(FSO.FileExists(arquivo2))
		caminho = "../" & caminho
		arquivo2 = Server.MapPath(caminho & arquivo)
	Wend
	whichFN = arquivo2
Else
	whichFN = arquivo
End if


'Achando arquivo - FIM
contxt = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&whichFN&";"
Set Conexao = CreateObject("Adodb.Connection")
Conexao.open contxt
%><%
'------------------------------------------------------------------------------------------------
' Este ASP exibe os resultados de uma Enquete, e exibe no fundo outras enquetes sem ser a que
' está a exibir os valores
'------------------------------------------------------------------------------------------------

' Obtenho o ID da pergunta da qual vou exibir os resultados
	id=request.querystring("id")
' Se o ID estiver vazio então exibe a pergunta de data mais recente
	if isempty(id) then
		sqlend=" ORDER BY data"
	else
' Senão exibe a pergunta do ID dado
		sqlend=" WHERE ID_enquete="& id
	end if
' Transformo esse ID num valor númerico
	valor=cint(id)
' Selecciono todas a pergunta do ID
	sql="SELECT * FROM enquete_pergunta "& sqlend
	set enquete_pergunta=conexao.execute(sql)
%>
<html>
	<head>
		<TITLE>Enquete ver 1.0</TITLE>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="css/styles.css">
	</head>
	<body bgcolor="#ffffff" topmargin=0 leftmargin=0 marginwidth="0" marginheight="0" text="#996699" link="#3333FF" alink="#0000CC" vlink="#333366">
<%
if Request.QueryString("erro")="sim" then
%>
<script language="JavaScript">
	alert('Você já votou neste enquete, por isso\nseu voto não foi aceito.');
</script>
<%
End if
%>
		<table width="50%" border="0" align=center class=enquete>
<%
' Se não existir pergunta do ID exibe mensagem de erro
		if enquete_pergunta.eof then
%>
			<tr> 
				<td colspan=3 class=nav align=center>Pergunta inexistente</td>
			</tr>
<%'Senão seleciona e exibe respostas
		else
			' Selecciono todas as respostas dessa pergunta
			sql="SELECT * FROM enquete_respostas WHERE ID_enquete="& enquete_pergunta("ID_enquete") &" ORDER BY id_resposta "
			set enquete_respostas=conexao.execute(sql)
			' Selecciono todas as perguntas ordenadas por data crescente
			sql="SELECT * FROM enquete_pergunta ORDER BY data "
			set perguntas=conexao.execute(sql)
		%>
			<tr> 
<%
' Linha com o texto da pergunta do ID
%>
				<td colspan=3 class=nav align=center><%=enquete_pergunta(1)%></td>
			</tr>
<%
' Se não tiver respostas exibe a mensagem seguinte
%>
		<%if enquete_respostas.eof then%>
			<tr> 
				<td colspan=3 class=enquete>Nenhumas respostas existentes</td>
			</tr>
<%
' Se tiver respostas exibe-as
%>
		<%else%>
			<%total=0%>
<%
' Enquanto as respostas não chegarem ao fim....
%>
			<%do while not enquete_respostas.eof
' Calculo o valor total dos Hits
				total=total+enquete_respostas("hits")%>
				<tr> 
<%
' Coluna com o texto da resposta
%>
					<td width="20%" nowrap class=enquete><%=enquete_respostas(2)%></td>
<%
' Coluna com as imagens que compoem o grafico de barra desta resposta
%>
					<td width="78%" class=enquete>
<%
' Imagem do inicio da barra
%><img src="imgs/barraopen.gif"><%
' Cilco for que colona o número de hits da resposta * n, sendo n=5, para dar comprimento á bala, dependendo da grossura do gif, poderá ter mais ou menos valor o n
' Imagem do meio da barra
n=1
						for x=0 to enquete_respostas("hits")*n%><img src="imgs/barramidle.gif"><%next
' Imagem do Fim da barra
%><img src="imgs/barraclose.gif"></td>
<%
' Valor real dos hits dessa resposta
%>
					<td width="2%" nowrap class=enquete><%=enquete_respostas("hits")%></td>
				</tr>
<%
' Passo á resposta seguinte
				enquete_respostas.movenext%>
			<%loop%>
<%
' Linha em que exibo o valor sumatório dos hits de todas as respostas
%>
			<tr> 
				<td width="20%" nowrap class=enquete>Total</td>
<%
' Coluna que exibe o grafico da barra, mesmo mecanismo das respostas descrito nas linhas anteriores
%>
				<td width="78%" class=enquete><img src="imgs/barraopen.gif"><%for x=0 to Total*n%><img src="imgs/barramidle.gif"><%next%><img src="imgs/barraclose.gif"></td>
				<td width="2%" nowrap class=enquete><%=total%></td>
			</tr>
		<%end if%>
		</table>
<%
' Tabela que vai exibir outras enquetes que não a que estiver a ser exibida
%>
		<table width="50%" align=center class=nav>
			<tr>
				<td colspan=2 align=center class=nav>Resultados de Enquetes anteriores</td>
			</tr>
			<tr class=grey1>		
				<td align=center width="10%">Data</td><td align=center>Pergunta</td>
			</tr>
<%
' Enquanto não chegar ao fim das perguntas....
%>
			<%do while not perguntas.eof%>
<%
' Se o ID da pergunta for diferente da pergunta atual, então essa pergunta vai aparecer na lista
%>
				<%if cint(perguntas("id_enquete"))<>cint(enquete_pergunta("ID_enquete")) then%>
					<tr class=grey2>
<%
' Coluna com o texto da data com link para exibir as respostas dessa pergunta
%>
						<td align=center><a href="resultados.asp?id=<%=perguntas("id_enquete")%>" class=enquete><%=perguntas("data")%></a></td>
<%
' Coluna com o texto da pergunta com link para exibir as respostas dessa pergunta
%>
						<td align=center><a href="resultados.asp?id=<%=perguntas("id_enquete")%>" class=enquete><%=perguntas("pergunta")%></a></td>
					</tr>
				<%end if%>
<%
' Passo á pergunta seguinte
%>
				<%perguntas.movenext%>
			<%loop%>
<%end if%>
		</table>
	
<center>
  <b><a href="javascript:history.go(-1)">Voltar</a></b> 
</center>
</body>
</html>