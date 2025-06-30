<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
imagem = Request.QueryString("img")

cam = Server.Mappath("../../downloads")
cam2 = fso.GetParentFoldername(whichfn) & "\imagens"
Sub exclui(arq)
	If fso.FileExists(arq) then
		fso.deletefile(arq)
	End if
End sub
exclui(cam & "\" & imagem)
exclui(cam2 & "\" & imagem)
REsponse.Redirect("excluirarquivo.asp?excluido=sim&cliente="&cliente)
%><!-- #include file="../fechaconexoes.asp" -->
