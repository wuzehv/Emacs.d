;;theme
(load-theme 'dracula t)

(tool-bar-mode -1)

(unless window-system
  (menu-bar-mode -1)
  (load-theme 'monokai t))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

(set-default-font "Source code pro 16")

(setq-default linum-format "%4d ")

(if (eq system-type 'windows-nt)
    (progn
      (setq mode-line-modes 'mode-name)

      (setq-default mode-line-format
                    (list
                     "%e"
                     mode-line-front-space
                     " "
                     '(:eval (propertize "%b" 'face 'font-lock-keyword-face
                                         'help-echo (buffer-file-name)))
                     " ["
                     '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                                         'face 'font-lock-preprocessor-face
                                         'help-echo (concat "Buffer is in "
                                                            (if overwrite-mode
                                                                "overwrite"
                                                              "insert") " mode")))
                     '(:eval (when (buffer-modified-p)
                               (concat "," (propertize "Mod"
                                                       'face 'font-lock-warning-face
                                                       'help-echo "Buffer has been modified"))))
                     '(:eval (when buffer-read-only
                               (concat "," (propertize "RO"
                                                       'face 'font-lock-type-face
                                                       'help-echo "Buffer is read-only"))))
                     "] "
                     "["
                     (propertize "%p" 'face 'font-lock-constant-face)
                     "/"
                     (propertize "%I" 'face 'font-lock-constant-face)
                     "] "
                     mode-line-modes
                     "   "
                     '(:eval `(vc-mode vc-mode))
                     "   "
                     " ("
                     (propertize "%l" 'face 'font-lock-type-face)
                     ","
                     (propertize "%c" 'face 'font-lock-type-face)
                     ") "
                     '(:eval (dotemacs-buffer-encoding-abbrev))
                     "  "
                     '(:eval mode-line-misc-info)
                     mode-line-end-spaces
                     ))
      )

  (use-package doom-modeline
    :ensure t
    :defer t
    :hook (after-init . doom-modeline-init))
  )

(provide 'my_theme)
