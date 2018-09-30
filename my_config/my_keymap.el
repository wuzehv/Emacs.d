;; keymap
(evil-leader/set-key
  "e" 'open-init-file
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wm" 'delete-other-windows
  "sa" 'helm-projectile-ag
  "pf" 'helm-projectile-find-file
  "fr" 'helm-recentf
  "pp" 'helm-projectile-switch-project
)

(define-key evil-normal-state-map (kbd "RET") 'helm-recentf)
(global-set-key (kbd "C-=") 'er/expand-region)

(provide 'my_keymap)
