;; theme
(load-theme 'dracula 1)

(tool-bar-mode -1)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(menu-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

(setq-default cursor-type 'bar)

(set-default-font "Source code pro 16")

(require 'doom-modeline)
(doom-modeline-init)

(setq-default linum-format "%4d ")

(provide 'my_theme)
