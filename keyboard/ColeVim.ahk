; AHK script with some custom Vim-friendly bindings
; 2009-01-29 Gabe Moothart, http://codingpatterns.blogspot.com

#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 3  ; Exact matching to avoid confusing T/B with Tab/Backspace.

;
; Custom Vim-like bindings
;

;for debugging
;KeyHistory

; Easier Esc key - std keyboard
Capslock::Escape

;Easier Esc key - TypeMatrix
;\::Esc
;Capslock::\

;Vim-like mappings for the arrow keys

;==========================
; Arrow keys
;==========================

; <A-k> is arrow-down (qwerty n)
$!N::
    Send, {Down}
return

; <A-h> is arrow-up (qwerty h)
$!H::
    Send, {Up}
return

; <A-j> is arrow-left (qwerty y)
$!Y::
    Send, {Left}
return

; <A-l> is arrow-right (qwerty u)
$!U::
    Send, {Right}
return


;==========================
; C-Arrow keys
;==========================

; <C-A-k> is ctrl-down (qwerty n)
$^!N::
    Send, ^{Down}
return

; <C-A-h> is ctrl-up (qwerty h)
$^!H::
    Send, ^{Up}
return

; <C-A-j> is ctrl-left (qwerty y)
$^!Y::
    Send, ^{Left}
return

; <C-A-l> is ctrl-right (qwerty u)
$^!U::
    Send, ^{Right}
return


;==========================
; S-Arrow Keys
;==========================

; <S-A-k> is shift-down (qwerty n)
$+!N::
    Send, +{Down}
return

;==========================
; <S-A-h> is shift-up (qwerty h)
;==========================
$+!H::
    Send, +{Up}
return

;==========================
; <S-A-j> is shift-left (qwerty y)
;==========================
$+!Y::
    Send, +{Left}
return

;==========================
; <S-A-l> is shift-right (qwerty u)
;==========================
$+!U::
    Send, +{Right}
return

;==========================
; C-S-Arrow Keys
;==========================

; <C-S-A-k> is ctrl-shift-down (qwerty n)
$+^!N::
    Send, +^{Down}
return

; <C-S-A-h> is ctrl-shift-up (qwerty h)
$+^!H::
    Send, +^{Up}
return

; <C-S-A-j> is ctrl-shift-left (qwerty y)
$+^!Y::
    Send, +^{Left}
return

; <C-S-A-l> is ctrl-shift-right (qwerty u)
$+^!U::
    Send, +^{Right}
return
