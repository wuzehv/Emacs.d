;; mode
(global-evil-leader-mode)
(evil-mode t)

(add-hook 'prog-mode-hook 'my_prog_mode_setting)

(add-hook 'php-mode-hook 'my_php_mode_setting)

(add-hook 'web-mode-hook 'my_web_mode_setting)

(add-hook 'c-mode-hook 'my_c_mode_setting)

(winum-mode)

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t
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

;; (add-to-list 'load-path "~/.emacs.d/private/google-translate")
;; (require 'google-translate)
;; (setq-default google-translate-enable-ido-completion t)

;; (setq-default google-translate-default-source-language "en")
;; (setq-default google-translate-default-target-language "zh-CN")

(setq url-automatic-caching t)
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
(push "*Youdao Dictionary*" popwin:special-display-config)
(setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")

(provide 'my_mode_hook)
