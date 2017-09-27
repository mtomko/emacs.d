(use-package scala-mode
  :ensure t
  :pin melpa-stable
  :init
  (setq comment-start "/* "
        comment-end " */"
        comment-style 'multi-line
        comment-empty-lines t)
  ;(setq prettify-symbols-alist scala-prettify-symbols-alist)
  ;(prettify-symbols-mode)
  )

(use-package sbt-mode
  :pin melpa)

(use-package ensime
  :ensure t
  :pin melpa-stable)

(use-package smartparens
  :diminish smartparens-mode
  :commands
  smartparens-strict-mode
  smartparens-mode
  sp-restrict-to-pairs-interactive
  sp-local-pair
  :init
  (setq sp-interactive-dwim t)
  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings)

  (sp-pair "(" ")" :wrap "C-(") ;; how do people live without this?
  (sp-pair "[" "]" :wrap "s-[") ;; C-[ sends ESC
  (sp-pair "{" "}" :wrap "C-{")

  ;; WORKAROUND https://github.com/Fuco1/smartparens/issues/543
  (bind-key "C-<left>" nil smartparens-mode-map)
  (bind-key "C-<right>" nil smartparens-mode-map)

  (bind-key "s-<delete>" 'sp-kill-sexp smartparens-mode-map)
  (bind-key "s-<backspace>" 'sp-backward-kill-sexp smartparens-mode-map))

;(use-package prettify-symbols :ensure t)

;; disable startup notifications
(setq ensime-startup-snapshot-notification 'nil)
(setq ensime-startup-notification 'nil)

(setq scala-indent:default-run-on-strategy 'eager)
(setq scala-indent:align-parameters t)

(provide 'init-scala)
