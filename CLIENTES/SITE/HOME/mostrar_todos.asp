<%
On error resume next
Set fso = CreateObject("Scripting.FileSystemObject")
nome_pasta = Request.QueryString("pasta")

%>Pastas: 
<br><br><%
Set pasta = fso.GetFolder(Server.Mappath(nome_pasta))
For each spasta in pasta.subfolders
    Response.Write(spasta.name & "<br>")
Next
%><hr>
<%
For each arq in pasta.Files
    Response.Write(arq.name & "<br>")
Next
%>





