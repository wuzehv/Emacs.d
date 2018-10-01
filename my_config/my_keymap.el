;; keymap
(evil-leader/set-key
  "e" 'open-init-file
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "by" 'copy-all-or-region
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wm" 'delete-other-windows
  "sa" 'helm-projectile-ag
  "pf" 'helm-projectile-find-file
  "fr" 'helm-recentf
  "pp" 'helm-projectile-switch-project
  "TAB" 'switch-to-previous-buffer
)

(define-key evil-normal-state-map (kbd "RET") 'helm-recentf)
(global-set-key (kbd "C-=") 'er/expand-region)

(define-key evil-normal-state-map (kbd ",,") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",,") 'evilnc-comment-or-uncomment-lines)

(provide 'my_keymap)
