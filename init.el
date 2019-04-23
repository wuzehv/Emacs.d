(package-initialize)

(add-to-list 'load-path "~/.emacs.d/my_config")

;; 自动添加private下子模块目录
(let ((default-directory "~/.emacs.d/private/"))
    (normal-top-level-add-subdirs-to-load-path))

(require 'init_package)

(require 'my_function)

(require 'my_mode_hook)

(require 'my_better_default)

(require 'my_keymap)

;; custom
(setq custom-file (expand-file-name "custom.el" "~/.emacs.d"))
(load custom-file 'no-error 'no-message)