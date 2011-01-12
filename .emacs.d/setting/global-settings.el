;;;
;;; 全局通用设置
;;;

;; without bool-bar
(if (eq system-type 'gnu/linux)
    (tool-bar-mode nil))

;; without menu-bar
;(menu-bar-mode nil)

;; without scroll-bar
(set-scroll-bar-mode nil)

;; show line number
(global-linum-mode t)

;; show col number
(column-number-mode t)

;; buffer title
(setq frame-title-format "HuHoo@%b");

;; stop creating those backup~ files 
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil) 

;; none auto-save
(setq auto-save-mode nil)

;; none bell
(setq ring-bell-function 'ignore)

;; none startup-message
(setq inhibit-startup-message t)

;; 禁止在草稿缓存里面显示处始化信息
(setq initial-scratch-message nil)

;; 支持中键粘贴
(setq mouse-yank-at-point t)

;; 允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;; 自动扫描函数名
(setq imenu-auto-rescan 1)

;; 在状态条上显示当前光标在哪个函数体内部
(which-function-mode t)

;; 当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)

;; 只要一操作鼠标自动闪开
(mouse-avoidance-mode "banish")

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
(setq void-text-area-pointer nil)

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

;; use space to table
(setq-default indent-tabs-mode nil)

;; default table width
(setq default-tab-width 4)

;; 显示时间，格式如下
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; 设置默认窗口分割为垂直分割
(setq split-width-threshold 1)

;; 支持图片
(auto-image-file-mode t)

;; 解决emacs shell 乱码
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
(kill-this-buffer);关闭customize窗口

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

(provide 'global-settings)


