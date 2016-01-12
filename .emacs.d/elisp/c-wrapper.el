;; customization for c-like languages

(let ((default-directory  "~/.emacs.d/elpa/"))
    (normal-top-level-add-subdirs-to-load-path))

(require 'cc-mode) ; various c-like modes
(require 'hideif) ; for hiding dead c macros

(setq c-default-style "linux"
      c-basic-offset 4)

(add-hook 'c-mode-hook
          '(lambda ()
             (setq c-tab-always-indent nil)
             (setq c-label-offset 0)
             (setq c-continued-brace-offset 4)
             (setq c-continued-statement-offset 4)))

(provide 'c-wrapper)
