;; mode
(global-evil-leader-mode)
(evil-mode t)

;; program
(add-hook 'prog-mode-hook
	      'linum-mode)

(add-hook 'php-mode-hook (lambda() (setq indent-tabs-mode t)))
(add-hook 'web-mode-hook (lambda() (setq indent-tabs-mode t)))

(require 'expand-region)

(require 'projectile)
(projectile-global-mode +1)

(require 'helm-projectile)
(helm-projectile-on)

(setq-default tab-width 4)

(provide 'my_mode_hook)
