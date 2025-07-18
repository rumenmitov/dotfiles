(setq emacs-directory "~/.config/emacs")
(setq org-directory "~/Nextcloud/org")

(auto-save-visited-mode 1)

(setq backup-directory-alist `((".*" . ,(concat emacs-directory "/backups/"))))
(setq auto-save-file-name-transforms `((".*" ,(concat emacs-directory "/auto-saves/") t)))

(setq inhibit-startup-message t)
(setq initial-scratch-message ";; -- Welcome to Emacs--\n\n")

(defun display-startup-echo-area-message ()
  (message nil))

(setq server-client-instructions nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default mode-line-format nil)

(setq default-frame-alist '(
                            (font . "FiraCode Nerd Font Mono 12")
                            (vertical-scroll-bars . nil)
                            ))

(global-display-line-numbers-mode 1)
(set-fringe-mode 0)

(setq display-line-numbers-type 'relative)
(setq display-line-numbers-current-absolute t)

(load-theme 'modus-vivendi-tinted 1)
(add-to-list 'default-frame-alist '(alpha-background . 80))

(custom-set-faces
 '(line-number ((t (:inherit default :background nil))))
 '(line-number-current-line ((t (:inherit default :background nil))))
 '(gnus-summary-cancelled ((t (:extend t :strike-through t))))
 '(org-block ((t (:inherit shadow :extend t :background "black" :slant italic))))
 '(org-block-begin-line ((t (:inherit org-meta-line :extend t :background "black" :box (:line-width (1 . 1) :color "grey75" :style pressed-button) :weight bold))))
 '(org-block-end-line ((t (:inherit org-block-begin-line :extend t :background "black" :box (:line-width (1 . 1) :color "grey75" :style released-button) :weight bold))))
 '(org-code ((t (:inherit shadow :extend t :background "black"))))
 '(org-inline-src-block ((t (:inherit nil))))
 '(org-meta-line ((t (:inherit font-lock-comment-face :foreground "white smoke")))))

(winner-mode 1)
(global-set-key (kbd "C-<") 'winner-undo)
(global-set-key (kbd "C->") 'winner-redo)

(windmove-default-keybindings)
(global-set-key (kbd "C-c C-w h") 'windmove-left)
(global-set-key (kbd "C-c C-w l") 'windmove-right)
(global-set-key (kbd "C-c C-w k") 'windmove-up)
(global-set-key (kbd "C-c C-w j") 'windmove-down)

(setq display-buffer-alist
        '(("\\*\\(Man*\\|Help\\*\\)" (display-buffer-full-frame))))

(setq viper-expert-level 5)
(setq viper-mode t)
(require 'viper)

(which-key-mode 1)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(setq recentf-max-saved-items 10)
(save-place-mode 1)

(icomplete-vertical-mode t)
(fido-vertical-mode t)
(global-completion-preview-mode t)

(setq completion-preview-minimum-symbol-length 1)
(setq completion-auto-select t)
(setq completion-auto-help 'always)
(setq completion-show-help nil)
(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq icomplete-in-buffer t)
(setq completions-max-height 10)
(setq completions-format "one-column")
(setq imenu-auto-rescan t)

(setopt completion-fail-discreetly t)

(define-key icomplete-vertical-mode-minibuffer-map (kbd "TAB") 'icomplete-force-complete)
(define-key icomplete-vertical-mode-minibuffer-map (kbd "RET") 'icomplete-force-complete-and-exit)
(global-set-key (kbd "M-n") 'completion-preview-next-candidate)
(global-set-key (kbd "M-p") 'completion-preview-prev-candidate)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default c-default-style "bsd"
	c-basic-offset tab-width)
(setq-default comment-auto-fill-only-comments t)

(setq compile-command "make ")
(setq gdb-show-main t)
(setq gdb-many-windows t)
(setq gdb-default-window-configuration-file "~/.config/emacs/gdb-window-config")

(global-set-key (kbd "C-x g.") 'flymake-goto-next-error)
(global-set-key (kbd "C-x g,") 'flymake-goto-prev-error)
(global-set-key (kbd "C-x gf") 'eglot-format)
(global-set-key (kbd "C-x gr") 'eglot-rename)
(global-set-key (kbd "C-x ga") 'eglot-code-actions)

(add-hook 'prog-mode-hook 'auto-fill-mode)

(add-hook 'c-mode-common-hook (lambda ()
				  (electric-pair-mode 1)
				  (c-toggle-auto-newline 1)))

(defface font-lock/todo-face '(
                               (t (:foreground "deep sky blue"
                                               :overline t
                                               :underline t
                                               :weight bold)))
  "TODO face")

(defface font-lock/bug-face '(
                              (t (:background "red"
                                              :foreground "white"
                                              :overline "white"
                                              :underline "white"
                                              :weight bold)))
  "BUG face")

(defface font-lock/info-face '(
                               (t (:foreground "white"
                                               :overline "white"
                                               :underline "white"
                                               :slant italic)))
  "INFO face")

(defvar custom/font/faces '(("\\<\\(TODO\\)" 1 'font-lock/todo-face prepend)
                          ("\\<\\(BUG\\)" 1 'font-lock/bug-face prepend)
                          ("\\<\\(INFO\\)" 1 'font-lock/info-face prepend)))

(font-lock-add-keywords 'c-mode custom/font/faces)
(font-lock-add-keywords 'c++-mode custom/font/faces)

(appt-activate 1)

(setq org-startup-with-inline-images t)

(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'ispell-minor-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook (lambda ()
                           (display-line-numbers-mode 0)
                           (setq left-margin-width 20)
                           (setq right-margin-width 20)))


(setq org-clock-persist t)
(org-clock-persistence-insinuate)

(setq org-clock-sound (concat emacs-directory "/assets/org-clock-sound.wav"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (python . t)
   (C .t)
   (haskell .t)
   (js .t)))

(add-hook 'org-mode-hook
          (lambda ()
            (setq prettify-symbols-alist
                  '(("[#A]"        . ?🔴)
                    ("[#B]"        . ?🔵)
                    ("[#C]"        . ?🟢)
                    ("#+author:"   . ?)
                    ("#+title:"    . ?)
                    ("#+date:"     . ?)                      
                    ("#+email:"    . ?)
                    ("#+options:"  . ?)                      
                    ("#+begin_src" . ?)
                    ("#+end_src"   . ?)
                    ("#+RESULTS:"  . ?)
                    ("- [ ]"       . ?)
                    ("- [-]"       . ?)
                    ("- [X]"       . ?)
                    ("RESEARCH"    . ?📜)
                    ("BUG"         . ?🪳)
                    ("INFO"        . ?💡)))
            (prettify-symbols-mode 1)))

(setq org-hide-emphasis-markers t)
(setq org-pretty-entities t)
(setq org-pretty-entities-include-sub-superscripts t)
(setq org-use-sub-superscripts '{})
(setq org-export-with-sub-superscripts '{})

(global-set-key (kbd "C-c a") 'org-agenda)

(setq org-agenda-files (list
                        (concat org-directory "/agenda/")
                        "~/Nextcloud/university/semester_4/software-engineering/"
			"~/Nextcloud/rasdaman/"))

(setq org-default-notes-file (concat org-directory "/agenda/notes.org"))
(setq diary-file (concat org-directory "/agenda/diary"))
(setq org-archive-location (concat org-directory "/archive/%s_archive::datetree/"))

(setq org-agenda-include-diary t)
(setq calendar-date-style 'european)

(setq org-tag-persistent-alist '((:startgroup . nil)
                                 ("@work" . ?W) ("@home" . ?H)
                                 (:endgroup . nil)))

(setq org-agenda-custom-commands
      `(("p" "Programming"
         ((todo "TODO"))
         ((org-agenda-files (list ,(concat org-directory "/agenda/programming.org")))))))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates
        `(("t"
           "Todo"
           entry
           (file ,(concat org-directory "/agenda/notes.org"))
           (file ,(concat emacs-directory "/templates/todo.tmpl")))
          ("e"
           "Email"
           entry
           (file ,(concat org-directory "/agenda/notes.org"))
           (file ,(concat emacs-directory "/templates/email.tmpl")))
          ("j"
           "Journal"
           plain
           (file+datetree ,(concat org-directory "/journal.org"))
           (file ,(concat emacs-directory "/templates/journal.tmpl")))
          ("p"
           "Programming"
           entry
           (file ,(concat org-directory "/agenda/programming.org"))
           (file ,(concat emacs-directory "/templates/programming.tmpl")))))

(setq gnus-use-dribble-file nil)
(setq gnus-directory "~/.news")

(require 'gnus-demon)
(gnus-demon-init)
(add-hook 'gnus-startup-hook
          (apply-partially #'gnus-demon-add-handler 'gnus-demon-scan-news 5 t))

(setq
 gnus-select-method '(nntp "news.gmane.io")
 gnus-newsgroup-maximum-articles 50)

(setq gnus-secondary-select-methods
      '((nnimap "gmail"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl))))

(setq user-mail-address "rumen.valmitov@gmail.com"
      user-full-name    "Rumen Mitov")

(setq smtpmail-smtp-server 		     "smtp.gmail.com"
      smtpmail-smtp-user                       "rumen.valmitov@gmail.com"
      smtpmail-servers-requiring-authorization "smtp.gmail.com"
      send-mail-function   		     'smtpmail-send-it
      smtpmail-smtp-service                    465
      smtpmail-stream-type                     'ssl)

(setq auth-sources '("~/.authinfo.gpg"))

(setq newsticker-url-list '(
                              ("HackerNews" "https://hnrss.org/frontpage" nil nil nil)
                              ("Suckless" "https://suckless.org/atom.xml" nil nil nil)                                
                              ("Guardian - Europe" "https://www.theguardian.com/europe/rss" nil nil nil)
                              ("The Atlantic" "https://www.theatlantic.com/feed/all/" nil nil nil)
                              ("The Verge" "https://theverge.com/rss/index.xml" nil nil nil)
                              ("EndGadget" "https://engadget.com/rss.xml" nil nil nil)
                              ("AlternativeTo" "https://feed.alternativeto.net/news/all" nil nil nil)
                              ("Guardian - Tech" "https://www.theguardian.com/uk/technology/rss" nil nil nil)))

(setq newsticker-groups '(
                          "News"
                          ("World News" "Guardian - Europe" "The Atlantic")
                          ("Tech News" "The Verge" "EndGadget" "AlternativeTo" "Guardian - Tech")
                          ("Mailing Lists" "HackerNews" "Suckless")))


(add-hook 'newsticker-mode-hook 'imenu-add-menubar-index)
(add-hook 'newsticker-treeview-mode-hook (lambda ()
                                           (setq-local browse-url-browser-function 'eww-browse-url)))

(setq visible-bell 1)
(setq use-short-answers t)
(setq use-dialog-box nil)

(require 'package)
(add-to-list 'package-archives '("meta" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package beacon)
(beacon-mode 1)

(use-package undo-tree)
(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist `(("." . ,(concat emacs-directory "/emacs/undo"))))
(setq undo-tree-visualizer-diff t)

(use-package yasnippet)
(use-package yasnippet-snippets)
(use-package yasnippet-capf
  :config
  (add-to-list 'completion-at-point-functions #'yasnippet-capf))

(yas-global-mode)
(define-key yas-minor-mode-map (kbd "C-c y") 'yas-insert-snippet)
(global-set-key (kbd "M-/") 'hippie-expand)

(defun config/load-yas-after-eglot ()
  "Loads yasnippets-capf after eglot, because eglot overrides the hook."
  (if (eglot-managed-p)
      ;; if eglot stops managing remove the hook,
      ;; otherwise when eglot restarts it will place its hook ahead
      ;; in the list.
      (add-hook 'completion-at-point-functions #'yasnippet-capf nil t)
    (remove-hook 'completion-at-point-functions #'yasnippet-capf t)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-managed-mode-hook 'config/load-yas-after-eglot))

(use-package haskell-mode)
(use-package go-mode)
(use-package rust-mode)
(use-package nix-mode)
(use-package php-mode)

(add-hook 'haskell-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'nix-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'php-mode-hook 'eglot-ensure)
