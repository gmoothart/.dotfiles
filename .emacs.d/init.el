
;;
;; load paths, etc.
;;
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/lib")

;;
;; misc
;;
(setq-default truncate-lines t)
(setq inhibit-startup-message t)

;;
;; viper/vimpulse
;;
(setq viper-mode t)                ; enable Viper at load time
(setq viper-ex-style-editing nil)  ; can backspace past start of insert / line
(require 'viper)                   ; load Viper
(require 'vimpulse)                ; load Vimpulse
(setq woman-use-own-frame nil)     ; don't create new frame for manpages
(setq woman-use-topic-at-point t)  ; don't prompt upon K key (manpage display)
(require 'redo)
(require 'rect-mark)