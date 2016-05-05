(require 'parenthesis)

; java/c/c++ - newline after {
(defun add_newline_braces
    (add-to-list 'parenthesis-func-alist
                 '(parenthesis-insert-newline-braces "{\n\n" "}" 2))
    (parenthesis-init))

;; (add-hook 'java-mode-hook add_newline_braces)

(defun add-backtick-completion (hook map)
  (add-hook
   hook
   (lambda()
     (parenthesis-register-keys "`" map))))

(add-hook
 'latex-mode-hook
 (lambda()
   (parenthesis-register-keys "$|" latex-mode-map)))

(add-hook
 'html-mode-hook
 (lambda()
   (parenthesis-register-keys "<" html-mode-map)))

;; (parenthesis-init)
(provide 'paren-wrapper)
