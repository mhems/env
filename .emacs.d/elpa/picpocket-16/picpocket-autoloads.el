;;; picpocket-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "picpocket" "picpocket.el" (22150 7256 599784
;;;;;;  656000))
;;; Generated autoloads from picpocket.el

(autoload 'picpocket "picpocket" "\
View the pictures in the current directory.

\(fn)" t nil)

(autoload 'picp-db-update "picpocket" "\
Manage the tag database.

Enter a special buffer where any suspicious database entries are
listed.  Suspicious entries are for example when files that have
disappeared.  Maybe they have been deleted outside of picpocket.
And the entries in picpocket now points to nowhere.  If there are
any such entries they will be listed in this buffer.  And there
will be an offer to clean up those entries from the database.

Note that this command can take some time to finish since it goes
through the entire database.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; picpocket-autoloads.el ends here
