;;theme
(load-theme 'monokai t)

(tool-bar-mode -1)

(unless window-system
  (menu-bar-mode -1))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

(set-default-font "Source code pro 16")

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
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\` . ?\`)
                            (?\( . ?\))
                            (?\{ . ?\})
                            (?\' . ?\')
                            ))

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(global-visual-line-mode t)

(global-prettify-symbols-mode t)

(global-disable-mouse-mode)

(modify-syntax-entry ?_ "w")
(modify-syntax-entry ?- "w")

(global-superword-mode)

;; org
(require 'org-bullets)

(setq org-fontify-done-headline t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)" "|" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("DOING" . "red")))

(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)
                           (org-remove-inline-images)
                           (org-bullets-mode t)
                           (hungry-delete-mode t)
                           (local-set-key (kbd "C-c C-o") 'my-org-open-at-point)))

(setq mode-require-final-newline nil)

(add-to-list 'load-path "~/.emacs.d/private/ob-php")

(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (php . t)
   (shell . t)))

(provide 'my_better_default)
