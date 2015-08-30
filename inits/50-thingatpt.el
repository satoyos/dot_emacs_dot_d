;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;; URLの取り扱い                                                   ;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; URLをハイライトで強調表示
(require 'thingatpt)
(global-hi-lock-mode 1)
(add-hook 'find-mode-hook
		  '(lambda()(highlight-regexp thing-at-point-url-regexp "hi-blue")))
;; URLをブラウザで開くキーバインド
(global-set-key "\C-c\C-j" 'browse-url-at-point)
(global-set-key [double-mouse-1] 'browse-url-at-mouse)


