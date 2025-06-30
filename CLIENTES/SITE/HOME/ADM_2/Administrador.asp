<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
'If not Session("alterado") then
'	Response.Redirect("atualizar_banco.asp")
'End if
	asimagens = Request.QueryString("asimagens")
	If asimagens = "" or asimagens = true or lcase(asimagens) = "verdadeiro" then
		asImagens = false
	Else
		asImagens = true
	End if
	id = Request.QueryString("id")
	If id = empty then id = 0
	Set Rs = Conexao_banco.Execute("Select * From nivel where subfam=" & id & " and ordem <> -1 order by ordem")
	Set ver = Conexao_banco.Execute("Select * From nivel")
	Do while not ver.EOF
		If ver("subfam") = 29 then
			Conexao_banco.Execute("Update Nivel set subfam=0 where id=" & ver("id"))
		End if
		ver.movenext
	Loop
	Set top = Conexao_banco.Execute("Select * From nivel where ordem=-1")
	Do while not top.EOF
		conta_top = conta_top + 1
		top.movenext
	Loop
	top.movefirst
	Set total = Conexao_banco.Execute("SELECT Count(NIVEL.id) AS ContarDeid, NIVEL.subfam FROM NIVEL GROUP BY NIVEL.subfam HAVING (((NIVEL.subfam)=" & id & "))")


	%>
<html>
<head>
<title>Administrador <%= ucase(cliente) %></title>
<meta http-equiv="Content-Type" content="text/html; chRset=iso-8859-1">
<script language="JavaScript">
<!--
<!--
function muda(pos, id)
{
window.open("muda_posicao.asp?cliente=<%= cliente%>&posicao=" + pos + "&id="+id+"&id=<%= id %>", "_self")
}

function excluir(id,arq,nome)
{
	var exclui_arquivo = "sim";
	var subitens = "nao";

	if(exclui_arquivo!=null)
	{
		if(confirm('Deseja mesmo excluir este item?\nSerá impossível desfazer.', 'ATENÇÃO!'))
		{
			if(confirm('Deseja excluir também os subitens?', 'ATENÇÃO!')){subitens='sim'}
			window.open('excluir_grupo.asp?cliente=<%= cliente%>&id='+id+'&exclui_arquivo='+exclui_arquivo+'&arquivo='+nome+'&subitens='+subitens, '_self')
		}
	}
}


function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(pRseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);



// -->

function MM_displayStatusMsg(msgStr) { //v1.0
  status=msgStr;
  document.MM_returnValue = true;
}
//-->
</script>
<link href="../../css/pag.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.posicao {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: xx-small;
	font-weight: bold;
	color: #000066;
	background-color: #f0f0f0;
}
-->
</style>
<style type="text/css">
<!--
.unnamed1 {
	visibility: hidden;
}
.unnamed2 {
	visibility: visible;
}
-->
</style>
</head>

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF" ondragend="MM_displayStatusMsg('asdsaa');return document.MM_returnValue">
<%
If tc > 0 then
%>
<table border="1" align="right" cellspacing="0" bordercolor="#000000" bgcolor="#<% If tc < 75 then %>FFFFFF<% Elseif tc < 90 then %>FFCC00<% Elseif tc >=90 then %>FF0000<% End if %>">
  <tr> 
    <td align="right" bordercolor="#FFFFFF"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"> 
      <% If tc < 100 Then %>
      Voc&ecirc; est&aacute; utilizando <%= conta_porcento %>%<br>
      do seu espa&ccedil;o. (<%= conta_bytes %> Mb) 
      <%
	Else
	%>
      <strong><font color="#FFFFFF"> <%= msg_cheia %> </font></strong> 
      <%
	End if
	%>
      </font></td>
  </tr>
</table>
<%
End if
%>


<%
'aviso = "<p>Aten&ccedil;&atilde;o!<br>        O administrador de imagens<br> est&aacute; temporariamente indispon&iacute;vel.   <br>       Motivo: atualiza&ccedil;&atilde;o de recursos.</p>      <p align=right>O Administrador.&nbsp;         </p>"
If aviso <> empty then
%>
<table border="1" align="left" cellspacing="0" bordercolor="#000000" bgcolor="#FFFFFF">
  <tr> 
    <td align="left" bordercolor="#FFFFFF"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><%= aviso %></font> 
    </td>
  </tr>
</table>
<%
End if
%>
<table border="1" align="center" cellspacing="0">
 <tr> 
  <td width="204" bordercolor="#000099" bgcolor="#000099"> <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#FFFFFF"><b>ADMINISTRADOR</b><br>
	<font color="#FFFF66" size="1"> <strong> 
	<%

