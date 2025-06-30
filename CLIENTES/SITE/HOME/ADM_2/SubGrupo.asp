<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<!-- #include file="validasenha.asp" -->
<%
id = Request.QuerysTring("id")
mostra_numero = Request.QueryString("mostra_numero")
%>
<html>
<head>
<title>Administrador <%= ucase(cliente) %></title>
<meta http-equiv="Content-Type" content="text/html; chRset=iso-8859-1">
<script language="JavaScript">
<!--


function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(pRseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function retorna(valor, valor2, valor3, valor4, valor5)
{
  var valores = new Array();
	valores['id_nivel']=valor;
	valores['nome']=valor2;
	valores['numero']=valor3;
	valores['inicial']=valor4;
	valores['final']=valor5;
  window.returnValue = valores;
  window.close();
}	

// -->
</script>

<link href="../../css/pag.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="#3399CC"  vlink="#0000FF" alink="#0066FF">

<%
		Function arvore(nivel)
			Set arv = Conexao_Banco.Execute("Select * From nivel where subfam=" & nivel & " order by ordem")
			Response.Write("<ul>")
			Do while not arv.EOF
				%>
				<li lang='af' type="square" class='tabela'>
				<div >
				 <input onDblClick="retorna(this.value, nome<%= arv("id") %>.innerHTML, numero.value, '', '')" type="radio" name="id_nivel" id="id_nivel" value="<%= arv("id") %>"<% If cint(request.QueryString("id")) = cint(arv("id")) then Response.Write(" checked")%>>
				 <span class="pequeno" id="nome<%= arv("id") %>">
				  <%= texto_imagem("texto", arv("nivel")) %>
				 </span>
				 </div>
				</li>
				<%
				call arvore(arv("id"))
				arv.movenext
			Loop
			Response.Write("</ul>")
		End Function
%>




<table width="100%" height="100%" border="1" align="center" cellspacing="0">
 <tr> 
  <td height="366" colspan="2" bordercolor="#999999" bgcolor="#CCCCCC"> <span<%
   If not mostra_numero then
   %> style="display: none"<%
 End if
 %>> <font size="2" face="Verdana, Arial, Helvetica, sans-serif">N&uacute;mero 
   de caracteres: 
   <input name="numero" type="text" id="numero" size="4" value="150">
   <br>
   Texto superior: <br>
   <textarea name="inicial" cols="20" rows="2" id="inicial"></textarea>
   <br>
   Texto inferior:<br>
   <textarea name="final" cols="20" rows="2" id="final"></textarea>
   </font> </span><font size="1" face="Arial, Helvetica, sans-serif"><b> 
   <% arvore(0) %>
   </b></font> </td>
 </tr>
 <tr bordercolor="#CCCCCC"> 
  <td height="2" bgcolor="#CCCCCC"><font face="Arial, Helvetica, sans-serif"><b><a href="#" onClick="javascript:retorna(document.id_nivel.value, document['nome'+document.id_nivel.value].innerHTML,numero.value)" class="links"><font size="2">Cancelar</font></a> 
   </b></font></td>
  <td bgcolor="#CCCCCC"> <div align="right">
	<input type="button" name="Submit" value="Inserir &gt;&gt;" onClick="javacript:for(var a=0; a <= id_nivel.length; a++){if(id_nivel[a].checked==true){var oid=id_nivel[a].value; retorna(oid, window.document.all['nome'+oid].innerHTML, numero.value, inicial.value, final.value)}}">
	&nbsp;&nbsp; </div></td>
 </tr>
</table>

</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
