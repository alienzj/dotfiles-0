;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "alienzj"
      user-mail-address "alienchuj@gmail.com"
      epa-file-encrypt-to user-mail-address)

;; enable auto-completion
(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)

(setq doom-font (font-spec :family "Monospace" :size 26)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 26)
      doom-unicode-font (font-spec :family "Noto Sans")
      doom-big-font (font-spec :family "Noto Sans" :size 32))

;;(setq doom-theme 'doom-solarized-light)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(setq doom-themes-treemacs-theme "doom-colors")

;;(doom-themes-visual-bell-config)
;;(doom-themes-neotree-config)

(setq doom-theme 'doom-solarized-dark)
;;(setq doom-theme 'doom-molokai)
;;(after! doom-themes
;;  (add-hook 'doom-load-theme-hook #'doom-themes-org-config))

;;(setq all-the-icons-scale-factor 1.0)
(doom-themes-treemacs-config)
(doom-themes-org-config)
(setq doom-modeline-height 4)
(setq doom-modeline-bar-width 2)
(setq doom-modeline-icon t)

(setq magit-repository-directories '(("~/projects" .2))
      magit-save-repository-buffers nil
      magit-inhibit-save-previous-winconf t)

(setq bibtex-completion-notes-path "~/documents/doraemon/org/ref.org"
      bibtex-completion-bibliography '("~/documents/doraemon/org/reference/Bibliography.bib")
      bibtex-completion-library-path "~/documents/doraemon/org/reference/pdf/"

      org-directory "~/documents/doraemon/org"

      ;; org-ref
      org-ref-bibliography-notes "~/documents/doraemon/org/ref.org"
      org-ref-default-bibliography '("~/documents/doraemon/org/reference/Bibliography.bib")
      org-ref-pdf-directory "~/documents/doraemon/org/reference/pdf/")

(setq-default org-download-image-dir "~/documents/doraemon/org/notebooks/images")


(after! org
  (add-to-list 'org-modules 'org-habit t))

(setq deft-extensions '("txt" "tex" "org"))
(setq deft-directory "~/documents/doraemon/org")
(setq deft-recursive t)

;;(setq +lookup-open-url-fn #'eww)

(setq ddragon-dir "~/documents/database/lol")

(defun xah-open-in-vscode ()
  "Open current file or dir in vscode.
Version 2019-11-04"
  (interactive)
  (let (($path (if (buffer-file-name) (buffer-file-name) default-directory )))
    (cond
     ((string-equal system-type "darwin")
      (shell-command (format "open -a Visual\\ Studio\\ Code.app \"%s\"" $path)))
     ((string-equal system-type "windows-nt")
      (shell-command (format "Code \"%s\"" $path)))
     ((string-equal system-type "gnu/linux")
      (shell-command (format "code \"%s\"" $path))))))

(setq anki-editor-create-decks t)

(setq conda-anaconda-home "~/.conda/envs/bioenv"
      conda-env-home-directory "~/.conda/envs/bioenv")
;;(setq clang-format-style-option "llvm")
;;(setq tab-width 4)

;; *** fringe
(defun remove-fringes ()
  (set-window-fringes nil 0 0)
  (set-window-margins nil 0 0))

(after! magit
  (add-hook 'magit-post-display-buffer-hook #'remove-fringes t)
  (add-hook! magit-popup-mode-hook #'remove-fringes))

(after! treemacs
  (add-hook 'treemacs-select-hook #'remove-fringes))
