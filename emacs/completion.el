;;; completion.el --- Auto-completion settings

;; ido-mode
(ido-mode t)
(ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)

;; Save your place in files you edit
(require 'saveplace)
(setq save-place-file (concat user-emacs-directory "places"))

;; Make prompts simpler
(defalias 'yes-or-no-p 'y-or-n-p)

;; From: https://github.com/technomancy/emacs-starter-kit
;; Hippie expand: at times perhaps too hip
(dolist (f '(try-expand-line try-expand-list try-complete-file-name-partially))
  (delete f hippie-expand-try-functions-list))

;; Add this back in at the end of the list.
(add-to-list 'hippie-expand-try-functions-list 'try-complete-file-name-partially t)
