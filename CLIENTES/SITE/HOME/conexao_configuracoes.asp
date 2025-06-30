<%
whichFN_conf = fso.GetParentFolderName(whichFN) & "\configuracoes.mdb"

'Session.Timeout = 20

nomedocliente_conf = Request.QueryString("cliente")
If nomedocliente_conf <> empty then
	cliente = nomedocliente_conf
End if
If cliente = empty then
	Response.Write("Sua conexão foi interrompida inesperadamente, por favor atualize esta página.")
	Response.End()
End if
%><!-- #include file="construcao.asp" --><%

arquivo_conf = Session("cam_dados") & "dados/" & cliente & "/configuracoes.mdb"
caminho_conf = ""


contxt = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&whichFN_conf&";"
Set Conexao_conf = CreateObject("ADODB.Connection")
Conexao_conf.open "DBQ=" & whichFN_conf & ";Driver={Microsoft Access Driver (*.mdb)}"


Session("idfam") = Request.QueryString("idfam")
Session("id_grupo") = request.QueryString("id_grupo")
id_grupo = Session("id_grupo")

%>