;; theme
(load-theme 'dracula t)

(tool-bar-mode -1)

(unless window-system
  (menu-bar-mode -1)
  (load-theme 'tao-yin t))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

(set-default-font "Source code pro 16")

(require 'doom-modeline)
(doom-modeline-init)

(setq-default linum-format "%4d ")

(provide 'my_theme)
