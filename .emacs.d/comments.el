(defun dka-fix-comments ()
        "Move through the entire buffer searching for comments that begin with
    \"//\" and fill them appropriately.  That means if comments start too
    close to the end of line (20 less than the fill-column) move the
    entire comment on a line by itself."
        (interactive)
        (save-excursion
          (beginning-of-buffer)
          (while (search-forward "//")
            (lisp-indent-for-comment)
            ;; when the comment is deemed to be too close to the end of the
            ;; line, yank it and put it on the previous line before filling
            (while (< (- fill-column 20) (- (current-column) 3))
              (search-backward "//")
              (kill-line)
              (beginning-of-line)
              (yank)
              (insert "\n"))
            ;; now fill the lines that are too long
            (if (and (not (end-of-line))
                     (< fill-column (current-column)))
                (c-fill-paragraph)))))
