(define-key global-map [?\C-h] 'delete-backward-char)
(define-key global-map [?¥] [?\\])

(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))

(add-hook 'agda2-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c ,") 'agda2-show-context)))
