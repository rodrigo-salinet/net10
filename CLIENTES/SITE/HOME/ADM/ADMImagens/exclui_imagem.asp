<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->


<%
arquivo = Request.QueryString("arquivo")
pasta = Request.QueryString("categoria")
relativo = "../../clientes/" & cliente & "/imagens/" & pasta & "/" & arquivo
relativo = replace(relativo, "\", "/")
do while instr(relativo, "//") > 0
	relativo = replace(relativo, "//", "/")
Loop
'REsponse.Write(relativo)
caminho_arquivo = Server.MapPath(relativo)


fso.Deletefile caminho_arquivo
Response.Redirect("janela_imagens.asp?cliente=" & cliente & "&categoria=" & pasta & "&msg=Excluída com sucesso.")
%><!-- #include file="../../fechaconexoes.asp" -->
