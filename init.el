;; @jr0cket - community developer > http://blog.jr0cket.co.uk/

;; Lightweight clojure setup for Emacs
;; requires emacs24 and leiningen


;; Add Marmalade package archive for Emacs starter kit and other Emacs packages

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") )
(package-initialize)


;; Add Clojure and other supporting packages to the Emacs environment
;; Packages are installed if they are not already present
;; The list includes packages for the starter kit, Clojure and markdown files (used by github)

(when (not package-archive-contents)
 	(package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell starter-kit-bindings
	clojure-mode clojure-test-mode
        rainbow-delimiters
        ac-slime
	markdown-mode
        popup
        undo-tree ))

;;; auto-complete only seems to work as a manual install, however that
;;; manual install relies on popup being available
 

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Useful global settings as Emacs is used predominantely for Clojure development

;; Launch the Clojure repl via Leiningen - M-x clojure-jack-in 
;; Global shortcut definition to fire up clojure repl and connect to it
(global-set-key (kbd "C-c C-j") 'clojure-jack-in)

;; Colour match parens and other structure characters to make code easy to follow
(global-rainbow-delimiters-mode)

;;; Enable undo-tree for everything, so you can M - _ to redo
(global-undo-tree-mode)


;;; Add configuration for the auto-completion package
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

