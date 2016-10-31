(use-package unfill :ensure t)
(use-package rainbow-mode :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package paredit :ensure t)
(use-package paredit-everywhere :ensure tXS)

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

(use-package expand-region :ensure t)

(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)

(provide 'init-editing-utils)
