<!-- #include file="../../conexao.asp" -->
<!-- #include file="../conexao_adm.asp" -->
<%
If tc < 100 then
%>
<%
nome_pasta = replace(Request.QueryString("categoria"), "//", "/")


caminho_fisico = caminho_cliente & "imagens\" & nome_pasta
nova_pasta = Request.Form("nome")
fso.CreateFolder caminho_fisico & "\" & nova_pasta
Response.Redirect("janela_imagens.asp?cliente="&cliente&"&categoria=" & nome_pasta & "\" & nova_pasta & "&msg=Categoria inserida.")
%><%
  else
  %>
<font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif"><strong><%= msg_cheia %><br>
</strong></font><font face="Verdana, Arial, Helvetica, sans-serif"><strong><a href="javascript:history.go(-1)"><font size="2">Clique 
aqui para voltar.</font></a></strong></font> 
<%
  End if
  %><!-- #include file="../../fechaconexoes.asp" -->
