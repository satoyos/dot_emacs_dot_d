;; color-moccurの設定
(when (require 'color-moccur nil t)
;;M-oにoccur-by-moccurを割り当て
(define-key global-map (kbd "M-o") 'occur-by-moccur)
;;スペース区切りでAND検索
(setq moccur-split-word t)
;;ディレクトリ検索するときの除外ファイル
(add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
(add-to-list 'dmoccur-exclusion-mask "^#.+#$")
;;Migemoを利用できる環境であればMigemoを使う
(when (and (executable-find "/usr/local/bin/cmigemo") ;;このパスも、自分の環境に合わせて変更してください
     (require 'migemo nil t))
(setq moccur-use-migemo t)))

;; moccur-editの設定
(require 'moccur-edit nil t)
