;; This file holds macros

; TODO make this better
(fset 'edit
      "\C-x\C-f\C-a\C-k~/.emacs\C-m")
(global-set-key (kbd "C-c e") 'edit)

(provide 'macros)
