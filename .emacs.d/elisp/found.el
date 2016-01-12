;; stuff i've found online

;; http://www.emacswiki.org/emacs/MakingScriptsExecutableOnSave
;; chmod u+x on executable files
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

;; https://sites.google.com/site/steveyegge2/my-dot-emacs-file
;; swap two and only two windows
(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((not (= (count-windows) 2))
         (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1)))))

(provide 'found)
