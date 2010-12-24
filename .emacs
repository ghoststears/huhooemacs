(add-to-list 'load-path "~/.emacs.d/site-lisp/")
(add-to-list 'load-path "~/.emacs.d/setting/")

;; 设置默认工作目录
(setq default-directory "~/work/")

;; ido
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers (or Gnus mail buffers)

;; 去掉工具栏
(tool-bar-mode nil)

;; 去掉菜单栏
;(menu-bar-mode nil)

;; 去掉滚动条
(set-scroll-bar-mode nil)

;; 显示行号
(global-linum-mode t)

;; 显示列号
(column-number-mode t)

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

;; goto line
(global-set-key [(control c) (control g)] 'goto-line)

;; un comment
(global-set-key (kbd "C-x M-;") 'uncomment-region)

;; hide region
(require 'hide-region)
(setq hide-region-before-string "+[...")
(setq hide-region-after-string "]\n")
(global-set-key (kbd "C-x M-r") 'hide-region-hide)
(global-set-key (kbd "C-x M-R") 'hide-region-unhide)

;; hide lines
(require 'hide-lines)

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

;;-----------------------------------------------------------------------------
;; table setting.
;;-----------------------------------------------------------------------------

;; 默认不用空格替代TAB
(setq-default indent-tabs-mode nil)

;; 设置TAB默认的宽度
(setq default-tab-width 4)

;; 设置用空格替代TAB的模式
;; (dolist (hook (list
;;                'emacs-lisp-mode-hook
;;                'lisp-mode-hook
;;                'lisp-interaction-mode-hook
;;                'scheme-mode-hook
;;                'c-mode-hook
;;                'c++-mode-hook
;;                'java-mode-hook
;;                'haskell-mode-hook
;;                'asm-mode-hook
;;                'emms-tag-editor-mode-hook
;;                'sh-mode-hook
;;                ))
;;   (add-hook hook '(lambda () (setq indent-tabs-mode nil))))
;;-----------------------------------------------------------------------------
;; table setting.
;;-----------------------------------------------------------------------------


;;-----------------------------------------------------------------------------
;; browse kill ring setting.
;;-----------------------------------------------------------------------------
(require 'browse-kill-ring)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

(browse-kill-ring-default-keybindings)
(setq browse-kill-ring-maximum-display-length nil)
(setq browse-kill-ring-highlight-current-entry t)
(setq browse-kill-ring-separator "---------")
(setq browse-kill-ring-display-duplicates nil)
(add-hook 'browse-kill-ring-hook 'browse-kill-ring-keys)
(defun browse-kill-ring-keys ()
  (define-key browse-kill-ring-mode-map (kbd "RET") 'browse-kill-ring-insert-and-quit-rdonly)
  (define-key browse-kill-ring-mode-map "<" 'beginning-of-buffer)
  (define-key browse-kill-ring-mode-map ">" 'end-of-buffer)
  (define-key browse-kill-ring-mode-map "j" 'next-line)
  (define-key browse-kill-ring-mode-map "k" 'previous-line)
  (define-key browse-kill-ring-mode-map "h" 'backward-char)
  (define-key browse-kill-ring-mode-map "l" 'forward-char)
  (define-key browse-kill-ring-mode-map (kbd "SPC") 'scroll-up)
  (define-key browse-kill-ring-mode-map (kbd "U") 'scroll-down)
  (define-key browse-kill-ring-mode-map "u" 'View-scroll-half-page-backward)
  (define-key browse-kill-ring-mode-map "o" 'other-window)
  )
;;-----------------------------------------------------------------------------
;; browse kill ring setting end.
;;-----------------------------------------------------------------------------

;; auto complete
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/site-lisp/yasnippet-0.6.1c")
(require 'yasnippet) 
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/yasnippet-0.6.1c/snippets")


(load-file "~/.emacs.d/site-lisp/cedet-1.0/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu


;;------------------------------------------------------------------------------
;; ECB
;;------------------------------------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/site-lisp/ecb-2.40/")
;(load-file "/path/to/ecb/ecb.el")
(require 'ecb-autoloads)

;; (add-hook 'ecb-deactivate-hook
;;       (lambda () (modify-all-frames-parameters '((width . 80)))))
;; ;; resize the ECB window to be default (order matters here)
;; (add-hook 'ecb-activate-hook (lambda () (ecb-redraw-layout)))
;; (add-hook 'ecb-activate-hook
;; 	  (lambda () (modify-all-frames-parameters '((width . 120)))))

;;------------------------------------------------------------------------------
;; CMake
;;------------------------------------------------------------------------------
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
                auto-mode-alist))
;;------------------------------------------------------------------------------
;; MySQL
;;------------------------------------------------------------------------------
(require 'mysql)
(setq sql-mysql-options '("-C" "-t" "-f" "-n"))


;;------------------------------------------------------------------------------
;; 字体设置
;; 
;; 英文字体使用 consolas, 中文字体使用 微软雅黑(msyh).
;;------------------------------------------------------------------------------

(cond 
      ((string-match "^GNU Emacs 23" (emacs-version))
       (let* ()
         (create-fontset-from-fontset-spec
          "-*-Consolas-normal-r-*-*-12-*-*-*-*-*-fontset-myfont")

         (set-fontset-font
          "fontset-default" nil
          "-*-msyh-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend) ;;所有其他的字符集

         (set-fontset-font
          "fontset-myfont" 'kana
          "-*-msyh-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)

         (set-fontset-font
          "fontset-myfont" 'han
          "-*-msyh-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)

         (set-fontset-font
          "fontset-myfont" 'cjk-misc
          "-*-msyh-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)

         (set-fontset-font
          "fontset-myfont" 'symbol
          "-*-msyh-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)
         )))

(set-default-font "fontset-myfont")

(add-to-list 'after-make-frame-functions
             (lambda (new-frame) (select-frame new-frame) (set-default-font "fontset-myfont")))
;;------------------------------------------------------------------------------
;; end of font setting
;;------------------------------------------------------------------------------

;; color theme
(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-arjen)))
(color-theme-dark-blue)
;(color-theme-gnome2)

;;-----------------------------------------------------------------------------
;; windows 启动最大化
;;-----------------------------------------------------------------------------

(global-set-key [f11] 'my-fullscreen)

;; 全屏
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)
;最大化
(defun my-maximized-horz ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(defun my-maximized-vert ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
;; ;; 最大化
;; (defun my-maximized ()
;;   (interactive)
;;   (x-send-client-message
;;    nil 0 nil "_NET_WM_STATE" 32
;;    '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
;;   (x-send-client-message
;;    nil 0 nil "_NET_WM_STATE" 32
;;    '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
;; )
;; 启动时最大化
(my-maximized)

;; (defun w32-restore-frame()
;; "Restore a minimized frame"
;; (interactive)
;; (w32-send-sys-command 61728))

;; (defun w32-maximize-frame()
;; "Maximize the current frame"
;; (interactive)
;; (w32-send-sys-command 61488))

;; (w32-maximize-frame)

;; 如果关闭了工具条，则会在最底下出现一条空隙，这时，在注册表里面加上：
;; [HKEY_LOCAL_MACHINE/SOFTWARE/GNU/EMACS] "EMACS.Toolbar"="0"
;; 来解决

;;-----------------------------------------------------------------------------
;; windows 启动最大化
;;-----------------------------------------------------------------------------
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("left8" (0.18781725888324874 . 0.2807017543859649) (0.18781725888324874 . 0.24561403508771928) (0.18781725888324874 . 0.2807017543859649) (0.18781725888324874 . 0.17543859649122806)))))
 '(ecb-options-version "2.40"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )