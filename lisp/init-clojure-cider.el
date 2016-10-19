(require 'init-clojure)

(use-package cider)

(setq nrepl-popup-stacktraces nil)

(after-load 'cider
  (add-hook 'cider-mode-hook 'eldoc-mode)
  (add-hook 'cider-repl-mode-hook 'subword-mode)
  (add-hook 'cider-repl-mode-hook 'paredit-mode)

  ;; nrepl isn't based on comint
  (add-hook 'cider-repl-mode-hook 'sanityinc/no-trailing-whitespace))

(use-package flycheck-clojure)

(after-load 'clojure-mode
  (after-load 'flycheck
    (flycheck-clojure-setup)))

(provide 'init-clojure-cider)
