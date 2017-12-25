;;; emacs.d-personal-init.el --- jhanschoo's customizations for Emacs Prelude
;;; Commentary:
;; Copyright (C) 2015-2016 Johannes Choo <jhanschoo@gmail.com>
;; This file is *NOT* part of GNU Emacs.
;;; Code:

;;define adding multiple elements to a list
(defun add-list-to-list (list-var elements &optional append compare-fn)
  "Add each element in ELEMENTS to the value of LIST-VAR if it isn't there yet."
  (dolist (item elements)
    (add-to-list list-var item append compare-fn)))

;(add-to-list
; 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; make Right Alt passthrough
(setq ns-right-alternate-modifier nil)

;; Unset irritating keybinding s-q
(global-unset-key [8388721])

;; Don't automatically enable spell-checking
;(setq prelude-flyspell nil)

;; Delete commands should move to Trash instead
(setq delete-by-moving-to-trash t)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" (:eval (if (buffer-file-name)
                      (abbreviate-file-name (buffer-file-name))
                    "%b")) "—" invocation-name " Prelude" ))

;; Prettify symbols
(global-prettify-symbols-mode)
(setq prettify-symbols-unprettify-at-point 'right-edge)

;; customize whitespace-mode
;; (setq whitespace-style '(face tabs empty trailing))

;; Web mode config
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; Emmet config
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

;; AUCTeX config
;(setq TeX-parse-self nil)
(add-hook 'prelude-latex-mode-hook
          (lambda ()
            ;(add-list-to-list 'LaTeX-indent-environment-list
                              ;; listings support
                              ;'(("lstlisting" current-indentation)
                              ;; tabu support
                                ;;("tabu" LaTeX-indent-tabular)
                                ;;("longtabu" LaTeX-indent-tabular)
                                ;; AMSmath support
                                ;("aligned" LaTeX-indent-tabular)
                                ;("cases" LaTeX-indent-tabular)
                                ;("multline" LaTeX-indent-tabular)
                                ;("multline*" LaTeX-indent-tabular)
                                ;("smallmatrix" LaTeX-indent-tabular)
                                ;("pmatrix" LaTeX-indent-tabular)
                                ;("pmatrix" LaTeX-indent-tabular)
                                ;("bmatrix" LaTeX-indent-tabular)
                                ;("Bmatrix" LaTeX-indent-tabular)
                                ;("vmatrix" LaTeX-indent-tabular)
                                ;("Vmatrix" LaTeX-indent-tabular)
                                ;)
                              ;t)
            (setq LaTeX-indent-environment-list
                  '(("verbatim" current-indentation)
                  ("verbatim" current-indentation)
                  ("lstlisting" current-indentation)
                  ("tabular")
                  ("tabular*")
                  ("align")
                  ("align*")
                  ("array")
                  ("eqnarray")
                  ("eqnarray*")
                  ("displaymath")
                  ("equation")
                  ("equation*")
                  ("picture")
                  ("tabbing")))
            (add-to-list 'LaTeX-verbatim-macros-with-delims "l")
            (add-to-list 'LaTeX-verbatim-environments "lstlisting")
            (when (eq system-type 'darwin)
              (setq TeX-view-program-list
                    '(("DVI Viewer" "/Applications/Skim.app/\
Contents/SharedSupport/displayline %n %o %b")
                      ("PDF Viewer"
                       "/Applications/Skim.app/\
Contents/SharedSupport/displayline %n %o %b")
                       ("HTML Viewer" "open %o"))
                ))
            (TeX-fold-mode t)
            (TeX-source-correlate-mode t)))

(setq LaTeX-paragraph-commands
      '("toprule"
        "midrule"
        "bottomrule"
        ))


(setq font-latex-fontify-script 'multi-level)

(setq font-latex-script-display '((raise -0.25) raise 0.25))

(setq TeX-engine 'luatex)

;; Add path to TeX Live on OS X
;(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
;(setq exec-path (append exec-path '(":/Library/TeX/texbin")))

;; Magit config

;; Prompt to stage file after saving
;; (add-hook 'after-save-hook
;;           (lambda ()
;;             (require 'magit-git)
;;             (if (magit-git-repo-p default-directory)
;;                 (magit-stage-file buffer-file-name))))

;; Org mode config
;(setq org-directory "~/Documents/org")
;(setq org-default-notes-file (concat org-directory "/index.org"))
;(setq org-mobile-directory org-directory)
;(setq org-mobile-inbox-for-pull org-default-notes-file)
;(setq org-html-doctype "html5")
;(setq org-html-html5-fancy t)

;(setq org-publish-project-alist
              ;'(("org-notes"
                 ;:base-directory "~/Documents/org"
                 ;:publishing-directory "~/Documents/public_html/"
                 ;:recursive t
                 ;:publishing-function org-html-publish-to-html
                 ;:headline-levels 4
                 ;:auto-preamble t
                 ;)
                ;("org-static"
                 ;:base-directory "~/Documents/org"
                 ;:base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
                 ;:publishing-directory "~/Documents/public_html/"
                 ;:recursive t
                 ;:publishing-function org-publish-attachment)
                ;("org"
                 ;:components ("org-notes" "org-static"))))
;;(define-key global-map "\C-cc" 'org-capture)


;; Color theme
;;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-11"))
(load-theme 'gruvbox t)

;; always show line numbers
(global-linum-mode t)

;; recognize terminal punctuation preceding single space as sentence
(setq sentence-end-double-space nil)

;; require polytonic-greek.el
;(require 'greek-polytonic)

(provide 'emacs.d-personal-init)
;;; emacs.d-personal-init.el ends here
