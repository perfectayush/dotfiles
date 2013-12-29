;;auto-complete with yasnippets and jedi
(setq yas-snippet-dirs '("~/.emacs.d/custom/snippets/"))
(add-to-list 'yas-snippet-dirs (car (file-expand-wildcards "~/.emacs.d/elpa/yasnippet-*/snippets")))
(yas-global-mode t)

(require 'auto-complete)
(require 'auto-complete-config)
(require 'robe)
(require 'ac-nrepl)

(ac-config-default)
(setq ac-fuzzy-enable t)
(global-auto-complete-mode t)
(ac-set-trigger-key "TAB")
(define-key ac-completing-map (kbd "C-s") 'ac-next)
(define-key ac-completing-map (kbd "C-r") 'ac-previous)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "<backtab>") 'ac-previous)


(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t) 
(setq jedi:complete-on-dot t)             

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-robe)
            (setq completion-at-point-functions '(auto-complete))))

;;ac-nrepl
(add-hook 'cider-repl-mode-hook 'ac-nrepl-setup)
(add-hook 'cider-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-repl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

(setq-default ac-sources
      '(ac-source-filename
        ac-source-yasnippet
        ac-source-functions
        ac-source-variables
        ac-source-symbols
        ac-source-features
        ac-source-abbrev
        ac-source-dictionary
        ac-source-semantic
        ac-source-ropemacs
        ac-source-words-in-buffer
        ac-source-files-in-current-dir
        ac-source-words-in-same-mode-buffers))

(provide 'ac-tweaks)
