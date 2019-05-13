(global-evil-leader-mode)
(evil-mode t)

(load-theme 'monokai t)

(tool-bar-mode -1)

(unless window-system
  (menu-bar-mode -1))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

(set-face-attribute 'default nil :font "Source code pro 16")

;; 设置中文字体
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (when (member "微软雅黑" (font-family-list))
    (my-set-chinese-font "微软雅黑" 18)))
 ((string-equal system-type "darwin") ; macOS
  (when (member "Hannotate SC" (font-family-list))
    (my-set-chinese-font "Hannotate SC")))
 ((string-equal system-type "gnu/linux") ; linux
  (when (member "DejaVu Sans Mono" (font-family-list))
    (my-set-chinese-font "DejaVu Sans Mono"))))

(setq-default linum-format "%4d ")

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init))

;; better default
(recentf-mode t)

;; 取消自动备份文件
(setq make-backup-files nil)

;; 自动加载外部修改文件
(global-auto-revert-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(global-hl-line-mode t)

(show-paren-mode t)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)

(save-place-mode t)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(auto-save-visited-mode t)

(electric-pair-mode t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(global-visual-line-mode t)

(global-prettify-symbols-mode t)

(global-disable-mouse-mode)

(modify-syntax-entry ?_ "w")
(modify-syntax-entry ?- "w")

;; org
(require 'org-bullets)

(setq org-fontify-done-headline t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)" "|" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("DOING" . "red")))

(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)
                           (org-display-inline-images)
                           (org-bullets-mode t)
                           (hungry-delete-mode t)
                           ;; 摩羯、白羊、射手、处女、巨蟹、双鱼、狮子
                           (setq org-bullets-bullet-list '("♑" "♈" "♐" "♍" "♋" "♓" "♌"))
                           (local-set-key (kbd "C-c C-o") 'my-org-open-at-point)))

(setq mode-require-final-newline nil)

(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (php . t)
   (shell . t)))

(setq org-emphasis-alist
      (cons '("+" '(:strike-through t :foreground "gray"))
            (delete* "+" org-emphasis-alist :key 'car :test 'equal)))

(setq org-emphasis-alist
      (cons '("*" '(:emphasis t :foreground "blue"))
            (delete* "*" org-emphasis-alist :key 'car :test 'equal)))

(setq org-emphasis-alist
      (cons '("~" '(:emphasis t :foreground "red"))
            (delete* "~" org-emphasis-alist :key 'car :test 'equal)))

(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)
(push (cons "\\*eshell\\*" display-buffer--same-window-action) display-buffer-alist)

(setq auto-revert-check-vc-info t)

(require 'aweshell)

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

(setq url-automatic-caching t)

(provide 'better-default)
