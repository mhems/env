(require 'parenthesis)

; add hooks for tex, markdown

(add-hook
 'html-mode-hook
 (lambda()
   (parenthesis-register-keys "<" html-mode-map)))
