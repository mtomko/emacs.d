;;----------------------------------------------------------------------------
;; User interface settings
;;----------------------------------------------------------------------------
(setq visible-bell nil)

;; use a larger window by default when Emacs is run in its own window
(if (window-system)
    (set-frame-size (selected-frame) 210 68))

(provide 'init-ui)
