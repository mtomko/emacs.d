;;; init-basic-packages --- Summary

;;; Commentary:
;;; require basic packages that take no additional configuration

;;; Code:
(use-package ag)
(use-package better-defaults)
(use-package browse-kill-ring)
(use-package flycheck)
(use-package fill-column-indicator)
(use-package immortal-scratch
  :pin melpa)
(use-package guide-key)
(use-package nlinum
  :pin gnu)

(provide 'init-basic-packages)
;;; init-basic-packages ends here
