;;; text.el --- Settings for text, lines, and whitespace

;; Change default major-mode to text-mode
(set-default 'major-mode  'text-mode)

;; Line wrapping and truncation
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(set-default 'truncate-lines t)
(setq truncate-partial-width-windows nil)

;; whitespace-mode
(setq whitespace-style '(face trailing tabs newline lines-tail)
      whitespace-action '(auto-cleanup))

;; Tabs and spaces
(setq-default 'indent-tabs-mode nil)

;; Newlines
(set-default 'require-final-newline t)
(setq next-line-add-newlines t)

;; Parenthesis
(show-paren-mode 1)

;; Font lock mode (syntax coloring)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)

;; Flyspell (spell checking) with aspell
(setq ispell-program-name "aspell")
(add-hook 'text-mode-hook 'turn-on-flyspell)
