(setopt emacs-directory "~/.config/emacs")
(setopt org-directory "~/Nextcloud/org")

(auto-save-visited-mode 1)

(setopt backup-directory-alist `((".*" . ,(concat emacs-directory "/backups/"))))
(setopt auto-save-file-name-transforms `((".*" ,(concat emacs-directory "/auto-saves/") t)))

(setopt inhibit-startup-message t)
(setopt initial-scratch-message ";; -- Welcome to Emacs --\n\n")

(defun display-startup-echo-area-message ()
  (message nil))

(setopt server-client-instructions nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default mode-line-format nil)

(setopt default-frame-alist '(
                              (font . "JetBrains Mono Light 12")
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

(load-theme 'leuven-dark 1)

(setopt modus-themes-bold-constructs t
        modus-themes-italic-constructs t
        modus-themes-disable-other-themes t
        modus-themes-custom-auto-reload t)

(add-to-list 'default-frame-alist '(alpha-background . 100))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completions-common-part ((t (:weight bold))))
 '(completions-first-difference ((t (:inherit completions-common-part :underline t))))
 '(cursor ((t (:background "PaleVioletRed3"))))
 '(ediff-current-diff-C ((t (:background "burlywood" :foreground "saddle brown"))))
 '(font-lock-constant-face ((t (:inherit default :foreground "'unspecified"))))
 '(font-lock-function-name-face ((t (:inherit default :foreground "'unspecified"))))
 '(font-lock-keyword-face ((t (:inherit nil :foreground "'unspecified" :weight normal))))
 '(font-lock-string-face ((t (:inherit default :foreground "'unspecified"))))
 '(font-lock-type-face ((t (:inherit default :foreground "'unspecified"))))
 '(font-lock-variable-name-face ((t (:inherit default :foreground "'unspecified"))))
 '(gnus-summary-cancelled ((t (:extend t :strike-through t))))
 '(highlight ((t (:background "black" :foreground "white" :weight extra-bold))))
 '(icomplete-first-match ((t (:foreground "magenta" :weight bold))))
 '(isearch ((t (:background "'unspecified" :foreground "red" :underline nil))))
 '(lazy-highlight ((t (:background "'unspecified" :foreground "orange red"))))
 '(line-number ((t (:inherit default :background nil))))
 '(line-number-current-line ((t (:inherit default :background nil))))
 '(minibuffer-prompt ((t (:background "#00000000" :weight bold))))
 '(org-agenda-date ((t (:foreground "#ec9d5a" :weight normal :height 1.1))))
 '(org-agenda-date-today ((t (:background "#25205900" :weight bold :height 1.1))))
 '(org-agenda-date-weekend ((t (:foreground "deep sky blue" :overline t :weight normal :height 1.1))))
 '(org-agenda-diary ((t (:background "#57272300" :foreground "#ff74ff" :slant italic :weight regular))))
 '(org-agenda-dimmed-todo-face ((t (:foreground "dim gray"))))
 '(org-agenda-structure ((t (:foreground "#e37233" :weight bold :height 1.3))))
 '(org-document-info-keyword ((t (:background "#00000000" :foreground "#ff7138"))))
 '(org-done ((t (:background "#127921" :foreground "lawn green" :box nil :overline t :weight bold))))
 '(org-inline-src-block ((t (:inherit nil))))
 '(org-level-1 ((t (:extend nil :background "#322d37" :foreground "white" :overline "white" :weight bold :height 1.1))))
 '(org-meta-line ((t (:inherit font-lock-comment-face :background "#00000000" :foreground "#ff7138"))))
 '(org-scheduled-today ((t (:background "#25205900" :weight normal))))
 '(org-todo ((t (:background "#25374300" :foreground "red" :box nil :weight bold))))
 '(org-warning ((t (:background "#ffffff00" :weight bold))))
 '(region ((t (:extend t :background "gray" :slant italic))))
 '(viper-minibuffer-insert ((t nil))))

(custom-theme-set-faces
 'leuven-dark
 '(org-block ((t (:inherit shadow
                           :extend t
                           :background "black"
                           :foreground "white"
                           :slant italic
                           :height 0.9))))
 
 '(org-block-begin-line ((t (:inherit org-meta-line
                                      :extend t
                                      :background "black"
                                      :foreground "white"
                                      :box (:line-width (1 . 1) :color "grey75" :style pressed-button)
                                      :weight bold))))
 
 '(org-block-end-line ((t (:inherit org-block-begin-line
                                    :extend t
                                    :box (:line-width (1 . 1) :color "grey75" :style released-button))))))

