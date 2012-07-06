;;; novice.el -- Functions to activate more advanced Emacs settings.

(defvar novice-file (concat user-emacs-directory "novice")
  "The name of a file, that when present on the file system
automatically enables novice mode.")

(defvar novice-off-modes
  '(menu-bar-mode tool-bar-mode scroll-bar-mode)
  "A list of modes to disable in novice mode.")

(defvar novice-on-modes
  '(ido-mode)
  "A list of modes to enable in novice mode.")

(defun novice-mode (activate)
  (let ((enable  (if activate novice-on-modes  novice-off-modes))
        (disable (if activate novice-off-modes novice-on-modes)))
    (dolist (mode enable)
      (if (fboundp mode) (funcall mode t)))
    (dolist (mode disable)
      (if (fboundp mode) (funcall mode -1)))))

(defun novice-maybe-enable (&optional frame)
  "Enable novice mode if the `novice-file' exists."
  (if (file-exists-p novice-file) (novice-mode t)
    (novice-mode nil)))

(defun novice ()
  "Toggle novice mode for the current and future Emacs sessions."
  (interactive)
  (if (file-exists-p novice-file) (delete-file novice-file)
    (with-temp-file novice-file (insert "1")))
  (novice-maybe-enable))
