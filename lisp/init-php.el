(use-package php-mode :demand)

(after-load 'php-mode
  (add-hook 'php-mode-hook
            (lambda ()
              (setq indent-tabs-mode nil
                    tab-width 2
                    c-basic-offset 2))))

(provide 'init-php)
