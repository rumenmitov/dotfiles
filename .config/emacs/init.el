(setopt emacs-directory "~/.config/emacs")
(setopt org-directory "~/Nextcloud/org")

(auto-save-visited-mode 1)

(setopt backup-directory-alist `((".*" . ,(concat emacs-directory "/backups/"))))
(setopt auto-save-file-name-transforms `((".*" ,(concat emacs-directory "/auto-saves/") t)))

(setopt inhibit-startup-message t)
(setopt initial-scratch-message ";; -- Welcome to Emacs--\n\n")

(defun display-startup-echo-area-message ()
  (message nil))

(setopt server-client-instructions nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default mode-line-format nil)

(setopt default-frame-alist '(
                              (font . "FiraCode Nerd Font Mono 12")
                              (vertical-scroll-bars . nil)
                              ))

(global-display-line-numbers-mode 1)
(set-fringe-mode 0)

(window-divider-mode t)

(setopt display-line-numbers-type 'relative
        display-line-numbers-current-absolute t
        window-divider-default-places t
        window-divider-default-right-width 3
        window-divider-default-bottom-width 1)

(setopt modus-themes-to-toggle '(modus-operandi-tinted modus-vivendi))

(load-theme 'modus-vivendi 1)

(setopt modus-themes-bold-constructs t
        modus-themes-italic-constructs t
        modus-themes-disable-other-themes t
        modus-themes-custom-auto-reload t)

(setopt modus-themes-common-palette-overrides
        modus-themes-preset-overrides-intense)

(add-to-list 'default-frame-alist '(alpha-background . 80))

(custom-set-faces
 '(viper-minibuffer-insert ((t nil)))
 '(line-number ((t (:inherit default :background nil))))
 '(line-number-current-line ((t (:inherit default :background nil))))
 '(gnus-summary-cancelled ((t (:extend t :strike-through t))))
 '(org-block ((t (:inherit shadow :extend t :background "black" :foreground "white" :slant italic))))
 '(org-block-begin-line ((t (:inherit org-meta-line :extend t :background "black" :box (:line-width (1 . 1) :color "grey75" :style pressed-button) :weight bold))))
 '(org-block-end-line ((t (:inherit org-block-begin-line :extend t :background "black" :box (:line-width (1 . 1) :color "grey75" :style released-button) :weight bold))))
 '(org-code ((t (:inherit shadow :extend t :background "black" :foreground "white"))))
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

(setopt display-buffer-alist
        '(("\\*\\(Man*\\|Help\\*\\)" (display-buffer-full-frame))))

(setopt window-min-height 10)
(setopt window-min-width 30)

;; The desired ratio of the focused window's size.
(setopt auto-resize-ratio 0.7)

(defun win/auto-resize ()
  (let* (
         (height (floor (* auto-resize-ratio (frame-height))))
         (width (floor (* auto-resize-ratio (frame-width))))
         ;; INFO We need to calculate by how much we should enlarge
         ;; focused window because Emacs does not allow setting the
         ;; window dimensions directly.
         (h-diff (max 0 (- height (window-height))))
         (w-diff (max 0 (- width (window-width)))))
    (enlarge-window h-diff)
    (enlarge-window w-diff t)))

(advice-add 'other-window :after (lambda (&rest args)
                                   (win/auto-resize)))

(advice-add 'windmove-up    :after 'win/auto-resize)
(advice-add 'windmove-down  :after 'win/auto-resize)
(advice-add 'windmove-right :after 'win/auto-resize)
(advice-add 'windmove-left  :after 'win/auto-resize)

(advice-add 'split-window-below :after (lambda (&rest args)
                                         (win/auto-resize)))

(advice-add 'split-window-right :after (lambda (&rest args)
                                         (win/auto-resize)))

(which-key-mode 1)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(setopt recentf-max-saved-items 10)
(save-place-mode 1)

(setopt vc-follow-symlinks t)

(defun preview/clean ()
  "Cleanup preview buffers."
  (kill-matching-buffers-no-ask ".* - preview"))

(defun preview/preview-file (file)
  "Open the preview for the current minibuffer selection."
  (preview/clean)
  (let* ((basename (ff-basename file)))
    (if (not (get-buffer basename))
        (progn
          (find-file-read-only file)
          (display-buffer basename '(display-buffer-full-frame . ((inhibit-same-window . nil))))
          (rename-buffer (concat basename  " - preview")))
      (display-buffer basename '(display-buffer-full-frame . ((inhibit-same-window . nil))))))
  (switch-to-minibuffer))

(defun preview/attach-preview(&rest args)
  "Makes sure that the filename exists and is clean (i.e. remove trailing slash from directories)."
  (let*
      ((file (nth 0 (completion-all-sorted-completions (icomplete--field-beg) (icomplete--field-end))))
       (file-dir (file-name-directory (minibuffer-contents)))
       (dir (if (equal file-dir file) "" file-dir))
       (clean-file (directory-file-name (concat dir file))))
    (when (file-exists-p clean-file)
      (preview/preview-file clean-file))))


(advice-add 'icomplete-forward-completions :after 'preview/attach-preview)
(advice-add 'icomplete-backward-completions :after 'preview/attach-preview)

(add-hook 'minibuffer-exit-hook 'preview/clean)

(icomplete-vertical-mode t)
(fido-vertical-mode t)
(global-completion-preview-mode t)

(setopt completion-preview-minimum-symbol-length 1
			  completion-auto-select t
			  completion-auto-help 'always
			  completion-show-help nil
			  completion-ignore-case t
			  read-buffer-completion-ignore-case t
			  read-file-name-completion-ignore-case t
			  icomplete-in-buffer t
			  completions-max-height 10
			  completions-format 'one-column
			  imenu-auto-rescan t
			  completion-fail-discreetly t
			  completions-detailed t
			  completions-sort 'historical)

(define-key icomplete-vertical-mode-minibuffer-map (kbd "TAB")
            'icomplete-force-complete)

(define-key icomplete-vertical-mode-minibuffer-map (kbd "RET")
            'icomplete-force-complete-and-exit)

(global-set-key (kbd "M-n") 'completion-preview-next-candidate)
(global-set-key (kbd "M-p") 'completion-preview-prev-candidate)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default c-default-style "bsd"
	c-basic-offset tab-width)
(setq-default comment-auto-fill-only-comments t)

(setopt compile-command "make "
				gdb-show-main t
				gdb-many-windows t
				gdb-default-window-configuration-file "~/.config/emacs/gdb-window-config")

(global-set-key (kbd "C-x g.") 'flymake-goto-next-error)
(global-set-key (kbd "C-x g,") 'flymake-goto-prev-error)
(global-set-key (kbd "C-x gd") 'xref-find-definitions)
(global-set-key (kbd "C-x grr") 'xref-find-references)
(global-set-key (kbd "C-x gff") 'eglot-format)
(global-set-key (kbd "C-x grn") 'eglot-rename)
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

(setopt org-startup-with-inline-images t
        org-tags-column 90)

(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'ispell-minor-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook (lambda ()
                           (display-line-numbers-mode 0)
                           (setq-local left-margin-width 20)
                           (setq-local right-margin-width 20)))


(setopt org-clock-persist t)
(org-clock-persistence-insinuate)

(setopt org-clock-sound (concat emacs-directory "/assets/org-clock-sound.wav"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (python . t)
   (C .t)
   (plantuml .t)
   (haskell .t)
   (js .t)))

(setopt org-plantuml-exec-mode 'plantuml)

(add-hook 'org-mode-hook
          (lambda ()
            (setopt prettify-symbols-alist
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

(setopt org-hide-emphasis-markers t)
(setopt org-pretty-entities t)
(setopt org-pretty-entities-include-sub-superscripts t)
(setopt org-use-sub-superscripts '{})
(setopt org-export-with-sub-superscripts '{})

(global-set-key (kbd "C-c a") 'org-agenda)

(setopt org-agenda-files (list
                          (concat org-directory "/agenda/")
                          "~/Nextcloud/phantomOS/org/phantomos.org"))

(setopt org-refile-targets '((org-agenda-files . (:maxlevel . 1))))
(advice-add 'org-refile :after 'org-save-all-org-buffers)

(setopt org-default-notes-file (concat org-directory "/agenda/notes.org")
				diary-file (concat org-directory "/agenda/diary")
				org-archive-location (concat org-directory "/archive/%s_archive::datetree/"))

(setopt org-agenda-include-diary t
        calendar-date-style 'european)

(setopt org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d)")
          (sequence "|" "AXED(a)")))

(setopt org-stuck-projects
        '("+LEVEL=2/-DONE-AXED" ("TODO" "NEXT" "NEXTACTION") nil ""))

(setopt org-enforce-todo-dependencies t
        org-enforce-todo-checkbox-dependencies t)

(setopt org-tag-persistent-alist '((:startgroup . nil)
                                   ("@work" . ?W) ("@home" . ?H)
                                   (:endgroup . nil)))

(setopt org-log-into-drawer t)

(add-to-list 'org-modules 'org-habit)
(add-to-list 'org-modules 'org-crypt)
(add-to-list 'org-modules 'org-ctags)
(add-to-list 'org-modules 'org-mouse)

(add-to-list 'org-export-backends 'beamer)
(add-to-list 'org-export-backends 'man)
(add-to-list 'org-export-backends 'md)

(setopt org-agenda-custom-commands
        `(("p" "Programming"
           ((todo "TODO"))
           ((org-agenda-files (list ,(concat org-directory "/agenda/programming.org")))))
          ("h" "Home"
           ((tags "@home /+TODO"
                  ((org-agenda-overriding-header "Home Tasks")))
            (tags "@home /+DONE"
                  ((org-agenda-overriding-header "Completed")
                   (org-agenda-max-entries 3)))
            (tags "@home /+AXED"
                  ((org-agenda-overriding-header "Cancelled")))))
          ("w" "Work"
           ((tags "@work /+TODO"
                  ((org-agenda-overriding-header "Work Tasks")))
            (tags "@work /+DONE"
                  ((org-agenda-overriding-header "Completed")
                   (org-agenda-max-entries 3)))
            (tags "@work /+AXED"
                  ((org-agenda-overriding-header "Cancelled")))))))

(add-hook 'ses-mode-hook (lambda () (display-line-numbers-mode 0)))

(global-set-key (kbd "C-c c") 'org-capture)

(setq-default org-capture-templates
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

(setopt gnus-use-dribble-file nil)
(setopt gnus-directory "~/.news")

(require 'gnus-demon)
(gnus-demon-init)
(add-hook 'gnus-startup-hook
          (apply-partially #'gnus-demon-add-handler 'gnus-demon-scan-news 5 t))

(setopt
 gnus-select-method '(nntp "news.gmane.io")
 gnus-newsgroup-maximum-articles 50)

(setopt gnus-secondary-select-methods
      '((nnimap "gmail"
                (nnimap-address "imap.gmail.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl))))

(setopt user-mail-address "rumen.valmitov@gmail.com"
      user-full-name    "Rumen Mitov")

(setopt smtpmail-smtp-server 		     "smtp.gmail.com"
      smtpmail-smtp-user                       "rumen.valmitov@gmail.com"
      smtpmail-servers-requiring-authorization "smtp.gmail.com"
      send-mail-function   		     'smtpmail-send-it
      smtpmail-smtp-service                    465
      smtpmail-stream-type                     'ssl)

(setopt auth-sources '("~/.authinfo.gpg"))

(setopt newsticker-url-list '(
                              ("HackerNews" "https://hnrss.org/frontpage" nil nil nil)
                              ("Suckless" "https://suckless.org/atom.xml" nil nil nil)                                
                              ("Guardian - Europe" "https://www.theguardian.com/europe/rss" nil nil nil)
                              ("The Atlantic" "https://www.theatlantic.com/feed/all/" nil nil nil)
                              ("The Verge" "https://theverge.com/rss/index.xml" nil nil nil)
                              ("EndGadget" "https://engadget.com/rss.xml" nil nil nil)
                              ("AlternativeTo" "https://feed.alternativeto.net/news/all" nil nil nil)
                              ("Guardian - Tech" "https://www.theguardian.com/uk/technology/rss" nil nil nil)))

(setopt newsticker-groups '(
                          "News"
                          ("World News" "Guardian - Europe" "The Atlantic")
                          ("Tech News" "The Verge" "EndGadget" "AlternativeTo" "Guardian - Tech")
                          ("Mailing Lists" "HackerNews" "Suckless")))


(add-hook 'newsticker-mode-hook 'imenu-add-menubar-index)
(add-hook 'newsticker-treeview-mode-hook (lambda ()
                                           (setq-local browse-url-browser-function 'eww-browse-url)))

(setopt visible-bell t
			  use-short-answers t
			  use-dialog-box nil)

(require 'package)
(add-to-list 'package-archives '("meta" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package-ensure)
(setopt use-package-always-ensure t)

(use-package evil
  :ensure t
  :config
  (evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle)
  (evil-set-initial-state 'xref--xref-buffer-mode 'emacs)
  (evil-set-initial-state 'newsticker-mode 'emacs)
  (evil-set-initial-state 'ses-mode 'emacs))

(evil-mode 1)

(use-package beacon)
(beacon-mode 1)

(use-package undo-tree)
(global-undo-tree-mode)
(setopt undo-tree-auto-save-history t
				undo-tree-history-directory-alist `(("." . ,(concat emacs-directory "/undo")))
				undo-tree-visualizer-diff t)

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
