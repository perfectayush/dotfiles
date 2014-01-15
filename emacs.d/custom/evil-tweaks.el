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
(define-key evil-normal-state-map "Q"    'call-last-kbd-macro)
(define-key evil-visual-state-map "Q"    'call-last-kbd-macro)
(define-key evil-motion-state-map ";"    'evil-ex)

;; evil-org-mode
(require 'org)

(defun always-insert-item ()
  "Force insertion of org item"
  (if (not (org-in-item-p))
      (insert "\n- ")
    (org-insert-item))
  )

(defun evil-org-eol-call (fun)
  "Go to end of line and call provided function"
  (end-of-line)
  (funcall fun)
  (evil-append nil)
  )

;; normal state shortcuts
(evil-define-key 'normal org-mode-map
  "gh" 'outline-up-heading
  "gj" (if (fboundp 'org-forward-same-level) ;to be backward compatible with older org version
         'org-forward-same-level
         'org-forward-heading-same-level)
  "gk" (if (fboundp 'org-backward-same-level)
         'org-backward-same-level
         'org-backward-heading-same-level)
  "gl" 'outline-next-visible-heading
  "t" 'org-todo
  "T" '(lambda () (interactive) (evil-org-eol-call '(org-insert-todo-heading nil)))
  "H" 'org-beginning-of-line
  "L" 'org-end-of-line
  ";t" 'org-show-todo-tree
  "o" '(lambda () (interactive) (evil-org-eol-call 'always-insert-item))
  "O" '(lambda () (interactive) (evil-org-eol-call 'org-insert-heading))
  "$" 'org-end-of-line
  "^" 'org-beginning-of-line
  "<" 'org-metaleft
  ">" 'org-metaright
  ";a" 'org-agenda
  "-" 'org-cycle-list-bullet
  (kbd "TAB") 'org-cycle)

;; normal & insert state shortcuts.
(mapc (lambda (state)
        (evil-define-key state org-mode-map
          (kbd "M-l") 'org-metaright
          (kbd "M-h") 'org-metaleft
          (kbd "M-k") 'org-metaup
          (kbd "M-j") 'org-metadown
          (kbd "M-L") 'org-shiftmetaright
          (kbd "M-H") 'org-shiftmetaleft
          (kbd "M-K") 'org-shiftmetaup
          (kbd "M-J") 'org-shiftmetadown
          (kbd "M-o") '(lambda () (interactive)
                         (evil-org-eol-call
                          '(lambda()
                             (org-insert-heading)
                             (org-metaright))))
          (kbd "M-t") '(lambda () (interactive)
                         (evil-org-eol-call
                          '(lambda()
                             (org-insert-todo-heading nil)
                             (org-metaright))))
          ))
      '(normal insert))


;; enable evil and key-chord-mode >:->
(key-chord-mode 1)
(evil-mode 1)

(provide 'evil-tweaks)
