;;; linum-relativenumber.el --- add relative line numbers to linum

;; Copyright (C) 2011,2012 Scott Jaderholm

;; Author: Scott Jaderholm <myfirstname@mylastname.com>
;; Created: 2011
;; License: GPL 3

;;; Commentary
;; This adds relative line numbers to linum. It retains the absolute line
;; numbers. It also indicates the top of the buffer and the current line.

;;; Usage
;; (add-to-list 'load-path "~/.elisp/linum-relativenumber")
;; (require 'linum-relativenumber)

(require 'linum)

(setq linum-relativenumber-last-pos 0)

(defadvice linum-update (before linum-relativenumber-linum-update activate)
  (setq-default linum-last-pos (line-number-at-pos)))

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

(defun linum-relativenumber-format (line-number)
  (let ((diff (abs (- line-number linum-last-pos))))
    (concat   (propertize (format "%3d " line-number)
                        'face 'linum-relativenumber-line)

              (propertize (format " %2d " diff)
                        'face (cond ((zerop diff) 'linum-relativenumber-zero)
                                    ((eq 1 line-number) 'linum-relativenumber-top)
                                    (t 'linum))))))

(setq linum-format 'linum-relativenumber-format)

(provide 'linum-relativenumber)
