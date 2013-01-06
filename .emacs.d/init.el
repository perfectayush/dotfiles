(add-to-list 'load-path "~/.emacs.d/custom")
(require 'dependencies-setup)
(require 'evil-tweaks)
(require 'linum-relativenumber)
(require 'default-tweaks)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes (quote ("d6a00ef5e53adf9b6fe417d2b4404895f26210c52bb8716971be106550cea257" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-active1 ((t (:inherit mode-line :background "#31A39C"))))
 '(powerline-active2 ((t (:inherit mode-line :background "#197374"))))
 '(powerline-inactive1 ((t (:inherit mode-line :background "#222222"))))
 '(powerline-inactive2 ((t (:inherit mode-line :background "#999999"))))
 )
