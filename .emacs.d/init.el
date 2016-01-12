;; top-level emacs customization


;; establish load path
(let ((default-directory  "~/.emacs.d/elpa/"))
    (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/elisp/")

;; establish archives
(require 'package)
(add-to-list 'package-archives '("melpa" .
                                 "http://melpa.org/packages"))
(add-to-list 'package-archives '("gnu" .
                                 "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" .
                                 "http://marmalade-repo.org/packages/"))

;; load my stuff
(require 'macros)
(require 'found)
(require 'keys)
(require 'convenience)
(require 'cedet-wrapper)
(require 'c-wrapper)
(require 'view) ; load this last
