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

                      ;; appearance
                      color-theme
                      color-theme-sanityinc-tomorrow
                      sublimity
                      
                      ;; evil-mode
                      evil
                      evil-indent-textobject
                      evil-visualstar
                      evil-leader
                      evil-numbers
                      evil-matchit
                      surround
                      evil-nerd-commenter
                      key-chord
                                                 
                      ;; utility
                      ag
                      projectile
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
                                                 
                      ;; Ruby
                      robe
                                                 
                      ;; Python
                      jedi
                      ein
                                                
                      ;; Lispy languages
                      smartparens
                      hl-sexp
                      rainbow-mode
                      rainbow-delimiters
                      racket-mode
                                                 
                      ;; Clojure mode extensions
                      clojure-mode
                      cljsbuild-mode
                      cider
                                                 
                      ;; Extra-Language-modes
                      puppet-mode
                      haskell-mode
                      haml-mode
                      yaml-mode
                      lua-mode

                      ;; auto-complete
                      yasnippet
                      auto-complete
                      ac-nrepl)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Load el-get for packages not available in elpa
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(defun eval-url (url)
  (let ((buffer (url-retrieve-synchronously url)))
    (save-excursion
      (set-buffer buffer)
      (goto-char (point-min))
      (re-search-forward "^$" nil 'move)
      (eval-region (point) (point-max))
      (kill-buffer (current-buffer)))))

(defun install-el-get ()
  (eval-url
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"))

(unless (require 'el-get nil t)
  (install-el-get))

(setq el-get-generate-autoloads t
      el-get-sources '(      (:name rcodetools
                              :type http
                              :url "https://raw.github.com/tnoda/rcodetools/master/rcodetools.el")

                             (:name dictem
                              :type git
                              :url "https://github.com/cheusov/dictem.git")))

(setq my-el-get-packages '(rcodetools dictem))

(el-get 'sync my-el-get-packages)
(provide 'dependencies-setup)
