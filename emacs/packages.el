;; -*- no-byte-compile: t; -*-
;;; .doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:host github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! org-pdftools :recipe (:host github :repo "fuxialexander/org-pdftools" :files ("*")))
(package! org-noter :recipe (:host github :repo "fuxialexander/org-noter" :branch "pdf-notes-booster" :files ("*")))
(package! org-ref)
(package! org-brain)

(package! websocket)
(package! zmq)
(package! simple-httpd)
(package! jupyter)

(package! snakemake-mode)
(package! pkgbuild-mode)
(package! wdl-mode)

(package! polymode)
(package! poly-markdown)
(package! poly-R)
(package! poly-wdl)
(package! ess-view)

(package! ddragon :recipe (:host github :repo "xuchunyang/ddragon.el" :files ("*")))

(package! anki-editor)

;;(package! darkplus :recipe (:host github :repo "popcorn4dinner/darkplus-emacs" :files ("*")))

;;(package! awesome-tab :recipe (:host github :repo "manateelazycat/awesome-tab" :files ("*")))

(package! tldr)
(package! esup)
