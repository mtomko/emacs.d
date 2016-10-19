;;----------------------------------------------------------------------------
;; Mark Tomko's Emacs Initialization File
;;
;; Borrows ideas & config from
;;   https://github.com/purcell/emacs.d
;;   https://github.com/technomancy/emacs-starter-kit
;;
;; 2016-10-18
;;----------------------------------------------------------------------------

;;----------------------------------------------------------------------------
;; Bootstrapping
;;----------------------------------------------------------------------------
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;----------------------------------------------------------------------------
;; Top-level definitions
;;----------------------------------------------------------------------------
(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer

;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;;----------------------------------------------------------------------------
;; Load configuration utilities
;;----------------------------------------------------------------------------
(require 'init-utils)

;;----------------------------------------------------------------------------
;; Package initialization
;;----------------------------------------------------------------------------
(require 'init-package-system)

;; (defvar required-packages '(anzu
;;                             avy
;;                             auto-compile
;;                             better-defaults
;;                             browse-kill-ring
;;                             coffee-mode
;;                             company-quickhelp
;;                             crontab-mode
;;                             css-eldoc
;;                             default-text-scale
;;                             diff-hl
;;                             diminish
;;                             dired+
;;                             dired-sort
;;                             disable-mouse
;;                             elein
;;                             elisp-slime-nav
;;                             elm-mode
;;                             ensime
;;                             fill-column-indicator
;;                             find-file-in-project
;;                             flycheck
;;                             flycheck-clojure
;;                             guide-key
;;                             highlight-symbol
;;                             hl-sexp
;;                             idle-highlight-mode
;;                             ido-ubiquitous
;;                             idomenu
;;                             immortal-scratch
;;                             indent-guide
;;                             ipretty
;;                             json-mode
;;                             ledger-mode
;;                             lively
;;                             magit
;;                             markdown-mode
;;                             mmm-mode
;;                             nlinum
;;                             osx-location
;;                             paredit
;;                             paredit-everywhere
;;                             php-mode
;;                             project-local-variables
;;                             rainbow-delimiters
;;                             rainbow-mode
;;                             scala-mode
;;                             scratch
;;                             scpaste
;;                             session
;;                             slime-company
;;                             tagedit
;;                             undo-tree
;;                             whitespace-cleanup-mode
;;                             ))

;; (package-initialize)
;; (dolist (p required-packages)
;;   (when (not (package-installed-p p))
;;     (package-install p)))

;;----------------------------------------------------------------------------
;; Custom set variables (do not touch below codes)
;;----------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;----------------------------------------------------------------------------
;; User interface settings
;;----------------------------------------------------------------------------
(require 'init-keys)
(require 'init-ido)
(require 'init-ui)
(require 'init-editing-utils)
(require 'init-smex)

;; Set theme after custem-safe-themes is defined
;; http://stackoverflow.com/a/8547861
(require 'init-theme)

;;----------------------------------------------------------------------------
;; Other settings
;;----------------------------------------------------------------------------
(require 'init-exec-path)

;;----------------------------------------------------------------------------
;; Language-specific settings
;;----------------------------------------------------------------------------
(require 'init-clojure)
(require 'init-csv)
(require 'init-ocaml)
(require 'init-php)
(require 'init-scala)

