;; package
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar misc/packages '(
                      evil
                      evil-leader
                      evil-surround
                      evil-nerd-commenter

                      company
                      company-go

                      helm
                      helm-ag
                      helm-projectile
                      helm-swoop

                      ;; ui相关
                      monokai-theme
                      doom-modeline
                      org-bullets
                      dashboard

                      ;; 工程相关
                      projectile
                      magit

                      smooth-scrolling
                      hungry-delete
                      expand-region
                      which-key
                      popwin
                      disable-mouse
                      iedit
                      use-package
                      winum
                      youdao-dictionary
                      exec-path-from-shell

                      ;; 编程相关
                      yasnippet
                      markdown-mode
                      php-mode
                      web-mode
                      lua-mode
                      haskell-mode
                      go-mode
                      ) "Default packages")

(setq package-selected-packages misc/packages)

(defun misc/packages-installed-p ()
  (loop for pkg in misc/packages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (misc/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg misc/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(provide 'init-packages)
