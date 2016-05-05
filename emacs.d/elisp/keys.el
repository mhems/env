;; my key mappings

(require 'cc-mode) ; various c-like modes

(defalias 'qrr 'query-replace-regexp)
(defalias 'c 'comment-region)
(defalias 'uc 'uncomment-region)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-x p") 'previous-multiframe-window)
(windmove-default-keybindings 'meta) ; M-arrow to navigate buffers
(setq minibuffer-prompt-properties
      (quote
       (read-only t point-enter minibuffer-avoid-prompt face minibuffer-prompt)))
(global-set-key (kbd "<f7>")      'fold-dwim-toggle)
(global-set-key (kbd "<M-f7>")    'fold-dwim-hide-all)
(global-set-key (kbd "<S-M-f7>")  'fold-dwim-show-all)
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-x j") 'crosshairs-flash)
(global-set-key (kbd "C-?") 'semantic-ia-describe-class)
(global-set-key (kbd "") 'semantic-ia-fast-jump)
(global-set-key (kbd "") 'semantic-symref)
(global-set-key (kbd "M-n") 'move-line-region-down)
(global-set-key (kbd "M-p") 'move-line-region-up)
(define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)
(global-set-key (kbd "C-<tab>") 'dabbrev-expand) ; C-tab complete
(global-set-key [(C-h)] 'delete-backward-char) ; cooperate with ^H
(global-set-key (kbd "C-x b") 'electric-buffer-list)
(global-set-key (kbd "C-c c") 'execute-extended-command) ; M-x

(provide 'keys)
