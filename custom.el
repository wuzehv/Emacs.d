(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-timeout 30)
 '(auto-save-visited-interval 1)
 '(company-idle-delay 0)
 '(confirm-kill-processes nil)
 '(custom-safe-themes
   (quote
    ("f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "3a3de615f80a0e8706208f0a71bbcc7cc3816988f971b6d237223b6731f91605" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "801a567c87755fe65d0484cb2bded31a4c5bb24fd1fe0ed11e6c02254017acb2" "dbade2e946597b9cda3e61978b5fcc14fa3afa2d3c4391d477bdaeff8f5638c5" "439d4ce8295685fc36fc119a062d0283bb05436ae841b053af76e9a5e42bc670" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default)))
 '(display-line-numbers-grow-only t)
 '(display-line-numbers-width nil)
 '(display-line-numbers-width-start nil)
 '(evil-leader/leader "SPC")
 '(global-whitespace-mode t)
 '(global-whitespace-newline-mode nil)
 '(indent-tabs-mode nil)
 '(org-image-actual-width 500)
 '(popwin:special-display-config
   (quote
    ((Man-mode)
     ("*Miniedit Help*" :noselect t)
     (help-mode)
     (completion-list-mode :noselect t)
     (compilation-mode :noselect t)
     (grep-mode :noselect t)
     (occur-mode :noselect t)
     ("*Pp Macroexpand Output*" :noselect t)
     ("*Shell Command Output*")
     ("*vc-diff*")
     ("*vc-change-log*")
     (" *undo-tree*" :width 60 :position right)
     ("^\\*anything.*\\*$" :regexp t)
     ("*slime-apropos*")
     ("*slime-macroexpansion*")
     ("*slime-description*")
     ("*slime-compilation*" :noselect t)
     ("*slime-xref*")
     (sldb-mode :stick t)
     (slime-repl-mode)
     (slime-connection-list-mode))))
 '(smooth-scroll-margin 10)
 '(whitespace-style (quote (face))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-rg-base-rg-cmd-face ((t (:weight normal))))
 '(helm-rg-inactive-arg-face ((t (:weight normal))))
 '(helm-rg-title-face ((t (:background "black" :weight bold))))
 '(line-number ((t (:inherit default :background "black" :foreground "red" :underline nil))))
 '(line-number-current-line ((t (:inherit default :background "#1B1E1C" :foreground "#F5F5F5" :underline nil :weight bold))))
 '(org-done ((t (:inherit org-headline-done :foreground "dim gray" :strike-through t :weight bold))))
 '(org-headline-done ((t (:foreground "dim gray" :strike-through t))))
 '(region ((t (:inherit highlight :background "dark slate gray"))))
 '(whitespace-empty ((t (:foreground "light gray" :inverse-video t)))))
