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

(require 'util)

;; ido
(require 'ido-settings)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers (or Gnus mail buffers)

;; generic copy
(require 'generic-copy)

;; org
(require 'org-settings)

;; alpha-window
(require 'alpha-window-settings)

;; 去掉工具栏
(if (eq system-type 'gnu/linux)
    (tool-bar-mode nil))

;; 去掉菜单栏
;(menu-bar-mode nil)

;; 去掉滚动条
(set-scroll-bar-mode nil)

;; 显示行号
(global-linum-mode t)

;; 显示列号
(column-number-mode t)

;; buffer title
(setq frame-title-format "HuHoo@%b");

;; 不产生备份文件
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil) 

;; 自动保存
(setq auto-save-mode nil)

;; 关闭烦人的出错时的提示声
(setq ring-bell-function 'ignore)

;; 关闭起动时闪屏
(setq inhibit-startup-message t)

;; 禁止在草稿缓存里面显示处始化信息
(setq initial-scratch-message nil)

;; 允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;; 粘贴于光标处,而不是鼠标指针处
(setq mouse-yank-at-point t)

;; 自动扫描函数名
(setq imenu-auto-rescan 1)

;; 在状态条上显示当前光标在哪个函数体内部
(which-function-mode t)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;; 只要一操作鼠标自动闪开
;(mouse-avoidance-mode "banish")

;; 光标在 TAB 字符上会显示为一个大方块
(setq x-stretch-cursor t)

;; 让选中的区域高亮显示 
(setq-default transient-mark-mode t)

;; 标记高亮
(transient-mark-mode 1)

;; 语法高亮
(global-font-lock-mode t)

;; keyword-face use bold
(set-face-bold-p 'font-lock-keyword-face t)

;; comment-face
(set-face-italic-p 'font-lock-comment-face t)

;; 设定自动缩进的注释风格
(setq-default comment-style 'indent)

;; 行尾自动加上一个新行
(setq require-final-newline t)

;; 用y和n来代替yes和no。
(fset 'yes-or-no-p 'y-or-n-p)

;; 打开压缩文件时自动解压缩
(auto-compression-mode 1)

;; 显示括号匹配
(show-paren-mode t)

;; 括号匹配显示但不是烦人的跳到另一个括号。
(setq show-paren-style 'parentheses)

;; 当插入右括号时不显示匹配的左括号
(setq blink-matching-paren nil)

;; 设置默认地主模式为TEXT模式
(setq default-major-mode 'text-mode)

;; 自动更新buffer
(setq auto-revert-mode 1)

;; lisp最大执行深度
(setq max-lisp-eval-depth 40000)

;; 最大容量
(setq max-specpdl-size 10000)

;; 用一个很大的 kill ring. 这样防止我不小心删掉重要的东西
(setq kill-ring-max 1024)

;; 撤销限制
(setq undo-outer-limit 1024000)

;; 显示字符窗中的换行符为 \n
(setq print-escape-newlines t)

;; 设置message记录全部消息, 而不用截去
(setq message-log-max t)

;; 设置 引用字符 的基数
(setq read-quoted-char-radix 16)

;; 禁止显示鼠标指针
;(setq void-text-area-pointer nil)

;; minibuffer 递归调用命令
(setq enable-recursive-minibuffers t)

;; 设置执行表达式的长度没有限制
(setq eval-expression-print-length nil)

;; 设置执行表达式的深度没有限制
(setq eval-expression-print-level nil)

;; 设置最大的全局标记容量
(setq global-mark-ring-max 1024)

;; 删除minibuffer的重复历史
(setq history-delete-duplicates t)

;; 开启变窄区域
(put 'narrow-to-region 'disabled nil)

(setq mouse-yank-at-point t)

;; use space to table
(setq-default indent-tabs-mode nil)

;; default table width
(setq default-tab-width 4)

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

