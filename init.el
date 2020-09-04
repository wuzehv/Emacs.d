(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

(add-to-list 'load-path (expand-file-name "emacs-world" user-emacs-directory))

;; 自动添加private下子模块目录
(let ((default-directory (concat user-emacs-directory "private/")))
    (normal-top-level-add-subdirs-to-load-path))

(setq byte-compile-warnings '(cl-functions))

(require 'misc-funcs)

(require 'init-packages)

(require 'init-default)

(require 'init-org)

;; custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'no-error 'no-message)