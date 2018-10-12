;; mode
(global-evil-leader-mode)
(evil-mode t)

(add-hook 'prog-mode-hook 'my_prog_mode_setting)

(add-hook 'php-mode-hook 'my_php_mode_setting)

(require 'expand-region)

(require 'projectile)
(projectile-global-mode +1)

(require 'helm-projectile)
(helm-projectile-on)

(add-to-list 'load-path "~/.emacs.d/snippets")
(require 'yasnippet)
(yas-global-mode t)

(require 'evil-surround)
(global-evil-surround-mode)

(evilnc-default-hotkeys)

(which-key-mode t)

(require 'popwin)
(popwin-mode t)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl.php?\\'" . web-mode))

(provide 'my_mode_hook)
