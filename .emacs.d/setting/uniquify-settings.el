;; -*- Emacs-Lisp -*-
;; -*- coding:utf-8 -*-
;;
;; ------------------------------------------------------------------------------
;;
;; @file        uniquify-settings.org
;; @brief
;; @author      iHuHoo.W (ihuhoo.w@gmail.com)
;; @date        2011-01-11 11:25:57
;;
;;     Copyright (C) 2011 iHuHoo.W, all rights reserved.
;; 
;; ------------------------------------------------------------------------------
;;

;; uniquify
(require 'uniquify)

(setq uniquify-buffer-name-style 'reverse)

(setq uniquify-separator "/")

;; rename after killing uniquified
(setq uniquify-after-kill-buffer-p t)

;; don't muck with special buffers (or Gnus mail buffers)
(setq uniquify-ignore-buffers-re "^\\*") 

(provide 'uniquify-settings)

