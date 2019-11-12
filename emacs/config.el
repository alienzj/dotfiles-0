;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "alienzj"
      user-mail-address "alienchuj@gmail.com"
      epa-file-encrypt-to user-mail-address

      company-idle-delay nil)


(setq doom-font (font-spec :family "Monospace" :size 26)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 26))

;;(setq doom-theme 'doom-solarized-light)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
(setq doom-themes-treemacs-theme "doom-colors")
(doom-themes-treemacs-config)
(doom-themes-org-config)
(setq doom-modeline-height 4)
(setq doom-modeline-bar-width 2)
(setq doom-modeline-icon t)


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
