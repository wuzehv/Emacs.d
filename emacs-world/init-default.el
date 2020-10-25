;; 系统默认设置
(tool-bar-mode -1)

(menu-bar-mode -1)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(set-face-attribute 'default nil :font "Source code pro 16")

;; 设置中文字体
(cond
 ((string-equal system-type "windows-nt") ; win
  (when (member "微软雅黑" (font-family-list))
    (misc/set-chinese-font "微软雅黑")))
 ((string-equal system-type "darwin") ; macOS
  (when (member "Hannotate SC" (font-family-list))
    (misc/set-chinese-font "Hannotate SC"))))

(setq-default linum-format "%4d ")

(setq ring-bell-function 'ignore)

;; 取消自动备份文件
(setq make-backup-files nil)

;; 自动加载外部修改文件
(global-auto-revert-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(global-hl-line-mode t)

(show-paren-mode t)

(save-place-mode t)

(auto-save-visited-mode t)

(electric-pair-mode t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(global-prettify-symbols-mode t)

(modify-syntax-entry ?_ "w")
(modify-syntax-entry ?- "w")

(setq mode-require-final-newline nil)

(setq auto-revert-check-vc-info t)

(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)
(push (cons "\\*eshell\\*" display-buffer--same-window-action) display-buffer-alist)

(setq-default line-spacing 0.4)

;; 平滑滚动
(setq scroll-margin 3
      scroll-conservatively 10000)

(load-theme 'leuven)

(provide 'init-default)
