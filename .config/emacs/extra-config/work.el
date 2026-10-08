;; -*- lexical-binding: t; -*-

(add-to-list 'org-agenda-files "~/Nextcloud/university/phd/org/phd.org")
(add-to-list 'custom--prettify-symbols-alist '(":ACCRa" 			. ?🦊))
(add-to-list 'custom--prettify-symbols-alist '(":ADMIN" 			. ?📚))
(add-to-list 'custom--prettify-symbols-alist '(":RESEARCH"    . ?📜))
(add-to-list 'custom--prettify-symbols-alist '(":BUG"         . ?🪳))
(add-to-list 'custom--prettify-symbols-alist '(":INFO"        . ?💡))


(add-to-list 'safe-local-variable-directories "~/Nextcloud/university/phd/org/")
(add-to-list 'org-capture-templates `("P"
                                      "PhD"
                                      entry
                                      (file+headline "~/Nextcloud/university/phd/org/phd.org" "Tasks")
                                      (file ,(concat user-emacs-directory "templates/phd.tmpl"))
                                      :unnarrowed t))
