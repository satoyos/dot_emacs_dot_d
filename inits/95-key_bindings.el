;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;; @ key binding - keyboard                                        ;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; C-hをバックスペースにする
;; 入力されるキーシーケンスを置き換える
(keyboard-translate ?\C-h ?\C-?)

;; 段落整形のキーを変更する
(global-set-key (kbd "C-\\") 'fill-paragraph)

;; 文字列置換
(global-set-key (kbd "M-r")  'replace-string)

;; コメントの付与と削除
(global-set-key (kbd "C-/")  'comment-dwim)

;; 'opt-¥'で確実にバックスラッシュを入力できるようにする
(global-set-key (kbd "s-¥")  "\\")

;; URLをブラウザで開くキーバインド
;; Web-modeで\C-c\C-jが効かないので、いっそのこと\C-jで開くようにした。
(global-set-key "\C-j" 'browse-url-at-point)

;; 文字列ペースト
(global-set-key (kbd "M-v")  'paste)
