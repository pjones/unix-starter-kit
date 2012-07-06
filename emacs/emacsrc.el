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
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(magit flymake-ruby ruby-end inf-ruby yaml-mode gist)
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

;; Put the scroll bar on the right where people expect it, and also
;; use window fringes.n
(set-scroll-bar-mode 'right)
(require 'fringe)
(fringe-mode 10)
(setq-default indicate-buffer-boundaries 'left
              indicate-empty-lines t)

;; Frame defaults
(defun pjones:frame-title-file-name ()
  (let* ((home (expand-file-name "~"))
         (end (length home))
         (start (and buffer-file-name (substring buffer-file-name 0 end)))
         (under-home (and start (string= home start))))
    (cond (under-home
           (concat "~/" (file-relative-name buffer-file-name "~")))
          (buffer-file-name buffer-file-name)
          (dired-directory
           (if (listp dired-directory) (car dired-directory) dired-directory))
          (t (buffer-name)))))

(defun pjones:frame-title-not-saved ()
  (if (buffer-modified-p) " (NOT SAVED)"))

(setq default-frame-alist '((cursor-type  . bar))
      frame-title-format '((:eval (pjones:frame-title-file-name))
                           (:eval (pjones:frame-title-not-saved))))

(setq-default cursor-in-non-selected-windows 'hbar)
(blink-cursor-mode)

;; Turn off the menu bar in text mode, but leave it on in the GUI.
(setq window-system-default-frame-alist
      '((x (menu-bar-lines . 1) (tool-bar-lines . 1))
        (nil (menu-bar-lines . 0) (tool-bar-lines . 0))))

;; Delete the region when you start typing
(delete-selection-mode)

;; Color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'devalot t)

;; Load all USK lisp files
(mapc 'load (directory-files usk-lisp-dir t "^[^#].*el$"))
(add-hook 'after-make-frame-functions 'novice-maybe-enable)
