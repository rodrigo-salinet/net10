<!--#include file="conexao.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
Set login = Conexao.Execute("Select * FRom Login")
If Session("usuario") <> login("usuario") and Session("senha") <> login("senha") then
	REsponse.Redirect("default.asp?erro=Usuário ou senha inválidos.")
End if
'------------------------------------------------------------------------------------------------
' Este ASP faz a administração de todas as enquetes, permitindo através dele adicionar perguntas,
' adicionar respostas a essas perguntas, alterar o texto e data de uma pergunta, alterar o texto
' de uma resposta, apagar uma pergunta e todas as suas respostas, apagar apenas uma resposta
'------------------------------------------------------------------------------------------------
%>
<!--Inclusão da função para trocar o formato da data (ver comentário no ASP)-->
<!--#include file="inc/funcaodata.asp"-->
<%
' Seleciono do banco de dados todas as perguntas ordenadas por ordem decrscente de data
	sql="SELECT * FROM enquete_pergunta ORDER BY data DESC"
	set pergunta=conexao.execute(sql)

' Os requests seguintes são para saber que tipo de acção o ASP deve tomar em relação a editar ou não algumas perguntas/respostas, se nenhum deles ter valor, não ativa o modo de edição para nenhum deles.

' Obtenho o valor de ID de uma pergunta
	id_p=request.querystring("id_p")
' Obtenho o valor de ID de uma resposta
	id_r=request.querystring("id_r")
' Obtenho a accao a executar
	action=request.querystring("action")
' Obtenho o valor de ID de uma pergunta noutra variavel
	id=request.querystring("id")
%>
<HTML>
<HEAD>
<TITLE> Administração da Enquete ver 1.0</TITLE>
<META NAME="Author" CONTENT="Paulo Jorge Iap Correia">
<META NAME="Email" CONTENT="paulo_iap@bol.com.br; paulo_iap@mail.pt">
<script language="javascript">
// Função de Javascript que troca a action do formulário para o ASP que adicionar uma resposta e envia esse formulário
	function envia_resposta()
	{
		document.form.action='add_r.asp';
		document.form.submit();
	}
// Função de Javascript que troca a action do formulário para o ASP que adicionar uma pergunta e envia esse formulário
	function envia_pergunta()
	{
		document.form.action='add_p.asp';
		document.form.submit();
	}
</script>
</HEAD>
<link rel="stylesheet" href="css/styles.css">
<BODY BGCOLOR="#FFFFFF">
<FORM name="form" METHOD="Post" ACTION="edit.asp">
<table width="70%" align=center class=nav>
<tr> 
<td colspan=5 align=center class=nav>Enquete</td>
</tr>
<tr class=grey1> 
<td align=center width="20%" bgcolor="#3399CC"><font color="#FFFFFF">Data</font></td>
<td colspan=2 align=center width="80%" bgcolor="#3399CC"><font color="#FFFFFF">Pergunta</font></td>
<td align=center bgcolor="#3399CC"><font color="#FFFFFF">Editar</font></td>
<td align=center bgcolor="#3399CC"><font color="#FFFFFF">Apagar</font></td>
</tr>
<%
' Se não tiver nenhumas perguntas no banco de dados, exibe a seguinte mensagem	
	if pergunta.eof then
%>
<tr class=grey2> 
<td colspan=5 align=center>Banco de dados vazio</td>
</tr>
<%
' Se tiver perguntas no banco de dados, exibe as perguntas e suas respostas
else
' Enquanto não chegar ao fim das perguntas exibe as perguntas
	do while not pergunta.eof%>
<tr class=grey2> 
<%
' Se o ID da pergunta for igual ao ID do request, então esta pergunta é para ser editada...
		if cint(pergunta("id_enquete"))=cint(id_p) then
' Coluna que contem um campo escondido com o ID da pergunta e o texto da data
%>
<td align=center bgcolor="#DDDDDD"> 
<INPUT class=textbox TYPE="hidden" name="id_p" value="<%=pergunta("id_enquete")%>">
<INPUT class=textbox TYPE="text" NAME="data" size="<%=len(pergunta("data"))%>" value="<%=pergunta("data")%>">
</td>
<%
' Coluna que contem um campo com o texto da pergunta
%>
<td colspan=2 align=center bgcolor="#DDDDDD"> 
<INPUT TYPE="text" NAME="pergunta" size="50" value="<%=pergunta("pergunta")%>">
</td>
<%
' Coluna que contem um link para efetuar a alteração
%>
<td align=center valign=top bgcolor="#DDDDDD">Atualizar<br>
<a href="#" OnClick="javascript:document.form.submit()"><IMG SRC="imgs/botao_adicionar.gif" border=0></a></td>
<%
' Coluna que contem um link para anular a edição
%>
<td align=center valign=top bgcolor="#DDDDDD">Voltar<br>
<a href="default.asp"><IMG SRC="imgs/botao_listar.gif" border=0></a></td>
<%
' Senão exibe apenas a pergunta
		else
