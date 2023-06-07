(setq gc-cons-threshold 100000000)
(setq large-file-warning-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

(add-to-list 'load-path (expand-file-name "emacs-world" user-emacs-directory))

(require 'init-func)

(require 'init-package)

(require 'init-default)

(require 'init-org)

;; custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'no-error 'no-message)