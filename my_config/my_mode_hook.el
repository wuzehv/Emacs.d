;; mode
(global-evil-leader-mode)
(evil-mode t)

(setq-default tab-width 4)

(add-hook 'prog-mode-hook
		  '(lambda ()
			 (linum-mode t)
			 (hungry-delete-mode t)))

(add-hook 'php-mode-hook
          '(lambda ()
			 (setq indent-tabs-mode t)
             (require 'company-php)
             (company-mode t)
             (ac-php-core-eldoc-setup)
             (make-local-variable 'company-backends)
			 (add-to-list 'company-backends 'company-ac-php-backend)))

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

(require 'popwin)
(popwin-mode 1)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl.php?\\'" . web-mode))

(provide 'my_mode_hook)
