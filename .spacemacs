;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
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
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     typescript
     graphviz
     csv
     vimscript
     html
     yaml
     elixir
     javascript
     ruby
     (ruby :variables
           ruby-version-manager 'rbenv
           ruby-test-runner 'rspec)
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     better-defaults
     emacs-lisp
     git
     markdown
     org
     (org :variables org-enable-reveal-js-support t)
     (shell :variables
            shell-default-height 30
            shell-default-shell 'eshell
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     dash
     ruby-on-rails
     osx
     auto-completion
     evil-snipe
     (evil-snipe :variables evil-snipe-enable-alternate-f-and-t-behaviors t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      key-chord
                                      magit-gh-pulls
                                      seeing-is-believing
                                      (rspec-mode :location (recipe :fetcher github :repo "trodrigu/rspec-mode" :branch "feature/find_feature_specs_for_controllers"))
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   evil-escape-sequence "jj"
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
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
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
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
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (require 'key-chord)
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (require 'magit-gh-pulls)
  (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls)
  (setq feature-step-search-path "features/**/*steps.rb")
  (setq js-indent-level 2)
  ;; (setq prettify-symbols-unprettify-at-point t)
  ;; (defconst pragmatapro-prettify-symbols-alist
  ;; (mapcar (lambda (s)
  ;;           `(,(car s)
  ;;             .
  ;;             ,(concat
  ;;               (list ?\C-i)
  ;;               (list (decode-char 'ucs (cadr s))))))
  ;;         (list '("[ERROR]"   #XE380)
  ;;               '("[DEBUG]"   #XE381)
  ;;               '("[INFO]"    #XE382)
  ;;               '("[WARN]"    #XE383)
  ;;               '("[WARNING]" #XE384)
  ;;               '("[ERR]"     #XE385)
  ;;               '("[FATAL]"   #XE386)
  ;;               '("[TRACE]"   #XE387)
  ;;               '("!!"        #XE720)
  ;;               '("!="        #XE721)
  ;;               '("!=="       #XE722)
  ;;               '("!!!"       #XE723)
  ;;               '("!≡"        #XE724)
  ;;               '("!≡≡"       #XE725)
  ;;               '("!>"        #XE726)
  ;;               '("#("        #XE740)
  ;;               '("#_"        #XE741)
  ;;               '("#{"        #XE742)
  ;;               '("#?"        #XE743)
  ;;               '("#>"        #XE744)
  ;;               '("##"        #XE745)
  ;;               '("%="        #XE750)
  ;;               '("%>"        #XE751)
  ;;               '("&%"        #XE760)
  ;;               '("&&"        #XE761)
  ;;               '("&*"        #XE762)
  ;;               '("&+"        #XE763)
  ;;               '("&-"        #XE764)
  ;;               '("&/"        #XE765)
  ;;               '("&="        #XE766)
  ;;               '("&&&"       #XE767)
  ;;               '("&>"        #XE768)
  ;;               '("***"       #XE780)
  ;;               '("*="        #XE781)
  ;;               '("*/"        #XE782)
  ;;               '("*>"        #XE783)
  ;;               '("++"        #XE790)
  ;;               '("+++"       #XE791)
  ;;               '("+="        #XE792)
  ;;               '("+>"        #XE793)
  ;;               '("++="       #XE794)
  ;;               '("--"        #XE7A0)
  ;;               '("-<"        #XE7A1)
  ;;               '("-<<"       #XE7A2)
  ;;               '("-="        #XE7A3)
  ;;               '("->"        #XE7A4)
  ;;               '("->>"       #XE7A5)
  ;;               '("---"       #XE7A6)
  ;;               '("-->"       #XE7A7)
  ;;               '("-+-"       #XE7A8)
  ;;               '("-\\/"      #XE7A9)
  ;;               '(".."        #XE7B0)
  ;;               '("..."       #XE7B1)
  ;;               '("..<"       #XE7B2)
  ;;               '(".>"        #XE7B3)
  ;;               '(".~"        #XE7B4)
  ;;               '(".="        #XE7B5)
  ;;               '("/*"        #XE7C0)
  ;;               '("//"        #XE7C1)
  ;;               '("/>"        #XE7C2)
  ;;               '("/="        #XE7C3)
  ;;               '("/=="       #XE7C4)
  ;;               '("///"       #XE7C5)
  ;;               '("/**"       #XE7C6)
  ;;               '("::"        #XE7D0)
  ;;               '(":="        #XE7D1)
  ;;               '(":≡"        #XE7D2)
  ;;               '(":>"        #XE7D3)
  ;;               '(":=>"       #XE7D4)
  ;;               '("<$>"       #XE7E0)
  ;;               '("<*"        #XE7E1)
  ;;               '("<*>"       #XE7E2)
  ;;               '("<+>"       #XE7E3)
  ;;               '("<-"        #XE7E4)
  ;;               '("<<"        #XE7E5)
  ;;               '("<<<"       #XE7E6)
  ;;               '("<<="       #XE7E7)
  ;;               '("<="        #XE7E8)
  ;;               '("<=>"       #XE7E9)
  ;;               '("<>"        #XE7EA)
  ;;               '("<|>"       #XE7EB)
  ;;               '("<<-"       #XE7EC)
  ;;               '("<|"        #XE7ED)
  ;;               '("<=<"       #XE7EE)
  ;;               '("<~"        #XE7EF)
  ;;               '("<~~"       #XE7F0)
  ;;               '("<<~"       #XE7F1)
  ;;               '("<$"        #XE7F2)
  ;;               '("<+"        #XE7F3)
  ;;               '("<!>"       #XE7F4)
  ;;               '("<@>"       #XE7F5)
  ;;               '("<#>"       #XE7F6)
  ;;               '("<%>"       #XE7F7)
  ;;               '("<^>"       #XE7F8)
  ;;               '("<&>"       #XE7F9)
  ;;               '("<?>"       #XE7FA)
  ;;               '("<.>"       #XE7FB)
  ;;               '("</>"       #XE7FC)
  ;;               '("<\\>"      #XE7FD)
  ;;               '("<\">"      #XE7FE)
  ;;               '("<:>"       #XE7FF)
  ;;               '("<~>"       #XE800)
  ;;               '("<**>"      #XE801)
  ;;               '("<<^"       #XE802)
  ;;               '("<!"        #XE803)
  ;;               '("<@"        #XE804)
  ;;               '("<#"        #XE805)
  ;;               '("<%"        #XE806)
  ;;               '("<^"        #XE807)
  ;;               '("<&"        #XE808)
  ;;               '("<?"        #XE809)
  ;;               '("<."        #XE80A)
  ;;               '("</"        #XE80B)
  ;;               '("<\\"       #XE80C)
  ;;               '("<\""       #XE80D)
  ;;               '("<:"        #XE80E)
  ;;               '("<->"       #XE80F)
  ;;               '("<!--"      #XE810)
  ;;               '("<--"       #XE811)
  ;;               '("<~<"       #XE812)
  ;;               '("<==>"      #XE813)
  ;;               '("==<"       #XE820)
  ;;               '("=="        #XE821)
  ;;               '("==="       #XE822)
  ;;               '("==>"       #XE823)
  ;;               '("=>"        #XE824)
  ;;               '("=~"        #XE825)
  ;;               '("=>>"       #XE826)
  ;;               '("=/="       #XE827)
  ;;               '("≡≡"        #XE830)
  ;;               '("≡≡≡"       #XE831)
  ;;               '("≡:≡"       #XE832)
  ;;               '(">-"        #XE840)
  ;;               '(">="        #XE841)
  ;;               '(">>"        #XE842)
  ;;               '(">>-"       #XE843)
  ;;               '(">=="       #XE844)
  ;;               '(">>>"       #XE845)
  ;;               '(">=>"       #XE846)
  ;;               '(">>^"       #XE847)
  ;;               '("??"        #XE860)
  ;;               '("?~"        #XE861)
  ;;               '("?="        #XE862)
  ;;               '("?>"        #XE863)
  ;;               '("???"       #XE864)
  ;;               '("^="        #XE868)
  ;;               '("^."        #XE869)
  ;;               '("^?"        #XE86A)
  ;;               '("^.."       #XE86B)
  ;;               '("^<<"       #XE86C)
  ;;               '("^>>"       #XE86D)
  ;;               '("^>"        #XE86E)
  ;;               '("\\\\"      #XE870)
  ;;               '("\\>"       #XE871)
  ;;               '("\\/-"      #XE872)
  ;;               '("@>"        #XE877)
  ;;               '("|="        #XE880)
  ;;               '("||"        #XE881)
  ;;               '("|>"        #XE882)
  ;;               '("|||"       #XE883)
  ;;               '("|+|"       #XE884)
  ;;               '("|->"       #XE885)
  ;;               '("|-->"      #XE886)
  ;;               '("|=>"       #XE887)
  ;;               '("|==>"      #XE888)
  ;;               '("~="        #XE890)
  ;;               '("~>"        #XE891)
  ;;               '("~~>"       #XE892)
  ;;               '("~>>"       #XE893)
  ;;               '("\">"       #XE8B0))))
  ;; (defun add-pragmatapro-prettify-symbols-alist ()
  ;;   (dolist (alias pragmatapro-prettify-symbols-alist)
  ;;     (push alias prettify-symbols-alist))
  ;;   (prettify-symbols-mode -1)
  ;;   (prettify-symbols-mode +1))

  ;; (add-hook 'prog-mode-hook
  ;;           #'add-pragmatapro-prettify-symbols-alist)
  ;; (global-prettify-symbols-mode +1)
  (setq projectile-rails-server-mode-ansi-colors nil)
  (defun jump-to-same-indent (direction)
    (interactive "P")
    (let ((start-indent (current-indentation)))
      (while
          (and (not (bobp))
               (zerop (forward-line (or direction 1)))
               (or (= (current-indentation) 0)
                   (> (current-indentation) start-indent)))))
    (back-to-indentation))
  (spacemacs/set-leader-keys "[" #'(lambda () (interactive) (jump-to-same-indent -1)))
  (spacemacs/set-leader-keys "]" 'jump-to-same-indent)
  (require 'org-projectile)
  (setq org-projectile:projects-file
        "~/captivereach-todo.org")
  (add-to-list 'org-capture-templates (org-projectile:project-todo-entry))
  (setq org-agenda-files (append org-agenda-files (org-projectile:todo-files)))
  (spacemacs/set-leader-keys "n n" 'org-projectile:project-todo-completing-read)
  (require 'seeing-is-believing)
  (add-hook 'ruby-mode-hook 'seeing-is-believing)
  (setq projectile-enable-caching f)

  ;;; Default rg arguments
  (when (executable-find "rg")
    (progn
      (defconst modi/rg-arguments
        `("--line-number" ; line numbers
          "--smart-case"
          "--follow" ; follow symlinks
          "--nmap" ; apply memory map optimization when possible
          )
        )
      (defun modi/advice-projectile-use-rg ()
        "Always use `rg' for getting a list of all files in the project."
        (mapconcat 'identity
                   (append '("\\rg") ; use unaliased version of `rg': \rg
                           modi/rg-argments
                           '("--null" ; output null separated results
                             "--files" ; get file names matching the regex '' (all files)
                             " ")
                           ))
        )
     )
    )
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gh-use-local-git-config t)
 '(helm-ag-base-command
   "rg --colors match:fg:magenta --colors line:bg:yellow --no-heading")
 '(org-agenda-files (quote ("~/.emacs.d/TODOs.org")))
 '(package-selected-packages
   (quote
    (tide typescript-mode graphviz-dot-mode evil-snipe winum unfill fuzzy flycheck-credo seeing-is-believing ox-reveal drag-stuff flycheck-cask idle-highlight-mode nyan-mode prodigy smex cask shut-up pallet nvm csv-mode vimrc-mode dactyl-mode helm-company helm-c-yasnippet company-web web-completion-data company-tern dash-functional tern company-statistics auto-yasnippet ac-ispell auto-complete reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode magit-gh-pulls gh marshal logito pcache ht projectile-rails inflections feature-mode helm-dash dash-at-point yaml-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby relative-line-numbers ob-elixir flycheck-mix alchemist company elixir-mode key-chord web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode orgit magit-gitflow evil-magit xterm-color smeargle shell-pop org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim multi-term mmm-mode markdown-toc markdown-mode htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help diff-hl auto-dictionary ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(sp-autoinsert-pair t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
