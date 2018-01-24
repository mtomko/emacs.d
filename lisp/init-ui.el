;;----------------------------------------------------------------------------
;; User interface settings
;;----------------------------------------------------------------------------

(setq ring-bell-function
      (lambda ()
        (invert-face 'mode-line)
        (run-with-timer 0.1 nil 'invert-face 'mode-line)))

;; use a larger window by default when Emacs is run in its own window
(if (window-system)
    (set-frame-size (selected-frame) 210 68))

(provide 'init-ui)
