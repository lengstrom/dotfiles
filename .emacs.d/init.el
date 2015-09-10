(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(abbrev-all-caps nil)
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(mac-control-modifier (quote control))
 '(mac-function-modifier (quote hyper))
 '(mac-option-modifier (quote meta))
 '(mac-right-control-modifier (quote control))
 '(mac-right-option-modifier nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Fonts
(add-to-list 'default-frame-alist '(font . "Fantasque Sans Mono-13"))
(set-face-attribute 'default t :font "Fantasque Sans Mono-13")
(set-face-attribute 'variable-pitch t :font "Avenir Next-12")

;; Electric pair mode
(electric-pair-mode 1)

;; Disable toolbar
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1))
  )

;; Stop warnings
(setq ring-bell-function 'ignore)

;; Line wrapping
(global-visual-line-mode 1)

;; Lose splash screen
(setq inhibit-splash-screen t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KEYMAPPING

;; Set command to super
(setq mac-command-modifier 'super)

;; Some useful keybindings for OSX
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-u") 'undo)
(global-set-key (kbd "s-y") 'undo-tree-redo)
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "<s-escape>") 'smex)
(global-set-key (kbd "s-o") 'find-file)
(global-set-key (kbd "s-^") 'enlarge-window)
(global-set-key (kbd "s-<") 'enlarge-window-horizontally)
(global-set-key (kbd "s->") 'shrink-window-horizontally)
(global-set-key (kbd "s-&") 'shrink-window)
(global-set-key (kbd "s-W") 'kill-buffer-and-window)
(global-set-key (kbd "s-R") 'compile)
(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg))
   (previous-line)
   )



(global-set-key (kbd "s-P") 'move-text-up)
(global-set-key (kbd "s-N") 'move-text-down)

;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

(global-set-key (kbd "s-r") 'rename-file-and-buffer)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(custom-set-variables
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; New tab
(defun new-buffer()
  (interactive)
  (switch-to-buffer (generate-new-buffer "buffer"))
  )

(global-set-key (kbd "s-t") 'new-buffer)

;; Custom keybindings
(global-set-key (kbd "s-/") 'comment-or-uncomment-region) ;; Comment / uncomment region via apple-/
;; Custom keybindings (selecting stuff)
;; newline-withoug-break-of-line
(defun newline-without-break-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (end-of-line)
    (newline-and-indent)))
(global-set-key (kbd "<s-return>") 'newline-without-break-of-line)

;; If something's selected and we type, delete the selected text.
(delete-selection-mode t)

;; Restore to desktop upon start
(desktop-save-mode 1)

;; PACKAGES
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

;; ORG-MODE
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; VISUAL

;; Line numbers
(global-linum-mode 1)
(setq linum-format " %d")

;; Themes
(load-theme 'monokai t)
(setq x-stretch-cursor t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; PLUGINS
;; SR-SPEEDBAR
(require 'sr-speedbar)
;;  (global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(global-set-key (kbd "s-e") 'sr-speedbar-toggle)

;; TRAMP
(require 'tramp)
(setq tramp-default-method "ssh")

;; HELM
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)
(helm-mode 1)
(helm-adaptive-mode t)

(global-set-key (kbd "s-o") 'helm-for-files)
(global-set-key (kbd "s-O") 'helm-find-files)
(global-set-key (kbd "s-S") 'helm-semantic-or-imenu)
(global-set-key (kbd "s-f") 'helm-occur)
(global-set-key (kbd "s-k") 'helm-show-kill-ring)

;; Expand-region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; MULTIPLE CURSORS
(require 'multiple-cursors)

;; Multiple cursor commands
(global-set-key (kbd "C-C C-C") 'mc/edit-lines)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "s-d") 'mc/mark-next-like-this)
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))
(global-set-key (kbd "s-D") 'duplicate-line)

;; Autocompletion
(global-set-key (kbd "C-<tab>") 'dabbrev-expand)
(define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)

(defun backward-kill-line (arg)
  (interactive "p")
  (kill-line (- 1 arg)))
(global-set-key (kbd "<s-backspace>")  'backward-kill-line)

(defun kill-whole-line-move-up()
  (interactive)
  (kill-whole-line)
  (previous-line))

(global-set-key (kbd "<C-backspace>")  'kill-whole-line-move-up)

;Change to character replacement from Vim
(defun zap-to-char (arg char)
  (interactive "p\ncZap to char: ")
  (if (char-table-p translation-table-for-input)
      (setq char (or (aref translation-table-for-input char) char)))
  (kill-region (point) (progn
                         (search-forward (char-to-string char)
                                         nil nil arg)
                         (point))))
(global-set-key (kbd "C-c t") 'zap-to-char)

;; COMPANY MODE
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)

;; COMPANY MODE OVERRIDES
(deftheme monokai-overrides)

(let ((class '((class color) (min-colors 257)))
      (terminal-class '((class color) (min-colors 89))))

  (custom-theme-set-faces
   'monokai-overrides

   ;; Linum and mode-line improvements (only in sRGB).
   `(linum
     ((,class :foreground "#75715E"
              :background "#49483E")))
   `(mode-line-inactive
     ((,class (:box (:line-width 1 :color "#2c2d26" :style nil)
                    :background "#2c2d26"))))

   ;; Additional modes
   ;; Company tweaks.
   `(company-tooltip-common
     ((t :foreground "#F8F8F0"
         :background "#474747"
         :underline t)))

   `(company-template-field
     ((t :inherit company-tooltip
         :foreground "#C2A1FF")))

   `(company-tooltip-common-selection
     ((t :foreground "#F8F8F0"
         :background "#474747"
         :underline t)))

   `(company-scrollbar-fg
     ((t :background "#BBF7EF")))

   `(company-tooltip-annotation
     ((t :inherit company-tooltip
         :foreground "#C2A1FF")))

   ;; Popup menu tweaks.
   `(popup-menu-face
     ((t :foreground "#A1EFE4"
         :background "#49483E")))

   `(popup-menu-selection-face
     ((t :background "#349B8D"
         :foreground "#BBF7EF")))

   ;; Circe
   `(circe-prompt-face
     ((t (:foreground "#C2A1FF" :weight bold))))

   `(circe-server-face
     ((t (:foreground "#75715E"))))

   `(circe-highlight-nick-face
     ((t (:foreground "#AE81FF" :weight bold))))

   `(circe-my-message-face
     ((t (:foreground "#E6DB74"))))

   `(circe-originator-face
     ((t (:weight bold))))))

(provide-theme `monokai-overrides)
(enable-theme 'monokai-overrides)

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-tern)
  (add-to-list 'company-backends 'company-anaconda)
  (setq company-tern-meta-as-single-line t))

;; Haskell mode
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

;; anaconda mode/
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)

;; RUST
(require 'rust-mode)
(require 'racer)
(add-hook 'rust-mode-hook #'racer-activate)

(add-to-list 'load-path "/Users/loganengstrom/.emacs.d/elpa/rust-mode-20150610.841")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(setq racer-rust-src-path "/Users/loganengstrom/projects/rust/src")
(setq racer-cmd "/Users/loganengstrom/projects/racer/target/release/racer")
(add-to-list 'load-path "/Users/loganengstrom/projects/racer/editors/emacs")
(eval-after-load "rust-mode" '(require 'racer))

(define-key rust-mode-map (kbd "TAB") #'racer-complete-or-indent)
(define-key rust-mode-map (kbd "M-.") #'racer-find-definition)

;; Mode line setup
(setq-default mode-line-format
	      '(; Position, including warning for 80 columns
		(:propertize "%4l:" face mode-line-position-face)
		(:eval (propertize "%3c" 'face
				   (if (>= (current-column) 80)
				       'mode-line-80col-face
				     'mode-line-position-face)))
					; emacsclient [default -- keep?]
		mode-line-client
		"  "
					; read-only or modified status
		(:eval
		 (cond (buffer-read-only
			(propertize " RO " 'face 'mode-line-read-only-face))
		       ((buffer-modified-p)
			(propertize " ** " 'face 'mode-line-modified-face))
		       (t "      ")))
		"  "
					; directory and buffer/file name
		(:propertize (:eval (shorten-directory default-directory 30))
			     face mode-line-folder-face)
		(:propertize "%b"
			     face mode-line-filename-face)
					; narrow [default -- keep?]
		" %n "
					; mode indicators: vc, recursive edit, major mode, minor modes, process, global
		(vc-mode vc-mode)
		"  %["
		(:propertize mode-name
			     face mode-line-mode-face)
		"%] "
		(:eval (propertize (format-mode-line minor-mode-alist)
				   'face 'mode-line-minor-mode-face))
		(:propertize mode-line-process
			     face mode-line-process-face)
		(global-mode-string global-mode-string)
		"  %p"
					; nyan-mode uses nyan cat as an alternative to %p
		(:eval (when nyan-mode (list (nyan-create))))
		))

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(set-face-attribute 'mode-line nil;
		    :foreground "gray60" :background "gray20"
		    :inverse-video nil
		    :box '(:line-width 6 :color "gray20" :style nil))
(set-face-attribute 'mode-line-inactive nil
		    :foreground "gray80" :background "gray40"
		    :inverse-video nil
		    :box '(:line-width 6 :color "gray40" :style nil))

(set-face-attribute 'mode-line-read-only-face nil
		    :inherit 'mode-line-face
		    :foreground "#4271ae"
		    :box '(:line-width 2 :color "#4271ae"))
(set-face-attribute 'mode-line-modified-face nil
		    :inherit 'mode-line-face
		    :foreground "#eab700"
		    :background "gray20"
		    :box '(:line-width 2 :color "#eab700"))
(set-face-attribute 'mode-line-folder-face nil
		    :inherit 'mode-line-face
		    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
		    :inherit 'mode-line-face
		    :foreground "#eab700"
		    :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
		    :inherit 'mode-line-face
		    :family "Menlo" :height 100)
(set-face-attribute 'mode-line-mode-face nil
		    :inherit 'mode-line-face
		    :foreground "gray80")
(set-face-attribute 'mode-line-minor-mode-face nil
		    :inherit 'mode-line-mode-face
		    :foreground "gray40"
		    :height 110)
(set-face-attribute 'mode-line-process-face nil
		    :inherit 'mode-line-face
		    :foreground "#718c00")
(set-face-attribute 'mode-line-80col-face nil
		    :inherit 'mode-line-position-face
		    :foreground "black" :background "#eab700")
(put 'upcase-region 'disabled nil)

(show-paren-mode 1)
