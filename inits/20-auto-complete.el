(require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; 対象の全てで補完を有効にする
(global-auto-complete-mode t)
(ac-config-default)
(add-hook 'html-mode-hook '(lambda () (auto-complete-mode t)))
;; 補完ウィンドウ内でのキー定義
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)
;; 補完は3文字めから
(setq ac-auto-start 3)
;; 起動キーの設定
;; (ac-set-trigger-key "TAB")
;; 「空気を読んでほしい」
;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part9
(setq ac-dwim t)
