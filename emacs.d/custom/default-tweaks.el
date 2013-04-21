;;Functions
(defun x11-maximize-frame ()
  "Maximize the current frame (to full screen)"
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))

(defun apply-to-frame (frame)
  (select-frame frame)
  (if (window-system frame)
      (progn  
        (x11-maximize-frame))))


;;set-appearance-tweaks
(require 'color-theme)
(color-theme-initialize)
(color-theme-tomorrow-night)


(set-cursor-color (background-color-at-point))
(set-default-font "DejaVu Sans Mono-14")
(setq default-frame-alist '((font . "DejaVu Sans Mono-14")))
(global-linum-mode 1)
(fringe-mode (quote (nil . 0)))
(global-rainbow-delimiters-mode 1)
(global-hl-line-mode 1)
(when window-system
  (x11-maximize-frame))
(add-hook 'after-make-frame-functions 'apply-to-frame)

;; Nrepl config
(add-hook 'nrepl-mode-hook 'evil-emacs-state)
(add-to-list 'evil-emacs-state-modes 'nrepl-mode)
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*") 

;;auto-complete with yasnippets and jedi
(require 'auto-complete-config)
(ac-config-default)
(defun ac-common-setup ()
  (setq ac-sources (append ac-sources '(ac-source-filename
                                        ac-source-yasnippet))))
(add-hook 'python-mode-hook 'jedi:setup)
(setq yas-snippet-dirs "~/.emacs.d/el-get/yasnippet/snippets/")
(yas-global-mode t)
(provide 'default-tweaks)
