Option Explicit
'----------------------------------- 
' 2021�N6��28�� 10:36:04�쐬
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

	msg = "�X�^�[�g�A�b�v�ɓo�^���܂����B" & vbLf & _
		"���񂩂�PC�N�����Ɏ����N������悤�ɂȂ�܂��B" & vbLf & _
		"�������c�[�����N�����܂���?"

	If vbYes = MsgBox(msg, vbYesNo) Then
		wsh.Run path_shortcut
	End If

	Set wsh = Nothing
	Set fso = Nothing
End Sub

Sub Install()
	If Not fso.FolderExists("C:\ISHII_Tools") Then fso.CreateFolder "C:\ISHII_Tools"
	fso.CopyFolder wsh.CurrentDirectory,"C:\ISHII_Tools\�X���[�v�h�~"
End Sub

Sub SetupShortcut()
	path_shortcut = "C:\ISHII_Tools\�X���[�v�h�~\DontLock.lnk"
	path_tool = "C:\ISHII_Tools\�X���[�v�h�~\DontLock\DontLock.exe"
	
	Set shortcut = wsh.CreateShortcut(path_shortcut)
	shortcut.TargetPath = path_tool
	shortcut.Save
	
	fso.CopyFile  path_shortcut, wsh.SpecialFolders("Startup") & "\DontLock.lnk", True
End Sub