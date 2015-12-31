(add-to-list 'load-path "~/.emacs.d/elisp")

;; IMPORTS
(require 'cl) ; common lisp
(require 'cc-mode) ; various c-like modes
(require 'parenthesis) ; for additional custom auto-pairing
(require 'hide-comnt) ; for hiding comments
(require 'hideif) ; for hiding dead c macros
(require 'javadoc-help) ; for looking up javadocs online
(require 'move) ; for moving lines and regions
(require 'highlight-chars) ; for highlighting whitespace and char. groups
(require 'dtrt-indent) ; for guessing indentation
(require 'titles) ; for title-fying

;; MODES
(dtrt-indent-mode 1) ; guess tab width
(electric-pair-mode 1) ; auto-insert closing paren pairs
(tool-bar-mode -1) ; no toolbar
(menu-bar-mode -1) ; no menu
(global-font-lock-mode 1) ; always syntax highlight
;(global-smart-tab-mode 1) ; TODO
(show-paren-mode 1) ; TODO
(transient-mark-mode 1) ; TODO
(line-number-mode 1) ; show line number in buffer
(column-number-mode 1) ; show column number in buffer

;; VARIABLES

(set-mouse-color "black")
(setq x-stretch-cursor 1) ; stretch cursor to char width (visual tabs)
; no startup stuff
(setq inhibit-splash-screen 1
      inhibit-startup-message 1)
(setq show-paren-style 'expression
      show-parens-style 'expression)
; highlight search/replace results
(setq search-highlight 1
      query-replace-highlight 1
      mouse-sel-retain-highlight 1)
; indentation
(setq c-default-style "linux"
      c-basic-offset 4)
(setq-default indent-tabs-mode nil
              tab-width 4)
(setq indent-line-function 'insert-tab)

(javadoc-set-predefined-urls '("https://docs.oracle.com/javase/8/docs/api/"))

;; KEY MAPPINGS

(defalias 'qrr 'query-replace-regexp)
(defalias 'c 'comment-region)
(defalias 'uc 'uncomment-region)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-x p") 'previous-multiframe-window)
(windmove-default-keybindings 'meta) ; M-arrow to navigate buffers
(setq minibuffer-prompt-properties
      (quote
       (read-only t point-enter minibuffer-avoid-prompt face minibuffer-prompt)))
(global-set-key (kbd "M-p") 'move-line-region-up)
(global-set-key (kbd "M-n") 'move-line-region-down)
(define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)
(global-set-key (kbd "C-<tab>") 'dabbrev-expand) ; C-tab complete
(global-set-key [(C-h)] 'delete-backward-char) ; cooperate with ^H
(global-set-key (kbd "C-x b") 'electric-buffer-list)
(global-set-key (kbd "C-c c") 'execute-extended-command) ; M-x

;; HOOKS

(add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
(add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)
(add-hook 'before-close-hook 'delete-trailing-whitespace)

;; thanks to http://www.emacswiki.org/emacs/MakingScriptsExecutableOnSave
;; chmod u+x on files that start with shebang
(add-hook 'after-save-hook
          #'(lambda ()
              (and (save-excursion
                     (save-restriction
                       (widen)
                       (goto-char (point-min))
                       (save-match-data
                         (looking-at "^#!"))))
                   (not (file-executable-p buffer-file-name))
                   (shell-command (concat "chmod u+x " buffer-file-name))
                   (message
                    (concat "Saved as script: " buffer-file-name)))))

(add-hook 'c-mode-hook
          '(lambda ()
             (setq c-tab-always-indent nil)
             (setq c-label-offset 0)
             (setq c-continued-brace-offset 4)
             (setq c-continued-statement-offset 4)))

;; MACROS

; TODO make this better
(fset 'edit
      "\C-x\C-f\C-a\C-k~/.emacs\C-m")
(global-set-key (kbd "C-c e") 'edit)
