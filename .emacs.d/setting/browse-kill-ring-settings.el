;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-08 19:00:50 Thursday by ahei>

(require 'browse-kill-ring)
(require 'browse-kill-ring+)

(global-set-key (kbd "C-c k") 'browse-kill-ring)

(browse-kill-ring-default-keybindings)
(setq browse-kill-ring-maximum-display-length nil)
(setq browse-kill-ring-highlight-current-entry t)
(setq browse-kill-ring-separator "--------------------")
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

(provide 'browse-kill-ring-settings)
