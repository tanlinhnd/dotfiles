;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; PATH
(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path 
        (append
         (split-string-and-unquote path ":")
         exec-path)))

;; Some term enhancement
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(defadvice ansi-term (before force-bash)
  (interactive (list "/bin/zsh")))
(ad-activate 'ansi-term)

;; Other configs
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Splash Screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; Happy Hacking")

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode  1)

;; Paragraph movement
(global-set-key (kbd "s-j") 'forward-paragraph)
(global-set-key (kbd "s-k") 'backward-paragraph)

;; UI configurations
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
(global-linum-mode 1)
(add-to-list 'default-frame-alist '(font . "Fira Code-13"))
(add-to-list 'default-frame-alist '(height . 48))
(add-to-list 'default-frame-alist '(width . 160))

;; Vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-escape
  :ensure t
  :init
  (setq-default evil-escape-key-sequence "qq")
  (setq-default evil-escape-delay 0.5)
  :config
  (evil-escape-mode 1))

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

;; All The Icons
(use-package all-the-icons :ensure t)

;; NeoTree
(use-package neotree
  :ensure t
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)

;; When running ‘projectile-switch-project’ (C-c p p), ‘neotree’ will change root automatically.
(setq projectile-switch-project-action 'neotree-projectile-action)

;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "→")
  :config
  (which-key-mode))

;; Fancy titlebar for MacOS
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)

;; Highlight current line
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")

;; Custom keybinding
(use-package general
  :ensure t
  :config (general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  "/"   '(counsel-projectile-ag :which-key "search project with ag")
  "SPC" '(execute-extended-command :which-key "execute command")'
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  ;; file
  "f"   '(:which-key "files")
  "ff"	'(counsel-find-file :which-key "find files")
  "ft"  '(neotree-show :which-key "show neotree")
  "fs"  '(save-buffer :which-key "save buffer")
  ;; priojectile with ivy
  "p"   '(:which-key "projectile")
  "pf"  '(counsel-projectile-find-file	 :which-key "jump to project file")
  "pd"  '(counsel-projectile-find-dir :which-key "jump to project dir")
  "pp"  '(counsel-projectile-switch-project :which-key "switch project")
  "pb"  '(counsel-projectile-switch-to-buffer	 :which-key "switch buffer")
  "ps" '(counsel-projectile-ag	:which-key "search project with ag")
  ;; swiper
  "s"   '(:which-key "swiper")
  "ss" '(swiper :which-key "search symbol in file")
  ;; Buffers
  "b"   '(:which-key "buffers")
  "bb"  '(switch-to-buffer :which-key "buffers list")
  "bd"  '(kill-this-buffer :which-key "kill buffer")
  ;; Window
  "w"   '(:which-key "window")
  "wl"  '(windmove-right :which-key "move right")
  "wh"  '(windmove-left :which-key "move left")
  "wk"  '(windmove-up :which-key "move up")
  "wj"  '(windmove-down :which-key "move bottom")
  "w/"  '(split-window-right :which-key "split right")
  "w-"  '(split-window-below :which-key "split bottom")
  "wd"  '(delete-window :which-key "delete window")
  "qz"  '(delete-frame :which-key "delete frame")
  ;; go mode
  "g"   '(:which-key "go-mode")
  "gg"  '(go-guru-map :which-key "go-guru map")
  "gi"  '(go-import-add :which-key "go-import-add")
  "gd"  '(go-guru-definition :which-key "go-guru-definition")
  ;; quit
  "q" '(:which-key "quit")
  "qq"  '(kill-emacs :which-key "quit emacs")
))

(defun switch-to-previous-buffer ()
(interactive)
(switch-to-buffer (other-buffer (current-buffer) 1)))

;; Ivy
(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :config
  (ivy-mode 1))

;; Projectile
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root t)
  :config
  (projectile-mode 1))

;; Ivy Projectile
(use-package counsel-projectile
  :ensure t
  :init
  :config
  (counsel-projectile-mode 1))

(with-eval-after-load 'ivy
  (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line))

;; Company mode
(use-package company
  :ensure t
  :config
  (global-company-mode 1))

(add-hook 'go-mode-hook
      (lambda ()
        (set (make-local-variable 'company-backends) '(company-go))
        (company-mode)))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-j") #'company-select-next)
  (define-key company-active-map (kbd "C-k") #'company-select-previous))

;; Powerline
(use-package spaceline
  :ensure t
  :init
  (setq powerline-default-separator 'slant)
  :config
  (spaceline-emacs-theme)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-buffer-size-off)
  (spaceline-toggle-evil-state-on))

;;;;;;;;;;;;;;;;;;;;;;;
;; Language Supports ;;
;;;;;;;;;;;;;;;;;;;;;;;
(use-package go-mode
  :ensure t)

(use-package flymake-go
  :ensure t)

;; flymake-go
(eval-after-load "go-mode"
  '(require 'flymake-go))

;; go-guru for go mode
(use-package go-guru
  :demand t)

(go-guru-hl-identifier-mode)

(add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  (setq gofmt-command "goimports")                ; gofmt uses invokes goimports
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

;; flycheck-gometalinter
(use-package flycheck-gometalinter
  :ensure t
  :init
  ;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
  (setq flycheck-gometalinter-vendor t)
  ;; only show errors
  (setq flycheck-gometalinter-errors-only t)
  ;; only run fast linters
  (setq flycheck-gometalinter-fast t)
  ;; use in tests files
  (setq flycheck-gometalinter-test t)
  ;; disable linters
  ; (setq flycheck-gometalinter-disable-linters '("gotype" "gocyclo"))
  ;; Only enable selected linters
  (setq flycheck-gometalinter-disable-all t)
  (setq flycheck-gometalinter-enable-linters '("golint"))
  ;; Set different deadline (default: 5s)
  (setq flycheck-gometalinter-deadline "10s")
  :config
  (progn
    (flycheck-gometalinter-setup)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-guru flycheck-gometalinter company company-go go-mode ivy which-key use-package spaceline neotree general evil-escape doom-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
