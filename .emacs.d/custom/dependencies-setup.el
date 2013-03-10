                                        ; derived from ELPA installation
                                        ; http://tromey.com/elpa/install.html
(defun eval-url (url)
  (let ((buffer (url-retrieve-synchronously url)))
    (save-excursion
      (set-buffer buffer)
      (goto-char (point-min))
      (re-search-forward "^$" nil 'move)
      (eval-region (point) (point-max))
      (kill-buffer (current-buffer)))))

;; Load ELPA
(add-to-list 'load-path "~/.emacs.d/elpa")

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-ruby starter-kit-eshell starter-kit-js)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Load el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(defun install-el-get ()
  (eval-url
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"))

(unless (require 'el-get nil t)
  (install-el-get))

;;extra source
(setq el-get-generate-autoloads t
      el-get-sources '(
                       (:name evil-paredit
                              :type git
                              :url "https://github.com/roman/evil-paredit.git")

                       (:name evil-nerd-commenter
                              :type git
                              :url "https://github.com/redguardtoo/evil-nerd-commenter.git")

                       (:name linum+
                              :type git
                              :url "https://github.com/emacsmirror/linum-plus.git")

                       (:name rainbow-mode
                              :type git
                              :url "https://github.com/emacsmirror/rainbow-mode.git")

                       (:name ac-nrepl
                              :type git
                              :url "https://github.com/purcell/ac-nrepl.git")

                       (:name popup
                              :type git
                              :url "https://github.com/auto-complete/popup-el.git")

                       (:name fuzzy
                              :type git
                              :url "https://github.com/auto-complete/fuzzy-el.git")

                       (:name auto-complete
                              :type git
                              :url "https://github.com/auto-complete/auto-complete.git")

                       (:name clojure-mode
                              :type git
                              :url "https://github.com/technomancy/clojure-mode.git")

                       (:name cljsbuild-mode
                              :type git
                              :url "https://github.com/BirdseyeSoftware/cljsbuild-mode.git")

                       (:name powerline
                              :type git
                              :url "https://github.com/milkypostman/powerline.git")

                       (:name undo-tree
                              :type git
                              :url "https://github.com/pheaver/undo-tree.el.git")

                       (:name rainbow-delimiters
                              :type git
                              :url "https://github.com/jlr/rainbow-delimiters.git")))

(setq my-el-get-packages
      '(

        ;;evil-mode
        evil
        evil-paredit
        evil-leader
        evil-nerd-commenter

        ;;utility
        magit
        ack
        ace-jump-mode
        sudo-save
        Enhanced-Ruby-Mode
        powerline
        popup
        fuzzy
        zenburn-theme
        linum+

        ;;auto-complete
        auto-complete
        ac-nrepl
        ac-python

        ;;Lispy languages
        paredit
        rainbow-mode
        rainbow-delimiters

        ;;Clojure mode extensions
        clojure-mode
        cljsbuild-mode
        nrepl

        ;;Extra-Language-modes
        puppet-mode
        haml-mode
        lua-mode
        ))

(el-get 'sync my-el-get-packages)

(provide 'dependencies-setup)
