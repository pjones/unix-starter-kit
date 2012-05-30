;;; emacsrc.el --- Emacs configuration from the unix-starter-kit
;;
;; Copyright (c) 2012 Peter Jones
;; Ideas taken from https://github.com/technomancy/emacs-starter-kit

;; Unix starter kit internal variables
(setq usk-lisp-dir (concat user-emacs-directory "usk"))

;; Package loading
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(magit flymake-ruby)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Some basic settings
(setq visible-bell t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      uniquify-buffer-name-style 'forward
      echo-keystrokes 0.1
      diff-switches "-u")

;; Put the scroll bar on the right where people expect it
(set-scroll-bar-mode 'right)

;; Color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'devalot t)

;; Load all USK lisp files
(mapc 'load (directory-files usk-lisp-dir t "^[^#].*el$"))
