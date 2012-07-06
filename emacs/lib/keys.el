;;; keys.el -- Key bindings and interactive functions.

(defun pjones:kill-region-or-backward-kill-word (arg)
  "Replacement for `kill-region'.  If there is a region with
`transient-mark-mode' active, it will be removed and placed in
the kill ring in a similar manner to `kill-region'.  If there
isn't a region, the word before point will be deleted (without
placing it in the kill ring)."
  (interactive "p")
  (if (or (not transient-mark-mode) (and transient-mark-mode mark-active))
      (kill-region (region-beginning) (region-end))
    (delete-region (point) (progn (forward-word (- arg)) (point)))))

(defun pjones:open-line-above ()
  "Open a line above point and move there."
  (interactive)
  (move-beginning-of-line nil)
  (open-line 1)
  (indent-according-to-mode))

(defun pjones:open-line-below ()
  "Open a line below the point, and move there"
  (interactive)
  (move-end-of-line 1)
  (newline)
  (indent-according-to-mode))

(global-set-key (kbd "C-o") 'pjones:open-line-above)
(global-set-key (kbd "M-o") 'pjones:open-line-below)
(global-set-key (kbd "C-w") 'pjones:kill-region-or-backward-kill-word)
