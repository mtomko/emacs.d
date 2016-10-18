(use-package unfill :demand)
(use-package rainbow-mode :demand)
(use-package rainbow-delimiters :demand)

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

(use-package expand-region :demand)

(provide 'init-editing-utils)
