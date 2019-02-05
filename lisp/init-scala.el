(use-package scala-mode
  :ensure t
  :init
  (setq comment-start "/* "
        comment-end " */"
        comment-style 'multi-line
        comment-empty-lines t)
; (setq prettify-symbols-alist scala-prettify-symbols-alist)
  (prettify-symbols-mode))

(use-package sbt-mode
  :ensure t
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-scala
  :pin melpa
  :ensure t
  :after scala-mode
  :demand t
  :hook (scala-mode . lsp)
  :init (setq lsp-scala-server-command "/usr/local/bin/metals-emacs"))

;(use-package prettify-symbols :ensure t)

;(setq scala-indent:default-run-on-strategy 'eager)
;(setq scala-indent:align-parameters t)

;; maybe doesn't work, not currently necessary
;;(setenv "JAVA_HOME" (shell-command-to-string "/usr/libexec/java_home -v1.8"))

(provide 'init-scala)
