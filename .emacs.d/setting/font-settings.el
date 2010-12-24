
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
