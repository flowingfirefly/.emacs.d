(add-to-list 'load-path "~/.emacs.d/scheme")
(add-to-list 'load-path "~/.emacs.d/company")
(add-to-list 'load-path "~/.emacs.d/spooc")

(autoload
  'paredit-mode "paredit"
  "ParEdit is a minor mode for performing structured editing of S-expression data."
  t)

(autoload
  'rainbow-delimiters-mode "rainbow-delimiters"
  "Highlight brackets according to their depth."
  t)

(autoload
  'company-mode "company"
  "Company is a text completion framework for Emacs."
  t)

(autoload
  'spooc-mode "spooc-mode"
  "spooc text mode."
  t)

(add-to-list 'auto-mode-alist '("\\.spoc\\'" . spooc-mode))

(add-hook 'spooc-mode-hook
	  (lambda ()
	    (company-mode 1)))

(add-hook 'scheme-mode-hook
  (lambda ()
    (paredit-mode 1)
    (rainbow-delimiters-mode 1)
    (show-paren-mode 1)
    (company-mode 1)))

;;; hide toolbar
(tool-bar-mode -1)

(load-theme 'wombat t)

(set-face-attribute 'default nil
		    :font "JetBrains Mono 15")

;; TODO 双引号有问题，还是英文
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset
		    (font-spec :family "Libian SC" :size 18)))

;;; 设置 complete any 弹出框的颜色
(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-preview-common ((t (:inherit default :background ,(color-lighten-name bg 10)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

(defun mac-switch-meta nil 
  "switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier nil)
      (progn 
	(setq mac-option-modifier nil)
	(setq mac-command-modifier 'meta)
      )
    (progn
      (setq mac-option-modifier 'meta)
      (setq mac-command-modifier 'hyper)
      )))

(mac-switch-meta)

(setq backup-directory-alist '(("." . "~/.emacs.d/auto-save-list")))

(defun resize-frame-width nil
  "resize frame width to 80 columns."
  (interactive)
  (message "done.")
  (set-frame-width (selected-frame) 80))

(global-set-key (quote [f9]) (quote resize-frame-width))

;;; hide scroll bar
(scroll-bar-mode -1)

;;; enable ligature
(mac-auto-operator-composition-mode)

;;; enable column number mode
(column-number-mode)
