LWin & Tab::
    AltTabMenu := true
    If GetKeyState("Shift","P")
        Send {Alt Down}{Shift Down}{Tab}
    else
        Send {Alt Down}{Tab}
return

#If (AltTabMenu)

    ~*LWin Up::
        Send {Shift Up}{Alt Up}
        AltTabMenu := false
    return

#If

#1::Send {LWin Up}{Ctrl down}1{Ctrl up}
#2::Send {LWin Up}{Ctrl down}2{Ctrl up}
#3::Send {LWin Up}{Ctrl down}3{Ctrl up}
#4::Send {LWin Up}{Ctrl down}4{Ctrl up}
#5::Send {LWin Up}{Ctrl down}5{Ctrl up}
#6::Send {LWin Up}{Ctrl down}6{Ctrl up}
#7::Send {LWin Up}{Ctrl down}7{Ctrl up}
#8::Send {LWin Up}{Ctrl down}8{Ctrl up}
#9::Send {LWin Up}{Ctrl down}9{Ctrl up}
return

+#4::
If WinExist("Snipping Tool")
{
	WinActivate
	WinWaitActive
	Send, {LWin Up}{Shift Up}{Alt down}n
	return
}
else
{
	Run % "snippingtool.exe"
	WinWait, ahk_class Microsoft-Windows-Tablet-SnipperToolbar
	WinActivate, ahk_class Microsoft-Windows-Tablet-SnipperToolbar
	WinWaitActive, ahk_class Microsoft-Windows-Tablet-SnipperToolbar
	Send, {LWin Up}{Shift Up}{Alt down}n
	return
}


IfWinActive, ahk_class Chrome_WidgetWin_1
{
	#t::Send {LWin Up}{Ctrl down}t{Ctrl up}
	#w::Send {LWin Up}{Ctrl down}w{Ctrl up}
	#k::Send {LWin Up}{Ctrl down}k{Ctrl up}
	#l::Send {LWin Up}{Ctrl down}l{Ctrl up}
	#c::Send {LWin Up}{Ctrl down}c{Ctrl up}
	#v::Send {LWin Up}{Ctrl down}v{Ctrl up}
	#x::Send {LWin Up}{Ctrl down}x{Ctrl up}
	#a::Send {LWin Up}{Ctrl down}a{Ctrl up}
}


return
