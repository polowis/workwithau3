#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("WiFi Host", 353, 226)
$MenuItem1 = GUICtrlCreateMenu("Option")
$MenuItem2 = GUICtrlCreateMenuItem("Guide", $MenuItem1)
$MenuItem4 = GUICtrlCreateMenuItem("Info", $MenuItem1)
$MenuItem3 = GUICtrlCreateMenuItem("Exit", $MenuItem1)
$Label1 = GUICtrlCreateLabel("WiFi Host ", 0, 0, 351, 27,$SS_CENTER)
GUICtrlSetFont(-1, 14, 400, 0, "Tahoma")
GUICtrlSetColor(-1, 0x008000)
$Label2 = GUICtrlCreateLabel("Name wifi", 0, 32, 351, 17, $SS_CENTER)
GUICtrlSetFont(-1, 10, 400, 0, "Tahoma")
GUICtrlSetColor(-1, 0x008000)
$Name = GUICtrlCreateInput("Name wifi", 56, 56, 233, 21,$SS_CENTER)


$Label3 = GUICtrlCreateLabel("Password (8 characters) ", 0, 88, 346, 25,$SS_CENTER)
GUICtrlSetFont(-1, 10, 400, 0, "Tahoma")
GUICtrlSetColor(-1, 0x008000)
$Pass = GUICtrlCreateInput("12345678", 56, 110, 233, 21,$SS_CENTER)

$Button1 = GUICtrlCreateButton("start hosting", 24, 152, 121, 41)
$Button2 = GUICtrlCreateButton("Stop", 208, 152, 121, 41)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

#Region ### START Koda GUI section ### Form=
$AB = GUICreate("Info", 344, 200, 299, 124,$WS_EX_TRANSPARENT)
$Labelab1 = GUICtrlCreateLabel("WiFi Host", 0, 0, 343, 27,$SS_CENTER)
GUICtrlSetFont(-1, 14, 400, 0, "Tahoma")
GUICtrlSetColor(-1, 0x008000)
$BAB = GUICtrlCreateButton("Ðóng", 88, 144, 145, 25)
;$Labelab2 = GUICtrlCreateLabel("Phát Tri?n B?i Xuân Dung 38 " & @CRLF & "K? Thu?t Viên c?a công ty TNHH Thuong M?i Và D?ch V? H?ng Hà" & @CRLF &" S? Ði?n tho?i: 0978296491 ", 32, 32, 281, 105,$SS_CENTER)
GUICtrlSetFont(-1, 12, 400, 0, "Tahoma")
GUICtrlSetColor(-1, 0x008000)
GUISetState(@SW_HIDE)
#EndRegion ### END Koda GUI section ###

While 1
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE
            Exit
         Case $MenuItem3
                Exit
         Case $Button1
            phatwifi()
         Case $Button2
            tatwifi()
         Case $MenuItem2
            FileInstall('C:\Users\Admin\Desktop\ass.html',@ScriptDir & "\HuongDan.html")
            ShellExecute(@ScriptDir & "\HuongDan.html")
         Case $MenuItem4
            GUISetState(@SW_SHOW,$AB)
         Case $BAB
                GUISetState(@SW_HIDE,$AB)
    EndSwitch
WEnd
$NameWf=
$PassWf=
Func phatwifi()
   Run("C:\WINDOWS\system32\cmd.exe")
WinWaitActive("C:\WINDOWS\system32\cmd.exe")

send('netsh wlan set hostednetwork mode=allow ssid='& GUICtrlRead($Name) &' key=' & GUICtrlRead($Pass) &'' & "{ENTER}")

send('netsh wlan start hostednetwork' & "{ENTER}")

ProcessClose("cmd.exe")
EndFunc
Func tatwifi()

Run("C:\WINDOWS\system32\cmd.exe")
WinWaitActive("C:\WINDOWS\system32\cmd.exe")
send('netsh wlan set hostednetwork mode=disallow ssid=' & GUICtrlRead($Name)&' key='& GUICtrlRead($Pass) &'' & "{ENTER}")
send('netsh wlan stop hostednetwork' & "{ENTER}")
ProcessClose("cmd.exe")

EndFunc
