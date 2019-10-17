(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/") ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package evil
  :init
  ;; 这个必须放在evil-mode生效之前
  (use-package evil-leader
    :after evil
    :init
    (evil-leader/set-key
      ;; 常用
      "e" 'misc/open-init-file
      "SPC" 'helm-buffers-list
      "TAB" 'misc/switch-to-previous-buffer
      "r" 'helm-recentf

      ;; file
      "ff" 'helm-find-files
      "fy" 'misc/put-file-name-on-clipboard
      "fs" 'helm-ag-this-file
      "fd" 'misc/delete-current-file-copy-to-kill-ring
      "fr" 'misc/rename-file-and-buffer

      ;; buffer
      "by" 'misc/copy-all-or-region
      "bk" 'kill-this-buffer

      ;; project
      "pf" 'helm-projectile-find-file
      "pp" 'helm-projectile-switch-project
      "pi" 'projectile-invalidate-cache
      "ps" 'helm-projectile-ag

      "x" 'helm-M-x
      "v" 'er/expand-region
      "jf" 'helm-imenu
      "d" 'dired-jump
      "i" 'iedit-mode
      "fc" 'recentf-cleanup
      "jc" 'ace-jump-char-mode

      ;; window
      "w/" 'split-window-right
      "w-" 'split-window-below
      "wm" 'delete-other-windows
      "1" 'winum-select-window-1
      "2" 'winum-select-window-2
      "3" 'winum-select-window-3
      "4" 'winum-select-window-4

      ;; org
      "oc" 'org-capture
      "or" 'org-archive-subtree
      "oa" 'org-agenda
      )
    :ensure t
    :config
    (global-evil-leader-mode))
  :ensure t
  :defer .1
  :config
  (progn
    (evil-mode)
    ;; insert mode下使用emacs键位
    ;; 移除insert本身的键位
    (setcdr evil-insert-state-map nil)
    ;; 绑定emacs到insert
    (define-key evil-insert-state-map
      (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
    ;; esc切换回insert
    (define-key evil-insert-state-map [escape] 'evil-normal-state))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  (use-package evil-nerd-commenter
    :after evil
    :ensure t
    :config
    (evilnc-default-hotkeys)
    (define-key evil-normal-state-map (kbd ",,") 'evilnc-comment-or-uncomment-lines)
    (define-key evil-visual-state-map (kbd ",,") 'evilnc-comment-or-uncomment-lines)))

;; 启动界面
(use-package dashboard
  :ensure t
  :config
  (progn
    (dashboard-setup-startup-hook)
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-banner-logo-title "Welcome to Emacs World!")
    (setq dashboard-startup-banner "~/.emacs.d/banner.png")
    (setq dashboard-center-content t)
    (setq dashboard-show-shortcuts nil)
    (setq dashboard-footer "by wuzehui")
    (setq dashboard-items '((recents . 5)))))

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init))

;; better default
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode))

;; dired
(use-package dired-x
  :config
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)
  (put 'dired-find-alternate-file 'disabled nil)
  ;; 延迟加载
  (with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)))

(use-package aweshell
  :ensure nil)

(use-package winum
  :ensure t)

(use-package helm
  :after evil
  :ensure t
  :init
  (setq helm-split-window-in-side-p           t
        helm-move-to-line-cycle-in-source     t
        helm-ff-search-library-in-sexp        t
        helm-scroll-amount                    8
        helm-ff-file-name-history-use-recentf t
        helm-autoresize-max-height 0
        helm-autoresize-min-height 20
        helm-ag-insert-at-point 'symbol)
  (define-key evil-normal-state-map (kbd "RET") 'helm-recentf)
  (global-set-key (kbd "M-x") 'helm-M-x)
  :config
  (progn
    (define-key helm-map [escape] 'helm-keyboard-quit)
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z")  'helm-select-action)
    (add-hook 'helm-minibuffer-set-up-hook
              'misc/helm-hide-minibuffer-maybe))
  (use-package helm-ag
    :ensure t)
  (use-package helm-projectile
    :ensure t)
  (use-package helm-swoop
    :ensure t))

(use-package smooth-scrolling
  :ensure t
  :init
  (setq scroll-conservatively 10)
  (setq scroll-margin 7)
  :config
  (smooth-scrolling-mode t))

(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

(use-package popwin
  :ensure t
  :config
  (popwin-mode t))

(use-package web
  :ensure t
  :mode ("\\.html?\\'" . web-mode)
  :mode ("\\.tpl.php?\\'" . web-mode))

(use-package company
  :ensure t
  :init
  (setq company-idle-delay 0)
  (setq company-show-numbers t)
  :config
  (company-tng-configure-default)
  (setq company-frontends
        '(company-tng-frontend
          company-pseudo-tooltip-frontend
          company-echo-metadata-frontend)))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t))

(add-hook 'prog-mode-hook 'hook/prog-mode-setting)
(add-hook 'c-mode-hook #'(lambda()
                           (setq c-default-style "Linux")
                           (setq c-basic-offset 4)))

(add-hook 'python-mode-hook #'(lambda ()
                                (setq indent-tabs-mode nil)))

(use-package youdao-dictionary
  :ensure t
  :config
  (add-hook 'youdao-dictionary-mode-hook #'(lambda ()
                                             (evil-emacs-state))))

(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save))

(use-package ace-jump-mode
  :ensure t)

(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package lua-mode
  :ensure t)

(use-package expand-region
  :ensure t)

(use-package php-mode
  :ensure t)

(use-package ob-php
  :ensure nil)

(use-package htmlize
  :ensure t)

(provide 'init-packages)
