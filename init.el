;;----------------------------------------------------------------------------
;; Mark Tomko's Emacs Initialization File
;; 2016-10-18
;;----------------------------------------------------------------------------

;;----------------------------------------------------------------------------
;; Top-level definitions
;;----------------------------------------------------------------------------
(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(if (fboundp 'with-eval-after-load)
    (defalias 'after-load 'with-eval-after-load)
  (defmacro after-load (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))

;;----------------------------------------------------------------------------
;; Temporarily reduce garbage collection during startup
;;----------------------------------------------------------------------------
(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
  "Initial value of `gc-cons-threshold' at start-up time.")
(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))

;;----------------------------------------------------------------------------
;; OS X keybindings
;;----------------------------------------------------------------------------
(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none)
  (setq-default default-input-method "MacOSX")
  ;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(1
                                    ((shift) . 5)
                                    ((control))))
  (dolist (multiple '("" "double-" "triple-"))
    (dolist (direction '("right" "left"))
      (global-set-key (read-kbd-macro (concat "<" multiple "wheel-" direction ">")) 'ignore)))
  (global-set-key (kbd "M-`") 'ns-next-frame)
  (global-set-key (kbd "M-h") 'ns-do-hide-emacs)
  (global-set-key (kbd "M-˙") 'ns-do-hide-others)
  (after-load 'nxml-mode
              (define-key nxml-mode-map (kbd "M-h") nil))
  (global-set-key (kbd "M-ˍ") 'ns-do-hide-others) ;; what describe-key reports for cmd-option-h
  )

;;----------------------------------------------------------------------------
;; Package initialization
;;----------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(defvar required-packages '(afternoon-theme
                            anzu
                            avy
                            auto-compile
                            better-defaults
                            browse-kill-ring
                            coffee-mode
                            company-quickhelp
                            crontab-mode
                            ;csv-mode
                            ;css-nav
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
                            guide-key
                            hl-sexp
                            idle-highlight-mode
                            ido-ubiquitous
                            ;ido-menu
                            immortal-scratch
                            indent-guide
                            ipretty
                            json-mode
                            ledger-mode
                            lively
                            magit
                            markdown-mode
                            merlin
                            mmm-mode
                            nlinum
                            paredit
                            paredit-everywhere
                            php-mode
                            rainbow-delimiters
                            rainbow-mode
                            scala-mode
                            scratch
                            scpaste
                            session
                            slime-company
                            smex
                            tagedit
                            tuareg
                            undo-tree
                            ))

(package-initialize)
(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;----------------------------------------------------------------------------
;; User interface settings
;;----------------------------------------------------------------------------
(setq visible-bell nil)

;; use a larger window by default when Emacs is run in its own window
(if (window-system)
    (set-frame-size (selected-frame) 120 48))

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
    (afternoon-theme ido-ubiquitous idle-highlight-mode find-file-in-project csv-mode better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set theme after custem-safe-themes is defined
;; http://stackoverflow.com/a/8547861
(load-theme 'afternoon)
