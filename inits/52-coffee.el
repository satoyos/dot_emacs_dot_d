(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2))
  )

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; auto-complete
(add-to-list 'ac-modes 'coffee-mode) ;; coffee-modeでACを使えるようにする

;; coffee-modeで、追加したjs2-modeのdict(辞書)で補完するようにする
;; wget https://raw.github.com/sandai/dotfiles/master/.emacs.d/ac-dict/js2-mode
(add-hook 'coffee-mode-hook
  '(lambda ()
    (add-to-list 'ac-dictionary-files "~/.emacs.d/ac-dict/js2-mode")
))
