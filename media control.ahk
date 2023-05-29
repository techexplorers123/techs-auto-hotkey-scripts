#NoEnv
#SingleInstance Force
#Include send-keys-to-spotify.ahk
#InstallKeybdHook
SendMode Input
SetWorkingDir %A_ScriptDir%
sleep 700
TrayTip warning!, script reloaded, 5, 1
announce_title=1
#Persistent
SetTitleMatchMode, 2
WinGetTitle, TitleLast, ahk_exe Spotify.exe
SetTimer, CheckChanged, 100
return
CheckChanged:
WinGetTitle, Title , ahk_exe Spotify.exe
if(announce_title==1)
{
If (Title <> TitleLast&&Title == "Spotify Premium")
{
nvdaCancel()
	nvdaSpeak("paused")
}
else If (Title <> TitleLast)
{
nvdaCancel()
	nvdaSpeak(Title)
}
}
TitleLast := Title
return
!#Up::
SoundSet +5
nvdaCancel()
SoundPlay *-1
return
!#Down::
SoundSet -5
nvdaCancel()
SoundPlay *-1
return
^!#Up::
Spotify_HotkeySend("^{Up}")
SoundPlay *-1
return
^!#Down::
Spotify_HotkeySend("^{Down}")
SoundPlay *-1
return
!#m::
send, {Volume_Mute}
return
!#Right::
send, {Media_Next}
return
!#Left::
send, {Media_Prev}
return
!#space::
send, {Media_Play_Pause}
return
nvdaSpeak(text)
{
return DllCall("nvdaControllerClient.dll\nvdaController_speakText", "wstr", text)
}
nvdaCancel()
{
return DllCall("nvdaControllerClient.dll\nvdaController_cancelSpeech")
}
#!l::
Spotify_HotkeySend("!+b")
nvdaSpeak("done")
return
!^#r::
Reload
TrayTip warning!, reloading script please wait, , 1
Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
MsgBox, 19,error!, The script could not be reloaded. Would you like to open it for editing?
IfMsgBox, Yes, Edit
return
#!+left::
Spotify_HotkeySend("+{left}")
return
#!+right::
Spotify_HotkeySend("+{right}")
return
#!t::
if(announce_title==1)
{
announce_title=0
nvdaCancel()
nvdaSpeak("title announcement disabled")
}
else if(announce_title==0)
{
announce_title=1
nvdaCancel()
nvdaSpeak("title announcement enabled")
}
return
