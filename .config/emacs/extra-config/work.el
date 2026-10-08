;; -*- lexical-binding: t; -*-

(add-to-list 'org-agenda-files "~/Nextcloud/university/phd/org/phd.org")
(add-to-list 'custom--prettify-symbols-alist '(":ACCRa" . ?🦊))
(add-to-list 'safe-local-variable-directories "~/Nextcloud/university/phd/org/")
(add-to-list 'org-capture-templates `("A"
                                      "ACCRa"
                                      entry
                                      (file+headline "~/Nextcloud/university/phd/org/phd.org" "Tasks")
                                      (file ,(concat user-emacs-directory "templates/accra.tmpl"))
                                      :unnarrowed t))