subfam = id
If subfam <> 0 then
	Do while cint(subfam) > 0 
		Set nivel_a = Conexao_banco.Execute("Select * From nivel where id=" & subfam)
		if nivel_a("id") <> id then
			todas_fam = "<a href='administrador.asp?id=" & nivel_a("id") & "&cliente=" & cliente & "'><font color='#FFFF66' class='links'>" & texto_imagem("texto", nivel_a("nivel")) & "</font></a> > " & todas_fam
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
todas_fam = "<a href='administrador.asp?cliente=" & cliente & "'><font color='#FFFF66' class='links'>" & texto_imagem("texto", top("nivel")) & "</font></a> > " & todas_fam & " "
Response.Write(todas_fam)
%>
	</strong></font><br>
	</font> </div></td>
 </tr>
 <%
  If Request.QueryString("msg") <> empty then
  %>
 <tr> 
  <td bgcolor="#CCCCCC" bordercolor="#999999" align="center"><font color="#333333" size="2" face="Arial, Helvetica, sans-serif"><em><strong><%= Request.QueryString("msg")%></strong></em></font></td>
 </tr>
 <%
  End if
  
  Set anterior = conexao_banco.Execute("Select * from nivel where id=" & id)
	if not anterior.EOF then
  If anterior("id") > 0 then
  	fam_anterior = anterior("subfam")
	If fam_anterior = 0 then
		fam_anterior = ""
	End if
  %> <tr>
  <td align="right" bordercolor="#999999" bgcolor="#CCCCCC">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr> 
	 <td nowrap><a href="grupos.asp?cliente=<%= cliente %>&id_grupo=<%= anterior("id") %>"><strong><font color="#990000" size="2" face="Verdana, Arial, Helvetica, sans-serif">Alterar 
	  <%= anterior("nivel") %></font></strong></a>&nbsp;&nbsp;</td>
	 <td align="right" nowrap> <a href="administrador.asp?cliente=<%= cliente %>&id=<%= fam_anterior %>"><img src="imagens/acima.gif" width="8" height="12" border="0" align="right"></a><a href="administrador.asp?cliente=<%= cliente %>&id=<%= fam_anterior %>"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Um 
	  n&iacute;vel acima</strong></font></a></td>
	</tr>
   </table>
</td>
 </tr>
<%
End if
  End if

  Set pi = Conexao_adm.Execute("Select * From relacao where usuario=" & verifica("id") & " and grupo=" & id)
  If (id <> 0 or verifica("geral") or not pi.EOF) and tc <= 100 then
	  %>
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC">
<p><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><a href="inserir_grupo.asp?cliente=<%= cliente%>&id_grupo=<%= id %>" class="links">Inserir 
	outro</a><br>
	</b></font></p></td>
 </tr>
 <%
  End if
  %>
 <tr> 
  <td align="center" bordercolor="#999999" bgcolor="#CCCCCC"> <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr> 
	 <td valign="middle" nowrap class="fonte"> <font face="Verdana, Arial, Helvetica, sans-serif" size="2"><strong> 
	  <a title="Voltar ao subnível inicial" href="Administrador.asp?cliente=<%= cliente%>&id=0" class="links"><%= texto_imagem(texto, top("nivel")) %></a> &nbsp;&nbsp; 
	  <%
	  If verifica("geral") then
		%>
	  <a href="grupos.asp?cliente=<%= cliente%>&id_grupo=<%= top("id") %>&fundo=<%= top("fundo") %>" class="links"><font size="1" color="#003300"><img src="imagens/altera.gif" alt="Alterar: <%= texto_imagem("texto", top("nivel")) %>" width="19" height="15" border="0"></font></a> 
	  <%
	  End if
	  %>
	  &nbsp;&nbsp; </strong></font><br> <br> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <%
