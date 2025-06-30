<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
If tc < 100 then
%>
<%
grupo = Request.Form("Grupo") 
imagem = Request.form("imagem")
URL = Request.Form("URL")
imagem = Request.Form("imagem")
target = Request.Form("target")

If imagem <> empty and imagem <> "http://" then
	imagem = "|***<img src=&quot;" & imagem & "&quot; alt=&quot;" & grupo & "&quot; border=&quot;0&quot;>***| " 
	grupo = imagem & grupo
End if

id = Request.QueryString("id_grupo")
If id = empty then
	id = 0
End if
If grupo <> empty then
	str = "Insert into nivel (nivel, SUBFAM, ordem) Values ('" & grupo & "', " & id & ", 0)"

	Conexao_banco.Execute(str)
	Set rs = conexao_banco.Execute("Select * From nivel order by id desc")
	Set frs = Conexao_banco.Execute("Select * FRom nivel where ordem=-1")
	Set ord = Conexao_banco.Execute("SELECT Sum(NIVEL.ordem) AS SomaDeordem FROM NIVEL HAVING (((NIVEL.subfam)=" & id & "))")
	ordem = ord("somadeordem")
	If not isNumeric(ordem) or ordem < 0 then
		ordem = "0"
	End if
	fundo = frs("fundo")
	If fundo = "" then
		fundo = "#FFFFFF"
	End if
	nid = rs("id")
	If URL <> Empty then
		pagina = "<script>abrearquivo(&#" & asc("'") & ";" & URL & "&#" & asc("'") & ";, &#" & asc("'") & ";" & target & "&#" & asc("'") & ";)</script><center>Se a página não abrir automaticamente, <a href=""" & URL & """ target="""& target &""">clique aqui.</a></center>"
	Else
		pagina = "<IFRAME title=Grupos style=&#34;WIDTH: 163px; HEIGHT: 435px&#34; align=left marginWidth=0 marginHeight=0 src=&#34;" & endereco_virtual & "menu_lateral.asp?cliente=" & cliente & "&amp;id=" & nid & "&amp;fundo=#" & fundo & "&#34; frameBorder=0></IFRAME>"
	End if
	Conexao_banco.Execute("UPDATE Nivel set pagina_inicial='" & pagina & "', fundo='" & fundo  & "', ordem=" & ordem & " Where id=" & nid)
	Conexao_adm.Execute("Insert into relacao(grupo, usuario) values(" & nid & ", " & verifica("id") & ")")
	Response.Redirect("Administrador.asp?msg=Inserido com sucesso.&id=" & id & "&cliente=" & cliente)
ELse
	%>
	<script>
	alert('Por favor coloque o nome do grupo.');
	history.go(-1);
	</script>
	<%
End if
%>
<%
  else
  %>
<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= msg_cheia %><br>
<a href="javascript:history.go(-1)"><font size="2">Clique aqui para voltar.</font></a></strong></font> 
<%
  End if
  %>
<!-- #include file="../fechaconexoes.asp" -->
