(require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; 対象の全てで補完を有効にする
(global-auto-complete-mode t)
(ac-config-default)
(add-hook 'html-mode-hook '(lambda () (auto-complete-mode t)))
;; 補完ウィンドウ内でのキー定義
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
(define-key ac-completing-map (kbd "M-/") 'ac-stop)
;; 補完は3文字めから
(setq ac-auto-start 3)
;; 起動キーの設定
;; (ac-set-trigger-key "TAB")
;; 「空気を読んでほしい」
;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part9
(setq ac-dwim t)

;; 「Emacs Auto-Completeユーザ辞書の作り方メモ」より
;; http://fukuyama.co/emacs-auto-complete

;;-----------
;; Auto-Complete user dictionaries location.
(defvar ac-user-dict-dir (expand-file-name "~/.emacs.d/ac-dict/"))

;; Complete action:
;; Put the cursor within () if a candidate has () at the end of it.
(defun ac-go-into-braces-action ()
  (save-restriction
    (narrow-to-region (point) (- (point) 2))
    (if (re-search-backward "()" nil t)
        (forward-char))))

;; Prefix Condition:
;; Auto completion start after any single character + dot(.) context.
(defun ac-js-dot-prefix ()
  "`x.' prefix."
  (if (re-search-backward ".\\.\\(.*\\)" nil t)
      (match-beginning 1)))

;; Currently selected candidate's color setting.
(defface ac-my-selection-face
  '((t (:background "#000080" :foreground "#ffffff")))
  "Face for selectied candidate."
  :group 'auto-complete)

;;; Dictionary 1 (Undersocre.js)はパス

;;; Dictionary 2 (jQuery)
(defface ac-jquery-candidate-face
  '((t (:background "#1f679a" :foreground "#eeeeee")))
  "Face for jquery candidate."
  :group 'auto-complete)
(defvar ac-jquery-method1-cache
  (ac-file-dictionary (concat ac-user-dict-dir "jquery-method1")))
(defvar ac-source-jquery-method-dict1
  '((candidates . ac-jquery-method1-cache)
    (candidate-face . ac-jquery-candidate-face)
    (selection-face . ac-my-selection-face)
    (prefix . ac-js-dot-prefix)
    (action . ac-go-into-braces-action)
    (symbol . "jquery method1")))

;; Dictionary 3 (jQuery prefix `jQuery.' or `$.')
(defun ac-jquery-method2-prefix ()
  "`$' or `jQuery' prefix."
  (if (re-search-backward "\\(jQuery\\|\\$\\)\\.\\(.*\\)" nil t)
      (match-beginning 2)))
(defvar ac-jquery-method2-cache
  (ac-file-dictionary (concat ac-user-dict-dir "jquery-method2")))
(defvar ac-source-jquery-method-dict2
  '((candidates . ac-jquery-method2-cache)
    (candidate-face . ac-jquery-candidate-face)
    (selection-face . ac-my-selection-face)
    (prefix . ac-jquery-method2-prefix)
    (action . ac-go-into-braces-action)
    (symbol . "jquery method2")))

;;; Dictionary 4 (jQuery selector prefix `x:')
(defun ac-jquery-selector-prefix ()
  "`x:' prefix."
  (if (re-search-backward ".\\:\\(.*\\)" nil t)
      (match-beginning 1)))
(defface ac-jquery-selector-candidate-face
  '((t (:background "#1B919A" :foreground "#eeeeee")))
  "Face for jquery selector candidate."
  :group 'auto-complete)
(defvar ac-jquery-selector-cache
  (ac-file-dictionary (concat ac-user-dict-dir "jquery-selector")))
(defvar ac-source-jquery-selector-dict
  '((candidates . ac-jquery-selector-cache)
    (candidate-face . ac-jquery-selector-candidate-face)
    (selection-face . ac-my-selection-face)
    (prefix . ac-jquery-selector-prefix)
    (action . ac-go-into-braces-action)
    (symbol . "jQuery selector")))

;; Dictionary 5 (jQuery deferred)
(defvar ac-jquery-deferred-cache
  (ac-file-dictionary (concat ac-user-dict-dir "jquery-deferred")))
(defvar ac-source-jquery-deferred-dict
  '((candidates . ac-jquery-deferred-cache)
    (candidate-face . ac-jquery-candidate-face)
    (selection-face . ac-my-selection-face)
    (prefix . ac-js-dot-prefix)
    (action . ac-go-into-braces-action)
    (symbol . "jQuery deferred")))

;;; Dictionary 6 (jQuery callback)
(defvar ac-jquery-callback-cache
  (ac-file-dictionary (concat ac-user-dict-dir "jquery-callback")))
(defvar ac-source-jquery-callback-dict
  '((candidates . ac-jquery-callback-cache)
    (candidate-face . ac-jquery-candidate-face)
    (selection-face . ac-my-selection-face)
    (prefix . ac-js-dot-prefix)
    (action . ac-go-into-braces-action)
    (symbol . "jQuery callback")))

;;; Dictionary 7 (jQuery event)
(defvar ac-jquery-event-cache
  (ac-file-dictionary (concat ac-user-dict-dir "jquery-event")))
(defvar ac-source-jquery-event-dict
  '((candidates . ac-jquery-event-cache)
    (candidate-face . ac-jquery-candidate-face)
    (selection-face . ac-my-selection-face)
    (prefix . ac-js-dot-prefix)
    (action . ac-go-into-braces-action)
    (symbol . "jQuery event")))

