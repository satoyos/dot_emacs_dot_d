(add-hook
 'text-mode-hook
 '(lambda()
   (goto-char (point-min))
  (while (search-forward "〜" nil t) (replace-match "～"))
  ))
