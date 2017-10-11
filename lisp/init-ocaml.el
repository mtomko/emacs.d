;;----------------------------------------------------------------------------
;; Language-specific settings
;;----------------------------------------------------------------------------
(use-package merlin)

(use-package tuareg)

(use-package flycheck-ocaml)

;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)

(provide 'init-ocaml)
