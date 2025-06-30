<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%

fundo_pg = Request.QueryString("fundo")
If fundo_pg = empty then fundo_pg = "FFFFFF"
id_grupo = Request.QueryString("id_grupo")
Set rs_grupo = Conexao_banco.Execute("Select * From nivel where id=" & id_grupo)
principal = rs_grupo("principal")

If Request.QueryString("pagina") <> empty then
	pagina = Request.QueryString("pagina")
Else
	pagina = rs_grupo("pagina_inicial") & " "
End if

'pagina = replace(pagina, "<form", "!-- formulario")
'pagina = replace(pagina, "</form", "!-- /formulario")
For each endereco in endereco_errado
	pagina = replace(pagina, endereco, endereco_virtual)
Next


pagina = replace(pagina, "home_noticias", "home")
pagina = replace(pagina, lcase(endereco_virtual1), lcase(endereco_virtual))
pagina = replace(pagina, lcase(endereco_virtual2), lcase(endereco_virtual))
pagina = replace(pagina, lcase(endereco_virtual3), lcase(endereco_virtual))
pagina = replace(pagina, lcase(endereco_virtual4), lcase(endereco_virtual))
pagina = replace(pagina, lcase(endereco_virtual & "home/clientes"), lcase(endereco_cliente))
'pagina = replace(pagina, lcase("iepe/iepe/"), lcase("home/clientes/iepe/"))
pagina = replace(pagina, "http://jean/net10/novo/clientes/" & cliente & "/", lcase(endereco_cliente))
pagina = replace(pagina, lcase("site/" & cliente & "/" & cliente & "/"), lcase("site/home/clientes/" & cliente & "/"))
pagina = replace(pagina, lcase("home/" & cliente & "/" & cliente), lcase("home/clientes/" & cliente))

fundo = rs_grupo("fundo")
grupo = rs_grupo("nivel")
If principal then
	subfam = "0"
End if
   	img = texto_imagem("imagem", grupo)
	
	Set podever = Conexao_adm.Execute("Select * From Relacao where usuario=" & verifica("id") & " and grupo=" & rs_grupo("id"))
	If not podever.EOF or verifica("geral") then
   %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
var cliente = "<%= cliente %>";
</script>
<script language="JavaScript" src="grupos.js">
</script>
<script language="JavaScript" src="mantenedor.js">
</script>
<style type="text/css">
<!--
.detalhes {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	color: #000000;
}
-->
</style>
</head>

