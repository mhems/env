
(require 'cl)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(defalias 'qrr 'query-replace-regexp)
(set-mouse-color "black")

(global-font-lock-mode 1)
(show-paren-mode 1)
(setq show-paren-style 'expression)
