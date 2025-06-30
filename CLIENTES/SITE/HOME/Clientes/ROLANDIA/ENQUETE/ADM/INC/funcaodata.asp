<%
'------------------------------------------------------------------------------------------
' Funчуo: Inverte a Data Recebida no Formato dd/mm/aaaa Para aaaa/mm/dd 
' Recebe: String contendo a data no formato esperado: dd/mm/aaaa ex: "21/01/2000"
' Retorna: Data Invertida no formato: aaaa/mm/dd (Usado no Convert do Sql com cod. 120)
' Obs: A Data Recebida deverс estс correta (use antes a funчуo DataValida(data)
'------------------------------------------------------------------------------------------
Function DataInvertida(data)
	dia=day(Data)
	mes=month(Data)
	ano=year(Data)
	DataInvertida=ano&"/"&mes&"/"&dia	
End Function
%>