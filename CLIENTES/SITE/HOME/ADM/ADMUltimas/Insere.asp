<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<!-- #include file="../../CONEXAO_ULTIMAS.asp" -->

<!-- #include file="../validasenha.asp" -->
<html>
<head>
<title>Administrador <%= ucase(cliente) %></title>
<meta http-equiv="Content-Type" content="text/html; chRset=iso-8859-1">
<script language="JavaScript">
<!--
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(pRseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);


function valida(valor)
{
}
function ver(nome)
{
	alert(nome + "!!")
	for(a in nome)
	{
		document.write(a + ": " + nome[a] + "<br>")
	}

}

// -->

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<link href="../../../css/pag.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.posicao {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	font-weight: bold;
	color: #000066;
	background-color: #f0f0f0;
}
.tabela {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: x-small;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF"><%
If tc < 100 then
%>

<table border="1" align="center" cellspacing="0">
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#000099"><strong><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif">Inserir<br>
   <font size="1"> </font></font></strong></tr>
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"> <form name="form1" id="form1" method="post" action="insere2.asp?cliente=<%= cliente %>">
	<table border="0" cellpadding="0" cellspacing="0" class="tabela">
	 <tr> 
	  <td><input name="tipo" type="radio" value="texto" checked>
	   Texto: </td>
	 </tr>
	 <tr> 
	  <td><input name="desc" type="text" id="desc" size="40" onChange="javascript:document.all.tipo[0].checked=true"> &nbsp;</td>
	 </tr>
	 <tr> 
	  <td>Link:</td>
	 </tr>
	 <tr> 
	  <td><input name="desturl" type="text" id="desturl" size="40" value="http://"> 
	   &nbsp;</td>
	 </tr>
	 <tr> 
	  <td align="center" valign="top"><font size="4">ou</font></td>
	 </tr>
	 <tr> 
	  <td valign="top"><input type="radio" name="tipo" value="banco"<%
	  		id = Request.QueryString("id")
		If id <> empty then Response.Write(" checked")
	  %>>
	   Inserir do banco:</td>
	 </tr>
	 <tr>
	  <td valign="top"> <font size="1"> <em>
	  <%
		
		If id = empty then id = "0"
	  		Set rs = Conexao_banco.Execute("Select * From nivel where subfam=" & id & " order by ordem")
			Set atual = Conexao_banco.EXecute("Select * From nivel where id=" & id)
		If rs.EOF then 
		%>
	   N&atilde;o h&aacute; nenhum sub-item.<br><br>

	   <font size="2">Clique em "Inserir &gt;&gt;" para inserir:<br>
	   <font color="#FF0000"><%= atual("nivel") %></font><br>&nbsp;
 </font> 
	   <input name="link" type="hidden" id="link" value="insere.asp?id=<%= id %>&cliente=<%= cliente %>">
	   <%
		ELse
	  %>
	   <select name="link" id="link" onChange="javascript:document.all.tipo[1].checked=true">
		<%
		
		Do while not rs.EOF
			%>
		<option value="insere.asp?id=<%= rs("id") %>&cliente=<%= cliente %>">&nbsp;&nbsp;<%= texto_imagem("texto", rs("nivel")) %></option>
		<%
			rs.movenext
		Loop
		%>
	   </select><%
	   End if
'	   If not rs.EOF then
	  Set subfam = Conexao_banco.Execute("Select * From nivel where subfam=" & id)
		  If not subfam.EOF  then
		  %>
		  <a href="#sub" name="sub" onClick="MM_jumpMenu('parent',document.all.link,1)">Subfam&iacute;lia</a><%
		  End if
'	  End if
	  %></em></font></td>
	 </tr>
	 <tr> 
	  <td valign="top"><strong><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"><font size="1">
	   <%
	Set top = Conexao_banco.Execute("Select * From nivel where ordem=-1")

subfam = id
If subfam <> 0 then
	Do while cint(subfam) > 0 
		Set nivel_a = Conexao_banco.Execute("Select * From nivel where id=" & subfam)
		if nivel_a("id") <> id then
			todas_fam = "<a href='insere.asp?cliente=" & cliente & "&id=" & nivel_a("id") & "'><font color='#FFFF66' class='links'>" & texto_imagem("texto", nivel_a("nivel")) & "</font></a> > " & todas_fam
		End if
		If nivel_a.EOF <> true then
			If nivel_a("subfam") > 0 then
				subfam = nivel_a("subfam")
			Else
				subfam = 0
			End if
		Else
			subfam = 0
		End if
	Loop
	todas_fam = left(todas_fam, len(todas_fam)-2)
End if
todas_fam = "<a href='insere.asp?cliente=" & cliente & "'><font color='#FFFF66' class='links'>" & texto_imagem("texto", top("nivel")) & "</font></a> > " & todas_fam & " "
Response.Write(todas_fam)
%>
	   </font></font></strong></td>
	 </tr>
	 <tr> 
	  <td align="right" valign="top"> <input type="submit" name="Submit" value="Inserir &gt;&gt;"> 
	  </td>
	 </tr>
	</table>
   </form></tr>
 <tr> 
  <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><font size="2"><a href="Default.asp?cliente=<%= cliente %>">Voltar</a></font></b></font></td>
 </tr>
</table>
<%
  else
  %>
<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= msg_cheia %><br>
<a href="javascript:history.go(-1)"><font size="2">Clique aqui para voltar.</font></a></strong></font> 
<%
  End if
  %>
</body>
</html><!-- #include file="../../fechaconexoes.asp" -->
