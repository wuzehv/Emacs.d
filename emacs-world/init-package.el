(setq package-archives '(("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package evil
  :init
  ;; 这个必须放在evil-mode生效之前
  (use-package evil-leader
    :after evil
    :init
    (evil-leader/set-key
      ;; 常用
      "e" 'misc/open-init-file
      "SPC" 'ivy-switch-buffer
      "d" 'dired-jump
      "v" 'er/expand-region
      "i" 'counsel-imenu
      "j" 'ace-jump-char-mode
      "r" 'counsel-recentf
      "TAB" 'misc/switch-to-previous-buffer

      ;; file
      "ff" 'counsel-find-file
      "fy" 'misc/put-file-name-on-clipboard
      "fr" 'misc/rename-file-and-buffer

      ;; buffer
      "by" 'misc/copy-all-or-region
      "bk" 'kill-this-buffer

      ;; project
      "pf" 'counsel-projectile-find-file
      "pp" 'counsel-projectile-switch-project
      "pi" 'projectile-invalidate-cache
      "ps" 'counsel-projectile-ag

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
    :config
    (global-evil-leader-mode))
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
    :config
    (global-evil-surround-mode))
  (use-package evil-nerd-commenter
    :after evil
    :config
    (define-key evil-normal-state-map (kbd ",,") 'evilnc-comment-or-uncomment-lines)
    (define-key evil-visual-state-map (kbd ",,") 'evilnc-comment-or-uncomment-lines)))

;; 启动界面
(use-package dashboard
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

(use-package ivy
  :config
  (define-key ivy-minibuffer-map [escape] 'minibuffer-keyboard-quit))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)))

(use-package counsel-projectile)

(use-package swiper
  :after evil
  :config
  (define-key evil-normal-state-map (kbd "/") 'swiper)
  :bind (("C-s" . swiper)))

(use-package which-key
  :config
  :hook (after-init . which-key-mode))

(use-package popwin
  :config
  :hook (after-init . popwin-mode))

(use-package markdown-mode)

(use-package web-mode
  :mode ("\\.html?\\'" . web-mode)
  :mode ("\\.tpl.php?\\'" . web-mode)
  :mode ("\\.tpl?\\'" . web-mode))

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-copy-env "PATH")))

(use-package go-mode
  :init
  (add-hook 'go-mode-hook #'(lambda()
                              (progn
                                (setq indent-tabs-mode t)
                                (setq tab-width 4))))
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'godoc-mode-hook #'(lambda ()
                                 (evil-emacs-state))))

(use-package ace-jump-mode)

(use-package yasnippet
  :config (yas-global-mode 1))

(use-package hungry-delete
  :config
  (global-hungry-delete-mode))

(use-package lua-mode)

(use-package expand-region)

(use-package php-mode)

(use-package htmlize)

(use-package window-numbering
  :config
  (window-numbering-mode 1))

(use-package yaml-mode)

(use-package nginx-mode)

(use-package haskell-mode)

(use-package iedit)

(use-package google-translate
  :init
  (use-package popup)
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
        :config
        (setq doom-themes-enable-bold t
              doom-themes-enable-italic t)
        (load-theme 'doom-one-light t)
        ;; (load-theme 'doom-monokai-classic t)
        (doom-themes-visual-bell-config)
        (doom-themes-org-config))
      )
  (load-theme 'leuven))

(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'character))

(add-hook 'prog-mode-hook 'hook/prog-mode-setting)

(add-hook 'compilation-mode-hook 'misc/compilation-hook)

(provide 'init-package)
