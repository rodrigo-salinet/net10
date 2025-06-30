<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<%
nome_pasta = Request.QueryString("categoria")

fso.Deletefolder caminho_cliente & "imagens\" & nome_pasta

Response.Redirect("janela_principal.asp?cliente=" & cliente)

%><!-- #include file="../../fechaconexoes.asp" -->
