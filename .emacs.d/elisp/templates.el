(setq auto-insert-query nil) ; don't ask for confirmation

(defun base-name (path)
  "Return basename of path without extension"
  (file-name-sans-extension (file-name-nondirectory path))
  )

(setq auto-insert-alist
      '(
        (("\\.java" . "Java skeleton")
         "Java Skeleton"
         "public class " (base-name buffer-file-name) " {" \n
         > _ \n
         -4 "}" \n
         )

        (("\\.h" . "C/C++ Header skeleton")
         "Header Skeleton"
         "#ifndef " (concat (upcase (base-name buffer-file-name)) "_H") \n
         "#define " (concat (upcase (base-name buffer-file-name)) "_H") \n
         \n
         _ \n
         \n
         "#endif /* " (concat (upcase (base-name buffer-file-name)) "_H") " */" \n
         )

        (("\\.tex" . "LaTex skeleton")
         "LaTex skeleton"
         "\\documentclass[12pt]{article}" \n
         \n
         "\\begin{document}" \n
         _ \n
         "\\end{document}" \n
         )

        )
      )

(auto-insert-mode 1)

(provide 'templates)
