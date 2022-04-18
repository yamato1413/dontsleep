Option Explicit
'----------------------------------- 
' 2021年6月28日 10:36:04作成
'----------------------------------- 

Dim wsh: Set wsh = CreateObject("WScript.Shell")
Dim fso: Set fso = Createobject("Scripting.FileSystemObject")

Dim msg
Dim path_shortcut
Dim path_tool
Dim shortcut

Main
Sub Main()
	Install

	SetupShortcut

	msg = "スタートアップに登録しました。" & vbLf & _
		"次回からPC起動時に自動起動するようになります。" & vbLf & _
		"今すぐツールを起動しますか?"

	If vbYes = MsgBox(msg, vbYesNo) Then
		wsh.Run path_shortcut
	End If

	Set wsh = Nothing
	Set fso = Nothing
End Sub

Sub Install()
	If Not fso.FolderExists("C:\ISHII_Tools") Then fso.CreateFolder "C:\ISHII_Tools"
	fso.CopyFolder wsh.CurrentDirectory,"C:\ISHII_Tools\スリープ防止"
End Sub

Sub SetupShortcut()
	path_shortcut = "C:\ISHII_Tools\スリープ防止\DontLock.lnk"
	path_tool = "C:\ISHII_Tools\スリープ防止\DontLock\DontLock.exe"
	
	Set shortcut = wsh.CreateShortcut(path_shortcut)
	shortcut.TargetPath = path_tool
	shortcut.Save
	
	fso.CopyFile  path_shortcut, wsh.SpecialFolders("Startup") & "\DontLock.lnk", True
End Sub