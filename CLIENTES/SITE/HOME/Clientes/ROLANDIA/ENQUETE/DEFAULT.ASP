<%
'Criando objeto 

Set FSO = Server.CreateObject("Scripting.FileSystemObject")

arquivo_enq = "dados/rolandia/enquete.mdb"
caminho_enq = ""

'Achando arquivo - INICIO
if (FSO.FileExists(arquivo_enq) <> true) then
	While NOT(FSO.FileExists(arquivo2_enq)) and total < 10
		total = total + 1
		arquivo2_enq = Server.MapPath(caminho_enq & arquivo_enq)
		caminho_enq = "../" & caminho_enq
	Wend
	whichFN_enq = arquivo2_enq
Else
	whichFN_enq = arquivo_enq
End if


'Achando arquivo - FIM
contxt2 = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&whichFN_enq&";"
Set Conexao2 = CreateObject("Adodb.Connection")
Conexao2.open contxt2
%><%
' Selecciono todas as perguntas por ordem decrescente de data
	sql="SELECT * FROM enquete_pergunta ORDER BY data DESC"
	set rs_enquete_pergunta=Conexao2.execute(sql)
' Selecciono todas as respostas da pergunta de data mais recente
	sql="SELECT * FROM enquete_respostas WHERE ID_enquete="&rs_enquete_pergunta(0)&" ORDER BY id_resposta "
	set rs_enquete_respostas=Conexao2.execute(sql)
	%>
<form name="enquete" method="post" action="<% If rs_enquete_pergunta("pr") then %>enquete/formulario_enquete.asp?id_p=<%= rs_enquete_pergunta("id_Enquete") %><% Else %>enquete/send_enquete.asp<% End if %>">
  
  <table border="1" class=enquete cellspacing="0" bordercolor="#009900" width="150" align="center">
    <tr> 
      <%
' Coluna que contem um link para poder ver os resultados desta enquete sem votar
%>
      <td class=nav align=center bgcolor="#CCFFCC" width="144"><a href="enquete/resultados.asp?id=<%=rs_enquete_pergunta(0)%>" class=nav><b><i><font size="2">Enquete</font></i></b></a></td>
    </tr>
    <tr> 
      <td width="144" bgcolor="#FFFFFF"> <font size="2" face="Arial, Helvetica, sans-serif"> 
        <font size="1"> 
        <%
' Formulário que vai enviar o ID da resposta para adicionar mais um hit
%>
        <input name="ID_enquete" type="hidden" id="ID_enquete" value="<%=rs_enquete_pergunta(0)%>">
        <%
' Coluna que contem o texto da pergunta
%>
        <%=rs_enquete_pergunta(1)%><br>
        <%
' Enquanto houver respostas para esta pergunta....
%>
        <%do while not rs_enquete_respostas.eof%>
        <%
' Cria um conjunto de radio buttons com o valor do ID da resposta e o texto da resposta
%>
        <input type="radio" name="resposta" value="<%=rs_enquete_respostas(0)%>" checked>
        <%=rs_enquete_respostas(2)%><br>
        <%rs_enquete_respostas.movenext%>
        <%loop%>
        </font></font></td>
    </tr>
    <tr> 
      <%
' Coluna que contem o butão que efetua o envio do formulário para o ASP que adiciona hits ás respostas
%>
      <td bgcolor="#FFFFFF" width="144"> 
        <center>
          <input type="image" border="0" name="imageField" src="enquete/IMAGENS/ENVIAR.png" width="39" height="13">
        </center>
      </td>
    </tr>
  </table>
</form>
