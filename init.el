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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
    (diff-hl psvn flycheck-clojure cider use-package tuareg smex php-mode flycheck-ocaml expand-region exec-path-from-shell ensime elein csv-nav csv-mode clojure-mode afternoon-theme))))
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
(require 'init-clojure-cider)
(require 'init-csv)
(require 'init-ocaml)
(require 'init-php)
(require 'init-scala)

