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
      "r" 'helm-recentf
      "d" 'dired-jump
      "v" 'er/expand-region
      "i" 'helm-imenu
      "j" 'ace-jump-char-mode
      "SPC" 'helm-buffers-list
      "TAB" 'misc/switch-to-previous-buffer

      ;; file
      "ff" 'helm-find-files
      "fy" 'misc/put-file-name-on-clipboard
      "fr" 'misc/rename-file-and-buffer

      ;; buffer
      "by" 'misc/copy-all-or-region
      "bk" 'kill-this-buffer

      ;; project
      "pf" 'helm-projectile-find-file
      "pp" 'helm-projectile-switch-project
      "pi" 'projectile-invalidate-cache
      "ps" 'helm-projectile-ag

      ;; lsp
      "gd" 'lsp-find-definition
      "gr" 'lsp-find-references

      ;; window
      "w/" 'split-window-right
      "w-" 'split-window-below
      "wm" 'delete-other-windows
      "1" 'select-window-1
      "2" 'select-window-2
      "3" 'select-window-3
      "4" 'select-window-4

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
    (define-key evil-insert-state-map [escape] 'evil-normal-state)
    (evil-define-key 'normal haskell-mode-map "o" 'misc/haskell-mode-map))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  (use-package evil-nerd-commenter
    :after evil
    :ensure t
    :config
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
    (setq dashboard-startup-banner (concat user-emacs-directory "banner.png"))
    (setq dashboard-center-content t)
    (setq dashboard-show-shortcuts nil)
    (setq dashboard-footer "by wuzehui")
    (setq dashboard-items '((recents . 5)))))

;; dired
(use-package dired-x
  :config
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)
  (put 'dired-find-alternate-file 'disabled nil)
  ;; 延迟加载
  (with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)))

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
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
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
    :ensure t
    :config
    (setq projectile-enable-caching t))
  (use-package helm-swoop
    :ensure t
    :config
    (global-set-key (kbd "C-s") 'helm-swoop)))

(use-package which-key
  :ensure t
  :config
  :hook (after-init . which-key-mode))

(use-package popwin
  :ensure t
  :config
  :hook (after-init . popwin-mode))

(use-package markdown-mode
  :ensure t)

(use-package web-mode
  :ensure t
  :mode ("\\.html?\\'" . web-mode)
  :mode ("\\.tpl.php?\\'" . web-mode)
  :mode ("\\.tpl?\\'" . web-mode))

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
  (setq exec-path-from-shell-check-startup-files nil)
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package go-mode
  :ensure t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'godoc-mode-hook #'(lambda ()
                                 (evil-emacs-state))))

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

(use-package htmlize
  :ensure t)

(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode 1))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

(use-package yaml-mode
  :ensure t)

(use-package nginx-mode
  :ensure t)

(use-package doom-modeline
  :ensure t
  :defer t
  :config
  (setq doom-modeline-buffer-file-name-style 'truncate-except-project)
  :hook (after-init . doom-modeline-init))

(use-package haskell-mode
  :ensure t)

(use-package iedit
  :ensure t)

(use-package google-translate
  :ensure t
  :config
  (defun google-translate--search-tkk ()
    "Search TKK. Fix search-failed \",tkk:'\""
    (list 430675 2721866130))
  :bind (
         ;; 光标下 英文到中文
         ("C-c t" . 'google-translate-at-point)
         ;; 光标下 中文到英文
         ("C-c r" . 'google-translate-at-point-reverse)
         ;; 手动输入 英文到中文
         ("C-c T" . 'google-translate-query-translate)
         ;; 手动输入 中文到英文
         ("C-c R" . 'google-translate-query-translate-reverse)))

(if (display-graphic-p)
    (progn
      (use-package doom-themes
        :ensure t
        :config
        (setq doom-themes-enable-bold t
              doom-themes-enable-italic t)
        (load-theme 'doom-one-light t)
        (doom-themes-visual-bell-config)
        (doom-themes-org-config))
      )
  (load-theme 'leuven))

(add-hook 'prog-mode-hook 'hook/prog-mode-setting)

(add-hook 'compilation-mode-hook 'misc/compilation-hook)

(provide 'init-packages)
