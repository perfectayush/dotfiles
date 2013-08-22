;;dictem
(require 'dictem)
(setq dictem-server "localhost")
(setq dictem-user-databases-alist
      `(("_en-en"  . ("gcide" "wn" "moby"))))

(setq dictem-use-user-databases-only t)

(setq dictem-port   "2628")
(dictem-initialize)

(setq dictem-default-strategy "word")
(setq dictem-use-user-databases-only t)

;; For creating hyperlinks on database names
;; and found matches.
(add-hook 'dictem-postprocess-match-hook
          'dictem-postprocess-match)

;; For highlighting the separator between the definitions found.
;; This also creates hyperlink on database names.
(add-hook 'dictem-postprocess-definition-hook
          'dictem-postprocess-definition-separator)

;; For creating hyperlinks in dictem buffer
;; that contains definitions.
(add-hook 'dictem-postprocess-definition-hook
          'dictem-postprocess-definition-hyperlinks)

;; For creating hyperlinks in dictem buffer
;; that contains information about a database.
(add-hook 'dictem-postprocess-show-info-hook
          'dictem-postprocess-definition-hyperlinks)


;;; http://paste.lisp.org/display/89086
(defun dictem-run-define-at-point-with-query ()
  "Query the default dict server with the word read in within this function."
  (interactive)
  (let* ((default-word (thing-at-point 'symbol))
         (default-prompt (concat "Lookup Word "
                                 (if default-word
                                     (concat "(" default-word ")") nil)
                                 ": "))
         (dictem-query
          (funcall #'(lambda (str)
                       "Remove Whitespace from beginning and end of a string."
                       (replace-regexp-in-string "^[ \n\t]*\\(.*?\\)[ \n\t]*$"
                                                 "\\1"
                                                 str))
                   (read-string default-prompt nil nil default-word))))
    (if (= (length dictem-query) 0) nil
      (dictem-run 'dictem-base-search "*" dictem-query "."))))

(defun dictem-run-define-at-point ()
  "dictem look up for thing at point"
  (interactive)
  (let* ((default-word (thing-at-point 'symbol))
         (dictem-query
          (funcall #'(lambda (str)
                       "Remove Whitespace from beginning and end of a string."
                       (replace-regexp-in-string "^[ \n\t]*\\(.*?\\)[ \n\t]*$"
                                                 "\\1"
                                                 str))
                   default-word)))
    (if (= (length dictem-query) 0) nil
      (dictem-run 'dictem-base-search "*" dictem-query "."))))

(define-key evil-normal-state-map "\C-cd" 'dictem-run-define-at-point)
(define-key evil-motion-state-map "\C-cd" 'dictem-run-define-at-point)
(define-key evil-normal-state-map "\C-cD" 'dictem-run-define-at-point-with-query)
(define-key evil-motion-state-map "\C-cD" 'dictem-run-define-at-point-with-query)

(evil-set-initial-state 'dictem-mode 'motion)
(evil-define-key 'motion dictem-mode-map
  "q"              'dictem-kill
  "Q"              'dictem-kill-all-buffers
  (kbd "TAB")      'dictem-next-link
  (kbd "backtab")  'dictem-previous-link)


(provide 'dictem-setup)
