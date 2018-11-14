;; package
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
                      evil
                      evil-leader
                      company
                      company-php
                      ac-php
                      hungry-delete
                      php-mode
                      helm
                      helm-ag
                      helm-projectile
                      tao-theme
                      doom-themes
                      projectile
                      org-bullets
                      doom-modeline
                      expand-region
                      yasnippet
                      evil-surround
                      evil-nerd-commenter
                      which-key
                      popwin
                      web-mode
                      disable-mouse
                      iedit
                      use-package
                      winum
                      smooth-scrolling
                      magit
                      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(provide 'init_package)
