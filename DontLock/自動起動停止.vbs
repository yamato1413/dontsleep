Option Explicit
'----------------------------------- 
' 2021年6月30日 8:58:38作成
'----------------------------------- 

Dim wsh: Set wsh = CreateObject("WScript.Shell")
Dim fso: Set fso = Createobject("Scripting.FileSystemObject")
'Dim xl : Set xl  = CreateObject("Excel.Application")
'Dim xl : Set xl  = GetObject(,"Excel.Application")

Main
Sub Main()
	fso.DeleteFile wsh.SpecialFolders("Startup") & "\DontLock.lnk"
	MsgBox "スタートアップから削除しました。" & vbLf & "次回からPC起動時に自動起動しなくなります。"
End Sub
