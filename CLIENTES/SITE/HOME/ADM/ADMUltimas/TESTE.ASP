<%
Response.Write(clng(&h10 * 10))
Response.End()
Function Hex2Dec(strValue)
'On Error GoTo CnvrtErr 
' 
' Converts a string of hexadecimal digits into a decimal number. 
' Valid input range '0' to '7FFFFFFF' 
' 
' Check to see if string already begins with &H. 
If left(strValue, 2) <> "&H" Then strValue = "&h" & strValue 

' Check to see if string contains Decimals and strip them out. 
If InStr(1, strValue, ".") Then strValue = left(strValue, (InStr(1, strValue, ".") - 1)) 

Hex2Dec = CLng(strValue) 
Exit Function 

'CnvrtErr: 
'Hex2Dec = 0 

End Function 
Response.Write(Hex2Dec("10"))
%>