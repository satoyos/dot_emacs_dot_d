(require 'helm)
(require 'helm-config)
(require 'helm-mode)
(require 'helm-descbinds)

(helm-migemo-mode 1)


;;; キー設定
(global-set-key (kbd "M-a") 'helm-mini)
(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; ;;; 既存のコマンドを Helm インターフェイスに置き換える
(helm-mode 1)
;;; 自動補完を無効
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
;;; helm-mode で無効にしたいコマンド
(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
(add-to-list 'helm-completing-read-handlers-alist '(find-file-at-point . nil))
(add-to-list 'helm-completing-read-handlers-alist '(write-file . nil))
(add-to-list 'helm-completing-read-handlers-alist '(helm-c-yas-complete . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-do-copy . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-do-rename . nil))
(add-to-list 'helm-completing-read-handlers-alist '(dired-create-directory . nil))

;;; 一度に表示する最大候補数を増やす
(setq helm-candidate-number-limit 99999)

