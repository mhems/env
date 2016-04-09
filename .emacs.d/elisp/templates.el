(auto-insert-mode 1)

(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\.java" . "Java skeleton")
     '(""
       "public class "
       (file-name-sans-extension (file-name-nondirectory (buffer-file-name)))
       " {" \n
       > _ \n
       -4 "}" \n
       )
     )
  )

(provide 'templates)
