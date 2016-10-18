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

(defvar required-packages '(;afternoon-theme
                            anzu
                            avy
                            auto-compile
                            better-defaults
                            browse-kill-ring
                            coffee-mode
                            company-quickhelp
                            crontab-mode
                            css-eldoc
                            csv-mode
                            csv-nav
                            default-text-scale
                            diff-hl
                            diminish
                            dired+
                            dired-sort
                            disable-mouse
                            elein
                            elisp-slime-nav
                            elm-mode
                            ensime
                            exec-path-from-shell
                            expand-region
                            fill-column-indicator
                            find-file-in-project
                            flycheck
                            flycheck-clojure
                            guide-key
                            highlight-symbol
                            hl-sexp
                            idle-highlight-mode
                            ido-ubiquitous
                            idomenu
                            immortal-scratch
                            indent-guide
                            ipretty
                            json-mode
                            ledger-mode
                            lively
                            magit
                            markdown-mode
                            mmm-mode
                            nlinum
                            osx-location
                            paredit
                            paredit-everywhere
                            php-mode
                            project-local-variables
                            rainbow-delimiters
                            rainbow-mode
                            scala-mode
                            scratch
                            scpaste
                            session
                            slime-company
                            tagedit
                            undo-tree
                            whitespace-cleanup-mode
                            ))

(package-initialize)
(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))

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
    ("28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" default)))
 '(package-selected-packages
   (quote
    (undo-tree tuareg tagedit smex slime-company session scpaste scratch rainbow-mode rainbow-delimiters php-mode paredit-everywhere paredit nlinum mmm-mode merlin markdown-mode magit lively ledger-mode json-mode ipretty indent-guide immortal-scratch hl-sexp guide-key fill-column-indicator expand-region exec-path-from-shell ensime elm-mode elisp-slime-nav elein disable-mouse dired-sort dired+ diminish diff-hl default-text-scale crontab-mode company-quickhelp coffee-mode browse-kill-ring auto-compile avy anzu idomenu afternoon-theme ido-ubiquitous idle-highlight-mode find-file-in-project csv-mode better-defaults))))
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
(require 'init-smex)
(require 'init-ui)

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
(require 'init-ocaml)

