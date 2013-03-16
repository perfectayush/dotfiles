;; Function to switch mode using jk by roman
;; In this section we implement code that will allow us
;; to get into evil-normal mode using "jk" in insert mode.

(evil-define-command custom/jk-to-normal-mode ()
  "Allows to get into 'normal' mode using 'jk'."
  :repeat change
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?k)
                           nil 0.5)))
      (cond
       ((null evt)
          (message ""))
       ((and (integerp evt)
             (char-equal evt ?k))
          ;; remove the j character
          (delete-char -1)
          (set-buffer-modified-p modified)
          (push 'escape unread-command-events))
       (t ; otherwise
          (setq unread-command-events (append unread-command-events
                                              (list evt))))))))
;;;;;;;;;;;;;;;;;
;; Custom highlights for insert and normal mode
;; in the modeline
;;;;;;;;;;;;;;;;;
;;
;; We don't want evil's default for evil-mode-line-format,
;; so we are going to append it ourselves at the
;; start of the mode-line-format list
(setq evil-mode-line-format nil)

(defun custom/evil-refresh-mode-line ()
  (interactive)
  (add-to-list 'mode-line-format " ")
  (add-to-list 'mode-line-format
               '(:eval evil-mode-line-tag))
  (force-mode-line-update))

(defmacro custom/make-evil-highlight-mode (evil-mode
                                        modeline-foreground
                                        modeline-background
                                        evil-tag-foreground
                                        evil-tag-background
                                        evil-tag-text)
  (let ((function-name  (intern (format "custom/highlight-%s-mode" evil-mode)))
        (tag-var-name   (intern (format "evil-%s-state-tag" evil-mode)))
        (evil-hook-name (intern (format "evil-%s-state-entry-hook"
                                        evil-mode))))
    `(progn
       ;; Create a function that will specify the
       ;; highlight for a evil-mode
       (defun ,function-name ()
         (interactive)
         (set-face-foreground 'modeline ,modeline-foreground)
         (set-face-background 'modeline ,modeline-background)
         (setq ,tag-var-name
               (propertize ,evil-tag-text
                           'face
                           '(:background ,evil-tag-background
                             :foreground ,evil-tag-foreground
                           'bold))))
       ;; Call the function for the simple initialization
       (,function-name)
       ;; Add a hook for the mode entry
       (add-hook ',evil-hook-name
                 ',function-name))))

;; custom colors for emacs evil modeline
(custom/make-evil-highlight-mode "insert"    ; mode name
                                 "#005F87"   ; modeline foreground
                                 "white"     ; modeline background
                                 "#005F87"   ; mode foreground
                                 "white"     ; mode background
                                 " INSERT ")      ; mode tag

(custom/make-evil-highlight-mode "normal"
                                 "white"
                                 "#0A423F"
                                 "#0A423F"
                                 "#81FC33"
                                 " NORMAL ")

(custom/make-evil-highlight-mode "emacs"
                                 "white"
                                 "#0A423F"
                                 "white"
                                 "#380A42"
                                 " EMACS ")

(custom/make-evil-highlight-mode "visual"
                                 "white"
                                 "#0A423F"
                                 "white"
                                 "#420A15"
                                 " VISUAL ")

(custom/make-evil-highlight-mode "replace"
                                 "white"
                                 "#0A423F"
                                 "white"
                                 "#D70000"
                                 " REPLACE ")

(custom/make-evil-highlight-mode "motion"
                                 "white"
                                 "#0A423F"
                                 "white"
                                 "#14AACC"
                                 " MOTION ")

(defadvice evil-refresh-mode-line
  (before custom-evil-refresh-mode-line activate)
  (custom/evil-refresh-mode-line))

(defadvice evil-mode-enable-in-buffers
  (after custom-evil-mode-enable-in-buffers activate)
  (custom/evil-refresh-mode-line))

;;evil surround
(global-surround-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key bindings overrides for evil mode ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; evil leader shortcuts
(require 'evil-leader)
(evil-leader/set-leader ",")
;;evil-leader-in-visual-mode
(define-key evil-visual-state-map "," evil-leader/map) 
(evil-leader/set-key
  "k"  'kill-buffer 
  "b"  'switch-to-buffer
  "e"  'file-file
  "u"  'undo-tree-visualize
  "l"  'evil-next-buffer
  "h"  'evil-prev-buffer
  "."  'find-tag
  "="  'evil-numbers/inc-at-pt
  "-"  'evil-numbers/dec-at-pt
  "cc" 'evilnc-comment-or-uncomment-lines
  "cc" 'evilnc-comment-or-uncomment-lines
  "ci" 'evilnc-comment-or-uncomment-to-the-line
)

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
(define-key evil-insert-state-map "j" #'custom/jk-to-normal-mode)

;; evil quick buffer switching
(define-key evil-normal-state-map "L" 'evil-next-buffer)
(define-key evil-normal-state-map "H" 'evil-prev-buffer)
(define-key evil-motion-state-map "H" 'evil-prev-buffer)
(define-key evil-motion-state-map "L" 'evil-next-buffer)

;; ace jump mode key bindings
(define-key evil-normal-state-map "  " 'ace-jump-mode)
(define-key evil-normal-state-map " k" 'ace-jump-char-mode)
(define-key evil-normal-state-map " l" 'ace-jump-line-mode)

;;evil cursor tweak for themes
(setq evil-default-cursor t)

;; override default evil states for modes
(evil-set-initial-state 'slime-repl-mode 'emacs)

;; emacs like movement
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)

;; enable evil >:->
(evil-mode 1)

(provide 'evil-tweaks)
