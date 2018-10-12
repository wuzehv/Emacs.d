;; org
(require 'org-bullets)

(setq org-todo-keywords
	'((sequence "TODO(t)" "DOING(i)"  "|" "DONE(d)" "CANCELLED(c)")))

(add-hook 'org-mode-hook (lambda ()
						   (setq truncate-lines nil)
						   (org-remove-inline-images)
						   (org-bullets-mode t)))

(provide 'my_org)
