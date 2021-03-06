;; org
(require 'org)

;; 不需要添加空格就支持样式；https://emacs-china.org/t/org-mode/597
(setcar (nthcdr 0 org-emphasis-regexp-components) " \t('\"{[:nonascii:]")
(setcar (nthcdr 1 org-emphasis-regexp-components) "- \t.,:!?;'\")}\\[[:nonascii:]")
(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
(org-element-update-syntax)

(require 'org-tempo) 

(use-package org-bullets
  :ensure t
  :init
  ;; 摩羯、白羊、射手、处女、巨蟹、双鱼、狮子
  ;; (setq org-bullets-bullet-list '("♑" "♈" "♐" "♍" "♋" "♓" "♌"))
  (setq org-ellipsis " ▼ "))

(use-package ob-go
  :ensure t)

(progn
  (setf org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
  (setq org-cycle-separator-lines 0)
  (setq org-default-notes-file "~/.org/notes.org")
  (setq org-agenda-files (list org-default-notes-file))
  (setq org-html-validation-link nil)
  (setq org-fontify-done-headline t
        org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d)" "|" "CANCELLED(c)"))
        org-todo-keyword-faces
        '(("DOING" . "red"))
        org-indirect-buffer-display 'current-window
        org-confirm-babel-evaluate nil
        org-export-backends (quote (ascii html icalendar latex md))
        ;; 不显示样式两边的符号
        ;; org-hide-emphasis-markers t

        ;; catture
        ;; 时间格式查看 C-h f format-time-string
        org-capture-templates
        '(("t"
           "Technology list item" entry
           (file+headline org-default-notes-file "Technology")
           "* TODO <%<%Y-%m-%d %H:%M Week:%u>> | %?\n")
          ("i"
           "Ideas for everything"
           entry
           (file+headline org-default-notes-file "Ideas")
           "* TODO <%<%Y-%m-%d %H:%M Week:%u>> | %?\n")
          ("p"
           "Protocol"
           entry
           (file+headline org-default-notes-file "Protocol")
           "* TODO <%<%Y-%m-%d %H:%M Week:%u>> | %:description\n  source: web\n  link: %l\n\n  %i\n" :immediate-finish t :kill-buffer t))

        ;; 样式
        org-emphasis-alist
        (cons '("+" '(:strike-through t :foreground "gray"))
              (delete* "+" org-emphasis-alist :key 'car :test 'equal))

        org-emphasis-alist
        (cons '("*" '(:emphasis t :foreground "DarkTurquoise"))
              (delete* "*" org-emphasis-alist :key 'car :test 'equal))

        org-emphasis-alist
        (cons '("~" '(:emphasis t :foreground "red"))
              (delete* "~" org-emphasis-alist :key 'car :test 'equal))))

(setf org-todo-keyword-faces '(("PAUSE" . (:foreground "white" :background "#3498DB" :weight bold))))

(with-eval-after-load 'org
  ;; 字体下载链接
  ;; https://github.com/be5invis/Sarasa-Gothic/releases
  ;; https://www.lanzous.com/ia5zbgh(我是安装的这个)
  (add-hook 'org-mode-hook (lambda ()
                             (setq indent-tabs-mode t)
                             (setq tab-width 4)
                             (setq truncate-lines nil)
                             (org-display-inline-images)
                             (org-bullets-mode t)
                             (hungry-delete-mode t)
                             (electric-pair-local-mode -1)
                             (local-set-key (kbd "C-c C-o") 'misc/org-open-at-point)
                             (set-face-attribute 'org-table nil :font "Sarasa Mono SC 16"))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (php . t)
   (go . t)
   (shell . t)))

(add-hook 'org-agenda-mode-hook (lambda()
                                  (define-key org-agenda-mode-map
                                    (kbd "RET") (lambda () (interactive) (org-agenda-switch-to t)))))

(add-hook 'before-save-hook (lambda()
                              (if (string= major-mode "org-mode")
                                  (misc/replace-punctuation))))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(global-set-key (kbd "C-c c") 'org-capture)

(provide 'init-org)
