(require 'whitespace)
(require 'cl)
(require 'cc-mode)


(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(defalias 'qrr 'query-replace-regexp)
(global-font-lock-mode 1)
(set-mouse-color "black")
(add-hook 'before-close-hook 'delete-trailing-whitespace)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
;(global-smart-tab-mode 1)
(show-paren-mode     1)
(transient-mark-mode 1)
(windmove-default-keybindings 'meta)
; Problem with makefiles and the like
;(setq-default indent-tabs-mode nil) ; use C-q to insert true tab
(setq minibuffer-prompt-properties (quote (read-only t point-enter minibuffer-avoid-prompt face minibuffer-prompt)))
(setq show-paren-style          'expression)
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

;; http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(add-hook 'c-mode-hook 
	  '(lambda ()
	     (setq c-tab-always-indent nil)
	     (setq c-label-offset 0)
	     (setq c-continued-brace-offset 2)
	     (setq c-continued-statement-offset 2)))


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
