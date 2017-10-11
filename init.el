;;----------------------------------------------------------------------------
;; Mark Tomko's Emacs Initialization File
;;
;; Borrows ideas & config from
;;   https://github.com/frgomes/.emacs.d
;;   https://github.com/purcell/emacs.d
;;   https://github.com/technomancy/emacs-starter-kit
;;
;; 2017-10-04
;;----------------------------------------------------------------------------

;;----------------------------------------------------------------------------
;; Bootstrapping
;;----------------------------------------------------------------------------

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;(package-initialize)

;;----------------------------------------------------------------------------
;; Some things stolen from https://github.com/frgomes/.emacs.d
;;----------------------------------------------------------------------------
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tooltip-mode)    (tooltip-mode -1))

;; No splash screen please
(setq inhibit-startup-message t)

;;----------------------------------------------------------------------------
;; Set up lisp directory
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
(require 'init-basic-packages)

;;----------------------------------------------------------------------------
;; User interface settings
;;----------------------------------------------------------------------------
(require 'init-keys)
(require 'init-ido)
(require 'init-ui)
(require 'init-editing-utils)
(require 'init-smex)

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
    ("6c7db7fdf356cf6bde4236248b17b129624d397a8e662cf1264e41dab87a4a9a" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" default)))
 '(package-selected-packages
   (quote
    (yoshi-theme prettify-symbols prettfiy-symbols smartparens pretty-symbols flymd gh-md markdown-mode sbt-mode scala-mode cargo flycheck-rust flymake-rust rust-mode flycheck-purescript psc-ide psci purescript-mode mmm-mode psvn flycheck-clojure cider tuareg smex php-mode flycheck-ocaml expand-region exec-path-from-shell elein csv-nav csv-mode clojure-mode afternoon-theme)))
 '(purescript-mode-hook
   (quote
    (capitalized-words-mode turn-on-eldoc-mode turn-on-purescript-indent turn-on-purescript-indentation turn-on-purescript-simple-indent turn-on-purescript-unicode-input-method))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set theme after custem-safe-themes is defined
;; http://stackoverflow.com/a/8547861
(require 'init-theme)

;; Start the server
(server-start)
