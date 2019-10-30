;; org
;; 不需要添加空格就支持样式；https://emacs-china.org/t/org-mode/597
(setcar (nthcdr 0 org-emphasis-regexp-components) " \t('\"{[:nonascii:]")
(setcar (nthcdr 1 org-emphasis-regexp-components) "- \t.,:!?;'\")}\\[[:nonascii:]")
(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
(org-element-update-syntax)

(use-package org-bullets
  :ensure t
  :init
  ;; 摩羯、白羊、射手、处女、巨蟹、双鱼、狮子
  (setq org-bullets-bullet-list '("♑" "♈" "♐" "♍" "♋" "♓" "♌")))

(use-package ob-go
  :ensure t)

(setq org-fontify-done-headline t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i)" "PAUSE(p)" "|" "DONE(d)" "|" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("DOING" . "red")))

(setf org-todo-keyword-faces '(("PAUSE" . (:foreground "white" :background "#3498DB" :weight bold))))

(setq org-indirect-buffer-display 'current-window)

(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)
                           (org-display-inline-images)
                           (org-bullets-mode t)
                           (hungry-delete-mode t)
                           (local-set-key (kbd "C-c C-o") 'misc/org-open-at-point)))

(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (php . t)
   (go . t)
   (shell . t)))

;; 不显示样式两边的符号
(setq org-hide-emphasis-markers t)

;; org样式
(setq org-emphasis-alist
      (cons '("+" '(:strike-through t :foreground "gray"))
            (delete* "+" org-emphasis-alist :key 'car :test 'equal)))

(setq org-emphasis-alist
      (cons '("*" '(:emphasis t :foreground "blue"))
            (delete* "*" org-emphasis-alist :key 'car :test 'equal)))

(setq org-emphasis-alist
      (cons '("~" '(:emphasis t :foreground "red"))
            (delete* "~" org-emphasis-alist :key 'car :test 'equal)))

(setq org-capture-templates
      '(("t"
         "Todo list item"
         entry
         (file+headline org-default-notes-file "Tasks")
         "* TODO %? %T\n")
		("i"
		 "Ideas for everything"
		 entry
		 (file+headline org-default-notes-file "Ideas")
		 "* TODO %? %T\n")
		("p"
		 "Protocol"
		 entry
		 (file+headline org-default-notes-file "Protocol")
		 "* %t %:description\n  source: web\n  link: %l\n\n  %i\n" :immediate-finish t :kill-buffer t)
		("o"
		 "Others"
		 entry
		 (file "~/.agenda/others.org")
		 "* TODO %? %T\n")))

(setq org-export-backends (quote (ascii html icalendar latex md)))

(use-package org-protocol)

(provide 'init-org)