'													  on error goto 0
If not rs.EOF then
	Do while not Rs.EOF
		If rs("ordem")<0 then Conexao_banco.EXecute("Update nivel set ordem=1 where id=" & rs("id"))
			visualizar = rs("visualizar")
		%>
              <tr nowrap> 
                <td width="57%" nowrap><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><strong> 
                  <%
	'	 	pagina = "<script>abrearquivo(&#" & asc("'") & ";" & URL & 

		 
		caminho_do_arquivo = rs("pagina_inicial")
		

		arquivo = Mostra_Caminho_do_arquivo(caminho_do_arquivo)

		If vartype(arquivo) = 8 then
			contem_arquivo = true
		Else
			contem_arquivo = false
		End if

		Set at = Conexao_banco.Execute("Select * From nivel where subfam=" & rs("id") & " order by ordem")
            If contem_arquivo then 
			%>
                  <img src="imagens/arquivo.gif" width="9" height="11" border="0" alt="<%= arquivo %>"> 
                  <%
			End if
		If not at.EOF then
			Response.Write("<a href='administrador.asp?cliente=" & cliente & "&id=" & Rs("id") & "&asimagens=" & Request.QueryString("asimagens") & "&arquivo=" & arquivo & "' class='links' title='Clique para ver os sub-itens'>") 
		End if
		
		If asimagens then
			Response.Write texto_imagem("imagem", Rs("nivel"))
		Else
			Response.Write texto_imagem("texto", Rs("nivel"))
		End if
		
		If not at.EOF then
			Response.Write("</a>")
		End if 
		
		%>
                  &nbsp;&nbsp; </strong></font></td>
                <%
	Set podever = Conexao_adm.Execute("Select * From Relacao where usuario=" & verifica("id") & " and grupo=" & rs("id"))
	If verifica("geral") or not podever.EOF or contem_arquivo then
	%> 
                <td nowrap width="22%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><strong><a href="grupos.asp?id_grupo=<%= Rs("id") %>&fundo=<%= rs("fundo") %>&cliente=<%= cliente %>" class="links"><font size="1" color="#003300"><img src="imagens/altera.gif" alt="Alterar: <%= texto_imagem("texto", Rs("nivel")) %>" width="19" height="15" border="0"></FONT></a>&nbsp; 
                  <a href="#" class="links" onClick="excluir('<%= rs("id") %>', '<%
			If contem_arquivo then
				%>1<%
			Else
				%>0<%
			End if
			%>', '<%= caminho_relativo %>')"><font size="1" color="#CC0000"><img src="imagens/exclui.gif" alt="Excluir: <%= texto_imagem("texto", Rs("nivel")) %>" width="12" height="11" border="0"></font></a> 
                  <a href="inserir_grupo.asp?cliente=<%= cliente%>&id_grupo=<%= rs("id") %>"><img src="ADMImagens/Imagens/adiciona.gif" alt="Inserir item um n&iacute;vel abaixo" width="9" height="10" border="0"></a>&nbsp;&nbsp; 
                  </strong></font> </td>
                <%
		 End if
		 
		 If verifica("geral") or not pi.EOF or contem_arquivo then
		 %>
                <td nowrap width="18%" align="right"><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><strong><img src="imagens/cima_baixo.gif" width="9" height="10" border="0" usemap="#Map<%= Rs("id") %>">	
                  <map name="Map<%= Rs("id") %>">
                    <% If rs("ordem")>0 then %>
                    <area shape="rect" title="Um nível acima" coords="0,1,10,5" href="#" onClick="muda('<%= cint(rs("ordem"))-1 %>', '<%= Rs("id") %>')">
                    <% End if %>
                    <% If rs("ordem")<=(cint(total("contardeid"))-2) then %>
                    <area shape="rect" title="Um nível abaixo" coords="0,10,10,4" href="#"  onClick="muda('<%= cint(rs("ordem"))+1 %>', '<%= Rs("id") %>')">
                    <% End if %>
                  </map>
                  <font color="#999999" size="1"> <a href="#posicao<%= rs("id") %>" id="posicao<%= rs("id") %>" onClick="javascript:if(document.all.pos<%= rs("id") %>.style.visibility=='hidden'){document.all.pos<%= rs("id") %>.style.visibility='visible';}else{document.all.pos<%= rs("id") %>.style.visibility='hidden'}"><font color="#999999" size="1" title="Alterar Posição">pos</font></a><span id="pos<%= rs("id") %>" style="visibility: hidden">: 
                  <input onChange="javascript:muda(this.value, '<%= rs("id") %>')" name="ordem" type="text" class="posicao" id="ordem" value="<%= rs("ordem") %>" size="2">
                  </span></font></strong></font></td>
                <%
		 End if
		 %>
              </tr>
              <%
		Rs.movenext
	Loop
End if
	
 %>
            </table></td>
	</tr>
   </table></tr>
 <tr> 
  <td bordercolor="#CCCCCC" bgcolor="#CCCCCC"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Clique 
   nos grupos para seus sub itens</font> </td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC"> <div align="center"> 
	<table width="100%" border="0">
	 <!-- 
	 <tr align="center"> 
	  <td><b><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="ADMImagens/DEFAULT.ASP?cliente=<%= cliente%>" target="_blank" class="links">Imagens</a> 
	   </font></b></td>
	  <td><b><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif">Arquivos</font></b></td>
	 </tr> -->
	 <tr align="center"> 
	  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><b><a href="Administrador.asp?cliente=<%= cliente %>&id=<%= Request.QueryString("id") %>&asimagens=<%= asimagens %>">Mostrar/ocultar 
	   bot&otilde;es</a> </b></font></td>
	 </tr>
	 <% 
	 If verifica("geral") then
	 %>
	 <tr align="center"> 
	  <td width="52%"><font face="Arial, Helvetica, sans-serif"><b><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="ADMUltimas/Default.asp?cliente=<%= cliente %>"><br>
	   Not&iacute;cias Rotativas</a></strong></font><font color="#000099" size="2" face="Verdana, Arial, Helvetica, sans-serif"><a href="config.asp?cliente=<%= cliente%>" class="links"><br>
	   <br>
	   Configura&ccedil;&otilde;es Visuais</a> *<br>
	   <br>
	   <a href="AdmUsuarios/Default.asp?cliente=<%= cliente %>">Usu&aacute;rios </a>*</font></b></font></td>
	 </tr>
	 <%
	 End if
	 %>
	</table>
   </div>
   <div align="center"></div></td>
 </tr>
 <tr> 
  <td align="right" bgcolor="#CCCCCC"><font size="2" face="Verdana, Arial, Helvetica, sans-serif">* 
   Novas atualiza&ccedil;&otilde;es</font></td>
 </tr>
 <tr> 
  <td bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><a href="sair.asp" class="links"><font size="2">Sair</font></a></b></font></td>
 </tr>
</table>

</body>
</html><!-- #include file="../fechaconexoes.asp" -->
