<%
function tira_html(strHTML, intWorkFlow)'ClearHTMLTags(strHTML, intWorkFlow)

	dim regEx, strTagLess
	
	strTagless = strHTML
	
	set regEx = New RegExp 
	'Cria o objeto regexp 
	regEx.IgnoreCase = True
	'Configuração case sensitivity
	regEx.Global = True
	
	
	if intWorkFlow <> 1 then
	regEx.Pattern = "<[^>]*>"
	'este padrao verifica qqer tag html
	strTagLess = regEx.Replace(strTagLess, "")
	'todas as tags html sao removidas
	end if
	
	if intWorkFlow > 0 and intWorkFlow < 3 then
	regEx.Pattern = "[<]"
	'verifica um < sozinho
	strTagLess = regEx.Replace(strTagLess, "&lt;")
	
	regEx.Pattern = "[>]"
	'verifica um > sozinho
	strTagLess = regEx.Replace(strTagLess, "&gt;")
	end if
	
	set regEx = nothing
	tira_HTML = strTagLess

end function
%>
