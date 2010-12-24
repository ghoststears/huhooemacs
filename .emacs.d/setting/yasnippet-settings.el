;; -*- Emacs-Lisp -*-

;; Time-stamp: <11/01/2009 18:37:35 ÐÇÆÚÈÕ by ahei>

(require 'yasnippet)
(yas/initialize)

(setq yas/root-directory (concat my-emacs-path "snippets"))
(yas/load-directory yas/root-directory)
(setq yas/trigger-key nil)
(yas/global-mode t)

(define-key yas/keymap (kbd "C-n") 'yas/next-field-or-maybe-expand)
(define-key yas/keymap (kbd "C-p") 'yas/prev-field)
