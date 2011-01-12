;; -*- Emacs-Lisp -*-
;; -*- coding:utf-8 -*-
;;
;; ------------------------------------------------------------------------------
;;
;; @file        .emacs
;; @brief
;; @author      iHuHoo.W (ihuhoo.w@gmail.com)
;; @date        2011-01-12 17:09:13
;;
;;     Copyright (C) 2011 iHuHoo.W, all rights reserved.
;; 
;; ------------------------------------------------------------------------------
;;


(defconst my-emacs-path              "~/.emacs.d/" "my emacs config file path")
(defconst my-emacs-my-lisps-path     (concat my-emacs-path "my-lisp/") "my lisp package")
(defconst my-emacs-vendor-lisps-path (concat my-emacs-path "site-lisp/") "the vendor lisp package")
(defconst my-emacs-settings-path     (concat my-emacs-path "setting/") "my self emacs setting")
(defconst my-emacs-templates-path    (concat my-emacs-path "templates/") "my templates")

;; add all subdir of 'my-emacs-path' to 'load-path'
(load (concat my-emacs-my-lisps-path "my-subdirs"))
(my-add-subdirs-to-load-path my-emacs-vendor-lisps-path)
(my-add-subdirs-to-load-path my-emacs-my-lisps-path)
(my-add-subdirs-to-load-path my-emacs-settings-path)


;; 设置默认工作目录
;; (setq default-directory "~/work/")

;; user information
(require 'user-info-settings)

;; eval-after-load
;; http://emacser.com/eval-after-load.htm
(require 'eval-after-load)

;; ahei-misc for some common function
(require 'ahei-misc)

;; util
(require 'util)

;; ido
(require 'ido-settings)

;; uniquify
(require 'uniquify-settings)

;; generic copy
(require 'generic-copy)

;; org
(require 'org-settings)

;; alpha-window
(require 'alpha-window-settings)

;; global settings
(require 'global-settings)

;; goto line
(global-set-key [(control c) (control g)] 'goto-line)

;; un comment
(global-set-key (kbd "C-x M-;") 'uncomment-region)

;; hide region
;; (require 'hide-region)
;; (setq hide-region-before-string "+[...")
;; (setq hide-region-after-string "]\n")
;; (global-set-key (kbd "C-x M-r") 'hide-region-hide)
;; (global-set-key (kbd "C-x M-R") 'hide-region-unhide)

;; hide lines
;; (require 'hide-lines)

;; 启用以下功能
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; 括号自动完成
(setq skeleton-pair t)
(local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
;(local-set-key (kbd "<") 'skeleton-pair-insert-maybe)

(defun visit-.emacs ()
  "visit .emacs file"
  (interactive)
  (find-file (concat "~/" ".emacs")))
(global-set-key (kbd "C-x E") 'visit-.emacs)

(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;;------------------------------------------------------------------------------
;; artist-mode
;;------------------------------------------------------------------------------
(autoload 'artist-mode "artist" "Enter artist-mode" t)

;; browse kill ring setting.
(require 'browse-kill-ring-settings)

;; yasnippet
(load "yasnippet-settings")

;; auto complete
(load "auto-complete-settings")

;; templates
(require 'template-settings)

;; auto inster 
(require 'auto-insert-settings)

;; cedet 
(load "cedet-settings")

;; ECB
(require 'ecb-settings)

;; c/cpp settings
(require 'c-settings)

;; doxymacs
(require 'doxymacs-settings)

;; git-emacs settings
(require 'git-emacs-settings)

;; grep settings
(require 'grep-settings)

;;------------------------------------------------------------------------------
;; CMake
;;------------------------------------------------------------------------------
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
                auto-mode-alist))

;; SQL for MySQL
(load "sql-settings")

;; font settings
(load "font-settings")

;; color theme
(load "color-theme-settings")

(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;; maxframe
;; (require 'maxframe-setings)

