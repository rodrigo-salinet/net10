// JavaScript Document

//fun��o executada ao iniciar o objeto
function inicia(objeto, idnivel)
{

}

// ao clicar
function clica(objeto, id)
{
	// fun��o para quando clicar abrir este link
	window.open('default.asp?idfam='+id, '_parent')
}

//quando colocar o mouse sobre o objeto (tabela, c�lula)
function sobre(objeto, id)
{
	//fun��o para mudar o fundo da tabela quando passar o mouse sobre
	if(objeto.id='tabela')
	{
		objeto.className='sobre';
	}
}

//quando tirar o mouse do objeto
function fora(objeto, id)
{
	//fun��o para voltar o fundo ao normal
	if(objeto.id='tabela')
	{
	objeto.className='';
	}

}

//quando soltar o bot�o
function solta(objeto, id)
{

}

//ao dar duplo click
function duplo(objeto, id)
{

}

