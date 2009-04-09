; Colemak layout for AutoHotkey (MS Windows)
; 2006-01-01 Shai Coleman, http://colemak.com/ . Public domain.
; See http://www.autohotkey.com/ for more information

; Also includes some custom Vim-friendly bindings
; 2009-01-29 Gabe Moothart, http://codingpatterns.blogspot.com

; For this to work you have to make sure that the US (QWERTY) layout is installed,
; that is set as the default layout, and that it is set as the current layout.
; Otherwise some of the key mappings will be wrong.
;
; This is mainly useful for those who don't have privileges to install a new layout
; This doesn't support the international features of the Colemak layout.

#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 3  ; Exact matching to avoid confusing T/B with Tab/Backspace.

;`::`
;1::1
;2::2
;3::3
;4::4
;5::5
;6::6
;7::7
;8::8
;9::9
;0::0
;-::-
;=::=

;q::q
;w::w
e::f
r::p
t::g
y::j
u::l
i::u
o::y
p::`;
;[::[
;]::]
;\::\

;a::a
s::r
d::s
f::t
g::d
;h::h
j::n
k::e
l::i
`;::o
;'::'

;z::z
;x::x
;c::c
;v::v
;b::b
n::k
;m::m
;,::,
;.::.
;/::/

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
