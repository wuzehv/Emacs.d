;; mode
(defun my_prog_mode_setting()
  "program setting"
  (display-line-numbers-mode t)
  (whitespace-mode t)
  (flycheck-mode t)
  (hungry-delete-mode t))

(defun my_php_mode_setting()
  "php mode setting"
  (setq indent-tabs-mode t)
  (setq-default tab-width 4)
  (company-mode t)
  (make-local-variable 'company-backends)
  (add-to-list 'company-backends #'company-tabnine))

(defun my_sh_mode_setting()
  "php mode setting"
  (company-mode t)
  (require 'company-shell)
  (company-mode t)
  (add-to-list 'company-backends 'company-shll))

(defun my_web_mode_setting()
  "web mode setting"
  (setq-default tab-width 4)
  (setq indent-tabs-mode t))

(defun my_c_mode_setting()
  "web mode setting"
  (setq indent-tabs-mode t)
  (local-set-key (kbd "C-c C-c") 'misc/c-compile)
  (setq default-tab-width 4)
  (setq c-default-style "Linux")
  (setq c-basic-offset 4))

(add-hook 'prog-mode-hook 'my_prog_mode_setting)

(add-hook 'php-mode-hook 'my_php_mode_setting)

(add-hook 'sh-mode-hook 'my_sh_mode_setting)

(add-hook 'web-mode-hook 'my_web_mode_setting)

(add-hook 'c-mode-hook 'my_c_mode_setting)

(add-hook 'helm-minibuffer-set-up-hook
          'misc/helm-hide-minibuffer-maybe)

(add-hook 'youdao-dictionary-mode-hook #'(lambda ()
                                           (evil-emacs-state)))

(provide 'mode-hook)
