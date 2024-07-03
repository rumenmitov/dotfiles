(setq inhibit-startup-message t)
(setq initial-scratch-message ";; -- Welcome to Emacs --\n\n")

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

(load-theme 'deeper-blue 1)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(setq recentf-max-saved-items 10)

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

(setopt completion-fail-discreetly t)

(define-key icomplete-vertical-mode-minibuffer-map (kbd "TAB") 'icomplete-force-complete)
(define-key icomplete-vertical-mode-minibuffer-map (kbd "RET") 'icomplete-force-complete-and-exit)

(add-hook 'post-self-insert-hook 'completion-help-at-point)
(add-hook 'minibuffer-mode-hook (lambda () (remove-hook 'post-self-insert-hook 'completion-help-at-point)))
(add-hook 'minibuffer-exit-hook (lambda () (add-hook 'post-self-insert-hook 'completion-help-at-point)))

(setq compile-command "make ")
(setq gdb-show-main t)

(add-hook 'gdb-breakpoints-mode-hook
          (lambda () (gdb-load-window-configuration "~/.config/emacs/gdb-window-config")))

(setq org-directory "~/Other/Nextcloud/org")
(setq org-default-notes-file (concat org-directory "/agenda/notes.org"))
(setq org-agenda-files '("~/Other/Nextcloud/org/agenda"))
(setq org-agenda-include-diary t)
(setq diary-file "~/Other/Nextcloud/org/agenda/diary")
(setq calendar-date-style 'european)
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'org-toggle-inline-images)
(setq org-hide-emphasis-markers t)

(setq visible-bell 1)
(setq use-short-answers t)
(add-to-list 'default-frame-alist '(alpha-background . 80))

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
(global-set-key (kbd "C-c n") 'yas-next-field)
(global-set-key (kbd "C-c p") 'yas-prev-field)

(use-package haskell-mode)
(use-package go-mode)
(use-package rust-mode)
(use-package nix-mode)

(add-hook 'haskell-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'nix-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(require 'flymake)
(define-key flymake-mode-map (kbd "C-x M-]") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "C-x M-[") 'flymake-goto-prev-error)
