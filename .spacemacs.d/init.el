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
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     asciidoc
     (auto-completion :variables
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip t
                      auto-completion-use-company-box t
                      auto-completion-enable-sort-by-usage t)
     ;; (clojure :variables
     ;;          clojure-toplevel-inside-comment-form t
     ;;          clojure-enable-linters '(clj-kondo joker)
     ;;          clojure-enable-sayid t
     ;;          cider-overlays-use-font-lock t
     ;;          cider-print-options '(("length" 24) ("level" 10))
     ;;          ;; '((\"length\" 50) (\"right-margin\" 70))
     ;;          ;; cider-preferred-build-tool 'clojure-cli
     ;;          clojure-enable-clj-refactor t)
     ;; command-log
     compleseus
     ;; colors
     csv
     ;; (dap :variables dap-enable-mouse-support	nil)
     ;; dash
     ;; (deft :variables deft-zetteldeft nil)
     ;; (elfeed :variables
     ;;         rmh-elfeed-org-files (list "~/development/org/elfeed.org"))
     ;; (elixir :variables
     ;;         elixir-backend 'alchemist)
     ;; (elm :variables
     ;;      elm-sort-imports-on-save t
     ;;      elm-format-on-save t)
     emacs-lisp
     emoji
     (git :variables
          git-magit-status-fullscreen t
          magit-diff-refine-hunk 'all)
     ;; google-calendar
     graphql
     ;; graphviz
     (gtags :variables
            gtags-enable-by-default nil)
     ;; (haskell :variables
     ;;          haskell-completion-backend 'lsp
     ;;          lsp-haskell-process-path-hie "haskell-language-server-wrapper")
     helpful
     (html :variables
           web-fmt-tool 'prettier)
     ;; browse buffers by major-mode or project
     (ibuffer :variables
              ibuffer-group-buffers-by 'projects)
     import-js
     (javascript :variables
                 javascript-repl 'indium
                 javascript-import-tool 'import-js
                 javascript-backend 'lsp
                 ;; javascript-lsp-linter nil
                 ;; if using flow, js2-mode sometimes gets confused
                 ;; js2-mode-show-strict-warnings nil
                 js2-mode-show-parse-errors nil
                 javascript-fmt-tool 'prettier
                 node-add-modules-path t
                 js2-include-node-externs t)
     ;; julia
     (json :variables
           json-fmt-tool 'prettier)
     (lsp :variables
          lsp-inlay-hints-mode t
          lsp-inlay-hint-enable t
          lsp-ui-sideline-show-code-actions t
          lsp-rust-server 'rust-analyzer
          cargo-process-reload-on-modify t
          lsp-rust-analyzer-cargo-watch-command "clippy"
          lsp-eldoc-render-all t
          lsp-rust-analyzer-proc-macro-enable t
          lsp-rust-analyzer-experimental-proc-attr-macros t
          lsp-rust-analyzer-inlay-hints-mode t
          lsp-rust-analyzer-max-inlay-hint-length '20
          lsp-rust-analyzer-server-display-inlay-hints t
          lsp-rust-analyzer-display-chaining-hints t
          lsp-rust-analyzer-display-parameter-hints t
          lsp-rust-analyzer-display-closure-return-type-hints t)
     markdown
     ;; multiple-cursors
     ;; ocaml
     (org :variables
          org-enable-org-journal-support t
          org-want-todo-bindings t
          org-enable-roam-support t
          org-enable-roam-protocol t
          ;; org-enable-github-support t
          ;; org-enable-bootstrap-support t
          ;; org-enable-reveal-js-support t
          ;; org-enable-hugo-support t
          ;; org-enable-trello-support t
          ;; org-enable-jira-support t
          ;; org-enable-epub-support t
          org-enable-sticky-header t
          org-projectile-file "TODOs.org")
     osx
     prettier
     ;; (python :variables
     ;;         python-backend 'lsp
     ;;         python-formatter 'yapf
     ;;         python-format-on-save t
     ;;         python-sort-imports-on-save t)
     (ranger :variables
             ranger-show-preview t
             ranger-cleanup-on-disable t
             ranger-show-hidden t
             ranger-max-preview-size 10)
     react
     ;; (ruby :variables
     ;;       ruby-enable-enh-ruby-mode	t
     ;;       ruby-backend 'lsp
     ;;       ruby-version-manager 'rbenv
     ;;       ruby-test-runner 'rspec
     ;;       ruby-highlight-debugger-keywords t)
     ;; ruby-on-rails
     (rust :variables
           rust-format-on-save t)
     semantic
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-enable-smart-eshell t)
     (solidity :variables
               solidity-flycheck-use-project t
               ;; solidity-flycheck-solc-additional-allow-paths '($(pwd)/node_modules/@openzeppelin)
               solidity-flycheck-chaining-error-level t
               solidity-flycheck-solc-checker-active t)
     (spacemacs-modeline :variables
                         doom-modeline-height 12
                         doom-modeline-bar-width 1
                         doom-modeline-buffer-file-name-style 'relative-to-project
                         doom-modeline-display-default-persp-name t
                         doom-modeline-buffer-encoding nil
                         doom-modeline-github t
                         doom-modeline-gnus nil
                         doom-modeline-irc nil
                         doom-modeline-env-version t
                         doom-modeline-modal-icon nil)
     (spell-checking :variables
                     ispell-program-name "aspell"
                     ispell-dictionary "en_US")
     ;; spotify
     (sql :variables
          sql-capitalize-keywords t)
     (syntax-checking  :variables
                       syntax-checking-enable-tooltips nil
                       syntax-checking-use-original-bitmaps t)
     ;; theming
     ;; (treemacs :variables
     ;;           treemacs-indentation 1
     ;;           treemacs-use-filewatch-mode t
     ;;           treemacs-use-follow-mode t)
     (typescript :variables
                 typescript-fmt-on-save t
                 typescript-fmt-tool 'prettier
                 typescript-linter 'eslint
                 typescript-backend 'lsp
                 typescript-lsp-linter 'nil
                 node-add-modules-path t)
     (version-control :variables
                      version-control-diff-side 'left
                      version-control-global-margin t)
     yaml
     )

     ;; List of additional packages that will be installed without being
     ;; wrapped in a layer. If you need some configuration for these
     ;; packages, then consider creating a layer. You can also put the
     ;; configuration in `dotspacemacs/user-config'.
     ;; To use a local version of a package, use the `:location' property:
     ;; '(your-package :location "~/path/to/your-package/")
     ;; Also include the dependencies as they will not be resolved automatically.
     dotspacemacs-additional-packages
   '(
     exec-path-from-shell
     (copilot :location (recipe
                         :fetcher github
                         :repo "zerolfx/copilot.el"
                         :files ("*.el" "dist")))
     )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(window-purpose)
   ;; dotspacemacs-excluded-packages '()

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
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

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

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
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

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
                         ;; badwolf)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   ;; dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)
   dotspacemacs-mode-line-theme '(doom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)

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
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

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
   dotspacemacs-large-file-size 1000

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
   dotspacemacs-enable-paste-transient-state nil

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
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

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

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
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
   dotspacemacs-line-numbers 'nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

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
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

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
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; prevent emacs from prompting on these dir-locals
  (add-to-list 'safe-local-variable-values
               '(projectile-indexing-method . hybrid))
  (add-to-list 'safe-local-variable-values
 '(flycheck-command-wrapper-function . (lambda (command)
                                                       (append '("bundle" "exec")
                                                               command))))

  ;; setup copilot
  (with-eval-after-load 'company
    ;; disable inline previews
    (delq 'company-preview-if-just-one-frontend company-frontends))
  (with-eval-after-load 'copilot
    (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
    (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion)
    (define-key copilot-completion-map (kbd "C-TAB") 'copilot-accept-completion-by-word)
    (define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion-by-word))
  (add-hook 'prog-mode-hook 'copilot-mode)

  ;; toggle indent guide globally on start
  (spacemacs/toggle-indent-guide-globally-on)
  ;; toggle indent highlight on buffer start
  (add-hook 'prog-mode-hook 'spacemacs/toggle-highlight-indentation-on)

  ;; keeps s-expressions balanced when possible in lisp modes
  (spacemacs/toggle-evil-safe-lisp-structural-editing-on-register-hooks)

  (add-to-list 'default-frame-alist
               '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist
               '(ns-appearance . light))

  (setq magit-log-section-commit-count 20)
  (setq magit-process-finish-apply-ansi-colors t)
  (when (eq system-type 'darwin)
    ;; Lefthook outputs an extra carriage returns on Darwin.
    (defun me/magit--darwin-process-filter (orig-fun proc string)
      (funcall orig-fun proc (replace-regexp-in-string "\r\n" "\n" string)))
    (advice-add 'magit-process-filter :around #'me/magit--darwin-process-filter))

  (setq auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))
  (setq paradox-github-token (cadr (auth-source-user-and-password "api.github.com"
                                                                  "wminshew^paradox")))

  (defun ask-user-about-lock (file other-user)
    "A value of t says to grab the lock on the file."
    t)

  ;; set indent defaults
  (setq-default
    standard-indent 2
    ;; js2-mode
    js2-basic-offset 2
    ;; web-mode
    js-indent-level 2
    css-indent-offset 2
    web-mode-markup-indent-offset 2
    web-mode-css-indent-offset 2
    web-mode-code-indent-offset 2
    web-mode-attr-indent-offset 2
    javascript-fmt-on-save t)

  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params
                 '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params
                 '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params
                 '("lineup-calls" . nil)))

  ;; set search mode to insensitive (default: smart)
  (setq case-fold-search nil)
  (setq evil-ex-search-case 'sensitive)

  ;; speed up lsp performance
  ;; https://github.com/emacs-lsp/lsp-mode#performance
  (setq read-process-output-max (* 1024 1024)) ;; 1mb

  (require 'exec-path-from-shell)
  (when (memq window-system
              '(mac ns x))
    ;; (setq dired-use-ls-dired nil)

    ;; (setq exec-path-from-shell-debug t)
    ;; (setq exec-path-from-shell-check-startup-files nil)
    ;; (setq exec-path-from-shell-arguments '("-i"))
    ;; TODO: still slow af, some suggestions to speed up via
    ;; https://github.com/purcell/exec-path-from-shell
    ;; maybe just use .spacemacs.env ,,
    (setq exec-path-from-shell-arguments nil)
    (dolist (var '("EDITOR" "GTAGSCONF" "GTAGSLABEL" "VISUAL" "ASDF_DIR"))
      (add-to-list 'exec-path-from-shell-variables var))
    (exec-path-from-shell-initialize)
    )

  ;; set shell external terminal to iTerm
  (setq terminal-here-terminal-command (list "/Applications/iTerm.app/Contents/MacOS/iTerm2"))

  ;; add emoji support in macos
  (when (eq system-type 'darwin)
    (set-fontset-font t 'unicode "Apple Color Emoji"
                      nil 'prepend))

  ;; set C-w to delete-word in completion
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word))

  ;; (setq deft-directory "~/development/org/wiki")

  ;; (yasnippet-snippets-initialize)

  ;; org config -- to avoid messing with emacs-vanilla org (wait for layer to load)
  (with-eval-after-load 'org
    (add-to-list 'org-modules 'org-habit t)
    ;; (add-to-list 'org-modules 'org-protocol t)
    ;; (add-to-list 'org-modules 'org-roam-protocol t)
    (require 'org-habit)
    ;; (require 'org-protocol)
    ;; (require 'org-roam-protocol)
    (require 'netrc)
    (setq org-todo-keywords '((sequence "TODO(t)" "PROGRESS(p)" "WAITING(w)"
                                        "|" "DONE(d)" "DELEGATED(g)" "CANCELLED(c)")))
    (setq org-highest-priority 0)
    (setq org-lowest-priority 9)
    (setq org-default-priority 5)
    (setq spaceline-org-clock-p t)
    (setq org-image-actual-width 700)
    ;; (setq org-image-actual-width nil)
    (setq org-directory "~/development/org")
    (setq org-roam-directory (concat org-directory "/wiki"))
    (setq org-default-notes-file (concat org-directory "/tasks.org"))
    (setq org-agenda-files '("~/development/org/tasks.org"
                             "~/development/org/habits.org"
                             ))
    (setq org-agenda-custom-commands
          '(("c" . "My Custom Agendas")
            ("cu" "Unscheduled TODO"
             ((todo ""
                    ((org-agenda-overriding-header "\nUnscheduled TODO")
                     (org-agenda-skip-function '(or (org-agenda-skip-entry-if 'scheduled)
                                                    (org-agenda-skip-entry-if 'deadline))))))
             nil
             nil)))
    (setq org-refile-targets '((nil :maxlevel . 9)
                               (org-agenda-files :maxlevel . 9)))
    (setq org-refile-use-outline-path 'file)
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-allow-creating-parent-nodes 'confirm)
    (setq org-journal-dir (concat org-directory "/journal"))
    (setq org-journal-file-format "%Y-%m-%d")
    (setq org-journal-file-type 'weekly)
    (setq org-agenda-span 'day)
    (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
    (setq org-agenda-skip-deadline-prewarning-if-scheduled t)
    (setq org-agenda-skip-deadline-if-done t)
    (setq org-agenda-window-setup 'current-window)
    (setq org-agenda-start-with-log-mode t)
    (setq org-habit-graph-column 80)
    (setq org-habit-show-habits-only-for-today t)
    (setq org-capture-templates '(("t" "Todo"
                                   entry
                                   (file+headline "~/development/org/tasks.org"
                                                  "tasks")
                                   "* TODO %?\n  %i\n  %a")
                                  ("p" "Protocol"
                                   entry
                                   (file+headline "~/development/org/tasks.org"
                                                  "tasks")
                                   "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
                                  ("L" "Protocol Link"
                                   entry
                                   (file+headline "~/development/org/tasks.org"
                                                  "read")
                                   "* TODO [#8] %? [[%:link][%:description]] \nCaptured On: %U")))
    (setq org-protocol-default-template-key "p")
    (setq org-roam-link-title-format "[[%s]]")
    (setq org-roam-capture-templates '(("d" "default"
                                        plain
                                        (function org-roam--capture-get-point)
                                        "%?"
                                        :file-name "${slug}"
                                        :head "#+TITLE: ${slug}
#+ROAM_KEY: ${slug}
#+ROAM_TAGS: "
                                        :unnarrowed t)
                                       ("c" "contact"
                                        plain
                                        (function org-roam--capture-get-point)
                                        "%?"
                                        :file-name "${slug}"
                                        :head "#+TITLE: ${slug}
#+ROAM_KEY: ${slug}
#+ROAM_TAGS: "
                                        :unnarrowed t)
                                       ("m" "meeting"
                                        plain
                                        (function org-roam--capture-get-point)
                                        "%?"
                                        :file-name "${slug}"
                                        :head "#+TITLE: ${slug}
#+ROAM_KEY: ${slug}
#+ROAM_TAGS: "
                                        :unnarrowed t)))
    (setq org-roam-capture-ref-templates '(("r" "ref"
                                            plain
                                            (function org-roam--capture-get-point)
                                            "%?"
                                            :file-name "websites/${slug}"
                                            :head "#+TITLE: ${title}
#+ROAM_KEY: ${ref}
#+ROAM_TAGS:
- source :: ${ref}"
                                            :unnarrowed t)))
    (defun get-authinfo (host port)
      (let* ((netrc (netrc-parse (expand-file-name "~/.authinfo.gpg")))
             (hostentry (netrc-machine netrc host port port)))
        (when hostentry
          (netrc-get hostentry "password"))))
    ;; (setq org-gcal-client-id "912804697644-uce1lkl6a1qmucc96qeolm8v8kgmt4e0.apps.googleusercontent.com"
    ;;       org-gcal-client-secret (get-authinfo "gcal.api" "9999")
    ;;       org-gcal-file-alist '(("wminshew@gmail.com" . "~/development/org/gcal.org"))
    ;;       ;; ("will@mighty.co" . "~/development/org/mighty-gcal.org"))
    ;;       org-gcal-remove-api-cancelled-events t)
    (add-hook 'org-agenda-finalize-hook
              (lambda ()
                (remove-text-properties (point-min)
                                        (point-max)
                                        '(mouse-face t))))
    (with-eval-after-load 'org-agenda
      (require 'org-projectile)
      (mapcar (lambda (file)
                (when (file-exists-p file)
                  (push file org-agenda-files)))
              (org-projectile-todo-files)))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(evil-want-Y-yank-to-eol nil)
 '(helm-completion-style 'emacs)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(package-selected-packages
   '(helpful elisp-refs lsp-haskell intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell dante lcr company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode attrap doom-modeline shrink-path indium json-process-client company-box import-js grizzl stickyfunc-enhance srefactor zetteldeft deft helm-dash dash-docs dash-at-point org-gcal persist request-deferred calfw elfeed-org elfeed-goodies ace-jump-mode noflet elfeed org-roam github-search github-clone gist gh marshal logito forge ghub closql emacsql-sqlite emacsql treepy org-sticky-header org-journal tide typescript-mode lsp-mode sqlup-mode sql-indent ibuffer-projectile ranger flyspell-correct-helm flyspell-correct auto-dictionary xkcd spotify helm-spotify-plus multi xterm-color vterm terminal-here shell-pop multi-term eshell-z eshell-prompt-extras esh-help helm-gtags ggtags enh-ruby-mode dap-mode bui company-statistics company-quickhelp projectile-rails inflections feature-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode impatient-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data add-node-modules-path yapfify yaml-mode utop tuareg caml seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake pytest pyenv-mode py-isort pippel pipenv pyvenv pip-requirements ocp-indent ob-elixir mvn minitest meghanada maven-test-mode lsp-python-ms lsp-java live-py-mode importmagic epc ctable concurrent deferred helm-pydoc groovy-mode groovy-imports pcache gradle-mode git-gutter-fringe+ fringe-helper git-gutter+ flycheck-ocaml merlin flycheck-mix flycheck-credo emojify emoji-cheat-sheet-plus dune cython-mode company-emoji company-anaconda chruby bundler inf-ruby browse-at-remote blacken auto-complete-rst anaconda-mode pythonic alchemist elixir-mode yasnippet-snippets helm-company helm-c-yasnippet fuzzy company-tern company auto-yasnippet ac-ispell auto-complete evil-mc ws-butler writeroom-mode visual-fill-column winum web-beautify volatile-highlights vi-tilde-fringe uuidgen treemacs-projectile treemacs-persp treemacs-magit treemacs-evil treemacs pfuture toc-org tern symon symbol-overlay string-inflection spaceline-all-the-icons all-the-icons memoize spaceline powerline smeargle rjsx-mode reveal-in-osx-finder restart-emacs rainbow-delimiters prettier-js popwin persp-mode password-generator paradox spinner overseer osx-trash osx-dictionary osx-clipboard orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-cliplink org-bullets org-brain org-ql peg ov org-super-agenda dash-functional ts ht open-junk-file nodejs-repl nameless move-text mmm-mode markdown-toc markdown-mode magit-svn magit-section magit-gitflow magit-popup macrostep lorem-ipsum livid-mode skewer-mode simple-httpd link-hint launchctl json-navigator hierarchy json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile projectile helm-org-rifle helm-org helm-mode-manager helm-make helm-ls-git helm-gitignore request helm-git-grep helm-flx helm-descbinds helm-ag google-translate golden-ratio gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md flycheck-package package-lint flycheck pkg-info epl let-alist flycheck-elsa flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit magit git-commit with-editor transient evil-lisp-state evil-lion evil-indent-plus evil-iedit-state iedit evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens smartparens paredit evil-args evil-anzu anzu eval-sexp-fu elisp-slime-nav editorconfig dumb-jump f dash s devdocs column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup which-key use-package pcre2el org-plus-contrib hydra lv hybrid-mode font-lock+ evil goto-chg undo-tree dotenv-mode diminish bind-map bind-key async))
 '(paradox-github-token t t)
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(safe-local-variable-values
   '((eval setq solidity-flycheck-solc-additional-allow-paths
           (list
            (expand-file-name "./node_modules"
                              (solidity-flycheck--find-working-directory nil))))
     (eval setq solidity-flycheck-solc-additional-allow-paths
           (list
            (expand-file-name "./lib/"
                              (solidity-flycheck--find-working-directory nil))))
     (eval setq solidity-flycheck-solc-additional-allow-paths
           (list
            (expand-file-name "./node_modules/"
                              (solidity-flycheck--find-working-directory nil))))
     (solidity-flycheck-solc-additional-allow-paths . "@rari-capital=node_modules/@rari-capital")
     (projectile-indexing-method . hybrid)
     (typescript-backend . lsp)
     (flycheck-command-wrapper-function lambda
                                        (command)
                                        (append
                                         '("bundle" "exec")
                                         command)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
