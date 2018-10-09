;; theme
(load-theme 'dracula 1)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode 0)

;; 关闭文件滑动控件
(scroll-bar-mode 0)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

(setq-default cursor-type 'bar)

(set-default-font "Source code pro 16")

(require 'doom-modeline)
(doom-modeline-init)

(setq-default linum-format "%4d ")

(provide 'my_theme)
