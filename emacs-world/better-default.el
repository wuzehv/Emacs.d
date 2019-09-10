(global-evil-leader-mode)
(evil-mode t)

(load-theme 'monokai t)

(tool-bar-mode -1)

(menu-bar-mode -1)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

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

(set-face-attribute 'default nil :font "Source code pro 16")

;; 设置中文字体
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (when (member "微软雅黑" (font-family-list))
    (misc/set-chinese-font "微软雅黑" 18)))
 ((string-equal system-type "darwin") ; macOS
  (when (member "Hannotate SC" (font-family-list))
    (misc/set-chinese-font "Hannotate SC"))))

(setq-default linum-format "%4d ")

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init))

;; better default
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode))

;; 取消自动备份文件
(setq make-backup-files nil)

;; 自动加载外部修改文件
(global-auto-revert-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(global-hl-line-mode t)

(show-paren-mode t)

;; dired
(use-package dired-x)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(save-place-mode t)

(auto-save-visited-mode t)

(electric-pair-mode t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(global-visual-line-mode t)

(global-prettify-symbols-mode t)

(global-disable-mouse-mode)

(modify-syntax-entry ?_ "w")
(modify-syntax-entry ?- "w")

(setq mode-require-final-newline nil)

(setq auto-revert-check-vc-info t)

(require 'aweshell)

(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)
(push (cons "\\*eshell\\*" display-buffer--same-window-action) display-buffer-alist)

(winum-mode)

(setq helm-split-window-in-side-p           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-scroll-amount                    8
      helm-ff-file-name-history-use-recentf t
      helm-autoresize-max-height 0
      helm-autoresize-min-height 20
      ;; helm-ag-insert-at-point 'symbol
      )

(smooth-scrolling-mode t)
(setq scroll-conservatively 10)
(setq scroll-margin 7)

(global-evil-surround-mode)

(evilnc-default-hotkeys)

(which-key-mode t)

(use-package popwin
  :config
  (popwin-mode t))

(use-package web
  :mode ("\\.html?\\'" . web-mode)
  :mode ("\\.tpl.php?\\'" . web-mode))

(setq url-automatic-caching t)

(setq-default line-spacing 0.3)

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; Use the tab-and-go frontend.
;; Allows TAB to select and complete at the same time.
(company-tng-configure-default)
(setq company-frontends
      '(company-tng-frontend
        company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))

(setq helm-ag-insert-at-point 'symbol)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'better-default)
