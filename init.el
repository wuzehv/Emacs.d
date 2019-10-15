(setq normal-gc-cons-threshold (* 20 1024 1024))
(setq init-gc-cons-threshold (* 128 1024 1024))
(setq gc-cons-threshold init-gc-cons-threshold)
(add-hook 'emacs-startup-hook
		(lambda () (setq gc-cons-threshold normal-gc-cons-threshold)))

(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

(add-to-list 'load-path "~/.emacs.d/emacs-world")

;; 自动添加private下子模块目录
(let ((default-directory "~/.emacs.d/private/"))
    (normal-top-level-add-subdirs-to-load-path))

(require 'init-packages)

(require 'init-default)

(require 'misc-funcs)

(require 'init-org)

(require 'init-keymap)

;; custom
(setq custom-file (expand-file-name "custom.el" "~/.emacs.d"))
(load custom-file 'no-error 'no-message)