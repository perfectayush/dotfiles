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
