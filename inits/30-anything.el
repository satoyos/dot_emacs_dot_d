;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ anything.el
;;; 総合インタフェース
;;; http://d.hatena.ne.jp/rubikitch/20100718/anything
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(require 'anything-startup nil t)
(global-set-key (kbd "M-a")     'anything-for-files)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
(setq anything-use-migemo t)

