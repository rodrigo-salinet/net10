<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->


<%
nome_arquivo = Request.Form("nome_arquivo")
pasta = Request.QueryString("arquivo")
caminho_arquivo = Server.MapPath("../../clientes/" & cliente & "/imagens" & pasta)

Set arquivo = fso.GetFile(caminho_arquivo)
arquivo.name= nome_arquivo
Response.Redirect("principal.asp?cliente=" & cliente & "&categoria=" & pasta & "#" & nome_arquivo)
%><!-- #include file="../../fechaconexoes.asp" -->
