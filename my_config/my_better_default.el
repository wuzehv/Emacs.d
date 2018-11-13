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

(provide 'my_better_default)
