;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/private/")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     compleseus

     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-return-key-behavior 'complete
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence nil)

     (lsp :variables
          lsp-headerline-breadcrumb-enable t
          lsp-headerline-breadcrumb-segments '(file symbols)
          lsp-lens-enable t
          lsp-navigation 'peek
          lsp-ui-remap-xref-keybindings t
          lsp-ui-remap-xref-keybindings t
          lsp-ui-doc-enable nil
          lsp-ui-sideline-enable nil)

     dap
     ;; evil
     evil-snipe
     (vinegar :variables vinegar-reuse-dired-buffer t)
     multiple-cursors

     ;; languages/frameworks
     html
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-enable-roam-support t
          org-roam-v2-ack t
          org-enable-roam-protocol t
          org-enable-roam-server t
          org-enable-roam-ui t)
     plantuml
     emacs-lisp
     lua
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyright
             python-fill-column 80)
     (ruby :variables
           ruby-version-manager 'chruby
           ruby-enable-enh-ruby-mode t
           ruby-backend 'lsp)
     (go :variables go-backend 'lsp)
     (shell :variables shell-default-shell 'eshell)
     clojure
     julia
     javascript
     markdown
     (java :variables java-backend 'lsp)
     (yaml :variables yaml-enable-lsp t)
     ansible
     docker
     terraform
     csv
     sql
     systemd
     php
     rust
     nginx

     ;; private layers
     archcode

     ;; emacs tooling
     (tree-sitter :variables
                  tree-sitter-syntax-highlight-enable t
                  tree-sitter-ident t
                  tree-sitter-fold-enable t)
     parinfer
     helpful
     ;; confluence
     vagrant
     git
     dash
     syntax-checking
     spell-checking
     better-defaults
     ibuffer
     pandoc
     colors
     speed-reading
     command-log
     restclient
     version-control
     treemacs
     theming
     (unicode-fonts :variables
                    unicode-fonts-enable-ligatures t
                    unicode-fonts-ligature-set '("!!" "!!." "!=" "!==" "#!" "##" "###" "####" "#(" "#:" "#="
                                                 "#?" "#[" "#_" "#_(" "#{" "$>" "%%" "&&" "(*" "*)" "**"
                                                 "***" "**/" "*/" "*>" "++" "+++" "+>" "--" "---" "-->" "-<"
                                                 "-<<" "->" "->>" "-|" "-}" "-~" ".-" ".." "..." "..<" ".="
                                                 ".?" "/*" "/**" "//" "///" "/=" "/==" "/>" "://" "::" ":::"
                                                 "::=" ":<" ":=" ":>" ";;" "<!--" "<$" "<$>" "<*" "<*>" "<+"
                                                 "<+>" "<-" "<--" "<-<" "<->" "</" "</>" "<:" "<<" "<<-"
                                                 "<<<" "<<=" "<=" "<=<" "<==" "<==>" "<=>" "<>" "<|" "<|>"
                                                 "<||" "<|||" "<~" "<~>" "<~~" "=!=" "=/=" "=:=" "=<<" "=="
                                                 "===" "==>" "=>" "=>>" ">-" ">->" ">:" ">=" ">=>" ">>" ">>-"
                                                 ">>=" ">>>" "?." "?:" "?=" "??" "[]" "[|" "\\\\" "\\\\\\"
                                                 "]#" "^=" "__" "_|_" "www" "{-" "{|" "|-" "|=" "|>" "|]"
                                                 "||" "||=" "||>" "|||>" "|}" "~-" "~=" "~>" "~@" "~~" "~~>"))

     (osx :variables osx-command-as       'super
                     osx-right-command-as 'hyper))

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(evil-textobj-column
                                      evil-python-movement
                                      good-scroll
                                      nord-theme
                                      doom-themes
                                      websocket
                                      (nano-theme :location (recipe
                                                             :fetcher github
                                                             :repo "rougier/nano-theme"))
                                      org-modern
                                      tron-legacy-theme)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(org-contrib)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "/usr/local/bin/Emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable t

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(modus-vivendi tron-legacy doom-nord)
   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme 'doom
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Iosevka SS09"
                               :size 18
                               :weight light
                               ;; :width expanded
                               :powerline-scale 1.0)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative t
                               :disabled-for-modes org-mode
                               :size-limit-kb 2000)
   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode t

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))


