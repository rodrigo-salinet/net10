// JavaScript Document

//função executada ao iniciar o objeto
function inicia(objeto, idnivel)
{

}

// ao clicar
function clica(objeto, id)
{
	// função para quando clicar abrir este link
	window.open('default.asp?idfam='+id, '_parent')
}

//quando colocar o mouse sobre o objeto (tabela, célula)
function sobre(objeto, id)
{
	//função para mudar o fundo da tabela quando passar o mouse sobre
	if(objeto.id='tabela')
	{
		objeto.className='sobre';
	}
}

//quando tirar o mouse do objeto
function fora(objeto, id)
{
	//função para voltar o fundo ao normal
	if(objeto.id='tabela')
	{
	objeto.className='';
	}

}

//quando soltar o botão
function solta(objeto, id)
{

}

//ao dar duplo click
function duplo(objeto, id)
{

}

