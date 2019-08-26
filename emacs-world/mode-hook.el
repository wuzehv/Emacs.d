;; mode
(defun my_prog_mode_setting()
  "program setting"
  (setq indent-tabs-mode t)
  (setq-default tab-width 4)
  (display-line-numbers-mode t)
  (flycheck-mode t)
  (hungry-delete-mode t)
  (company-mode t)
  (projectile-mode t)
  (helm-projectile-on)
  (yas-global-mode t))

(defun my_c_mode_setting()
  "c mode setting"
  (local-set-key (kbd "C-c C-c") 'misc/c-compile)
  (setq c-default-style "Linux")
  (setq c-basic-offset 4))

(add-hook 'prog-mode-hook 'my_prog_mode_setting)

(add-hook 'c-mode-hook 'my_c_mode_setting)

(add-hook 'helm-minibuffer-set-up-hook
          'misc/helm-hide-minibuffer-maybe)

(add-hook 'youdao-dictionary-mode-hook #'(lambda ()
                                           (evil-emacs-state)))

(provide 'mode-hook)
