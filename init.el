;;; package --- Summary

;;; Commentary:

;;; Code:

;;; Startup settings

;; from sanemacs, for performance
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))

;;; handle display settings early to avoid blinking and flashing
(setq inhibit-startup-message t)
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(blink-cursor-mode -1)

;;; Basic/fundamental settings
(setq user-full-name "Mark Tomko"
      user-mail-address "mjt0229@fastmail.com")

;;; just use UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;;; UI settings
(load-theme 'wombat)

(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)

;;; show the full path of the current file in the title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;;; Uncategorized settings (for now)

; Make *scratch* buffer blank
(setq initial-scratch-message "")
; y-or-n-p makes answering questions faster
(fset 'yes-or-no-p 'y-or-n-p)
; Auto-update buffer if file has changed on disk
(global-auto-revert-mode t)
; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; Offload the custom-set-variables to a separate file
;;; This keeps your init.el neater and you have the option
;;; to gitignore your custom.el if you see fit.
(setq custom-file "~/.emacs.d/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
;;; Load custom file. Don't hide errors. Hide success message
(load custom-file nil t)

;;; Do something useful with backup files
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;; Lockfiles unfortunately cause more pain than benefit
(setq create-lockfiles nil)

;;; Editing ergonomics
(setq-default tab-width 4
              indent-tabs-mode nil)

(add-hook 'before-save-hook 'whitespace-cleanup)

;;; Package management
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; Basic packages we want to use/configure
;;; hide minor modes from the mode line
(use-package diminish
             :ensure t)

(use-package smartparens
             :ensure t
             :diminish smartparens-mode
             :config
             (progn
               (require 'smartparens-config)
               (smartparens-global-mode 1)
               (show-paren-mode t)))

(use-package crux
             :ensure t
             :bind
             ("C-k" . crux-smart-kill-line)
             ("C-c n" . crux-cleanup-buffer-or-region)
             ("C-c f" . crux-recentf-find-file)
             ("C-a" . crux-move-beginning-of-line))

(use-package which-key
             :ensure t
             :diminish which-key-mode
             :config
             (which-key-mode +1))

;;; provides completion
(use-package company
             :ensure t
             :diminish company-mode
             :config
             (add-hook 'after-init-hook #'global-company-mode))

;;; syntax checking
(use-package flycheck
             :ensure t
             :diminish flycheck-mode
             :config
             (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package elisp-autofmt
  :commands (elisp-autofmt-save-hook-for-this-buffer)
  :hook (emacs-lisp-mode . elisp-autofmt-save-hook-for-this-buffer)

  :straight
  (elisp-autofmt
    :type git
    :host gitlab
    :files (:defaults "elisp-autofmt")
    :repo "ideasman42/emacs-elisp-autofmt"))


;;; magit
(use-package magit
             :ensure t
             :bind (("C-M-g" . magit-status)))

(provide 'init)
;;; init.el ends here