' Coluna que contem um campo com o texto da data
%>
<td align=center bgcolor="#DDDDDD"><%=pergunta("data")%></td>
<%
' Coluna que contem um campo com o texto da pergunta
%>
<td colspan=2 align=left bgcolor="#DDDDDD"><%=pergunta("pergunta")%><a href="admin.asp?action=<%=server.urlencode("add_r")%>&id=<%=pergunta("id_enquete")%>"><IMG SRC="imgs/botao_adicionar.gif" border=0 alt="Adicionar Resposta"></a></td>
<%
' Coluna que contem um link para editar a pergunta
%>
<td align=center valign=top bgcolor="#DDDDDD"><a href="admin.asp?id_p=<%=pergunta("id_enquete")%>"><IMG SRC="imgs/botao_editar.gif" border=0></a></td>
<%
' Coluna que contem um link para apagar a pergunta e todas as suas respostas
%>
<td align=center valign=top bgcolor="#DDDDDD"><a href="del.asp?id_p=<%=pergunta("id_enquete")%>" OnClick="return confirm('Deseja excluir?')"><IMG SRC="imgs/botao_apagar.gif" border=0></a></td>
<%end if%>
</tr>
<tr class=grey2>
<td align=center>Mensagem personalizada:</td>
<td colspan=2 align=center> 
<%		if cint(pergunta("id_enquete"))=cint(id_p) then %>
<input type="text" name="msg" size="50" value="<%=pergunta("msg")%>">
<%
Else
%>
<%=pergunta("msg")%>
<%
End if
%>
&nbsp;</td>
<td align=center valign=top>&nbsp;</td>
<td align=center valign=top>&nbsp;</td>
</tr>
<%	
' Selecciono todas as respostas da pergunta exibida anteriormente
	sql="SELECT * FROM enquete_respostas WHERE id_enquete="&pergunta("id_enquete")&" ORDER BY id_resposta"
	set respostas=conexao.execute(sql)
' Enquanto não chegar ao fim das respostas da pergunta
	do while not respostas.eof%>
<tr class=grey2> 
<%
' Se o ID do request for igual ao ID da resposta, então esta resposta é para ser editada
		if cint(respostas("id_resposta"))=cint(id_r) then%>
<td></td>
<td width=50></td>
<%
' Coluna que contem um campo escondido com o id da resposta e um campo com o texto da resposta
%>
<td align=center> 
<INPUT TYPE="hidden" name="id_r" value="<%=respostas("id_resposta")%>">
<INPUT TYPE="text" class=textbox NAME="resposta" size="40" value="<%=respostas("respostas")%>">
</td>
<%
' Coluna que contem um link para efetuar a alteração
%>
<td align=center valign=top>Atualizar<br>
<a href="#" OnClick="javascript:document.form.submit()"><IMG SRC="imgs/botao_adicionar.gif" border=0></a></td>
<%
' Coluna que contem um link para anular a alteração
%>
<td align=center valign=top>Voltar<br>
<a href="default.asp"><IMG SRC="imgs/botao_listar.gif" border=0></a></td>
<%
' Senão exibe a resposta
			else
%>
<td></td>
<td width=50></td>
<%
' Coluna que contem exibe o texto da resposta
%>
<td align=left><%=respostas("respostas")%></td>
<%
' Coluna que contem um link para editar o texto da resposta
%>
<td align=center valign=top><a href="admin.asp?id_r=<%=respostas("id_resposta")%>"><IMG 
			SRC="imgs/botao_editar.gif" border=0></a></td>
<%
' Coluna que contem um link para apagar a resposta
%>
<td align=center valign=top><a href="del.asp?id_r=<%=respostas("id_resposta")%>" OnClick="return confirm('Deseja excluir?')"><IMG SRC="imgs/botao_apagar.gif" border=0></a></td>
<%end if%>
</tr>
<%
' Passo para o registo seguinte das respostas
		respostas.movenext
	loop
' Se a acção for adicionar resposta e o ID da pergunta for o da pergunta atual, então adiciono o HTML para poder indicar o texto da resposta
	if (action="add_r") and (cint(id)=cint(pergunta("id_enquete"))) then%>
<tr class=grey2> 
<td></td>
<td width=50></td>
<%
' Coluna que contem um campo para o texto da resposta a adicionar
%>
<td align=center> 
<INPUT class=textbox TYPE="text" NAME="resposta" size="40">
<INPUT TYPE="hidden" name="id_p" value="<%=pergunta("id_enquete")%>">
</td>
<%
' Coluna que contem um link para efetuar a adição da resposta
%>
<td align=center valign=top>Adicionar<br>
<a href="#" OnClick="javascript:envia_resposta();"><IMG SRC="imgs/botao_adicionar.gif" border=0></a></td>
<%
' Coluna que contem um link para anular a adição da resposta
%>
<td align=center valign=top>Voltar<br>
<a href="default.asp"><IMG SRC="imgs/botao_listar.gif" border=0></a></td>
</tr>
<%end if
' Movimento-me para a pergunta seguinte
	pergunta.movenext
loop
end if
set perguntas=nothing
' Se a acção for adicionar pergunta, então adiciono o HTML para poder indicar o texto da data e da pergunta
	if (action="add_p")then%>
<tr class=grey2> 
<%
' Coluna que contem o texto da data
%>
<td align=center> 
<INPUT class=textbox TYPE="text" NAME="data" size="<%=len(datevalue(now()))%>" value="<%=datevalue(now())%>">
</td>
<%
' Coluna que contem o texto da pergunta
%>
<td colspan=2 align=center> 
<INPUT class=textbox TYPE="text" NAME="pergunta" size="40">
</td>
<%
' Coluna que contem um link para adicionar a pergunta
%>
<td align=center valign=top>Adicionar<br>
<a href="#" OnClick="javascript:envia_pergunta();"><input name="" type="image" src="imgs/botao_adicionar.gif" OnClick="javascript:envia_pergunta();"></a></td>
<%
' Coluna que contem um link para anular a pergunta
%>
<td align=center valign=top>Voltar<br>
<a href="admin.asp"><IMG SRC="imgs/botao_listar.gif" border=0></a></td>
</tr>
<%end if%>
</table>
<br>
<table align=center class=nav width="70%">
<tr>
	<td colspan=4 align=center>
<%
' Link para adicionar uma pergunta
%>
		<a href="admin.asp?action=<%=server.urlencode("add_p")%>">Adicionar Pergunta</a>
	</td>
</tr>
</table>
</form>
</BODY>
</HTML>