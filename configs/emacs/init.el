(setq custom-file "~/.emacs.d/custom.el")
(load custom-file :no-error-if-file-is-missing)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq inhibit-startup-screen t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq make-backup-files nil)

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox t))

(use-package ansi-color
  :hook
  (compilation-filter . ansi-color-compilation-filter))
