<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../validasenha.asp" -->
<%
arquivo = Request.Form("arquivo")
estilo = Request.Form("estilo")
alterar = Request.QueryString("alterar")
if arquivo = empty or arquivo = ".css" then
	arquivo = Session("arquivo_css")
Else
	Session("arquivo_css") = arquivo
End if
If estilo = empty then
	estilo = Session("estilo_css")
	msg = "Alterado com sucesso."
Else
	Session("estilo_css") = estilo
End if
nome_do_css = Server.MapPath("../../clientes/" & cliente & "/estilos/" & arquivo & ".css")
If fso.Fileexists(nome_do_css) and not alterar then
	%><script>
	if(confirm("Já existe um arquivo com este nome.\nDeseja sobrescrever?")){
		window.open("cria_estilo_manual02.asp?alterar=true&cliente=<%= cliente %>", "_self")
	}else{
		history.go(-1);
	}
	</script><%
	Response.End()
End if
msg = "Criado com sucesso."
Set css = fso.createTextFile(nome_do_css)
css.Write(estilo)
Response.Redirect("cria_estilo_manual01.asp?msg=" & msg & "&arquivo=" & arquivo & "&cliente=" & cliente)
%>

<!-- #include file="../../fechaconexoes.asp" -->
