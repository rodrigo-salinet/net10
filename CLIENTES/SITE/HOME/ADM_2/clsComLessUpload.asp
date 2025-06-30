<%
'***********************************************************************
' © Sloppycode.net All rights reserved.
'
' This is a standard copyright header for all source code appearing
' at sloppycode.net. This application/class/script may be redistributed,
' as long as the above copyright remains intact. 
' Comments to sloppycode@sloppycode.net
'***********************************************************************


Class ComLessUpload
	
	Private aAllData
	Private aHdr
	Private isPosted
	Private q

	'---------------------------------------------------------------------------
	' Constructor
	'---------------------------------------------------------------------------
	Private Sub Class_Initialize()
		If Request.TotalBytes > 0 Then
			Dim AllDataB, x
		
			' Set flag for posted data
			isPosted = True
			
			' Retrieve post data
			q = Chr(34)
			aAllDataB = Request.BinaryRead(Request.TotalBytes)
			
			' Convert to Ascii from Unicode
			For x = 1 To LenB(aAllDataB)
			aAllData = aAllData & Chr(AscB(MidB(aAllDataB, x, 1)))
			Next
			
			' Retrieve header
			aHdr = Left(aAllData, InStr(aAllData, vbCrLf) + 1)
		Else
			isPosted = False
		End If
	End Sub
    
	'---------------------------------------------------------------------------
	' Destructor
	'---------------------------------------------------------------------------
	Private Sub Class_Terminate()
		' 
	End Sub
		
	'---------------------------------------------------------------------------
	' Save with original filename
	'---------------------------------------------------------------------------
	Public Function Save(directory, field, overwrite) 'As Boolean
		If isPosted Then
			Dim filename
		
			filename = directory & GetFileName(field)
			SaveFile field,filename,overwrite
		End If
	End Function
	'---------------------------------------------------------------------------
	' Mostra o nome do campo de formulário
	'---------------------------------------------------------------------------
	Public Function NomeItem(field) 'As Boolean
		If isPosted Then
			Dim filename
			Dim x2
		
			x = InStr(aAllData, aHdr & "Content-Disposition: form-data; name=" & q & field & q)
		
			If x > 0 Then
				x = InStr(x, aAllData, vbCrLf)
				x = InStr(x + 1, aAllData, vbCrLf)
				x = InStr(x + 1, aAllData, vbCrLf)
				x2 = InStr(x, aAllData, Left(aHdr, Len(aHdr) - 2))
				
				NomeItem = Mid(aAllData, x + 2, x2 - x - 4)' & replace(aalldata, vbcrlf, "<br>") & "<hr>"
			End If
		End If
	End Function
	'---------------------------------------------------------------------------
	' Save with different filename
	'---------------------------------------------------------------------------
	Public Function SaveAs(filename, directory, field, overwrite) 'As Boolean
		If isPosted Then
			Dim filenameAll
		
			filenameAll = directory & filename
			SaveFile field,filenameAll,overwrite
		End If
	End Function
	'---------------------------------------------------------------------------
	' Look for the specified form field in the data, retrieve its filename
	'---------------------------------------------------------------------------
	Public Function GetFileName(field)
		If isPosted Then
			Dim x2, i

			x = InStr(aAllData, aHdr & "Content-Disposition: form-data; name=" & q & field & q)
			If x >0 Then
				x = InStr(x, aAllData, "filename=" & q)
				x2 = InStr(x, aAllData, vbCrLf)
				
				For i = x2 To x Step -1
					If Mid(aAllData, i, 1) = "\" Then
						x = i - 9
						Exit For
					End If
				Next
				
				GetFileName = Mid(aAllData, x + 10, x2 - (x + 11))
			End If
		
		End If
	End Function
	
	
    
	'---------------------------------------------------------------------------
	' Get file data from upload, for a specified field
	'---------------------------------------------------------------------------
	Private Function GetFileData(field)
		Dim x2
	
		x = InStr(aAllData, aHdr & "Content-Disposition: form-data; name=" & q & field & q)
	
		If x > 0 Then
			x = InStr(x, aAllData, vbCrLf)
			x = InStr(x + 1, aAllData, vbCrLf)
			x = InStr(x + 1, aAllData, vbCrLf) + 2
			x2 = InStr(x, aAllData, Left(aHdr, Len(aHdr) - 2))
			
			GetFileData = Mid(aAllData, x + 2, x2 - x - 4)
		End If
	End Function
    
	'---------------------------------------------------------------------------
	' Create an FSO object, save the data to disk
	'---------------------------------------------------------------------------
	Private Sub SaveFile(aField, aFilename, overwrite) 'As Boolean
		Dim FSO, TS
		
		Set FSO = CreateObject("Scripting.FileSystemObject")
		Set TS = FSO.CreateTextFile(aFilename, overwrite, False) ' final param is unicode
		
		TS.Write GetFileData(aField)
		TS.Close
		
		Set TS = Nothing
		Set FSO = Nothing
	End Sub

	
	
	
    
End Class



%>