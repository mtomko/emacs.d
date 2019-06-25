(use-package unfill)

(use-package rainbow-mode
  :pin gnu)

(use-package rainbow-delimiters)

(use-package paredit)

(use-package paredit-everywhere)

(when *is-a-mac*
  ;; set up the correct ls
  (setq insert-directory-program "/Users/mtomko/.nix-profile/bin/ls")
  (setq dired-listing-switches "-lXh --group-directories-first")

  (eval-after-load "dired"
    '(progn
      ;; these stolen from tmgreen
      ;; use quicklooks
      (define-key dired-mode-map (kbd "<SPC>")
	(lambda () (interactive)
	  (let ((lawlist-filename (dired-get-file-for-visit)))
            (start-process "quick-look" nil "qlmanage" "-p" lawlist-filename))))

      (define-key dired-mode-map (kbd "o")
	(lambda () (interactive)
	  (let ((lawlist-filename (dired-get-file-for-visit)))
            (if (or (equal (file-name-extension lawlist-filename) "tsv")
                    (equal (file-name-extension lawlist-filename) "txt"))
		(start-process "default-app" nil "open" "-a" "Numbers" lawlist-filename)
              (start-process "default-app" nil "open" lawlist-filename)))))
      
      (define-key dired-mode-map (kbd "V") 'magit-status))))

;;----------------------------------------------------------------------------
;; Require some packages that do take configuration
;;----------------------------------------------------------------------------

;; project interaction
(use-package projectile
  :demand
  :pin melpa-stable
  :init   (setq projectile-use-git-grep t)
  :config (projectile-global-mode t)
  :bind   (("s-f" . projectile-find-file)
           ("s-F" . projectile-grep)))

;; recover any past state of a buffer
(use-package undo-tree
  :pin gnu
  :diminish undo-tree-mode
  :config (global-undo-tree-mode)
  :bind ("s-/" . undo-tree-visualize))

;; highlight nad navigate between symbols
(use-package highlight-symbol
  :diminish highlight-symbol-mode
  :commands highlight-symbol
  :bind ("s-h" . highlight-symbol))

;; goto last change in current buffer
(use-package goto-chg
  :commands goto-last-change
  ;; complementary to
  ;; C-x r m / C-x r l
  ;; and C-<space> C-<space> / C-u C-<space>
  :bind (("C-." . goto-last-change)
         ("C-," . goto-last-change-reverse)))

;;(use-package helm
;;  :diminish helm-mode
;;  :commands (helm-mode helm-M-x helm-find-files)
;;  :bind (("M-x"     . helm-M-x)
;;         ("C-x C-f" . helm-find-files)))

;;(use-package neotree
;;  :defer 2
;;  :diminish neotree
;;  :commands neotree
;;  :config (neotree)
;;  :bind ("s-d" . neotree-toggle))

(use-package diff-hl)

(use-package magit
  :diminish magit-status
  :commands magit-status
  :config (setq magit-last-seen-setup-instructions "1.4.0")
          (setq magit-git-executable "/usr/bin/git")
  :bind ("M-s M-g" . magit-status))

(use-package gist
  :diminish gist-list
  :commands (gist-list gist-region-or-buffer)
  :bind (("M-s M-o" . gist-list)
	 ("M-s M-s" . gist-region-or-buffer)))

(use-package gitconfig-mode)


(use-package gitignore-mode)

(use-package find-file-in-repository
  :diminish find-file-in-repository
  :commands find-file-in-repository
  :bind ("M-s M-f" . find-file-in-repository))

(use-package window-numbering
  :init (window-numbering-mode 1))

(use-package yasnippet
  :diminish yas-minor-mode
  :commands yas-minor-mode
  :config (yas-reload-all))

(use-package yatemplate
  :defer 2 ;; WORKAROUND https://github.com/mineo/yatemplate/issues/3
  :config
    (auto-insert-mode)
    (setq auto-insert-alist nil)
    (yatemplate-fill-alist))

(use-package smartparens
  :diminish smartparens-mode
  :commands
    smartparens-strict-mode
    smartparens-mode
    sp-restrict-to-pairs-interactive
    sp-local-pair
  :init (setq sp-interactive-dwim t)
  :config
    (require 'smartparens-config)
    (sp-use-smartparens-bindings)
    (sp-pair "(" ")" :wrap "C-(") ;; how do people live without this?
    (sp-pair "[" "]" :wrap "s-[") ;; C-[ sends ESC
    (sp-pair "{" "}" :wrap "C-{")
    ;; WORKAROUND https://github.com/Fuco1/smartparens/issues/543
    (bind-key "C-<left>"  nil smartparens-mode-map)
    (bind-key "C-<right>" nil smartparens-mode-map)
    (bind-key "s-<delete>"    'sp-kill-sexp smartparens-mode-map)
    (bind-key "s-<backspace>" 'sp-backward-kill-sexp smartparens-mode-map))

(setq-default
 blink-cursor-interval 0.4
 case-fold-search t
 column-number-mode t
 delete-selection-mode t
 indent-tabs-mode nil
 make-backup-files nil
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil
 truncate-lines nil)

(transient-mark-mode t)

(show-paren-mode 1)

(use-package expand-region)

(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)

(provide 'init-editing-utils)
