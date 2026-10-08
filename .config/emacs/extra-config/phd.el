;; -*- lexical-binding: t; -*-

;; agenda file
(add-to-list 'org-agenda-files "~/Nextcloud/university/phd/org/phd.org")


;; pretty symbols
(defvar phd--prettify-symbols-alist '((":ACCRa" 			. ?🦊)
                                      (":ADMIN" 			. ?📚)
                                      (":RESEARCH"    . ?📜)
                                      (":BUG"         . ?🪳)
                                      (":INFO"        . ?💡)))

(mapcar (lambda (pretty-symbol)
          (add-to-list 'config--prettify-symbols-alist pretty-symbol))
        phd--prettify-symbols-alist)


;; capture templates
(add-to-list 'org-capture-templates `("p"
                                      "PhD"
                                      entry
                                      (file+headline "~/Nextcloud/university/phd/org/phd.org" "Tasks")
                                      (file ,(concat user-emacs-directory "templates/todo.tmpl"))
                                      :unnarrowed t))

;; agenda views
(add-to-list 'org-agenda-custom-commands `("p" "PhD"
                                            ((tags "RESEARCH /+TODO"
                                                   ((org-agenda-overriding-header "Research")))
                                             (tags "ACCRa /+TODO"
                                                   ((org-agenda-overriding-header "ACCRa")))
                                             (tags "/+DONE"
                                                   ((org-agenda-overriding-header "Completed")
                                                    (org-agenda-max-entries 3)))
                                             (tags "/+AXED"
                                                   ((org-agenda-overriding-header "Cancelled")
                                                    (org-agenda-max-entries 3))))
                                            ((org-agenda-files (list "~/Nextcloud/university/phd/org/phd.org")))))

;; misc
(add-to-list 'safe-local-variable-directories "~/Nextcloud/university/phd/org/")