;;; Dictionary 8 (html-tag)
(defvar ac-html-tag-event-cache
  (ac-file-dictionary (concat ac-user-dict-dir "html-tag-list")))
(defvar ac-source-html-tag-event-dict
  '((candidates . ac-html-tag-event-cache)
    (candidate-face . ac-jquery-candidate-face)
    (selection-face . ac-my-selection-face)
    (prefix . "<\\([^>]*\\)")
    (action . ac-go-into-braces-action)
    (symbol . "HTML Tag")))

;;; Dictionary 8 (html-attribute)
(defvar ac-html-attribute-event-cache
  (ac-file-dictionary (concat ac-user-dict-dir "html-attribute-list")))
(defvar ac-source-html-attribute-event-dict
  '((candidates . ac-html-attribute-event-cache)
    (candidate-face . ac-jquery-candidate-face)
    (selection-face . ac-my-selection-face)
    (prefix . "\\w[^>]*[[:space:]]+\\(.*\\)")
    (symbol . "HTML Attr")))


;; Choose dictionaries and sorces.
(defun ac-js-mode-setup ()
  (setq ac-sources
        '(
          ac-source-abbrev
          ac-source-words-in-same-mode-buffers
          ;; ac-source-yasnippet
          ac-source-filename
          ;; Sort by priority in prefixed dictionaries.
          ac-source-jquery-method-dict2  ; prefix `$.'
          ac-source-jquery-method-dict1  ; prefix `x.'
;;          ac-source-underscore-js-dict   ; prefix `x.'
          ac-source-jquery-deferred-dict ; prefix `x.'
          ac-source-jquery-callback-dict ; prefix `x.'
          ac-source-jquery-event-dict    ; prefix `x.'
          ac-source-jquery-selector-dict ; prefix `x:'
          )))
;; Apply to each major mode.
 (add-hook 'js-mode-hook 'ac-js-mode-setup)
 (add-hook 'js2-mode-hook 'ac-js-mode-setup)

(defun ac-web-mode-setup ()
  (setq ac-sources
        '(
          ac-source-abbrev
          ac-source-words-in-same-mode-buffers
          ;;ac-source-filename ; '/'にいちいち反応する！
          ;; Sort by priority in prefixed dictionaries.
          ac-source-jquery-method-dict2  ; prefix `$.'
          ac-source-jquery-method-dict1  ; prefix `x.'
;;          ac-source-underscore-js-dict   ; prefix `x.'
          ac-source-jquery-deferred-dict ; prefix `x.'
          ac-source-jquery-callback-dict ; prefix `x.'
          ac-source-jquery-event-dict    ; prefix `x.'
          ac-source-jquery-selector-dict ; prefix `x:'
          ac-source-html-tag-event-dict
          ac-source-html-attribute-event-dict
          )))

;; Apply to each major mode.
(add-hook 'web-mode-hook 'ac-web-mode-setup)
