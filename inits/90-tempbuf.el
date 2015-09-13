(require 'tempbuf)

;; ファイルを開いたら、自動的にtempbufを有効にする
(add-hook 'find-file-hooks 'turn-on-tempbuf-mode)
;; diredバッファに対して、自動的にtempbufを有効にする
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
