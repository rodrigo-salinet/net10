<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
If tc < 100 then
%>

<%
grupo = Request.Form("Grupo") 
URL = Request.Form("URL")
target = Request.Form("target")
id = Request.QueryString("id_grupo")
If id = empty then
	id = 0
End if
If grupo <> empty and url <> empty then
	str = "Insert into nivel (nivel, SUBFAM, ordem, pagina_inicial) Values ('" & grupo & "', " & id & ", 0, '<script>function abre(){window.open(""" & URL & """, """ & target & """);history.go(-1);} abre();</script><center>Se a página não abrir automaticamente, <a href=""#"" onClick=""abre()"">clique aqui.</a></center>')"
	Conexao_banco.Execute(str)
	Response.Redirect("Administrador.asp?msg=Inserido com sucesso.&id=" & id & "&cliente=" & cliente)
ELse
	%>
	<script>
	alert('O nome do item ou a URL foram deixados em branco!');
	history.go(-1);
	</script>
	<%
End if
%><%
  else
  %>
<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= msg_cheia %><br>
<a href="javascript:history.go(-1)"><font size="2">Clique aqui para voltar.</font></a></strong></font> 
<%
  End if
  %>
<!-- #include file="../fechaconexoes.asp" -->
