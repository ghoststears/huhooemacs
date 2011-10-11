;; -*- Emacs-Lisp -*-
;; -*- coding:utf-8 -*-
;;
;; ------------------------------------------------------------------------------
;;
;; @file        cedet-settings.el
;; @brief
;; @author      iHuHoo.W (ihuhoo.w@gmail.com)
;; @date        2011-10-11 10:45:12
;;
;;     Copyright (C) 2011 iHuHoo.W, all rights reserved.
;; 
;; ------------------------------------------------------------------------------
;;

(defvar cedet-path (concat my-emacs-vendor-lisps-path "cedet-1.0") "Path of `cedet'")
(my-add-subdirs-to-load-path cedet-path)

(require 'cedet)
;; (require 'cedet-eieio-settings)
;; (require 'cedet-ede-settings)
;; (require 'cedet-cogre-settings)
;; (require 'cedet-semantic-settings)
;; (require 'cedet-srecode-settings)
;; (require 'cedet-speedbar-settings)

;; 用pulse实现Emacs的淡入淡出效果
;; http://emacser.com/pulse.htm
(require 'pulse-settings)

(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
(semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)

(defconst user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst win-include-dirs
  (list "C:/MinGW/include"
        "C:/MinGW/include/c++/3.4.5"
        "C:/MinGW/include/c++/3.4.5/mingw32"
        "C:/MinGW/include/c++/3.4.5/backward"
        "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))

(require 'semantic-c nil 'noerror)

(let ((include-dirs user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs win-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;; jump
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [C-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;; code complete
(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)

;; ede 
(global-ede-mode t)

;; switch source file and header file
(require 'eassist nil 'noerror)
(define-key c-mode-base-map [C-c, o] 'eassist-switch-h-cpp)
(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))

;; autoload
(defun cedet-settings-4-info ()
  "`cedet' settings for `info'."
  (info-initialize)
  (dolist (package `("cogre" "common" "ede" "eieio" "semantic/doc" "speedbar" "srecode"))
    (add-to-list 'Info-directory-list (concat my-emacs-vendor-lisps-path "cedet-1.0/" package "/"))))

(eval-after-load "info"
  `(cedet-settings-4-info))

(provide 'cedet-settings)

