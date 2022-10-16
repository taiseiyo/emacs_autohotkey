#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; scan code: https://ocamejp.com/autohotkey-scancodes/
; use case https://forestail.com/software/autohotkey/#toc4

^!r::Reload
^!e::Edit

; emacs key bind
^f::Send, {Right}
^b::Send, {Left}
^p::Send, {Up}
^n::Send, {Down}
^e::Send, {End}
^a::Send, {Home}
^d::Send, {Delete}
^k::Send, {Shift down}{End}{Shift up}{Backspace}

; move screen
IsAltTabMenu := false
^!i::
    Send !^{Tab}
    IsAltTabMenu := true
    return
#If (IsAltTabMenu)
;    h::Send {Left}
    j::Send {Left}
    k::Send {Right}
;    l::Send {Right}
    i::Send {Tab}

    Enter::
        Send {Enter}
        IsAltTabMenu := false
    Return
    Space::
        Send {Space}
        IsAltTabMenu := false
    Return
#If

; courvas skk undo language
; ^j::Send, !{sc029}


; max window and return window
^!'::
If Maximized
WinRestore, A
Else
WinMaximize, A
Maximized := Maximized ? "" : 1
Return

; make ctrl+Alt+. minimize the current window
^!.::WinMinimize,A