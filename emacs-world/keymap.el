(global-set-key (kbd "C-M-\\") #'misc/indent-region-or-buffer)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-s s") 'magit-status)

(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)
(global-set-key (kbd "C-c t") 'youdao-dictionary-search-at-point-tooltip)
(global-set-key (kbd "C-s") 'helm-swoop)

(global-set-key (kbd "C-c C-v") 'browse-url-of-buffer)

(global-set-key (kbd "C-c c") 'org-capture)

(provide 'keymap)
