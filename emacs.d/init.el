(add-to-list 'load-path "~/.emacs.d/custom")
(require 'dependencies-setup)
(require 'evil-tweaks)
(require 'modeline-tweaks)
(require 'ac-tweaks)
(require 'smartparens-tweaks)
(require 'dictem-setup)
(require 'mpris-defuns)
(require 'misc-tweaks)
(require 'linum-relativenumber)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-highlight-parentheses-mode t)
 '(semantic-mode t)
 '(show-paren-mode nil)
 '(sp-highlight-pair-overlay nil)
 '(sp-highlight-wrap-overlay nil)
 '(sp-highlight-wrap-tag-overlay nil)
 '(vc-annotate-background nil))
