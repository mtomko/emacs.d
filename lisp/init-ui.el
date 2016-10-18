;;----------------------------------------------------------------------------
;; User interface settings
;;----------------------------------------------------------------------------
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq visible-bell nil)

;; use a larger window by default when Emacs is run in its own window
(if (window-system)
    (set-frame-size (selected-frame) 120 48))

(provide 'init-ui)
