;; mode
(defun hook/prog-mode-setting()
  "program setting"
  (setq indent-tabs-mode t)
  (setq-default tab-width 4)
  (display-line-numbers-mode t)
  (hungry-delete-mode t)
  (company-mode t)
  (projectile-mode t)
  (helm-projectile-on)
  (yas-global-mode t)
  (local-set-key (kbd "C-c C-c") 'misc/compile-and-run))

(defun hook/c-mode-setting()
  "c mode setting"
  (setq c-default-style "Linux")
  (setq c-basic-offset 4))

(defun hook/python-mode-setting()
  "python mode setting"
  (setq indent-tabs-mode nil))

(add-hook 'prog-mode-hook 'hook/prog-mode-setting)

(add-hook 'c-mode-hook 'hook/c-mode-setting)

(add-hook 'python-mode-hook 'hook/python-mode-setting)

(add-hook 'helm-minibuffer-set-up-hook
          'misc/helm-hide-minibuffer-maybe)

(add-hook 'youdao-dictionary-mode-hook #'(lambda ()
                                           (evil-emacs-state)))

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda ()
						  (set (make-local-variable 'company-backends) '(company-go))
						  (company-mode)))

(provide 'mode-hook)
