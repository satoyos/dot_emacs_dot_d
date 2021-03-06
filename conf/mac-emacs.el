;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;; @ exec-path (Mac)                                               ;;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat '"/usr/local/bin:" (getenv "PATH")))

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; Metaキーの割り当て                                              ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ language - input method                                       ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; モードラインの表示文字列
;(setq-default mac-ime-mode-line-state-indicator "[Aa] ")
;(setq mac-ime-mode-line-state-indicator-list '("[Aa]" "[あ]" "[Aa]"))

;; デフォルトIME
(setq default-input-method "MacOSX")
      

;; IME変更
;(global-set-key (kbd "C-\\") 'toggle-input-method)
;(global-set-key (kbd "C-o") 'toggle-input-method)

;(mac-set-input-method-parameter "com.justsystems.inputmethod.atok27.Japanese" `title "あ")
;(mac-set-input-method-parameter "com.justsystems.inputmethod.atok27.Japanese" `cursor-color "darkred")
;(mac-set-input-method-parameter "com.justsystems.inputmethod.atok27.Roman" `cursor-color "darkgreen")

;; ;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;; ;;; @ language - fontset                                            ;;;
;; ;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; 以下が Mac 用のフォント設定
(global-set-key [s-mouse-1] 'browse-url-at-mouse)
(let* ((size 14)
       (jpfont "Hiragino Maru Gothic ProN")
       (asciifont "Monaco")
       (h (* size 10)))
  (set-face-attribute 'default nil :family asciifont :height h)
  (set-fontset-font t 'katakana-jisx0201 jpfont)
  (set-fontset-font t 'japanese-jisx0208 jpfont)
  (set-fontset-font t 'japanese-jisx0212 jpfont)
  (set-fontset-font t 'japanese-jisx0213-1 jpfont)
  (set-fontset-font t 'japanese-jisx0213-2 jpfont)
  (set-fontset-font t '(#x0080 . #x024F) asciifont))
(setq face-font-rescale-alist
      '(("^-apple-hiragino.*" . 1.2)
	(".*-Hiragino Maru Gothic ProN-.*" . 1.2)
	(".*osaka-bold.*" . 1.2)
	(".*osaka-medium.*" . 1.2)
	(".*courier-bold-.*-mac-roman" . 1.0)
	(".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
	(".*monaco-bold-.*-mac-roman" . 0.9)
	("-cdac$" . 1.3)))
;; C-x 5 2 で新しいフレームを作ったときに同じフォントを使う
(setq frame-inherited-parameters '(font tool-bar-lines))

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ motion-mode.el
;;; RubyMotion開発支援
;;; https://github.com/ainame/motion-mode
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(require 'motion-mode)
;; following add-hook is very important.
(add-hook 'ruby-mode-hook 'motion-recognize-project)
(add-to-list 'ac-modes 'motion-mode)
(add-to-list 'ac-sources 'ac-source-dictionary)
;; set key-binds as you like
(define-key motion-mode-map (kbd "C-c C-c") 'motion-execute-rake)
(define-key motion-mode-map (kbd "C-c C-d") 'motion-dash-at-point)

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; ruby-mode
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; rinari
;;; Ruby on Rails開発支援
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
(require 'rinari)
;; rinariを賢く起動する方法が分からないので当面はruby-modeでは必ず起動してみる
(add-hook 'ruby-mode-hook
    (lambda () (rinari-launch)))


;;; rhtml-mode
;;(require 'rhtml-mode)
;;(add-hook 'rhtml-mode-hook
;;    (lambda () (rinari-launch)))

;; 上記rhtml-modeが今はメンテされておらず、うまく動かないこともあり、
;; 強引だが erbのメジャーモードであるWeb-modeで rinaiを起動してみる
(add-hook 'web-mode-hook
    (lambda () (rinari-launch)))

