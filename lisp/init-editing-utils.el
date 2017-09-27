(use-package unfill :ensure t)
(use-package rainbow-mode :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package paredit :ensure t)
(use-package paredit-everywhere :ensure t)

(when *is-a-mac*
  (use-package dired
    :ensure nil
    :config
    (progn
      ;; set up the correct ls
      (setq insert-directory-program "/usr/local/opt/coreutils/libexec/gnubin/ls")
      (setq dired-listing-switches "-lXh --group-directories-first")

      ;; these stolen from tmgreen
      ;; use quicklooks
      (define-key dired-mode-map (kbd "<SPC>")
        (lambda () (interactive)
          (let ((lawlist-filename (dired-get-file-for-visit)))
            (start-process "quick-look" nil "qlmanage" "-p" lawlist-filename))))

      (define-key dired-mode-map (kbd "o")
       (lambda () (interactive)
         (let ((lawlist-filename (dired-get-file-for-visit)))
           (if (or (equal (file-name-extension lawlist-filename) "tsv") (equal (file-name-extension lawlist-filename) "txt"))
               (start-process "default-app" nil "open" "-a" "Numbers" lawlist-filename)
             (start-process "default-app" nil "open" lawlist-filename)))))

      (define-key dired-mode-map "V" 'magit-status)
      
      ))) 

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
