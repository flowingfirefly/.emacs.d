(defvar spooc-highlights nil)

(setq spooc-highlights
      '(("\\\\[]@[\\{}]" . font-lock-string-face)
	("[[:digit:]]+" . font-lock-constant-face)
	("@\\(?:[[:alpha:]]+-*[[:alpha:]]+\\)+" . font-lock-function-name-face)
	("[][{}]" . font-lock-keyword-face)))

(define-derived-mode spooc-mode fundamental-mode "spooc"
  "major mode for editing spooc text."
  (setq font-lock-defaults '(spooc-highlights)))

(provide 'spooc-mode)
