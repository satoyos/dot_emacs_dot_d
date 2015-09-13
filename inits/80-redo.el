(require 'redo+)
(global-set-key (kbd "C-_") 'redo)
(setq undo-no-redo t) ; 過去のundoがredoされないようにする
;; 大量のredoに耐えられるようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)





