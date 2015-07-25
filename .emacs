; have backups go to ./.backups/
(require 'whitespace)
(require 'cl)
(require 'cc-mode)
;(require 'smart-tab)

;(add-to-list 'load-path "~/.emacs.d/")
;(add-to-list 'load-path "haskell_path")
;(load "haskell-mode-autoloads.el")
;(load-library "easy-mmode")
;(load-libray "smart-tab")

; turn on for folding
; M-x hs-minor-mode

; turn on for folding preproc
; M-x hide-ifdef-mode

; setq whitespace-style '(lines))
; (setq whitespace-line-column 78)
; (global-whitespace-mode 1)

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(add-hook 'before-close-hook 'delete-trailing-whitespace)
; (add-hook 'prog-mode-hook 'outline-minor-mode)
; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(set-mouse-color "black")
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(defalias 'qrr 'query-replace-regexp)
(global-font-lock-mode 1)
;(global-smart-tab-mode 1)
(show-paren-mode     1)
(setq show-paren-style 'expression)
(transient-mark-mode 1)
(windmove-default-keybindings 'meta)
; Problem with makefiles and the like
;(setq-default indent-tabs-mode nil) ; use C-q to insert true tab
; M-x highlight-changes-mode
(setq minibuffer-prompt-properties (quote (read-only t point-enter minibuffer-avoid-prompt face minibuffer-prompt)))
(setq show-parens-style         'expression)
(setq whitespace-style          'trailing)
(setq inhibit-splash-screen      t)
(setq line-number-mode           t)
(global-whitespace-mode          t)
(setq column-number-mode         t)
(setq inhibit-startup-message    t)
(setq search-highlight           t)
(setq query-replace-highlight    t)
(setq mouse-sel-retain-highlight t)
(setq c-default-style "linux"
      c-basic-offset 4)

(global-set-key (kbd "C-<tab>") 'dabbrev-expand)
(define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)
(global-set-key [(C-h)] 'delete-backward-char)
(global-set-key (kbd "C-x b") 'electric-buffer-list)
(global-set-key (kbd "C-c c") 'execute-extended-command)
(global-set-key (kbd "C-x p") 'previous-multiframe-window)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

(fset 'edit
   "\C-x\C-f\C-a\C-k~/.emacs\C-m")
(global-set-key (kbd "C-c e") 'edit)

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

;; thanks to http://geosoft.no/development/emacs.html

(defun scroll-down-keep-cursor ()
   ;; Scroll the text one line down while keeping the cursor
   (interactive)
   (scroll-down 1))

(defun scroll-up-keep-cursor ()
   ;; Scroll the text one line up while keeping the cursor
   (interactive)
   (scroll-up 1))

;(global-set-key [] 'scroll-down-keep-cursor)
;(global-set-key [] 'scroll-up-keep-cursor)

;; binary nav

;(global-set-key (kbd "RET") 'reindent-then-newline-and-indent).

;‘highlight-changes-mode’

;font-lock-add-keywords

;(setq inhibit-splash-screen t)

;(lexical-let ((beg -1)
;	            (end -1)
;		          (prev-mid -1))

;(defun backward-binary ()
;   (interactive)
;   (if (/= prev-mid (point))
;       (setq beg -1 end -1)
;     (setq end prev-mid))
;   (if (< beg 0) (setq beg (line-beginning-position)
;		              end (point)))
;   (setq prev-mid (/ (+ beg end) 2))
;   (goto-char prev-mid))

;(defun forward-binary ()
;   (interactive)
;   (if (/= prev-mid (point))
;       (setq beg -1 end -1)
;     (setq beg prev-mid))
;   (if (< end 0) (setq beg (point)
;		              end (line-end-position)))
;   (setq prev-mid (/ (+ beg end ) 2))
;   (goto-char prev-mid))
;)

;(global-set-key [(meta j)] 'backward-binary)
;(global-set-key [(meta k)] 'forward-binary)

;; thank you emacswiki.org

; (electric-indent-mode 1)
; fix for Python
;;; Indentation for python

;; Ignoring electric indentation
; (defun electric-indent-ignore-python (char)
;  "Ignore electric indentation for python-mode"
;  (if (equal major-mode 'python-mode)
;      `no-indent'
;    nil))
;(add-hook 'electric-indent-functions 'electric-indent-ignore-python)

;; Enter key executes newline-and-indent
;(defun set-newline-and-indent ()
;  "Map the return key with `newline-and-indent'"
;  (local-set-key (kbd "RET") 'newline-and-indent))
;(add-hook 'python-mode-hook 'set-newline-and-indent)


;(dolist (command '(yank yank-pop))
;   (eval `(defadvice ,command (after indent-region activate)
;            (and (not current-prefix-arg)
;                 (member major-mode '(emacs-lisp-mode lisp-mode
;                                                      clojure-mode    scheme-mode
;                                                      haskell-mode    ruby-mode
;                                                      rspec-mode      python-mode
;                                                      c-mode          c++-mode
;                                                      objc-mode       latex-mode
;                                                      plain-tex-mode))
;                 (let ((mark-even-if-inactive transient-mark-mode))
;                   (indent-region (region-beginning) (region-end) nil))))))
