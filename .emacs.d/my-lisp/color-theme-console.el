;; -*- Emacs-Lisp -*-
;; -*- coding:utf-8 -*-
;;
;; ------------------------------------------------------------------------------
;;
;; @file        color-theme-console.el
;; @brief
;; @author      iHuHoo.W (ihuhoo.w@gmail.com)
;; @date        2011-11-17 15:01:48
;;
;;     Copyright (C) 2011 iHuHoo.W, all rights reserved.
;; 
;; ------------------------------------------------------------------------------
;;


(defun color-theme-console ()
  (interactive)
  (color-theme-install
   '(color-theme-console      ((background-color . "#000000")
      (background-mode . light)
      (border-color . "#9d3939")
      (cursor-color . "#f8f5d8")
      (foreground-color . "#eeeeec")
      (mouse-color . "black"))
     (fringe ((t (:background "#9d3939"))))
     (mode-line ((t (:foreground "#949457" :background "#9b271c"))))
     (region ((t (:background "#3c4e40"))))
     (font-lock-builtin-face ((t (:foreground "#00cdcd"))))
     (font-lock-comment-face ((t (:foreground "#cd0000"))))
     (font-lock-function-name-face ((t (:foreground "#cdcd00"))))
     (font-lock-keyword-face ((t (:foreground "#00cdcd"))))
     (font-lock-string-face ((t (:foreground "#cd00cd"))))
     (font-lock-type-face ((t (:foreground"#8ae234"))))
     (font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
     (minibuffer-prompt ((t (:foreground "#888a6a" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'color-theme-console)
