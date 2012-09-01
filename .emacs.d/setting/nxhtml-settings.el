;; -*- Emacs-Lisp -*-
;; -*- coding:utf-8 -*-
;;
;; ------------------------------------------------------------------------------
;;
;; @file        nxhtml-settings.el
;; @brief
;; @author      iHuHoo.W (ihuhoo.w@gmail.com)
;; @date        2012-05-28 14:37:38
;;
;;     Copyright (C) 2012 iHuHoo.W, all rights reserved.
;; 
;; ------------------------------------------------------------------------------
;;

;; Mumamo is making emacs 23.4 freak out
(when (and (equal emacs-major-version 23)
           (equal emacs-minor-version 4))
  (eval-after-load "bytecomp"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function))
  (eval-after-load "tramp-compat"
    '(add-to-list 'byte-compile-not-obsolete-vars
                  'font-lock-beginning-of-syntax-function)))

(load "~/.emacs.d/site-lisp/nxhtml/autostart.el")

(provide 'nxhtml-settings)
