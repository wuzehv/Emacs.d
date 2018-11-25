;; keymap
(evil-leader/set-key
  "e" 'open-init-file
  "ff" 'helm-find-files
  "fy" 'put-file-name-on-clipboard
  "fr" 'helm-recentf
  "fc" 'recentf-cleanup
  "fs" 'helm-ag-this-file
  "fe" 'sudo-edit
  "fd" 'delete-current-file-copy-to-kill-ring
  "bb" 'helm-buffers-list
  "by" 'copy-all-or-region
  "bk" 'kill-this-buffer
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wm" 'delete-other-windows
  "sa" 'helm-projectile-ag
  "sc" 'helm-occur
  "pf" 'helm-projectile-find-file
  "pp" 'helm-projectile-switch-project
  "pi" 'projectile-invalidate-cache
  "TAB" 'switch-to-previous-buffer
  "SPC" 'helm-M-x
  "v" 'er/expand-region
  "jf" 'helm-imenu
  "rn" 'rename-file-and-buffer
  "d" 'dired-jump
  "i" 'iedit-mode
  "1" 'winum-select-window-1
  "2" 'winum-select-window-2
  "3" 'winum-select-window-3
  "4" 'winum-select-window-4
  )

(define-key evil-normal-state-map (kbd "RET") 'helm-recentf)
(global-set-key (kbd "M-x") 'helm-M-x)

(define-key evil-normal-state-map (kbd ",,") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",,") 'evilnc-comment-or-uncomment-lines)

;; insert mode下使用emacs键位
;; 移除insert本身的键位
(setcdr evil-insert-state-map nil)
;; 绑定emacs到insert
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
;; esc切换回insert
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(with-eval-after-load 'helm
  (define-key helm-map [escape] 'helm-keyboard-quit)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z")  'helm-select-action))

(global-set-key (kbd "C-M-\\") #'my-indent-region-or-buffer)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-s s") 'magit-status)

(provide 'my_keymap)
