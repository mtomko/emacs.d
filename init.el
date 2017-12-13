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
;; Set the location of the custom file
;;----------------------------------------------------------------------------
(setq custom-file "~/.emacs.d/custom.el")
(write-region "" "" custom-file t)
(load custom-file)

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
;; Set theme after custem-safe-themes is defined
;; http://stackoverflow.com/a/8547861
(require 'init-theme)
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
(require 'init-haskell)

;; Start the server
(server-start)
