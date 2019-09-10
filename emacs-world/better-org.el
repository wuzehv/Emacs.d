;; org
(require 'org-bullets)

(setq org-fontify-done-headline t)

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i)" "PAUSE(p)" "|" "DONE(d)" "|" "CANCELLED(c)")))

(setq org-todo-keyword-faces
      '(("DOING" . "red")))

(setf org-todo-keyword-faces '(("PAUSE" . (:foreground "white" :background "#3498DB" :weight bold))))

(add-hook 'org-mode-hook (lambda ()
                           (setq truncate-lines nil)
                           (org-display-inline-images)
                           (org-bullets-mode t)
                           (hungry-delete-mode t)
                           ;; 摩羯、白羊、射手、处女、巨蟹、双鱼、狮子
                           (setq org-bullets-bullet-list '("♑" "♈" "♐" "♍" "♋" "♓" "♌"))
                           (local-set-key (kbd "C-c C-o") 'misc/org-open-at-point)))

(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (php . t)
   (shell . t)))

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

;; agenda
(setq misc/org-agenda-base-dir "~/.agenda")
(setq org-agenda-files '(misc/org-agenda-base-dir))
(setq org-default-notes-file (concat misc/org-agenda-base-dir "/todo.org"))

(setq org-agenda-custom-commands
      '(
        ("w" . "任务安排")
        ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
        ("wb" "重要且不紧急的任务" tags-todo "-weekly-monthly-daily+PRIORITY=\"B\"")
        ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
        ("W" "Weekly Review"
         ((stuck "") ;; review stuck projects as designated by org-stuck-projects
          (tags-todo "project")
          (tags-todo "daily")
          (tags-todo "weekly")
          (tags-todo "school")
          (tags-todo "code")
          (tags-todo "theory")
          ))
        ))

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
		("o"
		 "Others"
		 entry
		 (file "~/.agenda/others.org")
		 "* TODO %? %T\n")))

(add-hook 'org-agenda-finalize-hook #'misc/org-agenda-time-grid-spacing)

(require 'org-protocol)

(provide 'better-org)