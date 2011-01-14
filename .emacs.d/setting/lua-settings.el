;; -*- Emacs-Lisp -*-
;; -*- coding:utf-8 -*-
;;
;; ------------------------------------------------------------------------------
;;
;; @file        lua-settings.el
;; @brief       lua settings
;; @author      iHuHoo.W (ihuhoo.w@gmail.com)
;; @date        2011-01-14 17:46:56
;;
;;     Copyright (C) 2011 iHuHoo.W, all rights reserved.
;; 
;; ------------------------------------------------------------------------------
;;

(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

(provide 'lua-settings)