(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  (progn
    ;;set custom file and load it
    (setq custom-file "~/.spacemacs.d/custom.el")
    (load custom-file 'no-error)

    (let
        ((nord0  "#2E3440")
         (nord1  "#3B4252")
         (nord2  "#434C5E")
         (nord3  "#4C566A")
         (nord4  "#D8DEE9")
         (nord5  "#E5E9F0")
         (nord6  "#ECEFF4")
         (nord7  "#8FBCBB")
         (nord8  "#88C0D0")
         (nord9  "#81A1C1")
         (nord10 "#5E81AC")
         (nord11 "#BF616A")
         (nord12 "#D08770")
         (nord13 "#EBCB8B")
         (nord14 "#A3BE8C")
         (nord15 "#B48EAD")
         (nord11+1 "#8c3941")
         (nord14+1 "#64824a"))


      (setq theming-modifications
            `((nord
               (diff-refine-removed :foreground ,nord5 :background ,nord11)
               (diff-refine-added  :foreground ,nord5 :background ,nord14)
               (magit-diff-removed :foreground ,nord5 :background ,nord11+1)
               (magit-diff-removed-highlight :foreground ,nord5 :background ,nord11+1)
               (magit-diff-added-highlight :foreground ,nord5 :background ,nord14+1)
               (magit-diff-added :foreground ,nord5 :background ,nord14+1)))))


    (setq configuration-layer-elpa-archives
          '(("melpa"    . "melpa.org/packages/")
            ("org"      . "orgmode.org/elpa/")
            ("ublt"     . "elpa.ubolonton.org/packages/")
            ("gnu"      . "elpa.gnu.org/packages/")))))


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (progn

    ;; evil-settings
    (global-evil-matchit-mode)

    ;; autocomplete mode
    (yas-global-mode)
    (global-company-mode)
    (setq yas-triggers-in-field nil)

    ;; evil-state settings
    (evil-set-initial-state 'anaconda-mode-view-mode 'motion)
    (evil-set-initial-state 'help-mode 'motion)

    ;; evil-textobj-column settings
    (define-key evil-inner-text-objects-map "c" 'evil-textobj-column-word)
    (define-key evil-inner-text-objects-map "C" 'evil-textobj-column-WORD)

    ;; evil-surround
    (setq yaml-mode-evil-surround-extras '((?q . ("\"{{ " . " }}\""))
                                           (?a . ("{{ " . " }}"))
                                           (?e . ("^(" . ")$"))))

    (setq jinja2-mode-evil-surround-extras '((?a . ("{{ " . " }}"))))
    (defun update-surround-list (surround-items)
      (dolist (item surround-items) (add-to-list 'evil-surround-pairs-alist item)))

    (add-hook 'yaml-mode-hook (lambda () (update-surround-list yaml-mode-evil-surround-extras)))
    (add-hook 'jinja2-mode-hook (lambda () (update-surround-list jinja2-mode-evil-surround-extras)))

    ;; wgrep settings
    (setq wgrep-auto-save-buffer t)

    ;; modify super/sub word mode for evil
    (add-hook 'superword-mode-hook #'(lambda ()
                                       (progn (modify-syntax-entry ?_ "w")
                                              (modify-syntax-entry ?- "w"))))

    (add-hook 'subword-mode-hook   #'(lambda ()
                                       (progn (modify-syntax-entry ?_ "_")
                                              (modify-syntax-entry ?- "_"))))

    ;; yaml-mode hooks
    (add-hook 'yaml-mode-hook #'superword-mode)
    (add-hook 'yaml-mode-hook #'smartparens-mode)
    (add-hook 'yaml-mode-hook #'spacemacs/load-yasnippet)


    ;; avy settings
    (setq avy-style 'words)

    ;; transparent title bar
    (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
    (add-to-list 'default-frame-alist '(ns-appearance . dark))

    ;; gpg settings
    (require 'epa-file)
    (setq epa-pinentry-mode 'loopback)
    (epa-file-enable)

    ;; doom treemacs config
    (doom-themes-treemacs-config)

    ;; org settings
    (setq org-brain-path "~/Dropbox/orgs/brain/")
    (setq org-roam-directory "~/Dropbox/orgs/roam/")

    (setq org-roam-capture-templates
          '(
            ("d" "default" plain "%?"
             :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                "#+title: ${title}\n")
             :unnarrowed t)
            ("m" "master_nodes" plain "%?"
             :if-new (file+head "master_nodes/%<%Y%m%d%H%M%S>-${slug}.org"
                                "#+title: ${title}\n")
             :unnarrowed t)
            ("p" "personal" entry "* %?"
             :if-new (file+head "personal/personal.org.gpg"
                                "#+title: Personal\n#+filetags: personal\n\n")
             :empty-lines 1
             :unnarrowed t)
            ("i" "interviews" plain "[[id:507B7F0B-0856-48C5-88CF-C2D4AB1DAE50][Interviews]]\n\n%?"
             :if-new (file+head "interviews/%<%Y-%m-%d-%H%M%S>-${slug}.org"
                                "#+title: ${title}\n#+filetags: interview\n\n")
             :empty-lines 1
             :unnarrowed t)
            ("f" "fairmatic" plain "[[id:3A8D1164-1AA0-4DDA-8D6E-581EB744B283][Fairmatic]]\n\n%?"
             :if-new (file+head "fairmatic/%<%Y-%m-%d-%H%M%S>-${slug}.org"
                                "#+title: ${title}\n#+filetags: fairmatic\n\n"))))

    (add-hook 'org-mode-hook 'org-modern-mode)
    (setq org-hide-emphasis-markers t
          org-pretty-entities t
          org-auto-align-tags nil
          org-tags-column 0
          org-ellipsis "…"
          org-catch-invisible-edits 'show-and-error
          org-special-ctrl-a/e t
          org-insert-heading-respect-content t)

    (global-set-key (kbd "s-c") 'org-roam-capture)

    ;; lsp settings
    (setq lsp-enable-file-watchers nil)

    ;; paradox settings
    (setq paradox-automatically-star nil)
    (setq paradox-github-token t)

    ;; counsel search override
    (setq counsel-rg-base-command
          '("rg"
            "--max-columns" "240"
            "--field-context-separator" ":"
            "--with-filename"
            "--no-heading"
            "--line-number"
            "--color" "never" "%s"))))

