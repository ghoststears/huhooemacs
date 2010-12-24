;; -*- Emacs-Lisp -*-
;; -*- coding:utf8 -*-

;; Time-stamp: <2009-11-24 10:29:08 Tuesday by ahei>

;; cedet1.0pre6 is conflict with which-func
;; after require cedet, which-func cann't work
(require 'cedet)
(require 'semantic-ia)

;; Enable EDE (Project Management) features
;; (global-ede-mode 1)

;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;; (setq semanticdb-project-roots (list "/"))
;; (require 'cc-mode)
;; (dolist (map (list c-mode-base-map emacs-lisp-mode-map))
;;   (define-key map (kbd "C-c j") 'semantic-complete-jump-local)
;;   (define-key map (kbd "C-c n") 'senator-next-tag)
;;   (define-key map (kbd "C-c p") 'senator-previous-tag))
