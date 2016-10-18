;;----------------------------------------------------------------------------
;; Language-specific settings
;;----------------------------------------------------------------------------
(use-package merlin
  :demand)

(use-package tuareg
  :demand)

(use-package flycheck-ocaml
  :demand)

;; OCaml
(autoload 'merlin-mode "merlin" "Merlin mode" t)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)

(provide 'init-ocaml)
