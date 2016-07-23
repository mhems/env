;; all things related to view

(let ((default-directory  "~/.emacs.d/elpa/"))
    (normal-top-level-add-subdirs-to-load-path))

(require 'whitespace) ; for visualizing whitespace
(require 'highlight-chars) ; for highlighting whitespace and char. groups
(require 'rainbow-delimiters) ; color parens at different levels
(require 'rfringe) ; right fringe
(require 'diminish) ; for diminishing modeline
(require 'color-theme) ; face themes
(require 'anzu) ; show match stats in modeline
(require 'wc-mode) ; word count in modeline
(require 'hide-comnt) ; for hiding comments

(setq-default tab-width 4
              indent-tabs-mode nil)

(global-linum-mode) ; line numbers
(global-anzu-mode 1) ; show match stats in modeline
(electric-pair-mode 1) ; auto-insert closing paren pairs
(tool-bar-mode -1) ; no toolbar
(menu-bar-mode -1) ; no menu
(global-font-lock-mode 1) ; always syntax highlight
(show-paren-mode 1) ; highlight matching pair's contents
(line-number-mode 1) ; show line number in modeline
(column-number-mode 1) ; show column number in modeline
(global-whitespace-mode 1) ; show whitespace

(setq whitespace-style '(face lines-tail space-before-tab))
(setq whitespace-line-column 80)

; do not clutter mode line
(diminish 'anzu-mode)
(diminish 'auto-complete-mode)
(diminish 'doc-mode)
(diminish 'abbrev-mode)

(set-mouse-color "black")
(setq x-stretch-cursor 1) ; stretch cursor to char width (visual tabs)
(setq require-final-newline 1)
; no startup stuff
(setq inhibit-splash-screen 1
      inhibit-startup-message 1)
(setq show-paren-style 'expression
      show-parens-style 'expression)
; empty *scratch* buffer
(setq initial-scratch-message nil)
(setq initial-major-mode 'fundamental-mode)
; highlight search/replace results
(setq search-highlight 1
      query-replace-highlight 1
      mouse-sel-retain-highlight 1)

(add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)

(provide 'view)
