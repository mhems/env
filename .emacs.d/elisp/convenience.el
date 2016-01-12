;; stuff for convenience and efficiency

(let ((default-directory  "~/.emacs.d/elpa/"))
    (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "~/.emacs.d/elisp/")

(require 'paren-wrapper) ; for additional custom auto-pairing
(require 'javadoc-help) ; for looking up javadocs online
(require 'move) ; for moving lines and regions
(require 'dtrt-indent) ; for guessing indentation
(require 'doc-mode) ; for documentation generation
;; (require 'smart-tabs-wrapper) ; context-sensitive tabbing
(require 'evil-nerd-commenter) ; vim-like commenting
(require 'insert-shebang) ; auto-insert shebang
(require 'ruby-end) ; auto-insert 'end' in ruby
(require 'simpleclip) ; interact with clipboard
(require 'auto-complete) ; auto-completion
(require 'auto-complete-config)
(require 'titles) ; for title-fying

(setq indent-line-function 'insert-tab)

(autoload 'cdlatex-mode "cdlatex" "CDLaTeX Mode" t)
(autoload 'turn-on-cdlatex "cdlatex" "CDLaTeX Mode" nil)

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'latex-mode-hook 'turn-on-cdlatex)

(autoload 'markdown-mode "markdown-mode" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; (add-backtick-completion 'markdown-mode 'markdown-mode-map) ; broken

(simpleclip-mode 1) ; interact with clipboard
(dtrt-indent-mode 1) ; guess tab width

(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict/")
(ac-config-default)
;(add-to-list 'ac-sources 'ac-source-gtags)
;(add-to-list 'ac-sources 'ac-source-semantic)

(javadoc-set-predefined-urls '("https://docs.oracle.com/javase/8/docs/api/"))

(add-hook 'after-save-hook 'delete-trailing-whitespace)
(add-hook 'kill-emacs-hook 'whitespace-cleanup)
(add-hook 'c-mode-common-hook 'doc-mode)
(add-hook 'java-mode-hook 'doc-mode)

;; auto insert shebangs for script languages
(add-hook 'python-mode-hook 'insert-shebang)
(add-hook 'ruby-mode-hook 'insert-shebang)
(add-hook 'sh-mode-hook 'insert-shebang)
(add-hook 'perl-mode-hook 'insert-shebang)

(provide 'convenience)
