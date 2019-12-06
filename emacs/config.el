;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "alienzj"
      user-mail-address "alienchuj@gmail.com"
      epa-file-encrypt-to user-mail-address

      company-idle-delay nil)


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

(setq conda-anaconda-home "~/.conda/envs/bioenv")
;;(setq clang-format-style-option "llvm")
;;(setq tab-width 4)

(awesome-tab-mode t)

;;(setq awesome-tab-label-fixed-length 20)
;;(setq awesome-tab-height 8)

(when (not (display-graphic-p))
  (setq frame-background-mode 'dark))

;;(setq awesome-tab-style 'wave)
(setq awesome-tab-style 'bar)

(setq awesome-tab-display-icon nil)

(defhydra awesome-fast-switch (:hint nil)
  "
 ^^^^Fast Move             ^^^^Tab                    ^^Search            ^^Misc
-^^^^--------------------+-^^^^---------------------+-^^----------------+-^^---------------------------
   ^_k_^   prev group    | _C-a_^^     select first | _b_ search buffer | _C-k_   kill buffer
 _h_   _l_  switch tab   | _C-e_^^     select last  | _g_ search group  | _C-S-k_ kill others in group
   ^_j_^   next group    | _C-j_^^     ace jump     | ^^                | ^^
 ^^0 ~ 9^^ select window | _C-h_/_C-l_ move current | ^^                | ^^
-^^^^--------------------+-^^^^---------------------+-^^----------------+-^^---------------------------
"
  ("h" awesome-tab-backward-tab)
  ("j" awesome-tab-forward-group)
  ("k" awesome-tab-backward-group)
  ("l" awesome-tab-forward-tab)
  ("0" my-select-window)
  ("1" my-select-window)
  ("2" my-select-window)
  ("3" my-select-window)
  ("4" my-select-window)
  ("5" my-select-window)
  ("6" my-select-window)
  ("7" my-select-window)
  ("8" my-select-window)
  ("9" my-select-window)
  ("C-a" awesome-tab-select-beg-tab)
  ("C-e" awesome-tab-select-end-tab)
  ("C-j" awesome-tab-ace-jump)
  ("C-h" awesome-tab-move-current-tab-to-left)
  ("C-l" awesome-tab-move-current-tab-to-right)
  ("b" ivy-switch-buffer)
  ("g" awesome-tab-counsel-switch-group)
  ("C-k" kill-current-buffer)
  ("C-S-k" awesome-tab-kill-other-buffers-in-current-group)
  ("q" nil "quit"))

;; winum users can use `winum-select-window-by-number' directly.
(defun my-select-window-by-number (win-id)
  "Use `ace-window' to select the window by using window index.
WIN-ID : Window index."
  (let ((wnd (nth (- win-id 1) (aw-window-list))))
    (if wnd
        (aw-switch-to-window wnd)
      (message "No such window."))))

(defun my-select-window ()
  (interactive)
  (let* ((event last-input-event)
         (key (make-vector 1 event))
         (key-desc (key-description key)))
    (my-select-window-by-number
     (string-to-number (car (nreverse (split-string key-desc "-")))))))

(global-set-key (kbd "s-1") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-2") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-3") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-4") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-5") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-6") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-7") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-8") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-9") 'awesome-tab-select-visible-tab)
(global-set-key (kbd "s-0") 'awesome-tab-select-visible-tab)

(defun awesome-tab-hide-tab (x)
  (let ((name (format "%s" x)))
    (or
     (string-prefix-p "*epc" name)
     (string-prefix-p "*helm" name)
     (string-prefix-p "*Compile-Log*" name)
     (string-prefix-p "*lsp" name)
     (and (string-prefix-p "magit" name)
               (not (file-name-extension name)))
     )))

(defun awesome-tab-buffer-groups ()
  "`awesome-tab-buffer-groups' control buffers' group rules.

Group awesome-tab with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
All buffer name start with * will group to \"Emacs\".
Other buffer group by `awesome-tab-get-group-name' with project name."
  (list
   (cond
    ((or (string-equal "*" (substring (buffer-name) 0 1))
         (memq major-mode '(magit-process-mode
                            magit-status-mode
                            magit-diff-mode
                            magit-log-mode
                            magit-file-mode
                            magit-blob-mode
                            magit-blame-mode
                            )))
     "Emacs")
    ((derived-mode-p 'eshell-mode)
     "EShell")
    ((derived-mode-p 'emacs-lisp-mode)
     "Elisp")
    ((derived-mode-p 'dired-mode)
     "Dired")
    ((memq major-mode '(org-mode org-agenda-mode diary-mode))
     "OrgMode")
    (t
     (awesome-tab-get-group-name (current-buffer))))))
