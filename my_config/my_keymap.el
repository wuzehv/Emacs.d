;; keymap
(evil-leader/set-key
  "e" 'open-init-file
  "ff" 'helm-find-files
  "fy" 'put-file-name-on-clipboard
  "fr" 'helm-recentf
  "fc" 'recentf-cleanup
  "fs" 'helm-ag-this-file
  "bb" 'helm-buffers-list
  "by" 'copy-all-or-region
  "bk" 'kill-this-buffer
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wm" 'delete-other-windows
  "sa" 'helm-projectile-ag
  "pf" 'helm-projectile-find-file
  "pp" 'helm-projectile-switch-project
  "pi" 'projectile-invalidate-cache
  "TAB" 'switch-to-previous-buffer
  "SPC" 'helm-M-x
  "v" 'er/expand-region
)

(define-key evil-normal-state-map (kbd "RET") 'helm-recentf)
(global-set-key (kbd "M-x") 'helm-M-x)

(define-key evil-normal-state-map (kbd ",,") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",,") 'evilnc-comment-or-uncomment-lines)

(provide 'my_keymap)
