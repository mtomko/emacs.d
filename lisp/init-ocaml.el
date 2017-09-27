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
;(autoload 'merlin-mode "merlin" "Merlin mode" t)
;(add-hook 'tuareg-mode-hook 'merlin-mode)
;(add-hook 'caml-mode-hook 'merlin-mode)

;; Add opam emacs directory to the load-path
;(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
;(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))

;; Load merlin-mode
;(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)

(provide 'init-ocaml)
