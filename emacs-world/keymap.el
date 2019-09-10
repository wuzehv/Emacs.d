;; keymap
(evil-leader/set-key
  ;; 常用
  "e" 'misc/open-init-file
  "SPC" 'helm-buffers-list
  "TAB" 'misc/switch-to-previous-buffer
  "r" 'helm-recentf

  ;; file
  "ff" 'helm-find-files
  "fy" 'misc/put-file-name-on-clipboard
  "fs" 'helm-ag-this-file
  "fd" 'misc/delete-current-file-copy-to-kill-ring
  "fr" 'misc/rename-file-and-buffer

  ;; buffer
  "by" 'misc/copy-all-or-region
  "bk" 'kill-this-buffer

  ;; project
  "pf" 'helm-projectile-find-file
  "pp" 'helm-projectile-switch-project
  "pi" 'projectile-invalidate-cache
  "ps" 'helm-projectile-ag

  "x" 'helm-M-x
  "v" 'er/expand-region
  "jf" 'helm-imenu
  "d" 'dired-jump
  "i" 'iedit-mode
  "fc" 'recentf-cleanup

  ;; window
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wm" 'delete-other-windows
  "1" 'winum-select-window-1
  "2" 'winum-select-window-2
  "3" 'winum-select-window-3
  "4" 'winum-select-window-4

  ;; org
  "oc" 'org-capture
  "or" 'org-archive-subtree
  "oa" 'org-agenda
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

(global-set-key (kbd "C-M-\\") #'misc/indent-region-or-buffer)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-s s") 'magit-status)

(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
(global-set-key (kbd "C-c t") 'youdao-dictionary-search-at-point-tooltip)
(global-set-key (kbd "C-s") 'helm-swoop)

(global-set-key (kbd "C-c C-v") 'browse-url-of-buffer)

(define-key evil-motion-state-map (kbd "C-i") nil)

(evil-define-key 'normal haskell-mode-map "o" 'misc/haskell-mode-map)

(define-key evil-normal-state-map (kbd "#")
  (lambda () (interactive) (helm-swoop)))

(global-set-key (kbd "C-c c") 'org-capture)

(provide 'keymap)
