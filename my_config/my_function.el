;; function
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun switch-to-previous-buffer ()
  "Switch to most recent buffer. Repeated calls toggle back and forth between the most recent two buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun copy-all-or-region ()
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

(defun put-file-name-on-clipboard ()
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

(defun my_prog_mode_setting()
  "program setting"
  (setq indent-tabs-mode t)
  (setq-default tab-width 4)
  (linum-mode t)
  (whitespace-mode t)
  (hungry-delete-mode t))

(defun my_php_mode_setting()
  "php mode setting"
  (setq indent-tabs-mode t)
  (require 'company-php)
  (company-mode t)
  (ac-php-core-eldoc-setup)
  (make-local-variable 'company-backends)
  (add-to-list 'company-backends 'company-ac-php-backend))

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root"
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(provide 'my_function)
