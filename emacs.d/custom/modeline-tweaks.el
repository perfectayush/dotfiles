(provide 'modeline-tweaks)

;; Faces
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defface powerline-active0 '((t (:background "#585858" :foreground "#FFFFFF" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)
(defface powerline-active1 '((t (:background "#303030" :foreground "#FFFFFF" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active2 '((t (:background "#D0D0D0" :foreground "#585858" :inherit mode-line)))
  "Powerline face 2."
  :group 'powerline)

(defface powerline-inactive0
  '((t (:background "grey11" :foreground "#FFFFFF" :inherit mode-line-inactive)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-inactive1
  '((t (:background "grey11" :foreground "#FFFFFF" :inherit mode-line-inactive)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-inactive2
  '((t (:background "grey20" :foreground "#FFFFFF" :inherit mode-line-inactive)))
  "Powerline face 2."
  :group 'powerline)

(defface powerline-insert0 '((t (:background "#0087AF" :foreground "#FFFFFF" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-insert1 '((t (:background "#005F87" :foreground "#87D7FF" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-insert2 '((t (:background "#0087AF" :foreground "#FFFFFF" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-evil-inactive '((t (:background "black" :foreground "#FFFFFF" :inherit mode-line)))
  "Powerline evil inactive state face."
  :group 'powerline)

(defface powerline-evil-normal '((t (:background "#AFD700" :foreground "#005F00" :inherit mode-line)))
  "Powerline evil normal state face."
  :group 'powerline)

(defface powerline-evil-insert '((t (:background "#FFFFFF" :foreground "#005F87" :inherit mode-line)))
  "Powerline evil insert state face."
  :group 'powerline)

(defface powerline-evil-visual '((t (:background "#FF8700" :foreground "#870000" :inherit mode-line)))
  "Powerline evil visual state face."
  :group 'powerline)

(defface powerline-evil-operator '((t (:background "red" :foreground "#FFFFFF" :inherit mode-line)))
  "Powerline evil operator state face."
  :group 'powerline)

(defface powerline-evil-motion '((t (:background "#0087AF" :foreground "#FFFFFF" :inherit mode-line)))
  "Powerline evil motion state face."
  :group 'powerline)

(defface powerline-evil-replace '((t (:background "#870000" :foreground "#FFFFFF" :inherit mode-line)))
  "Powerline evil replace state face."
  :group 'powerline)

(defface powerline-evil-emacs '((t (:background "#5F005F" :foreground "#FFFFFF" :inherit mode-line)))
  "Powerline evil emacs state face."
  :group 'powerline)

(defface powerline-evil-devil '((t (:background "#FFFFFF" :foreground "#5F005F" :inherit mode-line)))
  "Powerline evil unknown state face."
  :group 'powerline)



;; Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun custom-evil-state ()
  (cond ((evil-normal-state-p)   "NORMAL")
        ((evil-insert-state-p)   "INSERT")
        ((evil-visual-state-p)   "VISUAL")
        ((evil-operator-state-p) "OPERATOR")
        ((evil-motion-state-p)   "MOTION")
        ((evil-replace-state-p)  "REPLACE")
        ((evil-emacs-state-p)    "EMACS")
        (t                       "DEVIL")))


(defun custom-evil-face (&optional state)
  ;; Don't propertize if we're not in the selected buffer
      (cond ;((not (eq (current-buffer) (car (buffer-list))))
                                        ;'powerline-evil-inactive)
       ((evil-normal-state-p)   'powerline-evil-normal)
       ((evil-insert-state-p)   'powerline-evil-insert)
       ((evil-visual-state-p)   'powerline-evil-visual)
       ((evil-operator-state-p) 'powerline-evil-operator)
       ((evil-motion-state-p)   'powerline-evil-motion)
       ((evil-replace-state-p)  'powerline-evil-replace)
       ((evil-emacs-state-p)    'powerline-evil-emacs)
       (t                       'powerline-evil-devil)))


;; Modeline tweaking
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun custom-modeline-things ()
  (interactive)
  (setq eol-mnemonic-unix      "unix")
  (setq eol-mnemonic-dos       "dos")
  (setq eol-mnemonic-mac       "mac")
  (setq eol-mnemonic-undecided "unknown")
  (custom-powerline-things))


;; Powerline
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://www.emacswiki.org/emacs/PowerLine

(defun custom-powerline-things ()
  (require 'powerline)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active    (eq (frame-selected-window) (selected-window)))
                          (face0     (if active 'powerline-active0 'powerline-inactive0))
                          (face1     (if active 'powerline-active1 'powerline-inactive1))
                          (face2     (if active 'powerline-active2 'powerline-inactive2))
                          (face0     (if (evil-insert-state-p) 'powerline-insert0 face0))
                          (face1     (if (evil-insert-state-p) 'powerline-insert1 face1))
                          (face2     (if (evil-insert-state-p) 'powerline-insert2 face2))
                          (evilstate (custom-evil-state))
                          (evilface  (if active (custom-evil-face evilstate) 'powerline-evil-inactive))
                          (lhs (list
                                    ; evil state
                                (propertize (format " %s " evilstate) 'face evilface)
                                (powerline-arrow-left evilface face0)

                                    ; buffer name
                                (eval
                                 (cond (buffer-read-only
                                        (propertize " %b RO " 'face face0))
                                       ((buffer-modified-p)
                                        (propertize " %b + " 'face face0))
                                       (t (powerline-raw "%b " face0 'l))))
                                (powerline-arrow-left face0 face1)

                                    ; modes

                                   (powerline-raw " " face1)
                                   (powerline-major-mode face1 'l)
                                   (powerline-process face1)
                                   (powerline-raw " :" face1)
                                   (powerline-minor-modes face1 'l)
                                   (powerline-raw " " face1)
                                   (powerline-arrow-left face1 face2)

                                    ; process
                                ;; (when mode-line-process
                                ;;   (powerline-raw (format "%s " mode-line-process) face2 'l))


                                    ; vcs
                                (powerline-vc face2)))

                          (rhs (list
                                    ; mode string
                                (powerline-raw global-mode-string face2 'r)
                                (powerline-arrow-right face2 face1)

                                    ; position percent
                                (powerline-raw (mode-line-eol-desc) face1 'l)
                                (powerline-raw " | %p" face1 'r)
                                ;; (powerline-narrow face0 'r)
                                (powerline-arrow-right face1 face0)

                                    ; position 
                                (powerline-raw " LN %l:%2c" face0 'r)
                                ;;(powerline-narrow face0 'r)
                                ;;no arrow here
                                ;;(powerline-arrow-right face0 face2)

                                (powerline-hud face1 face2))))

                     (concat
                      (powerline-render lhs)
                      (powerline-fill face2 (powerline-width rhs))
                      (powerline-render rhs)))))))

(defvar mode-line-cleaner-alist
  `((auto-complete-mode . " α")
    (yas-minor-mode . " γ")
    (golden-ratio-mode . " φ")
    (smartparens-mode . " Φ")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (undo-tree-mode . " τ")
    (volatile-highlights-mode . " υ")
    (elisp-slime-nav-mode . " δ")
    (nrepl-mode . " ηζ")
    (nrepl-interaction-mode . " ηζ")
    ;; Major modes
    (clojure-mode . "λ")
    (hi-lock-mode . "")
    (python-mode . "Py")
    (emacs-lisp-mode . "EL")
    (lisp-interaction-mode . "ELi")
    (puppet-mode . "PP")
    (markdown-mode . "md"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")


(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                  (mode-str (cdr cleaner))
                  (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
               (setcar old-mode-str mode-str))
             ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))


;; Tweaking
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-modeline-things)
(add-hook 'after-change-major-mode-hook 'clean-mode-line)
