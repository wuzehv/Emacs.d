;; org
(require 'org-bullets)
(add-hook 'org-mode-hook 'org-bullets-mode)

(setq org-todo-keywords
	'((sequence "TODO(t)" "DOING(i)"  "|" "DONE(d)" "CANCELLED(c)")))

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
(add-hook 'org-mode-hook (lambda () (org-remove-inline-images)))

(provide 'my_org)
