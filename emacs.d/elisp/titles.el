;; converts HELLO WORLD to H E L L O  W O R L D
(defun expand-title(arg)
  "Insert space between each character of arg"
  (reduce #'concat
    (mapcar (lambda (c) (concat (upcase c) " "))
      (mapcar 'string arg)
    )
  )
)

;;                              +-------+
;; function that takes TITLE to | TITLE |
;;                              +-------+
(defun border-title(arg)
  "Return border decorated arg"
  ; ...
  )

(provide 'titles)
