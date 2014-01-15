;;evil surround
(global-surround-mode 1)

;;functions
(defun evil-eval-replace ()
  (interactive)
  (end-of-sexp)
  (esk-eval-and-replace))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key bindings overrides for evil mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; evil leader shortcuts
(require 'evil-leader)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "i"  'indent-region
  "k"  'kill-buffer 
  "e"  'evil-eval-replace
  "b"  'switch-to-buffer
  "u"  'undo-tree-visualize
  "l"  'evil-next-buffer
  "h"  'evil-prev-buffer
  "."  'find-tag
  "="  'evil-numbers/inc-at-pt
  "-"  'evil-numbers/dec-at-pt
  "cc" 'evilnc-comment-or-uncomment-lines
  "ci" 'evilnc-comment-or-uncomment-to-the-line
)
(global-evil-leader-mode 1)

;; Global Evil mode toggles
(define-key global-map [f5] 'evil-mode)
(global-set-key (kbd "<f7> e") 'evil-emacs-state)
(global-set-key (kbd "<f7> n") 'evil-normal-state)

;; mod to default insert state map
;;(setcdr evil-insert-state-map nil)
;; but [escape] should switch back to normal state
;;(define-key evil-insert-state-map [escape] 'evil-normal-state) 
;;(define-key evil-visual-state-map [escape] 'evil-normal-state)

;; Adding the binding for the j character, then
;; the k is handled on the function
(setq key-chord-two-keys-delay 0.25)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-emacs-state-map "jk" 'evil-normal-state)


;; evil quick buffer switching
(define-key evil-normal-state-map "J" 'evil-next-buffer)
(define-key evil-normal-state-map "K" 'evil-prev-buffer)
(define-key evil-motion-state-map "K" 'evil-prev-buffer)
(define-key evil-motion-state-map "J" 'evil-next-buffer)

;; ace jump mode key bindings
(key-chord-define evil-normal-state-map "  " #'ace-jump-char-mode)
(key-chord-define evil-visual-state-map "  " #'ace-jump-char-mode)
(key-chord-define evil-normal-state-map " l" #'ace-jump-line-mode)
(key-chord-define evil-visual-state-map " l" #'ace-jump-line-mode)
(key-chord-define evil-normal-state-map " w" #'ace-jump-word-mode)
(key-chord-define evil-visual-state-map " w" #'ace-jump-word-mode)

;;evil cursor tweak for themes
(setq evil-default-cursor t)

;; override default evil states for modes
(evil-set-initial-state 'slime-repl-mode 'emacs)
(evil-set-initial-state 'eshell-mode 'emacs)
(evil-set-initial-state 'nrepl-mode 'emacs)

;; emacs like movement
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-normal-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)
(define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
(define-key evil-visual-state-map "Q" 'call-last-kbd-macro)

;; enable evil and key-chord-mode >:->
(key-chord-mode 1)
(evil-mode 1)

(provide 'evil-tweaks)
