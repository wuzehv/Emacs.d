(add-to-list 'load-path "~/.emacs.d/emacs-world")

;; 自动添加private下子模块目录
(let ((default-directory "~/.emacs.d/private/"))
    (normal-top-level-add-subdirs-to-load-path))

(require 'init-packages)

(require 'init-default)

(require 'misc-funcs)

(require 'init-org)

;; custom
(setq custom-file (expand-file-name "custom.el" "~/.emacs.d"))
(load custom-file 'no-error 'no-message)