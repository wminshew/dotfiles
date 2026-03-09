;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; org-directory must be set before org loads!
(setq org-directory "~/development/org")

;; set localleader-key to ,
(setq doom-localleader-key ",")

;; Use "fd" to exit insert mode (like Spacemacs); default is "jk"
(setq evil-escape-key-sequence "fd")
;; To also keep "jk" working alongside "fd", uncomment both lines below:
;; (after! evil
;; (evil-define-key* '(insert replace visual operator) 'global "jk" #'evil-escape))

;;; Core settings

;; macOS frame settings
(when (eq system-type 'darwin)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . light)))

;; LSP performance — default Emacs value (4KB) is too small for LSP JSON payloads
(setq read-process-output-max (* 1024 1024))  ; 1mb

;; Auth sources
(setq auth-sources '("~/.authinfo.gpg" "~/.authinfo" "~/.netrc"))


;;; Magit

(after! magit
  (setq magit-log-section-commit-count 20)
  (setq magit-process-finish-apply-ansi-colors t)
  (when (eq system-type 'darwin)
    (defun me/magit--darwin-process-filter (orig-fun proc string)
      (funcall orig-fun proc (replace-regexp-in-string "\r\n" "\n" string)))
    (advice-add 'magit-process-filter :around #'me/magit--darwin-process-filter)))


;;; Emoji font (macOS, supplements the (emoji +unicode) module)

(when (eq system-type 'darwin)
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend))


;;; Org / Journal / Roam

(after! org
  (require 'org-habit)
  (map! :map org-mode-map
        :localleader
        "k" #'org-timestamp-up
        "j" #'org-timestamp-down)
  (map! :map org-mode-map
        :n "M-h" #'org-metaleft
        :n "M-l" #'org-metaright
        :n "M-k" #'org-metaup
        :n "M-j" #'org-metadown)
  (setq org-todo-keywords '((sequence "TODO(t)" "PROGRESS(p)" "WAITING(w)"
                             "|" "DONE(d)" "DELEGATED(g)" "CANCELLED(c)")))
  (setq org-highest-priority 0
        org-lowest-priority 9
        org-default-priority 5)
  (setq org-image-actual-width 700)
  (setq org-default-notes-file (concat org-directory "/tasks.org"))
  (setq org-agenda-files '("~/development/org/tasks.org"
                           "~/development/org/habits.org"))
  (setq org-habit-graph-column 80
        org-habit-show-habits-only-for-today t)
  (setq org-agenda-span 'day
        org-agenda-start-day nil
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-deadline-prewarning-if-scheduled t
        org-agenda-skip-deadline-if-done t
        org-agenda-window-setup 'current-window
        org-agenda-start-with-log-mode t)
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9)))
  (setq org-refile-use-outline-path 'file
        org-outline-path-complete-in-steps nil
        org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/development/org/tasks.org" "tasks")
           "* TODO %?\n  %i\n  %a")
          ("p" "Protocol" entry (file+headline "~/development/org/tasks.org" "tasks")
           "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
          ("L" "Protocol Link" entry (file+headline "~/development/org/tasks.org" "read")
           "* TODO [#8] %? [[%:link][%:description]] \nCaptured On: %U")))
  (setq org-agenda-custom-commands
        '(("c" . "My Custom Agendas")
          ("cu" "Unscheduled TODO"
           ((todo "" ((org-agenda-overriding-header "\nUnscheduled TODO")
                      (org-agenda-skip-function
                       '(or (org-agenda-skip-entry-if 'scheduled)
                            (org-agenda-skip-entry-if 'deadline))))))
           nil nil))))

;; org-journal (v2 API, similar to v1)
(after! org-journal
  (setq org-journal-dir (concat org-directory "/journal")
        org-journal-file-format "%Y-%m-%d"
        org-journal-file-type 'weekly))

;; org-roam v2 (API significantly changed from spacemacs config which used v1)
(after! org-roam
  (setq org-roam-directory (concat org-directory "/wiki"))
  (setq org-roam-capture-templates
        '(("d" "default" plain "%?"
           :target (file+head "${slug}.org"
                              "#+TITLE: ${title}\n#+ROAM_TAGS:\n")
           :unnarrowed t)
          ("c" "contact" plain "%?"
           :target (file+head "${slug}.org"
                              "#+TITLE: ${title}\n#+ROAM_TAGS:\n")
           :unnarrowed t)
          ("m" "meeting" plain "%?"
           :target (file+head "${slug}.org"
                              "#+TITLE: ${title}\n#+ROAM_TAGS:\n")
           :unnarrowed t))))


;;; LSP & Languages

(after! lsp-mode
  (setq lsp-inlay-hints-mode t
        lsp-ui-sideline-show-code-actions t
        lsp-eldoc-render-all t))

(after! lsp-rust
  (setq lsp-rust-analyzer-cargo-watch-command "clippy"
        lsp-rust-analyzer-proc-macro-enable t
        lsp-rust-analyzer-inlay-hints-mode t
        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-parameter-hints t
        lsp-rust-analyzer-display-closure-return-type-hints t))

;; TypeScript: use project-local tsserver (like tide-tsserver-executable)
(after! lsp-javascript
  (setq lsp-typescript-tsdk "node_modules/typescript/lib"))


;;; Solidity

(after! solidity-mode
  (setq solidity-flycheck-use-project t
        solidity-flycheck-chaining-error-level t
        solidity-flycheck-solc-checker-active t))
;; Note: solidity-flycheck-solc-additional-allow-paths (for node_modules)
;; is handled per-project via .dir-locals.el
