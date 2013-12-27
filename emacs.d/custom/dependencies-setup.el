                                        ; derived from ELPA installation
                                        ; http://tromey.com/elpa/install.html

;; Load ELPA
(add-to-list 'load-path "~/.emacs.d/elpa")

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(
                      ;; emacs libraries
                      s
                      epl
                      dash
                      pkg-info

                      ;; starter-kit
                      starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-eshell
                      starter-kit-js

                      color-theme
                      color-theme-sanityinc-tomorrow
                      
                      ;;evil-mode
                      evil
                      evil-leader
                      evil-numbers
                      surround
                      evil-nerd-commenter
                      key-chord
                                                 
                      ;;utility
                      ack
                      ace-jump-mode
                      sudo-ext
                      powerline
                      popup
                      fuzzy
                      kpm-list
                      golden-ratio
                      helm
                      multiple-cursors
;                      dictem
                      xclip
                                                 
                      ;;Ruby
                      robe
                                                 
                      ;; python
                      jedi
                      ein
                                                
                      ;;Lispy languages
                      smartparens
                      hl-sexp
                      rainbow-mode
                      rainbow-delimiters
                                                 
                      ;;Clojure mode extensions
                      clojure-mode
                      cljsbuild-mode
                      cider
                                                 
                      ;;Extra-Language-modes
                      puppet-mode
                      haskell-mode
                      haml-mode
                      yaml-mode
                      lua-mode

                      ;;auto-complete
                      yasnippet
                      auto-complete
                      ac-nrepl
;                      auto-complete-yasnippet
 
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'dependencies-setup)
