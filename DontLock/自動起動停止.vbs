Option Explicit
'----------------------------------- 
' 2021�N6��30�� 8:58:38�쐬
'----------------------------------- 

Dim wsh: Set wsh = CreateObject("WScript.Shell")
Dim fso: Set fso = Createobject("Scripting.FileSystemObject")
'Dim xl : Set xl  = CreateObject("Excel.Application")
'Dim xl : Set xl  = GetObject(,"Excel.Application")

Main
Sub Main()
	fso.DeleteFile wsh.SpecialFolders("Startup") & "\DontLock.lnk"
	MsgBox "�X�^�[�g�A�b�v����폜���܂����B" & vbLf & "���񂩂�PC�N�����Ɏ����N�����Ȃ��Ȃ�܂��B"
End Sub
