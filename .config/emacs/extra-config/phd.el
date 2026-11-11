;; -*- lexical-binding: t; -*-

;; agenda file
(add-to-list 'org-agenda-files "~/Nextcloud/university/phd/org/phd.org")


;; pretty symbols
(defvar phd--prettify-symbols-alist '((":ADMIN" 			. ?📚)
                                      (":RESEARCH"    . ?📜)
                                      (":FEATURE"     . ?🚀)
                                      (":BUG"         . ?🐛)
                                      (":INVESTIGATE" . ?🔎)))

(mapcar (lambda (pretty-symbol)
          (add-to-list 'config--prettify-symbols-alist pretty-symbol))
        phd--prettify-symbols-alist)


;; capture templates
(add-to-list 'org-capture-templates `("P"
                                      "PhD"
                                      entry
                                      (file+headline "~/Nextcloud/university/phd/org/phd.org" "Tasks")
                                      (file ,(concat user-emacs-directory "templates/todo.tmpl"))
                                      :unnarrowed t))

;; agenda views
(add-to-list 'org-agenda-custom-commands `("P" "PhD Next Steps"
                                           ((tags-todo "+CATEGORY=\"ACCRa\"+TODO=\"NEXT\""
                                                       ((org-agenda-overriding-header "ACCRa")))
                                            (tags-todo "+RESEARCH+TODO=\"NEXT\""
                                                       ((org-agenda-overriding-header "Literature")))
                                            (stuck ""
                                                   ((org-agenda-overriding-header "Stuck")))                                  
                                            (tags "/+DONE"
                                                  ((org-agenda-overriding-header "Completed")
                                                   (org-agenda-max-entries 3)))
                                            (tags "/+AXED"
                                                  ((org-agenda-overriding-header "Cancelled")
                                                   (org-agenda-max-entries 3))))
                                           ((org-agenda-files (list "~/Nextcloud/university/phd/org/phd.org")))))

(defun phd--get-assignee ()
  "Extract and return the person responsible for a task."
  (let* ((assignee (org-entry-get (point) "assignee")))
    (if assignee
        (concat "👤 " assignee)
      "")))

(add-to-list 'org-agenda-custom-commands `("A" "ACCRa Agenda"
                                           agenda ""
                                           ((org-agenda-overriding-header "ACCRa")
                                            (org-agenda-category-filter-preset '("+ACCRa"))
                                            (org-agenda-prefix-format
                                             "  %-20(phd--get-assignee) %s")
                                            (org-agenda-include-diary nil)
                                            (org-agenda-span 30)
                                            (org-agenda-show-all-dates nil)
                                            (org-deadline-warning-days 0))
                                           ("/tmp/accra-agenda.pdf")))


(add-to-list 'org-agenda-category-icon-alist `("phd"
                                               ,(concat user-emacs-directory "extra-config/assets/phd.svg")
                                               nil nil :ascent center))


(add-to-list 'org-agenda-category-icon-alist `("ACCRa"
                                               ,(concat user-emacs-directory "extra-config/assets/accra.svg")
                                               nil nil :ascent center))


;; misc
(add-to-list 'safe-local-variable-directories "~/Nextcloud/university/phd/org/")
