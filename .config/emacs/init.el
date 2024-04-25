(setq inhibit-startup-message t)
(setq initial-scratch-message ";; -- Welcome to Emacs --\n\n")

(defun display-startup-echo-area-message ()
  (message nil))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font "CaskaydiaCove Nerd Font 12" nil t)

(global-display-line-numbers-mode 1)

(load-theme 'deeper-blue' t)

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(setq recentf-max-saved-items 10)

(icomplete-vertical-mode)
(fido-vertical-mode)
(electric-pair-mode)

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

(setq use-short-answers t)

(add-hook 'org-mode-hook 'org-indent-mode)

(require 'package)
(add-to-list 'package-archives '("meta" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package haskell-mode)
(use-package go-mode)
(use-package rust-mode)

(setq rust-cargo-bin "/nix/store/3kx3456vvdnp8p28glgf8lbzgw1lb7s4-system-path/bin/cargo")

(add-hook 'haskell-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(require 'flymake)
(define-key flymake-mode-map (kbd "C-x M-]") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "C-x M-[") 'flymake-goto-prev-error)