<body vlink="#0000FF" alink="#0066FF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="ColocarTexto(document.form1.Mensagem.value);mantem();//if(document.form1.aimagem.src!=""&&document.form1.aimagem.src!=null){colocaImagem(document.form1.aimagem.src)}">
<form action="update_grupo.asp?id_grupo=<%= Request.QueryString("id_grupo") %>&cliente=<%= cliente %>" method="post" name="form1" target="_self" onSubmit="PegarTexto(this);">
  
 <table width="100%" border="1" cellspacing="0" align="center">
  <tr> 
   <td colspan="2" bordercolor="#000099" bgcolor="#000099"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
	 <tr> 
	  <td width="16%" bordercolor="#000099" bgcolor="#000099"><a href="Administrador.asp?cliente=<%= cliente %>&id=<%= rs_grupo("subfam") %>"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Voltar</strong></font></a> 
	  </td>
	  <td width="50%" align="center" bordercolor="#000099" bgcolor="#000099"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><b><%= texto_imagem("texto", rs_grupo("nivel")) %></b></font></td>
	  <%
  If Request.QueryString("msg") <> empty then
  %>
	  <td width="34%" align="center" bordercolor="#999999" bgcolor="#CCCCCC"><em><strong><font color="#990000" size="1" face="Arial, Helvetica, sans-serif"><%= Request.QuerySTring("msg") %></font></strong></em></td>
	  <%
  End if
	%>
	 </tr>
	</table></td>
  </tr>
  <tr> 
   <td colspan="2" bgcolor="#CCCCCC"><object id="myEditor" name="myEditor" data="editoru.asp?id_grupo=<%= id_grupo %>&cliente=<%= cliente %>" type="text/x-scriptlet" width="100%" height="423">
	 <!-- Isto só é exibido em browsers que não suportão scriptlets -->
	 Seu browser não suporta Scriptlets, por favor atualize para uma versão mais 
	 recente (preferencialmente: IE6+) </object> 
	 <textarea name="Mensagem" cols="80" rows="10" style="display: none"><%= pagina %></textarea>
	 <iframe src="mantem.asp" name="mantenedor" id="mantenedor" style="display: none"></iframe></td>
  </tr><%
 ' If rs_grupo.fields(1) = "HEAD" then
  %>
  <tr bordercolor="#CCCCCC" bgcolor="#CCCCCC"> 
   <td colspan="2" align="center"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	<a href="#" onClick="window.showModalDialog('inserir_js.asp?valor='+ encode(form1.head.value), '', 'center: yes; status: no;')"><br>
	</a></strong></font> <%
	If rs_grupo.Fields.count > 10 then
		head = rs_grupo("head")
		If instr(head,  "&#" & asc("""") & ";")>0 then
			head = replace(head,  "&#" & asc("""") & ";", "'")
		End if
		If instr(head,  "&#" & asc("'") & ";")>0 then
			head = replace(head,  "&#" & asc("'") & ";", "'")
		End if
		If head = empty then head = " "
			
		

	%>
	<textarea name="Head" cols="80" rows="3" style="display: none"><%= Server.HTMLEncode(head) %></textarea>
	
	<a href="#HEAD" name="HEAD" onClick="cabecalho(form1.Head.value)"><strong><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif">Conte&uacute;dos 
	do cabe&ccedil;alho</font></strong></a><%
	End if
	

	%></td>
</td>
  </tr>
  <%
 ' End if
  %>
  <tr> 
   <td colspan="2" align="center" bordercolor="#999999" bgcolor="#CCCCCC"><a href="#" onClick="javascript:if(confirm('Atenção, isto irá limpar a formatação atual!\nDeseja continuar e perder as alterações?')){window.open('Inserir_grupo.asp?id_grupo=<%= rs_grupo("id") %>', '_self')}"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Inserir 
	item um n&iacute;vel abaixo</strong></font></a> </td>
  </tr>
  <tr> 
   <td width="60%" bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><strong>Nome:<br>
	<input name="grupo" type="text" id="grupo" value="<%= texto_imagem("texto", grupo) %>"  size="20">
	</strong> 
	<input name="Fundo" type="hidden" id="Fundo" value="<%
	fundo = Request.QueryString("fundo")
		If Request.QueryString("fundo") = empty then
			fundo = rs_grupo("fundo")
		End if
		If vartype(fundo) = 1 then
			fundo = "FFFFFF"
		End if
		fundo = replace(fundo, "#", "")
		Response.Write(fundo)
		  %>" onChange="muda_fundo(this.value)" size="7">
	</font><font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
	<input name="fundo_imagem" type="hidden" id="fundo_imagem" value="<%= rs_grupo("fundo_imagem") %>" size="60">
	<input name="estilo" type="hidden" id="estilo" value="<%= replace(rs_grupo("estilo"), "home/", "../") %>">
	</font><font size="3" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; 
	</font></td>
   <td width="40%" align="center" bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong> 
	<% If not rs_grupo("principal") then %>
	SubGrupo de:</strong></font><font size="3" face="Verdana, Arial, Helvetica, sans-serif"><br>
	<input name="subfam" type="hidden" id="subfam" value="<%= rs_grupo("subfam") %>">
	<a href="#subf" name="subf" id="subf" onClick="this.innerText=subgrupo('<%= rs_grupo("subfam") %>');">Escolha 
	um</a> 
	<% End if %>
	&nbsp; </font></td>
  </tr>
  <tr> 
   <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif">Imagem 
	de Bot&atilde;o:<br>
	<strong><img src="imagens/imgbd.gif" alt="Escolher imagem do banco de dados" width="22" height="22" align="right" onClick="carrega_img('imagem');nome_imagem(document.form1.imagem.value, true)"></strong>	
<%
	On error resume next
'	 img 
%>
	 
	</script><input name="imagem" value="<%= nome_imagem(img) %>" size="60" onChange="nome_imagem(this.value, true)">
	</font> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
	<span id='imagens'> 
	<%
	 If img <> empty then 
		 %>
	<%= replace(img, "<img", "<img name='aimagem' ") %> 
	<%
	 End if
	 %>
	</span> </font> </td>
   <td align="center" bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font face="Verdana, Arial, Helvetica, sans-serif"><strong>Arquivo: 
	</strong> 
	<%
   Set pagina_inicial = Conexao_banco.Execute("Select * From nivel where id=" & id_grupo)
   caminho_do_arquivo = pagina_inicial("pagina_inicial")
   comeco_arq = "<script>function abre(){window.open("""
   fim_arq = """, ""_blank"");history.go(-1);} abre();</script><center>Se a página não abrir automaticamente, <a href=""#"" onClick=""abre()"">clique aqui.</a></center>"


   If instr(caminho_do_arquivo, comeco_arq) > 0 and instr(caminho_do_arquivo, fim_arq)>0 then
	   caminho_do_arquivo = replace(caminho_do_arquivo, comeco_arq, "")
	   caminho_do_arquivo = replace(caminho_do_arquivo, fim_arq, "")
   Else
   		caminho_do_arquivo = "Nenhum arquivo relacionado."
   End if
 		%>
	<font size="-2"><%= caminho_do_arquivo%></font> </font></td>
  </tr>
  <tr> 
   <td colspan="2" align="center" bordercolor="#CCCCCC" bgcolor="#CCCCCC"> <input name="ultimas" type="checkbox" id="ultimas2" value="true">
   <%
   		strsql = "Select * From ultimas where desturl='" & endereco_virtual & "default.asp?id=" & id_grupo & "&cliente=" & cliente & "'"
   		Set ult = Conexao_ultimas.Execute(strsql)
		If not ult.EOF then
			If ult("desturl") = endereco_virtual & "default.asp?id=" & id_grupo & "&cliente=" & cliente then
				' checked<%
			End if
		End if
   %>
    <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Inserir 
	em not&iacute;cias rotativas</strong></font> 
	&nbsp;</td>
  </tr>
  <tr> 
      <td colspan="2" align="center" bgcolor="#CCCCCC"> <font color="#990000"><% 'on error goto 0%>
       <input name="naomostrar" type="checkbox" id="naomostrar" value="false"<% If lcase(rs_grupo("VISUALIZAR")) = "false" then %> checked<% End if %>>
        <font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Não mostrar 
        no Menu</strong></font></font><!-- <%= rs_grupo("VISUALIZAR") %> --></td>
  </tr> 
  <tr> 
   <td colspan="2" bgcolor="#CCCCCC"> <center>
	 <input type="submit" name="Submit" value="Enviar">
	 <input type="reset" name="Submit2" onClick="Limpar()" value="Limpar P&aacute;gina">
	 <input name="Submit22" value="Cancelar" type="button" onClick="history.go(-1)">
	</center></td>
  </tr>
 </table>
</form>
</body>
</html>
<%
End if
%><!-- #include file="../fechaconexoes.asp" -->
