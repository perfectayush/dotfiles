;;Functions

;;set-appearance-tweaks
(require 'color-theme)
(color-theme-initialize)
(color-theme-tomorrow-night)


(set-cursor-color (background-color-at-point))
(set-default-font "DejaVu Sans Mono-14")
(setq default-frame-alist '((font . "DejaVu Sans Mono-14")))
(global-linum-mode 1)
(fringe-mode (quote (0 . nil)))
(global-rainbow-delimiters-mode 1)
(global-hl-line-mode 1)

;; Nrepl config
(add-hook 'nrepl-mode-hook 'evil-emacs-state)
(add-to-list 'evil-emacs-state-modes 'nrepl-mode)
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*") 

;;kpm-list tweaks for evil
(defadvice kpm-list (after no-evil-kpm-list activate)
  "Make kpm-list play along with evil-mode."
  (with-current-buffer (get-buffer kpm-list-buffer-name)
    (define-key evil-normal-state-local-map (kbd "<RET>") 'kpm-list-select-buffer)
    (define-key evil-normal-state-local-map "q" 'quit-window)
    (define-key evil-normal-state-local-map "o" 'kpm-list-select-other-window)
    (define-key evil-normal-state-local-map "j" 'kpm-list-next-buffer)
    (define-key evil-normal-state-local-map "k" 'kpm-list-prev-buffer)
    (define-key evil-normal-state-local-map "d" 'kpm-list-kill-buffer)))

;;horizontal splitting for temp buff
(defun split-horizontally-for-temp-buffers ()
  "Split the window horizontally for temp buffers."
  (when (and (one-window-p t)
             (not (active-minibuffer-window)))
    (split-window-horizontally)))

(add-hook 'temp-buffer-setup-hook 'split-horizontally-for-temp-buffers)

;;golden-ratio
(require 'golden-ratio)
(golden-ratio-mode 1)

;; Setting rbenv and java path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:"        ;ruby
                       "/opt/java/bin:/opt/java/db/bin:/opt/java/jre/bin:"                    ;java
                       (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))
(setq exec-path (append exec-path '("/opt/java/bin" "/opt/java/db/bin" "/opt/java/jre/bin")))

;; super key bindings
(global-set-key (kbd  "s-x") 'helm-command-prefix)

;; global key bindings for cycling buffer
(global-set-key (kbd  "C-c j") 'next-buffer)
(global-set-key (kbd  "C-c k") 'previous-buffer)

;; allow text to be copide to x-clipboard even from terminal
(turn-on-xclip)

(provide 'misc-tweaks)
