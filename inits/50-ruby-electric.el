;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;; ruby-electric
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(setq ruby-electric-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map " " 'ruby-electric-space/return)
        (define-key map [remap delete-backward-char] 'ruby-electric-delete-backward-char)
        (define-key map [remap newline] 'ruby-electric-space/return)
        (define-key map [remap newline-and-indent] 'ruby-electric-space/return)
        map))

(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

