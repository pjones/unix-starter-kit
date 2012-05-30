;;; code.el --- Settings for editing source code

;; Generic hook run in most programming modes
(defun usk-programming-mode-hook ()
  (require 'align)
  (setq save-place t)
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (flyspell-prog-mode)
  (electric-pair-mode 1)
  (whitespace-mode t)
  (font-lock-add-keywords nil '(("\\<\\(FIXME:\\|TODO:\\|NOTE:\\|WARN:\\)"
                                 1 devalot-fixme-face t)))
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent))
(add-hook 'prog-mode-hook 'usk-programming-mode-hook)

;; Ruby
(add-to-list 'auto-mode-alist '("\\.rake$"    . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.irbrc$"   . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$"      . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$"   . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$"    . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$"    . ruby-mode))
(add-hook 'ruby-mode-hook 'inf-ruby-keys)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'ruby-end-mode)

;; Ruby embedded in HTML
(add-to-list 'load-path (concat user-emacs-directory "rhtml"))
(autoload 'rhtml-mode "rhtml-mode" "Mode for editing mixed Ruby and HTML" t)
(add-to-list 'auto-mode-alist '("\\.html\\.erb$" . rhtml-mode))

;; HTML, CSS, JavaScript
(add-to-list 'auto-mode-alist '("\\.css\\.scss$" . css-mode))
(add-hook 'css-mode-hook 'usk-programming-mode-hook)
(add-hook 'sgml-mode-hook 'usk-programming-mode-hook)
(setq css-indent-offset 2 sgml-basic-offset 2
      js-indent-level 2 js-flat-functions t)

;; Shell scripting
(setq sh-basic-offset 2)

;; Make #! scripts executable after saving them
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
