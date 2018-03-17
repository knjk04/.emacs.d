
(menu-bar-mode -1)
(tool-bar-mode -1)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package evil
  :ensure t
  :config
  ;; Make Evil's point behave more like Emacs'
  (setq evil-want-change-word-to-end nil)
  (setq evil-move-cursor-back nil)
  (evil-mode))

(global-set-key (kbd "C-:") 'avy-goto-char)

(use-package smex
  :ensure t
  :bind
  (("M-x" . smex)))

(use-package auto-complete
:ensure t
:config
(ac-config-default)
(global-auto-complete-mode))

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)  ; Enable guide-key-mode

(use-package exwm
:ensure t
:config
(require 'exwm-config)
(exwm-config-default))

(require 'smartparens-config)

(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

;; set sizes here to stop spacemacs theme resizing these
(set-face-attribute 'org-level-1 nil :height 1.0)
(set-face-attribute 'org-level-2 nil :height 1.0)
(set-face-attribute 'org-level-3 nil :height 1.0)
(set-face-attribute 'org-scheduled-today nil :height 1.0)
(set-face-attribute 'org-agenda-date-today nil :height 1.1)
(set-face-attribute 'org-table nil :foreground "#008787")

(use-package spaceline
  :demand t
  :init
  (setq powerline-default-separator 'arrow-fade)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

(global-nlinum-relative-mode)

(display-time-mode 1)

(show-paren-mode 1)
(setq show-paren-delay 0)

(setq tab-always-indent 'complete)

(require 'server)
(unless (server-running-p)
  (server-start))

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
