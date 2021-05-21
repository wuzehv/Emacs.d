;; function
(defun misc/open-init-file()
  (interactive)
  (find-file (concat user-emacs-directory "init.el")))

(defun misc/switch-to-previous-buffer ()
  "Switch to most recent buffer. Repeated calls toggle back and forth between the most recent two buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun misc/copy-all-or-region ()
  "Put the whole buffer content to `kill-ring', or text selection if there's one.
Respects `narrow-to-region'.
URL `http://ergoemacs.org/emacs/emacs_copy_cut_all_or_region.html'
Version 2015-08-22"
  (interactive)
  (if (use-region-p)
      (progn
        (kill-new (buffer-substring (region-beginning) (region-end)))
        (message "Text selection copied."))
    (progn
      (kill-new (buffer-string))
      (message "Buffer content copied."))))

(defun misc/put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun misc/rename-file-and-buffer()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(defun misc/org-open-at-point ()
  "open org file at point and full screen"
  (interactive)
  (org-open-at-point)
  (delete-other-windows))

(defun misc/compile-and-run()
  "compile && run"
  (interactive)
  (if (memq major-mode '(c-mode python-mode go-mode php-mode sh-mode java-mode))
      (progn
        (save-buffer)
        (if (string= major-mode "c-mode")
            (compile (format "gcc %s && ./a.out" (buffer-file-name))))
        (if (string= major-mode "python-mode")
            (compile (format "python3 %s" (buffer-file-name))))
        (if (string= major-mode "go-mode")
            (compile (format "go run %s" (buffer-file-name))))
        (if (string= major-mode "php-mode")
            (compile (format "php %s" (buffer-file-name))))
        (if (string= major-mode "sh-mode")
            (compile (format "/bin/bash %s" (buffer-file-name))))
        (if (string= major-mode "java-mode")
            (compile (format "java %s" (buffer-file-name))))
        (evil-normal-state))))

(defun misc/haskell-mode-map()
  "fix evil normal 状态下 haskell mode \"o\"键 缩进问题"
  (interactive)
  (evil-append-line 1)
  (haskell-indentation-newline-and-indent))

(defun misc/indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-region (point-min) (point-max))
        (message "Indented buffer.")))))

(global-set-key (kbd "C-M-\\") #'misc/indent-region-or-buffer)

(defun misc/org-screenshot (basename)
  "Take a screenshot into a time stamped unique-named file in the
same directory as the org-buffer and insert a link to this file."
  (interactive "sScreenshot name: ")
  (if (equal basename "")
      (setq basename (format-time-string "%Y%m%d_%H%M%S")))
  (setq target-dir "./imgs/")
  (unless (file-exists-p target-dir)
    (make-directory target-dir t))
  (setq filename
        (concat target-dir
                (file-name-base (buffer-file-name))
                "_"
                basename
                ".png"))
  (call-process "screencapture" nil nil nil "-s" filename)
  (when (file-exists-p filename)
    (insert (concat "[[" filename "]]"))
    (org-display-inline-images)))

(defun misc/set-chinese-font (love-font &optional size)
  "根据系统设置中文字体"
  (unless size
    (setq size 16))
  (when (member love-font (font-family-list))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family love-font :size size)))))

;; after yank auto indent
(dolist (command '(evil-paste-after yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(defun hook/prog-mode-setting()
  "program setting"
  (display-line-numbers-mode t)
  (hungry-delete-mode t)
  (projectile-mode t)
  (yas-global-mode t)
  (highlight-indent-guides-mode t)
  (local-set-key (kbd "<f4>") 'misc/compile-and-run))

(defun misc/replace-punctuation()
  "Convert punctuation from Chinese to English characters"
  (interactive)
  (save-excursion
    (let ((map '(
                 ("，" . ", ")
                 ("。" . ". ")
                 ("；" . "; ")
                 ("：" . ": ")
                 ("（" . "(")
                 ("）" . ")")
                 ("？" . "? ")
                 )))
      (while map
        (setq tmp (car map))
        (replace-string (car tmp) (cdr tmp) nil (point-min) (point-max))
        (setq map (cdr map))))))

(defun misc/compilation-hook ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (/ (* 2 h) 5))
          (local-set-key (kbd "q" ) 'delete-window))))))

;; dired mode, delete buffer automatically after removing file
(advice-add 'dired-delete-file :before
            (lambda (file &rest rest)
              (when-let ((buf (get-file-buffer file)))
                (kill-buffer buf))))

(defun misc/tuofeng-variables()
  "驼峰转下划线"
  (interactive)
  (save-excursion
    (progn
      (mark-whole-buffer)
      (replace-regexp "\\([A-Z]\\)" "_\\1")
      (downcase-region (region-beginning) (region-end)))))

(defun misc/org-babel-remove-result-all()
  "移除org文件中所有的RESULTS"
  (interactive)
  (org-babel-remove-result-one-or-many t))

(provide 'init-func)