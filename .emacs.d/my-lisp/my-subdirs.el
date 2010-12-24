;; -*- Emacs-Lisp -*-

;; Time-stamp: <08/27/2009 09:58:37 星期四 by ahei>

(defun my-add-subdirs-to-load-path (dir)
  "把DIR的所有子目录都加到`load-path'里面"
  (interactive)
  (let ((default-directory (concat dir "/")))
    (add-to-list 'load-path dir)
    (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	(normal-top-level-add-subdirs-to-load-path))))
