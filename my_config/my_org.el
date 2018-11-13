;; org
(require 'org-bullets)

(setq org-fontify-done-headline t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)" "|" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("DOING" . "red")))

(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)
                           (org-remove-inline-images)
                           (org-bullets-mode t)
                           (local-set-key (kbd "C-c C-o") 'my-org-open-at-point)))

(provide 'my_org)
