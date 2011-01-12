;;;
;;; ȫ��ͨ������
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

;; ��ֹ�ڲݸ建��������ʾ��ʼ����Ϣ
(setq initial-scratch-message nil)

;; ֧���м�ճ��
(setq mouse-yank-at-point t)

;; ����emacs���ⲿ���������ճ��
(setq x-select-enable-clipboard t)

;; �Զ�ɨ�躯����
(setq imenu-auto-rescan 1)

;; ��״̬������ʾ��ǰ������ĸ��������ڲ�
(which-function-mode t)

;; ���������β�����ƶ���ʱ��ʼ�ձ�������β��
(setq track-eol t)

;; ֻҪһ��������Զ�����
(mouse-avoidance-mode "banish")

;; ����� TAB �ַ��ϻ���ʾΪһ���󷽿�
(setq x-stretch-cursor t)

;; ��ѡ�е����������ʾ 
(setq-default transient-mark-mode t)

;; ��Ǹ���
(transient-mark-mode 1)

;; �﷨����
(global-font-lock-mode t)

;; keyword-face use bold
(set-face-bold-p 'font-lock-keyword-face t)

;; comment-face
(set-face-italic-p 'font-lock-comment-face t)

;; �趨�Զ�������ע�ͷ��
(setq-default comment-style 'indent)

;; ��β�Զ�����һ������
(setq require-final-newline t)

;; ��y��n������yes��no��
(fset 'yes-or-no-p 'y-or-n-p)

;; ��ѹ���ļ�ʱ�Զ���ѹ��
(auto-compression-mode 1)

;; ��ʾ����ƥ��
(show-paren-mode t)

;; ����ƥ����ʾ�����Ƿ��˵�������һ�����š�
(setq show-paren-style 'parentheses)

;; ������������ʱ����ʾƥ���������
(setq blink-matching-paren nil)

;; ����Ĭ�ϵ���ģʽΪTEXTģʽ
(setq default-major-mode 'text-mode)

;; �Զ�����buffer
(setq auto-revert-mode 1)

;; lisp���ִ�����
(setq max-lisp-eval-depth 40000)

;; �������
(setq max-specpdl-size 10000)

;; ��һ���ܴ�� kill ring. ������ֹ�Ҳ�С��ɾ����Ҫ�Ķ���
(setq kill-ring-max 1024)

;; ��������
(setq undo-outer-limit 1024000)

;; ��ʾ�ַ����еĻ��з�Ϊ \n
(setq print-escape-newlines t)

;; ����message��¼ȫ����Ϣ, �����ý�ȥ
(setq message-log-max t)

;; ���� �����ַ� �Ļ���
(setq read-quoted-char-radix 16)

;; ��ֹ��ʾ���ָ��
(setq void-text-area-pointer nil)

;; minibuffer �ݹ��������
(setq enable-recursive-minibuffers t)

;; ����ִ�б��ʽ�ĳ���û������
(setq eval-expression-print-length nil)

;; ����ִ�б��ʽ�����û������
(setq eval-expression-print-level nil)

;; ��������ȫ�ֱ������
(setq global-mark-ring-max 1024)

;; ɾ��minibuffer���ظ���ʷ
(setq history-delete-duplicates t)

;; ������խ����
(put 'narrow-to-region 'disabled nil)

;; use space to table
(setq-default indent-tabs-mode nil)

;; default table width
(setq default-tab-width 4)

;; ��ʾʱ�䣬��ʽ����
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; ����Ĭ�ϴ��ڷָ�Ϊ��ֱ�ָ�
(setq split-width-threshold 1)

;; ֧��ͼƬ
(auto-image-file-mode t)

;; ���emacs shell ����
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
(kill-this-buffer);�ر�customize����

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

(provide 'global-settings)


