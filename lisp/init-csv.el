(use-package csv-mode
  :demand
  :pin gnu)

;(use-package csv-nav
;  :demand
;  :pin gnu)

(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")

(setq csv-separators '("," ";" "|" " "))

(provide 'init-csv)