(winner-mode 1)
(keymap-global-set "C-<" 'winner-undo)
(keymap-global-set "C->" 'winner-redo)

(windmove-default-keybindings)
(keymap-global-set "C-c C-w h" 'windmove-left)
(keymap-global-set "C-c C-w l" 'windmove-right)
(keymap-global-set "C-c C-w k" 'windmove-up)
(keymap-global-set "C-c C-w j" 'windmove-down)

(setopt display-buffer-alist
        `(("Org Agenda" (display-buffer-full-frame))
          (,(rx
             (literal "*")
             (or "Man" "Help")
             (* anychar)
             (literal "*"))
           (display-buffer-full-frame))))

(setopt window-min-height 10)
(setopt window-min-width 30)

;; The desired ratio of the focused window's size.
(setopt auto-resize-ratio 0.7)

(defun win/auto-resize ()
  (if (not (minibufferp))
      (let* (
             (height (floor (* auto-resize-ratio (frame-height))))
             (width (floor (* auto-resize-ratio (frame-width))))
             ;; INFO We need to calculate by how much we should enlarge
             ;; focused window because Emacs does not allow setting the
             ;; window dimensions directly.
             (h-diff (max 0 (- height (window-height))))
             (w-diff (max 0 (- width (window-width)))))
        (enlarge-window h-diff)
        (enlarge-window w-diff t))))

(advice-add 'select-window :after (lambda (&rest args)
                                         (win/auto-resize)))

(which-key-mode 1)

(recentf-mode 1)
(keymap-global-set "C-x C-r" 'recentf-open-files)
(setopt recentf-max-saved-items 10)
(save-place-mode 1)

(global-completion-preview-mode t)
(fido-mode t)

(setopt completion-preview-minimum-symbol-length 1
			  completion-auto-select 'second-tab
			  completion-auto-help nil
			  completion-show-help nil
			  completion-ignore-case t
        completion-styles '(flex basic partial-completion)
			  read-buffer-completion-ignore-case t
			  read-file-name-completion-ignore-case t
			  icomplete-in-buffer t
			  completions-format 'one-column
			  imenu-auto-rescan t
			  completion-fail-discreetly t
			  completions-detailed t
			  completions-sort 'historical)

(keymap-global-set "M-n" 'completion-preview-next-candidate)
(keymap-global-set "M-p" 'completion-preview-prev-candidate)

;; INFO We want the minibuffer to populate as much of the frame as
;; possible.
(setopt max-mini-window-height 10)

;; NOTE This will prevent the resize of the echo area as well as the
;; minibuffer area.
(setopt resize-mini-windows nil)


(use-package icomplete
  :bind
  (:map icomplete-minibuffer-map
        ("<tab>"      . 'icomplete-forward-completions)
        ("<backtab>"  . 'icomplete-backward-completions)))


(advice-add 'read-from-minibuffer
            :around (lambda (oldfn &rest r)
                      (let* ((frame (make-frame '((title . "minibuffer-float")
                                                  (minibuffer . only)))))
                        (unwind-protect
                            (apply oldfn r)
                          (delete-frame frame)))))

(setq-default tab-width 2)
(setq-default tab-always-indent nil)
(setq-default indent-tabs-mode nil)
(setq-default c-default-style "bsd"
	            c-basic-offset tab-width
              c-tab-always-indent nil)
(setq-default comment-auto-fill-only-comments t)

(require 'ansi-color)
(add-hook 'compilation-filter-hook (lambda ()
                                     (ansi-color-apply-on-region compilation-filter-start (point-max))))

(setopt ediff-window-setup-function 'ediff-setup-windows-plain)

(setopt compile-command "make "
				gdb-show-main t
				gdb-many-windows t
        gdb-debuginfod-enable-setting t
        gdb-restore-window-configuration-after-quit t
        gdb-window-configuration-directory "~/.config/emacs/gdb-windows/"
				gdb-default-window-configuration-file (concat gdb-window-configuration-directory "io"))

(setopt enable-remote-dir-locals t)

(keymap-global-set "C-x g ."  'flymake-goto-next-error)
(keymap-global-set "C-x g ,"  'flymake-goto-prev-error)
(keymap-global-set "C-x g O"  'imenu)
(keymap-global-set "C-x g r s" 'eldoc)
(keymap-global-set "C-x g r d" 'xref-find-definitions)
(keymap-global-set "C-x g r r" 'xref-find-references)
(keymap-global-set "C-x g r i" 'eglot-find-implementation)
(keymap-global-set "C-x g r t" 'eglot-find-typeDefinition)
(keymap-global-set "C-x g r f" 'eglot-format)
(keymap-global-set "C-x g r n" 'eglot-rename)
(keymap-global-set "C-x g r a" 'eglot-code-actions)

(add-hook 'prog-mode-hook 'auto-fill-mode)

(add-hook 'c-mode-common-hook (lambda ()
                                (setq-local indent-line-function 'c-indent-line)))

(defface font-lock/todo-face '(
                               (t (:foreground "yellow"
                                               :background "black"
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
                               (t (:foreground "deep sky blue"
                                               :overline "deep sky blue"
                                               :underline "deep sky blue"
                                               :slant italic)))
  "INFO face")


(defface font-lock/safety-face '(
                               (t (:foreground "orange"
                                               :slant italic)))
  "SAFETY face")


(defvar custom/font/faces `((,(rx word-start "TODO" word-end) 0 'font-lock/todo-face prepend)
                            (,(rx word-start (or "BUG" "FIXME") word-end) 0 'font-lock/bug-face prepend)
                            (,(rx word-start (or "INFO" "NOTE") word-end) 0 'font-lock/info-face prepend)
                            (,(rx word-start "SAFETY" word-end) 0 'font-lock/safety-face prepend)))

(add-hook 'prog-mode-hook (lambda ()
                            (font-lock-add-keywords nil custom/font/faces)))

(require 'tempo)
(setq tempo-interactive t)

(keymap-global-set "C-c n" 'tempo-forward-mark)
(keymap-global-set "C-c p" 'tempo-backward-mark)

(defmacro tempo/setup-mode (MODE)
  "Create a tags-list, a template-definition function, and a
completion function for the symbol MODE.

The generated template-definition function `tempo/MODE/define' will have the following form:

	(tempo/MODE/define ELEMENTS TAG DOCUMENTATION)

`tempo/MODE/define' is just a wrapper for `tempo-define-template'.

Example:

	(tempo/setup-mode 'c-mode)
	;; creates the following:
	;; => tempo/c-mode/tags    - tags alist to store the snippets
	;; => tempo/c-mode/define  - function to define snippets for MODE
	;; => tempo/c-mode/cmpl    - completion function, added to `completion-at-point-functions'
	;;                           for that mode


  ;; then, to define snippets for c-mode:

	(tempo/c-mode/define
    '(\"if (\" p \") { \" p \" }\" p)
    \"if\"
    \"If snippet.\") 
"
  (let* (
         ;; INFO if we expect a symbol (e.g. 'foo) as a parameter,
         ;; MODE will be ''foo. So we need to strip one quote
         ;; to get the proper symbol name.
         (mode      		(symbol-name (eval MODE)))
         (tags-list 		(format "tempo/%s/tags" mode))
         (tag-name-fmt  (concat mode "--%s"))
         (mode-hook 		(format "%s-hook" mode))
         (define-fn 		(format "tempo/%s/define" mode))
         (cmpl-fn   		(format "tempo/%s/cmpl" mode)))
    
    `(progn
       (defvar ,(intern tags-list) nil
         ,(format "Auto-generated alist that will store all defined snippets for %s." mode))

       (defun ,(intern define-fn) (ELEMENTS TAG DOCUMENTATION)
         ,(format "Auto-generated wrapper for `tempo-define-template' for %s." mode)
         (tempo-define-template (format ,tag-name-fmt TAG)
                                ELEMENTS
                                TAG
                                DOCUMENTATION
                                (quote ,(intern tags-list))))

       
       (defun ,(intern cmpl-fn) ()
         ,(format "Auto-generated snippet completion function for %s." mode) 
         (save-excursion
           (let ((end (point)))
             (backward-word)
             (let ((beg (point)))
               ;; we return the form expectd by
               ;; `completion-at-point-functions'
               (list beg end ,(intern tags-list)
                     :exclusive 'no
                     :exit-function (lambda (str _status)
                                      ;; a completion was found!
                                      ;; delete the user input and call the snippet
                                      (backward-kill-word 1)
                                      (funcall-interactively
                                       (cdr (assoc str ,(intern tags-list))))))))))

       


       ;; hook completion function in MODE
       (add-hook (quote ,(intern mode-hook)) (lambda ()
                                               (add-hook
                                                'completion-at-point-functions
                                                (quote ,(intern cmpl-fn))
                                                ;; INFO the `tempo/MODE/cmpl' should be the first function
                                                ;; as other completion functions may not have :exclusive set
                                                ;; to 'no.
                                                -1
                                                t))))))

(setq
 c--main      '("int main(int argc, char *argv[]) {" n > p n "}")
 
 c--docbrief  '(> " @brief   " p)
 
 c--docparam  '(> " @param   " p)

 c--docret    '(> " @return  " p)

 c--todo      '(> "/* TODO " p " */" p)
 
 c--info      '(> "/* INFO " p " */" p)

 c--bug       '(> "/* BUG " p " */" p)

 c--switch    '(> "switch (" p ") {" p n> "}" p)

 c--case      '(> "case " p ": " p))

(tempo/setup-mode 'c-mode)

(tempo/c-mode/define c--main              "main"            "Snippet for main().")
(tempo/c-mode/define c--docbrief    			"docbrief" 				"Snippet for briefs in docstrings.")
(tempo/c-mode/define c--docparam    			"docparam" 				"Snippet for parameters in docstrings.")
(tempo/c-mode/define c--docret      			"docret"   				"Snippet for return values in docstrings.")
(tempo/c-mode/define c--todo        			"doctodo" 				"Snippet for TODO comments.")
(tempo/c-mode/define c--info        			"docinfo" 				"Snippet for INFO comments.")
(tempo/c-mode/define c--bug         			"docbug"  				"Snippet for BUG comments.")
(tempo/c-mode/define c--switch      			"switch"  				"Snippet for switch blocks.")
(tempo/c-mode/define c--case        			"case"    				"Snippet for case blocks.")

(tempo/setup-mode 'c++-mode)

(tempo/c++-mode/define c--main        "main"            "Snippet for main().")
(tempo/c++-mode/define c--docbrief    "docbrief" 				"Snippet for briefs in docstrings.")
(tempo/c++-mode/define c--docparam    "docparam" 				"Snippet for parameters in docstrings.")
(tempo/c++-mode/define c--docret      "docret"   				"Snippet for return values in docstrings.")
(tempo/c++-mode/define c--todo        "doctodo" 				"Snippet for TODO comments.")
(tempo/c++-mode/define c--info        "docinfo" 				"Snippet for INFO comments.")
(tempo/c++-mode/define c--bug         "docbug"  				"Snippet for BUG comments.")
(tempo/c++-mode/define c--switch      "switch"  				"Snippet for switch blocks.")
(tempo/c++-mode/define c--case        "case"    				"Snippet for case blocks.")

(require 'vc-git)

(defun git-prompt--untracked-files ()
  "Returns the number of untracked files in the current git repository.
If that number is zero, an empty string is returned."
  (let* ((untracked (string-trim (shell-command-to-string "git ls-files --others --exclude-standard | wc -l"))))
    (if (< 0 (string-to-number untracked))
        (concat untracked "🌱 ")
      "")))


(defun git-prompt--changed-files ()
  "Returns the number of changed files in the current git repository.
If that number is zero, an empty string is returned."  
  (let* ((changed (string-trim (shell-command-to-string "git ls-files --modified | wc -l"))))
    (if (< 0 (string-to-number changed))
        (concat changed "🛠️ ")
      "")))


(defun git-prompt--deleted-files ()
  "Returns the number of deleted files in the current git repository.
If that number is zero, an empty string is returned."
  (let* ((deleted (string-trim (shell-command-to-string "git ls-files --deleted | wc -l"))))
    (if (< 0 (string-to-number deleted))
        (concat deleted "🗑️ ")
      "")))


(defun eshell-prompt--git-prompt ()
  "Detects if current directory is in a git directory.
If it is, returns the number of untracked, changed, and deleted files as a string."
  (if-let* ((git-symb (propertize "  " 'face '(:foreground "orange red")))
            (branch (car (vc-git-branches))))
      (let* ((branch-col (propertize branch 'face '(:foreground "lawn green"))))
        (propertize (concat git-symb branch-col " " (git-prompt--untracked-files) (git-prompt--changed-files) (git-prompt--deleted-files))))
    (propertize "")))


(setq-default eshell-banner-message "\n\n"
              eshell-prompt-function (lambda ()
                                       (concat
                                        (propertize (abbreviate-file-name (eshell/pwd)) 'face '(:foreground "magenta"))
                                        (eshell-prompt--git-prompt)
                                        (propertize " λ  "))))


(advice-add 'project-eshell :after #'hack-dir-local-variables-non-file-buffer)

(use-package esh-module
  :config
  (add-to-list 'eshell-modules-list 'eshell-elecslash))

(use-package em-cmpl
  :hook (eshell-cmpl-mode . (lambda ()
                              (setq-local completion-auto-help t))))

(require 'imenu)
(require 'org)

(appt-activate 1)

(setopt org-startup-with-inline-images t
        org-tags-column 90
        org-imenu-depth 7
        org-goto-interface 'outline-path-completion
        org-outline-path-complete-in-steps nil)

(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'diary-list-entries-hook 'diary-sort-entries t)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'ispell-minor-mode)
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook (lambda ()
                           (display-line-numbers-mode 0)
                           (setq-local completion-auto-help t)
                           (setq-local left-margin-width 5)
                           (setq-local right-margin-width 5)))

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

(keymap-global-set "C-c a" 'org-agenda)

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
                  ((org-agenda-overriding-header "Cancelled")))))
          ("T" "Thesis"
           ((tags "ADMIN"
                  ((org-agenda-overriding-header "Administration")))
            (tags "RESEARCH"
                  ((org-agenda-overriding-header "Research")))
            (tags "BUG"
                  ((org-agenda-overriding-header "Bugs"))))
           ((org-agenda-files (list "~/Nextcloud/university/semester_6/thesis/thesis.org"))))))

(add-hook 'ses-mode-hook (lambda () (display-line-numbers-mode 0)))

(keymap-global-set "C-c c" 'org-capture)

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

(setopt gnus-directory "~/Nextcloud/gnus")
(setopt gnus-startup-file (concat gnus-directory "/newsrc"))
(setopt nnml-directory (concat gnus-directory "/nnml"))

(setopt gnus-use-dribble-file nil)
(setopt gnus-message-archive-group nil)
(setopt gnus-save-killed-list nil)
(setopt gnus-check-new-newsgroups nil)
(setopt gnus-save-newsrc-file nil)

(require 'gnus-demon)
(gnus-demon-init)

(setopt gnus-select-method
      '(nnmaildir "email" (directory (concat gnus-directory "/email"))))

(add-to-list 'gnus-secondary-select-methods '(nntp "news.gwene.org"))

(setopt user-mail-address "rumenmitov@disroot.org"
      user-full-name    "Rumen Mitov")

(setopt smtpmail-smtp-server 		     "disroot.org"
      smtpmail-smtp-user                       "rumenmitov@disroot.org"
      smtpmail-servers-requiring-authorization "disroot.org"
      send-mail-function   		     'smtpmail-send-it
      smtpmail-smtp-service                    587
      smtpmail-stream-type                     'starttls)

(setopt auth-sources '("~/.authinfo.gpg"))

(add-hook 'gnus-get-new-news-hook '(lambda ()
                                     (start-process "offlineimap" nil "offlineimap")))

(use-package mpc
  :bind
  (:map mpc-mode-map
        ("<return>"     . mpc-select-toggle)
        ("S-<return>"   . mpc-select-extend)
        ("S"            . mpc-songs-search)
        ("K"            . mpc-songs-kill-search))

  (:map mpc-songs-mode-map
        ("a" . mpc-playlist-add)
        ("P" . mpc-playlist)
        ("=" . mpc-play)        
        ("d" . mpc-playlist-delete))
  
  :config
  (setopt mpc-browser-tags '(Filename)))

(setopt visible-bell nil
			  use-short-answers t
			  use-dialog-box nil
        disabled-command-function nil
        browse-url-browser-function 'eww-browse-url
        imenu-flatten 'prefix
        set-mark-command-repeat-pop t
        isearch-lazy-count t)

(repeat-mode 1)
(savehist-mode 1)

(use-package proced
  :config
  (setopt proced-auto-update-flag 'visible))

(require 'package)
(add-to-list 'package-archives '("meta" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package-ensure)
(setopt use-package-always-ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values '((org-archive-location . "::* Archived"))))
