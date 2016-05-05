;; cedet customization

;; (load-file "~/.emacs.d/elisp/cedet-1.1/common/cedet.el")

(semantic-mode 1)

(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-local-symbol-highlight-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode1)
;; (global-semantic-tag-folding-mode 1)

;; (global-srecode-minor-mode 1) ; templates in ~/.srecode
;; (require 'semantic/bovine/gcc)
;; (require 'cedet-java)
;; (require 'semantic/db-javap)

(provide 'cedet-wrapper)
