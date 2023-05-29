#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Space::PostMessage WM_INPUTLANGCHANGEREQUEST:=0x50, INPUTLANGCHANGE_FORWARD:=0x2,,, % (hWndOwn := DllCall("GetWindow", Ptr, hWnd:=WinExist("A"), UInt, GW_OWNER := 4, Ptr)) ? "ahk_id" hWndOwn : "ahk_id" hWnd

