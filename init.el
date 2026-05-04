;
; version: 2026-02-18
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Enable 'Find File at Point' (FFAP)
;;
;; platform-applibility: all
;;


(ffap-bindings)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Integrate Emacs copy/paste with System copy/paste
;;
;; platform-applibility: linux (some including 'debian wheezy')
;; reference: http://stackoverflow.com/questions/3216081/integrate-emacs-copy-paste-with-system-copy-paste
;;
;;
;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Load `dired-x`
;;
;; binds `C-x C-j` to 'dired-jump'
;;
;; platform-applibility: all
;;



(require 'dired-x)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; print current date / current time
;;
;; reference: http://stackoverflow.com/questions/251908/how-can-i-insert-current-date-and-time-into-a-file-using-emacs


;; current date

; old-format: "%a %b %d %H:%M:%S %Z %Y"
(defvar current-date-insert-format "%Y-%m-%d"
  "Format of date to insert with `current-date-insert' func
See help of `format-time-string' for possible replacements")

(defun current-date-insert ()
  "insert the current date and time into current buffer.
Uses `current-date-insert-format' for the formatting the date/time."
       (interactive)
       ;(insert (let () (comment-start))e
       (insert (format-time-string current-date-insert-format (current-time)))
       (insert "\n==========\n")
       )


(global-set-key "\C-c\C-c\C-d\C-i" 'current-date-insert)

;; current time


; old-format: "%a %H:%M:%S"
(defvar current-time-insert-format "%H:%M"
  "Format of date to insert with `current-time-insert' func.
Note the weekly scope of the command's precision.")

(defun current-time-insert ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert "- ")
       (insert (format-time-string current-time-insert-format (current-time)))
       (insert ": ")
       )


(global-set-key "\C-c\C-c\C-t\C-i" 'current-time-insert)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ascii table support
;;
;; reference: http://www.emacswiki.org/AsciiTable



(defun ascii-table ()
    "Display basic ASCII table (0 thru 128)."
    (interactive)
    (setq buffer-read-only nil)        ;; Not need to edit the content, just read mode (added)
    (local-set-key "q" 'bury-buffer)   ;; Nice to have the option to bury the buffer (added)
    (switch-to-buffer "*ASCII*")
    (erase-buffer)
    (setq lower32 '("nul" "soh" "stx" "etx" "eot" "enq" "ack" "bel"
		    "bs" "ht" "nl" "vt" "np" "cr" "so" "si"
		    "dle" "dc1" "dc2" "dc3" "dc4" "nak" "syn" "etb"
		    "can" "em" "sub" "esc" "fs" "gs" "rs" "us"
		    ))
    (save-excursion (let ((i -1))
      (insert "ASCII characters 0 thru 127.\n\n")
      (insert " Hex  Dec  Char|  Hex  Dec  Char|  Hex  Dec  Char|  Hex  Dec  Char\n")
      (while (< i 31)
        (insert (format "%4x %4d %4s | %4x %4d %4s | %4x %4d %4s | %4x %4d %4s\n"
                        (setq i (+ 1  i)) i (elt lower32 i)
                        (setq i (+ 32 i)) i (single-key-description i)
                        (setq i (+ 32 i)) i (single-key-description i)
                        (setq i (+ 32 i)) i (single-key-description i)))
        (setq i (- i 96))))))

(global-set-key "\C-c\C-a\C-t" 'ascii-table)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; vvv http://stackoverflow.com/questions/9878623/how-can-i-disable-auto-fill-mode-in-emacs

(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

; ^^^ http://stackoverflow.com/questions/9878623/how-can-i-disable-auto-fill-mode-in-emacs

; vvv http://stackoverflow.com/questions/1850292/emacs-23-1-and-mac-os-x-problem-with-files-drag-and-drop


(setq ns-pop-up-frames nil)

; vvv http://stackoverflow.com/questions/1850292/emacs-23-1-and-mac-os-x-problem-with-files-drag-and-drop


; vvv http://www.gnu.org/software/emacs/emacs-lisp-intro/html_node/Keybindings.html


;;; Rebind `C-x C-b' from `buffer-list` to  `buffer-menu'
(global-set-key "\C-x\C-b" 'buffer-menu)


; ^^^  http://www.gnu.org/software/emacs/emacs-lisp-intro/html_node/Keybindings.html

; vvv http://stackoverflow.com/questions/916797/emacs-global-set-key-to-c-tab


; (global-set-key (kbd "<C-tab>") 'next-multiframe-window)
(global-set-key (kbd "<C-tab>") 'other-window)

; (global-set-key (kbd "<C-S-tab>") 'previous-multiframe-window)
(global-set-key (kbd "<C-S-tab>") (other-window -1))

; ^^^ http://stackoverflow.com/questions/916797/emacs-global-set-key-to-c-tab


; enable CUA mode ...
; vvv http://www.emacswiki.org/CuaMode

(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

; ^^^ http://www.emacswiki.org/CuaMode


; Set emacs “Meta” key to be the mac command key
; vvv https://superuser.com/questions/297259/set-emacs-meta-key-to-be-the-mac-key

; (setq mac-option-key-is-meta nil
;       mac-command-key-is-meta t
;       mac-command-modifier 'meta
;       mac-option-modifier 'none)

; ^^^ https://superuser.com/questions/297259/set-emacs-meta-key-to-be-the-mac-key


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'md5)

(defun md5-current-kill ()
  (interactive)
    (insert hash)
    (insert (kill-new (md5 (current-kill 0))))
  )


(defun sha256-current-kill ()
  (interactive)
  (let (setq result)
    (setq hash (secure-hash 'sha256 (current-kill 0)))
    (setq str hash)
    (setq result "")
    (while (> (length str) 0)
      (setq result (concat result (string (string-to-number (substring str 0 2 ) 16))))
      (setq str (substring str 2))
      )
    (insert '"\n")
    (insert hash)
    (insert '"\n")
    (insert (base64-encode-string result))
    )
  )


(defun sha256-current-kill-2 ()
  (interactive)
  (let* ((kill   (current-kill 0))
         (hex    (secure-hash 'sha256 kill))
         (binary (secure-hash 'sha256 kill nil nil t)))
    (insert "\n" hex "\n" (base64-encode-string binary t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;  Save Bookmarks automatically when they are updated
;;
;; [Emacs: Bookmark Init](http://xahlee.info/emacs/emacs/emacs_bookmark_init.html)
;;


(setq bookmark-save-flag 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Add MELPA (Milkypostman’s Emacs Lisp Package Archive)
;;
;; [Markdown Mode for Emacs](https://jblevins.org/projects/markdown-mode/)
;;

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Add Markdown support
;;
;; [Markdown Mode for Emacs](https://jblevins.org/projects/markdown-mode/)
;;
;; M-x package-install RET markdown-mode RET


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(markdown-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Personal key-bindings
;;
;; [keyboard - What are good custom keybindings in emacs? - Stack Overflow](https://stackoverflow.com/questions/5682631/what-are-good-custom-keybindings-in-emacs)
;;

(global-unset-key "\C-l")
(defvar ctl-l-map (make-keymap)
     "Keymap for local bindings and functions, prefixed by (^L)")
(define-key global-map "\C-l" 'Control-L-prefix)
(fset 'Control-L-prefix ctl-l-map)


(define-key ctl-l-map "\C-l" 'redraw-display)
(define-key ctl-l-map "l"    'recenter)

(define-key ctl-l-map "at" 'ascii-table)
(define-key ctl-l-map "id" 'current-date-insert)
(define-key ctl-l-map "it" 'current-time-insert)
(define-key ctl-l-map "dtw" 'delete-trailing-whitespace)
(define-key ctl-l-map "``" (lambda ()
	(interactive)
	(insert "```\n```\n")))
(define-key ctl-l-map "`b" (lambda ()
	(interactive)
	(insert "```bash\n```\n")))
(define-key ctl-l-map "`m" (lambda ()
	(interactive)
	(insert "```markdown\n```\n")))

;; navigation

(global-set-key (kbd "<M-down>") 'scroll-up-command)
(global-set-key (kbd "<M-up>")   'scroll-down-command)

;; buffers


(global-set-key (kbd "C-<") 'previous-buffer)
(global-set-key (kbd "C->") 'next-buffer)
