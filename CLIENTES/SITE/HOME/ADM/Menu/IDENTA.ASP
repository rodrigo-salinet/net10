<html>
<head>
<title>Documento sem t&iacute;tulo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%
Set fso = Server.createObject("Scripting.FileSystemObject")
Set txt = fso.OpenTextFile(Server.MapPath("awjsmenugold10_2.js"))
texto = txt.readall
For i = 1 to len(texto)
	caractere = mid(texto, i, 1)
	If i <= 10 then
		%><%= caractere %><hr><%
	End if
	If caractere = "{" then
		comeco = true
	End if
	If caractere = "}" then
		comeco = false
	End if
	If caractere = vbcrlf then
		caractere = caractere & "    "
	End if
	ntexto = ntexto & caractere
Next
Set novo = fso.CreateTextFile(Server.MapPath("awjsmenugold10_4.js"))

ntexto = replace(ntexto, "aWBmNbspm", "variavel01")
ntexto = replace(ntexto, "awBMNbspm", "variavel02")
ntexto = replace(ntexto, "AWBmNbspm", "variavel03")
ntexto = replace(ntexto, "aWBMNbspm", "variavel04")
ntexto = replace(ntexto, "AWBMNbspm", "variavel05")
ntexto = replace(ntexto, "awbmnBspm", "variavel06")
ntexto = replace(ntexto, "AwbmnBspm", "variavel07")
ntexto = replace(ntexto, "aWbmnBspm", "variavel08")
ntexto = replace(ntexto, "awBmnBspm", "variavel09")
ntexto = replace(ntexto, "awbMnBspm", "variavel10")
ntexto = replace(ntexto, "AWbmnBspm", "variavel11")
ntexto = replace(ntexto, "aWBmnBspm", "variavel12")
ntexto = replace(ntexto, "awBMnBspm", "variavel13")
ntexto = replace(ntexto, "AWBmnBspm", "variavel14")
ntexto = replace(ntexto, "aWBMnBspm", "variavel15")
ntexto = replace(ntexto, "AWBMnBspm", "variavel16")
ntexto = replace(ntexto, "awbmnbSpm", "variavel17")
ntexto = replace(ntexto, "AwbmnbSpm", "variavel18")
ntexto = replace(ntexto, "aWbmnbSpm", "variavel19")
ntexto = replace(ntexto, "awBmnbSpm", "variavel20")
ntexto = replace(ntexto, "awbMnbSpm", "variavel21")
ntexto = replace(ntexto, "AWbmnbSpm", "variavel22")
ntexto = replace(ntexto, "awbMnbsPM", "variavel23")
ntexto = replace(ntexto, "AWbmnbsPM", "variavel24")
ntexto = replace(ntexto, "aWBmnbsPM", "variavel25")
ntexto = replace(ntexto, "awBMnbsPM", "variavel26")
ntexto = replace(ntexto, "AWBmnbsPM", "variavel27")
ntexto = replace(ntexto, "AWBMnBSpm", "variavel28")
ntexto = replace(ntexto, "awbmnbSPm", "variavel29")
ntexto = replace(ntexto, "AwbmnbSPm", "variavel30")
ntexto = replace(ntexto, "aWbmnbSPm", "variavel31")
ntexto = replace(ntexto, "aWBMnbsPM", "variavel32")
ntexto = replace(ntexto, "awbMNBspm", "funcao01")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")
ntexto = replace(ntexto, "", "variavel")





'novo.write(ntexto)

Function vari(variavel, pos)

	For i = 1 to tam
		cara = mid(variavel, pos, 1)
		nvari = replace(variavel, cara, Ucase(cara))
	Next


'	vari = 
End function

%><%= replace(ntexto, vbcrlf, "<br>") %>

</body>
</html>
