;; mode
(global-evil-leader-mode)
(evil-mode t)

(setq-default tab-width 4)

(add-hook 'prog-mode-hook 'linum-mode)

(add-hook 'php-mode-hook (lambda() (setq indent-tabs-mode t)))
(add-hook 'web-mode-hook (lambda() (setq indent-tabs-mode t)))

(require 'expand-region)

(require 'projectile)
(projectile-global-mode +1)

(require 'helm-projectile)
(helm-projectile-on)

(add-to-list 'load-path
              "~/.emacs.d/snippets")
(require 'yasnippet)
(yas-global-mode 1)

(require 'evil-surround)
(global-evil-surround-mode)

(evilnc-default-hotkeys)

(which-key-mode t)

(provide 'my_mode_hook)
