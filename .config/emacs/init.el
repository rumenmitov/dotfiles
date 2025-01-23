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
                            (font . "Hack Nerd Font Mono 18")
                            (vertical-scroll-bars . nil)
                            ))

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq display-line-numbers-current-absolute t)

(load-theme 'deeper-blue 1)
(add-to-list 'default-frame-alist '(alpha-background . 80))

(custom-set-faces
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

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(setq recentf-max-saved-items 10)
(save-place-mode 1)

(icomplete-vertical-mode)
(fido-vertical-mode)

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

(add-hook 'post-self-insert-hook 'completion-help-at-point)
(add-hook 'minibuffer-mode-hook (lambda () (remove-hook 'post-self-insert-hook 'completion-help-at-point)))
(add-hook 'minibuffer-exit-hook (lambda () (add-hook 'post-self-insert-hook 'completion-help-at-point)))

(setq tab-width 4)
(setq c-default-style "bsd"
      c-basic-offset tab-width)

(setq compile-command "make ")
(setq gdb-show-main t)
(setq gdb-many-windows t)
(setq gdb-default-window-configuration-file "~/.config/emacs/gdb-window-config")

(setq comment-auto-fill-only-comments t)

(add-hook 'prog-mode-hook 'auto-fill-mode)

(add-hook 'c-mode-common-hook (lambda ()
                         (c-toggle-auto-newline 1)))

(add-hook 'c-mode-common-hook 'electric-pair-mode)

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

(setq org-clock-sound "~/.config/emacs/assets/org-clock-sound.wav")

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
                    ("#+email:"    . ?) 
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

(setq org-directory "~/Nextcloud/org")
(setq org-default-notes-file (concat org-directory "/agenda/notes.org"))
(setq org-agenda-files (list (concat org-directory "/agenda/")))
(setq org-agenda-include-diary t)
(setq diary-file (concat org-directory "/agenda/diary"))
(setq calendar-date-style 'european)

(setq org-tag-persistent-alist '((:startgroup . nil)
                                 ("@work" . ?W) ("@home" . ?H)
                                 (:endgroup . nil)))

(setq org-agenda-custom-commands
      '(("p" "Programming"
         ((todo "TODO"))
         ((org-agenda-files (list (concat org-directory "/agenda/programming.org")))))))

(setq org-archive-location (concat org-directory "/archive/%s_archive::datetree/"))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates
        '(("t"
           "Todo"
           entry
           (file "~/Nextcloud/org/agenda/notes.org")
           (file "~/.config/emacs/templates/todo.tmpl"))
          ("e"
           "Email"
           entry
           (file "~/Nextcloud/org/agenda/notes.org")
           (file "~/.config/emacs/templates/email.tmpl"))
          ("j"
           "Journal"
           plain
           (file+datetree "~/Nextcloud/org/journal.org")
           (file "~/.config/emacs/templates/journal.tmpl"))
          ("p"
           "Programming"
           entry
           (file "~/Nextcloud/org/agenda/programming.org")
           (file "~/.config/emacs/templates/programming.tmpl"))))

(setq gnus-use-dribble-file nil)
(setq gnus-directory "~/.news")
(setq message-directory "~/Nextcloud/mail")
(setq nnfolder-directory "~/Nextcloud/mail/archive")

(require 'gnus-demon)
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
(setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo")))
(setq undo-tree-visualizer-diff t)

(use-package yasnippet)
(use-package yasnippet-snippets)
(yas-global-mode)
(define-key yas-minor-mode-map (kbd "C-c y") 'yas-insert-snippet)
(global-set-key (kbd "M-/") 'hippie-expand)
(add-to-list 'hippie-expand-try-functions-list 'yas-hippie-try-expand t)

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

(require 'flymake)
(define-key flymake-mode-map (kbd "C-x .") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "C-x ,") 'flymake-goto-prev-error)
