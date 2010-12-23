;;;
;;; ȫ��ͨ������
;;;

;; �﷨����
(global-font-lock-mode t)

;; keyword-face use bold
(set-face-bold-p 'font-lock-keyword-face t)

;; comment-face
(set-face-italic-p 'font-lock-comment-face t)

;; �� y/n���� yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; ��ʾ�к�
(column-number-mode t)

;; always show line numbers
(global-linum-mode 1) 

;;; ��ʾ����ƥ��
(show-paren-mode t)

;;; ��ʾʱ�䣬��ʽ����
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; ֧���м�ճ��
(setq mouse-yank-at-point t)

;; ֧�� emacs ���ⲿ�����ճ��
(setq x-select-enable-clipboard t)

;; ����Ĭ�ϴ��ڷָ�Ϊ��ֱ�ָ�
(setq split-width-threshold 1)

;; ���� Tab ���Ϊ 4
(setq default-tab-width 4)

;; ֧��ͼƬ
(auto-image-file-mode t)

;; stop creating those backup~ files 
(setq make-backup-files nil)

;; stop creating those #autosave# files 
(setq auto-save-default nil)

;; ���emacs shell ����
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
(kill-this-buffer);�ر�customize����

;; ȥ���Ǹ����Ĺ�����
(tool-bar-mode nil)

(global-set-key [f11] 'my-fullscreen)

;; ȫ��
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)

;; ���
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
)
;; ����ʱ���
(my-maximized)

;; �½�һ�У����ܹ������
(defun zl-newline nil
"open new line belowe current line"
    (interactive)
    (end-of-line)
    (newline)
)

;;; �� Shift + �س� Ϊ�½�һ��(���֮��)
(global-set-key [S-return] 'zl-newline)

;;; ���������½�һ�У����ܹ������
(defun zl-newline-up nil
"open new line up current line"
    (interactive)
    (beginning-of-line)
    (newline)
    (backward-char)
)

;;; �� Ctrl + Shift + �س���Ϊ�½�һ��(��ǰ���֮��)
(global-set-key [C-S-return] 'zl-newline-up)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode t)

;; ;;; ��������
;; (setq w32-charset-info-alist
;;     (cons '("gbk" w32-charset-gb2312 . 936) w32-charset-info-alist))

;; (setq default-frame-alist
;;       (append
;;        '((font . "fontset-gbk")) default-frame-alist))

;; (create-fontset-from-fontset-spec
;;  (concat
;;   "-outline-Courier New-normal-r-normal-normal-13-97-96-96-c-*-fontset-gbk,"
;;   "chinese-gb2312:-outline-������-normal-r-normal-*-14-*-96-96-c-*-iso10646-1,"
;;   "mule-unicode-0100-24ff:-*-������-normal-r-*-*-14-*-96-96-c-*-iso10646-1,"
;;   "chinese-cns11643-5:-*-������-normal-r-normal-*-14-*-96-96-c-*-iso10646-1,"
;;   "chinese-cns11643-6:-*-������-normal-r-normal-*-14-*-96-96-c-*-iso10646-1,"
;;   "chinese-cns11643-7:-*-������-normal-r-normal-*-14-*-96-96-c-*-iso10646-1"))
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
;;           "-*-NSimSun-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend) ;;�����������ַ���
;;           ;;"-*-NSimSun-*-*-*-*-12-*-*-*-*-*-iso10646-1" nil 'prepend) ;;�����������ַ���
;;          (set-fontset-font
;;           "fontset-myfont" 'kana
;;           "-*-NSimSun-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)
;;          (set-fontset-font
;;           "fontset-myfont" 'han
;;           "-*-NSimSun-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)
;;          (set-fontset-font
;;           "fontset-myfont" 'cjk-misc
;;           "-*-NSimSun-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)

;;          ;; ��������unicode-bmp����Ϊ���ĺ͵����еı����ַ������ڸ��ַ�����
;; ;         (set-fontset-font
;; ;          "fontset-myfont" 'unicode-bmp
;; ;          "-*-NSimSun-*-*-*-*-12-*-*-*-*-*-iso10646-1" nil 'prepend)
;;          (set-fontset-font
;;           "fontset-myfont" 'symbol
;;           "-*-NSimSun-*-*-*-*-*-*-*-*-*-*-iso10646-1" nil 'prepend)
;;          )))

;; ;; ������

;; (set-default-font "fontset-myfont")

;; (add-to-list 'after-make-frame-functions
;; (lambda (new-frame) (select-frame new-frame) (set-default-font "fontset-myfont")))


;; windows �������
;; (defun w32-restore-frame()
;; "Restore a minimized frame"
;; (interactive)
;; (w32-send-sys-command 61728))

;; (defun w32-maximize-frame()
;; "Maximize the current frame"
;; (interactive)
;; (w32-send-sys-command 61488))

;; (w32-maximize-frame)

;; ����ر��˹����������������³���һ����϶����ʱ����ע���������ϣ�
;; [HKEY_LOCAL_MACHINE/SOFTWARE/GNU/EMACS] "EMACS.Toolbar"="0"
;; �����


;;; ���(color-theme)����
;; (add-to-list 'load-path "~/site-lisp/color-theme-6.6.0")
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (color-theme-gnome2)))

;; lisp load path
(add-to-list 'load-path "/usr/share/emacs/23.1/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

