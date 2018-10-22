;; mode
(global-evil-leader-mode)
(evil-mode t)

(add-hook 'prog-mode-hook 'my_prog_mode_setting)

(add-hook 'php-mode-hook 'my_php_mode_setting)

(add-hook 'web-mode-hook 'my_web_mode_setting)

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
