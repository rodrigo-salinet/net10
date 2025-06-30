<%
Set cabeca = fso.OpenTextFile(Server.Mappath("home/Clientes/" & cliente & "/cabecalho.htm"))
cabecalho = cabeca.readall
if cabecalho <> "undefined" and cabecalho <> null and vartype(cabecalho) <> 1 and vartype(cabecalho) <> 0 and cabecalho <> "&nbsp;" then 
	Response.Write(cabecalho)
End if
%>

