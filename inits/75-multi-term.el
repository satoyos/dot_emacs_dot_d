(require 'multi-term)
(setq multi-term-program shell-file-name)

;; Emacs が保持する terminfo を利用する
(setq system-uses-terminfo nil)

(add-hook 'term-mode-hook
         '(lambda ()
            ;; M-c を term 内copyにする
            (define-key term-raw-map (kbd "M-c") 'term-copy-old-input)
            ))
