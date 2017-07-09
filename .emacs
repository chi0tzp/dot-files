;; Emacs usually has a splash screen on startup.  Let's get rid of
;; that and start with a blank buffer.
;; (setq inhibit-startup-message t)

;; I like to see what is selected in the buffer.  This turns on visual
;; feedback on selections.
(setq transient-mark-mode t)

;; Position of the vertical scrollbar. Useful for left-handers.
; (set-scroll-bar-mode 'left)

; Temporary files cluttering up the space are annoying.  Here's how we
; can deal with them -- create a directory in your home directory, and
; save to there instead!  No more random ~ files.
(defvar user-temporary-file-directory
  "~/.emacs-autosaves/")
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; Enable mouse wheel scrolling. (but should work out-of-the-box)
; (if (load "mwheel" t)
;    (mwheel-install))

;; Column line where text should be wrapped
; (setq-default fill-column 75)

;; Cursor color
(set-cursor-color "white")
;; Color for selected text
(set-face-background 'region "gray20")

;; set keybindings
(global-set-key [f4] 'goto-line)

;; Color setup (note: these lines are commented because the next
;; paragraph will take care of them)
; (set-foreground-color "white")
; (set-background-color "black")

;; this section will give us bold fonts
(custom-set-faces  ;;  only one 'custom-set-faces' entry may exist in .emacs!!
 '(default ((t (:foreground "white" :background "black" :bold t))) t)
 ; '(default ((t (:foreground "white" :background "black" t))) t)
 '(isearch ((t (:foreground "black" :background "yellow"))) t)
)

;; places top left corner of initial frame at location (x,y) on screen
;(setq initial-frame-alist
;      '(
;	(top               . 30)
;	(left              . 0)
;	)
;      )

;; Match parentheses.  Useful to be sure you've closed everything up.
 (show-paren-mode t)

;; Display settings
; default size and color options for all frames.
(setq default-frame-alist
 '(
    (width             . 75)
    (height            . 50)
  )
)

; Change font size
(set-face-attribute 'default nil :height 105)

;; turn off the toolbar, menubar or scrollbar
;; (this method will render the setting of frame size unreliable, this
;; could be resolved by using the .Xresources file instead)
; (tool-bar-mode 0)
; (menu-bar-mode 0)
; (set-scroll-bar-mode nil)

;; alternative method, to be inserted in .Xresources file:
; emacs.geometry: 80x50
; emacs.menuBar: off
; emacs.verticalScrollBars: off
; emacs.toolBar: 0

;; Activate highlighting for POV-Ray files
;; load-path is where the .el files for POV-Ray are stored
;; current version can be downloaded at http://xahlee.org/3d/povray_emacs.html
(add-to-list 'load-path "~/.emacs-custom-el/pov-mode-3.2")
(autoload 'pov-mode "pov-mode" "PoVray scene file mode" t)
(add-to-list 'auto-mode-alist '("\\.pov\\'" . pov-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . pov-mode))

;; Activate python highlighting for PYX and PPL files
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.ppl\\'" . python-mode))

;; *****************************
;; *** AUCTEX-specific stuff ***
;; *****************************

;; do not choose different fonts for section, subsection etc.
; (setq font-latex-fontify-sectioning 'color)

;; font locking (i.e. syntax highlighting) spanning more than one line
(setq font-latex-do-multi-line t)

;; enable/disable highlighting of subscript and superscript via raised
;; or lowered text
(setq font-latex-fontify-script nil)

;; *********************
;; *** miscellaneous ***
;; *********************

;; Activate font-lock mode (syntax coloring).
(global-font-lock-mode t)

;; Line numbers are good.  Getting column numbering as well is better.
(column-number-mode t)

;; Always end files in a newline.
; (setq require-final-newline 't)
;; ...or ask to end in newline if needed
; (setq require-final-newline 'query)
