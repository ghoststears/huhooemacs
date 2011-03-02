;;; -*- Mode: Lisp -*-

;;; lispworks.lisp --
;;; LispWorks ILISP initializations.
;;;
;;; Independently written by:
;;;
;;; Jason Trenouth: jason@harlequin.co.uk
;;; Qiegang Long: qlong@cs.umass.edu
;;;
;;; and later merged together by Jason.
;;;
;;; This file is part of ILISP.
;;; Please refer to the file COPYING for copyrights and licensing
;;; information.
;;; Please refer to the file ACKNOWLEGDEMENTS for an (incomplete) list
;;; of present and past contributors.
;;;
;;; $Id: lispworks.lisp,v 1.6 2002/01/24 19:54:14 anisotropy9 Exp $

(in-package "ILISP")

;; Make LispWorks interactive
#+Unix
(setf system::*force-top-level* t)


;;; ilisp-eval --
;;;
;;; Notes:
;;;
;;; 19990806 Unknown Author (blame Marco Antoniotti for this)

(defun ilisp-eval (form package filename)
  "Evaluate FORM in PACKAGE recording FILENAME as the source file."
  (let ((*package* (ilisp-find-package package))
 	#+LispWorks3 (compiler::*input-pathname* (merge-pathnames filename))
 	#+LispWorks3 (compiler::*warn-on-non-top-level-defun* nil)
 	)
    #+LispWorks3
    (eval (read-from-string form))
    #+LispWorks4
    (dspec:at-location ((or (probe-file filename) (merge-pathnames filename)))
		       (eval (read-from-string form)))))
 
 
;;; ilisp-trace --
;;;
;;; Notes:
;;;
;;; 19990806 Unknown Author (blame Marco Antoniotti for this)

(defun ilisp-trace (symbol package breakp)
  "Trace SYMBOL in PACKAGE."
  (declare (ignorable breakp))
  (ilisp-errors
   (let ((real-symbol (ilisp-find-symbol symbol package)))
     (when real-symbol (eval `(trace (,real-symbol :break ,breakp)))))))

 
(defun ilisp-callers (symbol package)
  "Print a list of all of the functions that call FUNCTION.
Returns T if successful."
  (ilisp-errors
      (let ((function-name (ilisp-find-symbol symbol package))
	    (*print-level* nil)
	    (*print-length* nil)
	    (*package* (find-package 'lisp))
	    (callers ())
	    )
	(when (and function-name (fboundp function-name))
	  (setf callers (munge-who-calls
			 #+(or :lispworks3 :lispworks4) (hcl:who-calls function-name)
			 #-(or :lispworks3 :lispworks4) (lw:who-calls function-name)
			 ))
	  (dolist (caller callers)
	    (print caller))
	  t))))
	  
;; gross hack to munge who-calls output for ILISP
(defun munge-who-calls (who-calls)
  (labels ((top-level-caller (form)
	     (if (atom form)
		 form
		 (top-level-caller (second form)))))
    (delete-if-not 'symbolp
		   (delete-duplicates (mapcar #'top-level-caller who-calls)))))


;; Jason 6 SEP 94 -- tabularized Qiegang's code
;;
;; There are some problems lurking here:
;;   - the mapping ought to be done by LispWorks
;;   - surely you really want just three source types:
;;     function, type, and variable
;;
(defconstant *source-type-translations*
  '(
    ("class"     defclass)
    ("function"  )
    ("macro"     )
    ("structure" defstruct)
    ("setf"      defsetf)
    ("type"      deftype)
    ("variable"  defvar defparameter defconstant)
    ))


(defun translate-source-type-to-dspec (symbol type)
  (let ((entry (find type *source-type-translations*
		     :key 'first :test 'equal)))
    (if entry
	(let ((wrappers (rest entry)))
	  (if wrappers
	      (loop for wrap in wrappers collecting `(,wrap ,symbol))
	      `(,symbol)))
	(error "unknown source type for ~S requested from ILISP: ~S"
	       symbol type))))


(defun ilisp-source-files (symbol package type)
  "Print each file for PACKAGE:SYMBOL's TYPE definition on a line.
Returns T if successful."
  ;; A function to limit the search with type?
  (ilisp-errors
   (let* ((symbol (ilisp-find-symbol symbol package))
	  (all (equal type "any"))
	  ;; Note:
	  ;; 19990806 Marco Antoniotti
	  ;;
	  ;; (paths (when symbol (compiler::find-source-file symbol)))
	  (paths (when symbol (dspec:find-dspec-locations symbol)))
	  (dspecs (or all (translate-source-type-to-dspec symbol type)))
	  (cands ())
	  )
     (if (and paths (not all))
	 (setq cands
	       (loop for path in paths
		     when (find (car path) dspecs :test 'equal)
		     collect path))
       (setq cands paths))
     (if cands
	 (progn
	   (dolist (file (remove-duplicates paths
					    :key #'cdr :test #'equal))
	     (print (truename (cadr file))))
	   t)
	 nil))))

;;; sys::get-top-loop-handler, sys::define-top-loop-handler --
;;;
;;; Notes:
;;;
;;; 19990806 Unknown Author (blame Marco Antoniotti for this)
;;;
;;; 19990806 Marco Antoniotti
;;; I decided to leave these in, although they are a little too system
;;; dependent.  I will remove them if people complain.

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (fboundp 'sys::define-top-loop-handler)

    ;; Duplicated from ccl/top-loop.lisp
    (defmacro sys::get-top-loop-handler (command-name)
      `(get ,command-name 'sys::top-loop-handler))

    (defmacro sys::define-top-loop-handler (name &body body)
      (lw:with-unique-names (top-loop-handler)
        `(let ((,top-loop-handler #'(lambda (sys::line) ,@body)))
          (mapc #'(lambda (name)
                    (setf (sys::get-top-loop-handler name) ,top-loop-handler))
           (if (consp ',name) ',name  '(,name))))))))

(sys::define-top-loop-handler :ilisp-send
  (values (multiple-value-list (eval (cadr sys::line))) nil))


(eval-when (load eval)
  (unless (compiled-function-p #'ilisp-callers)
    (ilisp-message t "File is not compiled, use M-x ilisp-compile-inits")))

;;; end of file -- lispworks.lisp --
