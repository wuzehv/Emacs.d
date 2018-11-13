;; mode
(global-evil-leader-mode)
(evil-mode t)

(add-hook 'prog-mode-hook 'my_prog_mode_setting)

(add-hook 'php-mode-hook 'my_php_mode_setting)

(add-hook 'web-mode-hook 'my_web_mode_setting)

(winum-mode)

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t
      helm-autoresize-max-height 0
      helm-autoresize-min-height 20)

(add-hook 'helm-minibuffer-set-up-hook
          'my-helm-hide-minibuffer-maybe)

(smooth-scrolling-mode t)

(use-package projectile
  :config
  (projectile-global-mode +1))

(use-package helm-projectile
  :config
  (helm-projectile-on))

(use-package yasnippet
  :load-path "~/.emacs.d/snippets"
  :config
  (yas-global-mode t))

(global-evil-surround-mode)

(evilnc-default-hotkeys)

(which-key-mode t)

(use-package popwin
  :config
  (popwin-mode t))

(use-package web
  :mode ("\\.html?\\'" . web-mode)
  :mode ("\\.tpl.php?\\'" . web-mode))

(provide 'my_mode_hook)
