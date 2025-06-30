<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
arquivo = Request.QueryString("arq")
cam = Server.Mappath("../clientes/" & cliente & "/arquivos")
'cam2 = fso.GetParentFoldername(whichfn) & "\temp"
Sub exclui(arq)
	If fso.FileExists(arq) then
		fso.deletefile(arq)
	End if
End sub
exclui(cam & "\" & arquivo)
'exclui(cam2 & "\" & arquivo)
REsponse.Redirect("admnistrador.asp?msg=Arquivo excluído com sucesso.&cliente="&cliente)
%><!-- #include file="../fechaconexoes.asp" -->
