;;; backups.el --- Settings for Emacs backup files.
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control 'never
      backup-by-copying t)
