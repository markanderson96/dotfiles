;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Mark Anderson"
      user-mail-address "andersm3@tcd.ie")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 14))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Preserve clock history across sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
(setq org-clock-idle-time 15)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; Mail stuffs
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(after! mu4e
    ;; temporary aliases
    (defalias 'mu4e~start 'mu4e--start)
    (defalias 'mu4e~stop 'mu4e--stop)
    (defalias 'mu4e~proc-sentinel 'mu4e--server-sentinel)
    (defalias 'mu4e~proc-start 'mu4e--server-start)
    (defalias 'mu4e~main-view 'mu4e--main-view)
    (defalias 'mu4e~main-action-str 'mu4e--main-action-str)
    (defalias 'mu4e~proc-move 'mu4e--server-move)
    (defalias 'mu4e~mark-check-target 'mu4e--mark-check-target)
    (set-email-account!
     "gmail"
     '((mu4e-sent-folder       . "/[Gmail]/Sent Mail")
       (mu4e-trash-folder      . "/[Gmail]/Bin")
       (mu4e-drafts-folder     . "/[Gmail]/Drafts")
       (mu4e-refile-folder     . "/[Gmail]/All Mail")
       (smtpmail-smtp-user     . "andersm3@tcd.ie"))
     t)

    (setq mu4e-maildir-shortcuts
          '((:maildir "/Inbox"              :key ?i)
            (:maildir "/[Gmail]/Sent Mail"  :key ?s)
            (:maildir "/[Gmail]/Thrash"     :key ?t)
            (:maildir "/[Gmail]/Drafts"     :key ?d)
            (:maildir "/[Gmail]/All Mail"   :key ?a)))

    (setq smtpmail-smtp-server "smtp.gmail.com")
    (setq smtpmail-smtp-service 587)
    (setq mu4e-get-mail-command "mbsync gmail"
          ;; get emails and index every 5 minutes
          mu4e-update-interval 300
              ;; send emails with format=flowed
              mu4e-compose-format-flowed t
              ;; no need to run cleanup after indexing for gmail
              mu4e-index-cleanup nil
              mu4e-index-lazy-check t
          ;; more sensible date format
          mu4e-headers-date-format "%d-%m-%y"))
