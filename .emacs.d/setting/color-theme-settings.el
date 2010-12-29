;; -*- Emacs-Lisp -*-

;; color theme
(require 'color-theme)

;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-blackboard)))

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-arjen)))
(color-theme-dark-blue)

