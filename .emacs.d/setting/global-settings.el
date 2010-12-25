;;;
;;; 全局通用设置
;;;

;; 语法高亮
(global-font-lock-mode t)

;; keyword-face use bold
(set-face-bold-p 'font-lock-keyword-face t)

;; comment-face
(set-face-italic-p 'font-lock-comment-face t)

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示列号
(column-number-mode t)

;; always show line numbers
(global-linum-mode 1) 

;;; 显示括号匹配
(show-paren-mode t)

;;; 显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; 支持中键粘贴
(setq mouse-yank-at-point t)

;; 支持 emacs 和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; 设置默认窗口分割为垂直分割
(setq split-width-threshold 1)

;; 设置 Tab 宽度为 4
(setq default-tab-width 4)

;; 支持图片
(auto-image-file-mode t)

;; stop creating those backup~ files 
(setq make-backup-files nil)

;; stop creating those #autosave# files 
(setq auto-save-default nil)

;; 解决emacs shell 乱码
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
(kill-this-buffer);关闭customize窗口

;; 去掉那个大大的工具栏
(tool-bar-mode nil)

(global-set-key [f11] 'my-fullscreen)

;; 全屏
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

;; 最大化
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)
;; 启动时最大化
(my-maximized)

;; 新建一行，不管光标在哪
(defun zl-newline nil
"open new line belowe current line"
    (interactive)
    (end-of-line)
    (newline)
)

;;; 绑定 Shift + 回车 为新建一行(光标之下)
(global-set-key [S-return] 'zl-newline)

;;; 本行上面新建一行，不管光标在哪
(defun zl-newline-up nil
"open new line up current line"
    (interactive)
    (beginning-of-line)
    (newline)
    (backward-char)
)

;;; 绑定 Ctrl + Shift + 回车，为新建一行(当前光标之上)
(global-set-key [C-S-return] 'zl-newline-up)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode t)

;; ;;; 设置字体
;; (setq w32-charset-info-alist
;;     (cons '("gbk" w32-charset-gb2312 . 936) w32-charset-info-alist))

;; (setq default-frame-alist
;;       (append
;;        '((font . "fontset-gbk")) default-frame-alist))

;; (create-fontset-from-fontset-spec
;;  (concat
;;   "-outline-Courier New-normal-r-normal-normal-13-97-96-96-c-*-fontset-gbk,"
;;   "chinese-gb2312:-outline-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1,"
;;   "mule-unicode-0100-24ff:-*-新宋体-normal-r-*-*-14-*-96-96-c-*-iso10646-1,"
;;   "chinese-cns11643-5:-*-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1,"
;;   "chinese-cns11643-6:-*-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1,"
;;   "chinese-cns11643-7:-*-新宋体-normal-r-normal-*-14-*-96-96-c-*-iso10646-1"))
;; (set-default-font "fontset-gbk")

(prefer-coding-system 'utf-8)

;(setq w32-get-true-file-attributes nil)
;; (cond ((string-match "^GNU Emacs 22" (emacs-version))
;;        (let* ()
;;          (create-fontset-from-fontset-spec
;;           "-outline-Courier New-normal-r-*-*-12-*-*-*-*-*-fontset-myfont,
;;            chinese-iso-8bit:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1,
;;            chinese-gb2312:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1,
;;            chinese-big5-1:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1,
;;            chinese-big5-2:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1,
;;            chinese-cns11643-5:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1,
;;            chinese-cns11643-6:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1,
;;            chinese-cns11643-7:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1, 
;;            japanese-jisx0208-1978:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1, 
;;            japanese-jisx0208:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1, 
;;            japanese-jisx0212:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1, 
;;            japanese-jisx0213-1:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1, 
;;            japanese-jisx0213-2:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1, 
;;            korean-ksc5601:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1, 
;;            mule-unicode-0100-24ff:-*-simsun-*-r-normal-*-12-*-*-*-*-*-iso10646-1")))

;;        ((string-match "^GNU Emacs 23" (emacs-version))
;;        (let* ()
;;          (create-fontset-from-fontset-spec
;;           "-*-Consolas-normal-r-*-*-14-*-*-*-*-*-fontset-myfont")
;;          (set-fontset-font
;;           "fontset-default" nil
;;           "-*-NSimSun-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend) ;;所有其他的字符集
;;           ;;"-*-NSimSun-*-*-*-*-12-*-*-*-*-*-iso10646-1" nil 'prepend) ;;所有其他的字符集
;;          (set-fontset-font
;;           "fontset-myfont" 'kana
;;           "-*-NSimSun-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)
;;          (set-fontset-font
;;           "fontset-myfont" 'han
;;           "-*-NSimSun-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)
;;          (set-fontset-font
;;           "fontset-myfont" 'cjk-misc
;;           "-*-NSimSun-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)

;;          ;; 不能设置unicode-bmp，因为中文和德文中的变音字符都属于该字符集。
;; ;         (set-fontset-font
;; ;          "fontset-myfont" 'unicode-bmp
;; ;          "-*-NSimSun-*-*-*-*-12-*-*-*-*-*-iso10646-1" nil 'prepend)
;;          (set-fontset-font
;;           "fontset-myfont" 'symbol
;;           "-*-NSimSun-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)
;;          )))

;; ;; 新宋体

;; (set-default-font "fontset-myfont")

;; (add-to-list 'after-make-frame-functions
;; (lambda (new-frame) (select-frame new-frame) (set-default-font "fontset-myfont")))


;; windows 启动最大化
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


;;; 外观(color-theme)设置
;; (add-to-list 'load-path "~/site-lisp/color-theme-6.6.0")
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-gnome2)))

;; lisp load path
(add-to-list 'load-path "/usr/share/emacs/23.1/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

