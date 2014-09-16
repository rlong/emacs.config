

;; vvv http://stackoverflow.com/questions/11028148/cant-get-python-mode-working-in-emacs-on-mac-os-x

(add-to-list 'load-path "~/.emacs.d/markdown-mode.2014-09-17")

;; ^^^ http://stackoverflow.com/questions/11028148/cant-get-python-mode-working-in-emacs-on-mac-os-x


;;; vvv http://jblevins.org/projects/markdown-mode/

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; ^^^ http://jblevins.org/projects/markdown-mode/

