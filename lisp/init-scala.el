(use-package ensime
  :pin melpa-stable)

(use-package sbt-mode
  :pin melpa)

(use-package scala-mode
  :pin melpa-stable
  :init
  (setq comment-start "/* "
        comment-end " */"
        comment-style 'multi-line
        comment-empty-lines t)
  ;(setq prettify-symbols-alist scala-prettify-symbols-alist)
  (prettify-symbols-mode))

;(use-package prettify-symbols :ensure t)

;; disable startup notifications
(setq ensime-startup-snapshot-notification 'nil)
(setq ensime-startup-notification 'nil)

(setq scala-indent:default-run-on-strategy 'eager)
(setq scala-indent:align-parameters t)

;; maybe doesn't work, not currently necessary
;;(setenv "JAVA_HOME" (shell-command-to-string "/usr/libexec/java_home -v1.8"))

(provide 'init-scala)
