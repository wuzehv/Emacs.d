(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

(add-to-list 'load-path "~/.emacs.d/emacs-world")

;; 自动添加private下子模块目录
(let ((default-directory "~/.emacs.d/private/"))
    (normal-top-level-add-subdirs-to-load-path))

(require 'misc-funcs)

(require 'init-packages)

(require 'init-default)

(require 'init-org)

(require 'init-keymap)

;; custom
(setq custom-file (expand-file-name "custom.el" "~/.emacs.d"))
(load custom-file 'no-error 'no-message)
