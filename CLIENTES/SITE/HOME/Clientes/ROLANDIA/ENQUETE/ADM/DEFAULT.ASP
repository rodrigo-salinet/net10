<!-- #Include file="conexao.asp" -->

<html>
<head>
<title>ADMINISTRADOR</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" border="0" cellspacing="0">
<tr> 
<td> 
<form name="form1" method="post" action="senha.asp">
<table border="0" cellspacing="0" align="center">
          <tr> 
            <td> <center>
                <b><font size="4" face="Arial, Helvetica, sans-serif" color="#FF0000">&Aacute;rea 
                restrita ao administrador do site.</font></b> </center></td>
          </tr>
		  <%
		  If Request.QueryString("erro") <> empty then
		  %>
          <tr> 
            <td><center>
                <strong><em><font color="#0000FF"><%= Request.QueryString("erro") %></font></em></strong> <%= Session("usuario") & " " & Session("senha") %> 
              </center></td>
          </tr>
		  <% End if %>
        </table>
        <table width="29%" border="0" cellspacing="0" align="center">
<tr> 
<td bgcolor="#3399CC"> 
<center>
<b><font face="Arial, Helvetica, sans-serif" color="#FFFFFF">Usu&aacute;rio:</font></b> 
</center>
</td>
</tr>
<tr> 
<td> 
<center>
<input type="text" name="usuario">
</center>
</td>
</tr>
<tr> 
<td bgcolor="#3399CC"> 
<center>
<b><font face="Arial, Helvetica, sans-serif" color="#FFFFFF">Senha:</font></b> 
</center>
</td>
</tr>
<tr> 
<td> 
<center>
<input type="password" name="senha">
</center>
</td>
</tr>
<tr> 
<td> 
<center>
<input type="submit" name="Submit" value="Enviar">
<input type="reset" name="Submit2" value="Cancelar" onClick="javascript:history.go(-1)">
</center>
</td>
</tr>
</table>
</form>
</td>
</tr>
</table>
</body>
</html>
