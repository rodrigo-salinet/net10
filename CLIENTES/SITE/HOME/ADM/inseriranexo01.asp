<!-- #include file="../conexao.asp" -->
<!-- #include file="conexao_adm.asp" -->
<html>
<head>
<title>Inserir</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script>
var cancelar;

v = new Array();
v[0] = '';
v[1] = '';
v[2] = '';
v[3] = '';
v[4] = '';
aretornar = 'lateral';

function retorna(valor)
{
	v[0] = valor;
	if(valor=="lateral")
	{
		v[1] = '<%= endereco_virtual %>menu_lateral.asp?cliente=<%= cliente %>';
		v[3] = '160';
		v[4] = '300';
	}
	
	if(valor=="busca")
	{
		v[1] = '<%= endereco_virtual %>busca.asp?cliente=<%= cliente %>';
		v[3] = '200';
		v[4] = '56';
	}
	
	if(valor=="rotativas")
	{
		v[1] = '<%= endereco_virtual %>ultimas.asp?cliente=<%= cliente %>';
		v[3] = '160';
		v[4] = '200';
	}
	
	if(valor=="rotativash")
	{
		v[1] = '<%= endereco_virtual %>ultimas.asp?cliente=<%= cliente %>&horizontal=true';
		v[3] = '300';
		v[4] = '18';
	}
	
	if(valor=="resumo")
	{
		mostraItem = window.showModalDialog('subgrupo.asp?mostra_numero=true','','');
		if(mostraItem!=null)
		{
			var id = mostraItem["id_nivel"];
			var numero = mostraItem["numero"];
			mostraItem = "<%= endereco_virtual & "tabela.asp?cliente=" & cliente & "&id=" %>" + id + "&numero="+numero;
			v[1] = mostraItem;//prompt('Coloque o endereço completo:', 'http://', 'Inserir outro anexo');
			v[3] = prompt('Largura:', '150');
			v[4] = prompt('Altura:', '150');
			v[0] = v[0] + id
			
		}
		else{
			var cancelar = true;
		}
	}

	if(valor=="outro")
	{
		nome = prompt("Nome do Anexo:", 'outro', 'Inserir outro anexo');
		v[1] = prompt('Coloque o endereço completo:', 'http://', 'Inserir outro anexo');
		v[3] = prompt('Largura:', '150', 'Inserir outro anexo');
		v[4] = prompt('Altura:', '150', 'Inserir outro anexo');
		v[0] = v[0] + nome;
	}

	v[2] = form1.align.value;
	if(cancelar!=true)
		window.returnValue = v;
	window.close();
}
</script>
</head>

<body bgcolor="#CCCCCC">
<form id="form1" name="form1">
<fieldset>
  <legend><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><strong>Tipo 
  de Anexo</strong></font></legend>
 <p> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
  <input type="radio" name="Tipo" onDblClick="retorna(this.value)" onChange="aretornar=this.value" value="lateral" checked>
  <span onClick="Tipo[0].checked=true;aretornar=Tipo[0].value">Menu Lateral </span><br>
  <input type="radio" name="Tipo" onDblClick="retorna(this.value);" onChange="aretornar=this.value" value="busca">
  <span onClick="Tipo[1].checked=true;aretornar=Tipo[1].value">Busca </span> <br>
  <input type="radio" name="Tipo" onDblClick="retorna(this.value)" onChange="aretornar=this.value" value="rotativas">
  <span onClick="Tipo[2].checked=true;aretornar=Tipo[2].value">&Uacute;ltimas Not&iacute;cias </span></font><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
  <input type="radio" name="Tipo" onDblClick="retorna(this.value)" onChange="aretornar=this.value" value="rotativash">
  <span onClick="Tipo[3].checked=true;aretornar=Tipo[3].value">&Uacute;ltimas Not&iacute;cias (horizontal) </span>
  <br>
  <input type="radio" name="Tipo" onDblClick="retorna(this.value)" onChange="aretornar=this.value" value="resumo">
  <span onClick="Tipo[4].checked=true;aretornar=Tipo[4].value">Resumo de um item... </span> <br>
  <input type="radio" name="Tipo" onDblClick="retorna(this.value)" onChange="aretornar=this.value" value="outro">
  <span onClick="Tipo[5].checked=true;aretornar=Tipo[5].value">Outro... </span> </font></p>
 <p align="center"> <font size="2" face="Verdana, Arial, Helvetica, sans-serif"> 
    <select name="align" id="align">
      <option value="left" selected>&Agrave; esquerda</option>
      <option value="center">No centro</option>
      <option value="right">&Agrave; direita</option>
    </select>
    </font></p>
  <p align="center"> 
    <input name="Inserir" type="button" id="Inserir" onClick="retorna(aretornar)" value="Inserir">
  </p>
  </fieldset>
</form>
</body>
</html>
<!-- #include file="../fechaconexoes.asp" -->
