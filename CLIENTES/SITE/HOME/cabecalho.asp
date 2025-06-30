<%
Set cabeca = fso.OpenTextFile(Server.Mappath("home/Clientes/" & Session("cliente") & "/cabecalho.htm"))
Response.Write(cabeca.readall)
%>

