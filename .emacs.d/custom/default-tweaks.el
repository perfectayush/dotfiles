;;set-appearance-tweaks
(set-cursor-color (background-color-at-point))
(set-default-font "DejaVu Sans Mono-14")
(global-linum-mode 1)
(fringe-mode (quote (nil . 0)))
(global-rainbow-delimiters-mode 1)

 ;;powerline enable
(require 'powerline)
(powerline-default)

;; Nrepl config
(add-hook 'nrepl-mode-hook 'evil-emacs-state)
(add-to-list 'evil-emacs-state-modes 'nrepl-mode)
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*") 

;;auto-complete
(require 'auto-complete-config)
(ac-config-default)
(provide 'default-tweaks)

