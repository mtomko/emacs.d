;;; init-package-system.el --- Initializes the package system

;;; Commentary:

;; This package specifies package archives and initializes the `use-package` system

;;; Code:

;; Borrowed from http://ensime.github.io/editors/emacs/learning/
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))
  
(load-packages '(use-package diminish bind-key))

;; from now on, use-package is responsible for downloading packages
(setq use-package-always-defer t)
(setq use-package-always-ensure t)
(setq use-package-always-pin "melpa-stable")

;; Wire use-package https://github.com/jwiegley/use-package
(eval-when-compile (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(provide 'init-package-system)
;;; init-package-system.el ends here
