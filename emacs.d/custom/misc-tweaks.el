;;Functions

;;server-file
(setq server-socket-dir "/tmp/emacs1000/")

;;set-appearance-tweaks
(load-theme 'sanityinc-tomorrow-night t)
(set-default-font "DejaVu Sans Mono-14")
(setq default-frame-alist '((font . "DejaVu Sans Mono-14")))
(global-linum-mode 1)
(fringe-mode (quote (0 . nil)))
(global-rainbow-delimiters-mode 1)
(global-hl-line-mode 1)

;; make emacsclient transparent in terminal and in window-mode
(require 'alpha)
(add-hook 'after-make-frame-functions
          '(lambda (frame)
             (select-frame frame)
             (if window-system
               (transparency-set-value 95)
               (set-frame-parameter nil 'background-color "unspecified-bg"))))

;; highlight parenthesis for lispy languages
(global-highlight-parentheses-mode t)
(require 'rainbow-delimiters)
(set-face-attribute 'hl-paren-face nil :underline t :inherit 'rainbow-delimiters-faces :foreground "blue")
(set-face-attribute 'sp-show-pair-match-face nil :underline t)

(set-face-attribute 'rainbow-delimiters-depth-1-face nil :inherit 'rainbow-delimiters-faces :foreground "grey")
(set-face-attribute 'rainbow-delimiters-depth-2-face nil :inherit 'rainbow-delimiters-faces :foreground "#04F103")
(set-face-attribute 'rainbow-delimiters-depth-3-face nil :inherit 'rainbow-delimiters-faces :foreground "#04F179")
(set-face-attribute 'rainbow-delimiters-depth-4-face nil :inherit 'rainbow-delimiters-faces :foreground "#04F1F1")
(set-face-attribute 'rainbow-delimiters-depth-5-face nil :inherit 'rainbow-delimiters-faces :foreground "#7C6AE3")
(set-face-attribute 'rainbow-delimiters-depth-6-face nil :inherit 'rainbow-delimiters-faces :foreground "#F103E3")
(set-face-attribute 'rainbow-delimiters-depth-7-face nil :inherit 'rainbow-delimiters-faces :foreground "#932FE3")
(set-face-attribute 'rainbow-delimiters-depth-8-face nil :inherit 'rainbow-delimiters-faces :foreground "#04F179")
(set-face-attribute 'rainbow-delimiters-depth-9-face nil :inherit 'rainbow-delimiters-faces :foreground "#04F1F1")

;; linum appearance
(set-face-attribute 'linum nil :foreground "#111" :background "grey70")

(defface linum-relativenumber-zero
  '((t :inherit linum :foreground "grey70" :background "#5F00AF" :weight bold))
  "Face for displaying line number 0"
  :group 'linum)

(defface linum-relativenumber-top
  '((t :inherit linum :weight normal))
  "Face for displaying top line number"
  :group 'linum)

(defface linum-relativenumber-line
  '((t :inherit linum :foreground "grey70" :background "#111" :weight normal))
  "Face for displaying absolute line number"
  :group 'linum)


;;Cider config
(require 'cider)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-tab-command 'indent-for-tab-command)
(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

;;kpm-list tweaks for evil
(require 'kpm-list)
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

;;rcodetools for ruby
(require 'rcodetools)

;; helm config
(require 'helm-config)

;; global key bindings for cycling buffer
(global-set-key (kbd  "C-c j") 'next-buffer)
(global-set-key (kbd  "C-c k") 'previous-buffer)

;;racket-mode tweaks
(add-hook 'racket-mode-hook 'hl-sexp-mode)

;; sublimity
(require 'sublimity)
(require 'sublimity-scroll)
(sublimity-global-mode)

(setq sublimity-scroll-weight 5
      sublimity-scroll-drift-length 3)

;; truncate lines (don't wrap)
(set-default 'truncate-lines t)

;; don't ask follow symlinks
(setq vc-follow-symlinks t)

;; auto-save mode tweaks
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist         `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix   emacs-tmp-dir)

;; xclip mode
(setq x-select-enable-clipboard t)
(setq interprogram-cut-function 'x-select-text)
(xclip-mode 1)

;;ssh settings for tramp
(setenv "SSH_AUTH_SOCK" "/run/user/1000/keyring/ssh")
(setq tramp-use-ssh-controlmaster-options nil)

(tramp-set-completion-function "ssh"
         '((tramp-parse-sconfig "/etc/ssh_config")
           (tramp-parse-sconfig "~/.ssh/config")))

(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

(provide 'misc-tweaks)
