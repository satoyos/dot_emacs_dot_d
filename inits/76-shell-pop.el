(require 'shell-pop)
(shell-pop-set-internal-mode "multi-term")
;; 25% の高さに分割する
(shell-pop-set-window-height 25)
;;(shell-pop-set-internal-mode-shell shell-file-name)
;; ショートカットも好みで変更してください
(global-set-key [f8] 'shell-pop)
