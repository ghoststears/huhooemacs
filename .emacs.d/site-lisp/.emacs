
;; 设置默认工作目录
(setq default-directory "~/work/vgame/srv/vgame/res/entities/")
;;;
;; table 设置
;;






(prefer-coding-system 'cn-gb-2312)
(set-keyboard-coding-system 'cn-gb-2312)
(set-selection-coding-system 'cn-gb-2312)
(set-terminal-coding-system 'cn-gb-2312)
(set-buffer-file-coding-system 'gb2312)
(setq default-buffer-file-coding-system 'gb2312)
(setq locale-coding-system 'gb2312)
(set-language-environment-coding-systems 'Chinese-GB18030)
(global-font-lock-mode t)
(auto-image-file-mode t)
(pc-selection-mode t)



;;; Python
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
                                   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(add-hook 'python-mode-hook
		  (lambda ()
			(set-variable 'py-indent-offset 4)
			(setq indent-tabs-mode t)
			(setq tab-width (default-value 'tab-width))
			)
		  )

