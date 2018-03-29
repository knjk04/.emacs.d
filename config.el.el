
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'css-mode-hook #'aggressive-indent-mode)

;;activate for programming modes
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

(global-anzu-mode +1)

(use-package auto-complete
:ensure t
:config
(ac-config-default)
(global-auto-complete-mode))

(use-package dashboard
    :config
    (dashboard-setup-startup-hook))

(global-set-key (kbd "C-:") 'avy-goto-char)

(use-package evil
  :ensure t
  :config
  ;; Make Evil's point behave more like Emacs'
  (setq evil-want-change-word-to-end nil)
  (setq evil-move-cursor-back nil)
  (evil-mode))

(evil-commentary-mode)

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package exwm
:ensure t
:config
(require 'exwm-config)


  ;; Set the initial workspace number.
  (setq exwm-workspace-number 0)
  ;; Make class name the buffer name
  (add-hook 'exwm-update-class-hook
            (lambda ()
              (exwm-workspace-rename-buffer exwm-class-name)))

  ;; Don't use evil-mode in exwm buffers
  (add-to-list 'evil-emacs-state-modes 'exwm-mode)

  ;; 's-w': Switch workspace
  (exwm-input-set-key (kbd "s-w") #'exwm-workspace-switch)
  ;; 's-N': Switch to certain workspace
  (dotimes (i 10)
    (exwm-input-set-key (kbd (format "s-%d" i))
                        `(lambda ()
                           (interactive)
                           (exwm-workspace-switch-create ,i))))
  ;; 's-r': Launch application
  (exwm-input-set-key (kbd "s-r")
                      (lambda (command)
                        (interactive (list (read-shell-command "$ ")))
                        (start-process-shell-command command nil command)))

  ;; Better window management
  (exwm-input-set-key (kbd "s-h") 'windmove-left)
  (exwm-input-set-key (kbd "s-j") 'windmove-down)
  (exwm-input-set-key (kbd "s-k") 'windmove-up)
  (exwm-input-set-key (kbd "s-l") 'windmove-right)

  (exwm-input-set-key (kbd "s-s") 'split-window-right)
  (exwm-input-set-key (kbd "s-v") 'split-window-vertically)

  (advice-add 'split-window-right :after 'windmove-right)
  (advice-add 'split-window-vertically :after 'windmove-down)

  (exwm-input-set-key (kbd "s-d") 'delete-window)
  (exwm-input-set-key (kbd "s-q") '(lambda ()
                                     (interactive)
                                     (kill-buffer (current-buffer))))

  ;; Save my hands
  (exwm-input-set-key (kbd "s-f") 'find-file)
  (exwm-input-set-key (kbd "s-b") 'ido-switch-buffer)

  (exwm-input-set-key (kbd "s-w") 'save-buffer)

  ;; Swap between qwerty and Dvorak with the same keyboard key
  (exwm-input-set-key (kbd "s-;") '(lambda ()
                                     (interactive)
                                     (start-process-shell-command "aoeu" nil "aoeu")
                                     (message "Qwerty")))
  (exwm-input-set-key (kbd "s-z") '(lambda ()
                                     (interactive)
                                     (start-process-shell-command "asdf" nil "asdf")
                                     (message "Dvorak")))

  ;; Line-editing shortcuts
  (exwm-input-set-simulation-keys
   '(([?\C-b] . left)
     ([?\C-f] . right)
     ([?\M-f] . C-right)
     ([?\M-b] . C-left)
     ([?\C-y] . S-insert)
     ([?\C-p] . up)
     ([?\C-n] . down)
     ([?\C-a] . home)
     ([?\C-e] . end)
     ([?\M-v] . prior)
     ([?\C-v] . next)
     ([?\C-d] . delete)
     ([?\C-k] . (S-end delete))))
  ;; Configure Ido
  (exwm-config-ido)
  ;; Other configurations
  (exwm-config-misc)

  ;; Allow switching buffers between workspaces
  (setq exwm-workspace-show-all-buffers t)
  (setq exwm-layout-show-all-buffers t))

;; enable systemtray
(require 'exwm-systemtray)
(exwm-systemtray-enable)

; (eye-browse-mode t)

(add-hook 'after-init-hook #'fancy-battery-mode)

(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)  ; Enable guide-key-mode

(use-package helm
:bind (:map evil-normal-state-map
;using ido instead for find-files
("SPC f" . helm-find-files)
("SPC r" . helm-recentf)))
(require 'helm-config)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;("SPC f" . ido-find-file)

(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;(package-install 'intero)
;(add-hook 'haskell-mode-hook 'intero-mode)

(require 'multiple-cursors)
;;for when there is an active region that goes across multiple lines, the below adds a cursor to every line
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;;when I want to add multiple cursors that are not on continuous lines, but rather based on keywords in the buffer
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(use-package org-bullets
 :ensure t
 :init
 (setq org-bullets-bullet-list
  '("◉" "◎" "￼" "○" "►" "◇"))
 :config
 (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package paredit
  :ensure t
  :config
  (add-hook 'evil-cleverparens-mode-hook #'enable-paredit-mode))
(add-hook 'prog-mode-hook #'paredit-mode)

;;start the mode automatically in most programming modes (requires Emacs 24+)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;M-x smartparens-mode to toggle
;;M-x sp-cheat-sheet shows available commands + usage examples
(require 'smartparens-config)

(use-package smex
  :ensure t
  :bind
  (("M-x" . smex)))

;(sml/setup)

(use-package which-key
    :ensure t
    :config
    (which-key-mode))

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
;  (setq powerline-default-separator 'arrow-fade)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

;(defun ido-my-keys ()(defun bind-ido-keys ()
;  "Keybindings for ido mode."
;  (define-key ido-completion-map (kbd "<down>") 'ido-next-match) 
;  (define-key ido-completion-map (kbd "<up>")   'ido-prev-match))
;
;(add-hook 'ido-setup-hook #'bind-ido-keys)

;;(defun init-file ()
;;(if (eq system-type 'windows-nt)

(global-nlinum-relative-mode)

(display-time-mode 1)

(setq tab-always-indent 'complete)

(menu-bar-mode -1)
(tool-bar-mode -1)

(scroll-bar-mode -1)

'(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :family "Source Code Pro for Powerline"))))

(require 'server)
(unless (server-running-p)
  (server-start))

(show-paren-mode 1)
(setq show-paren-delay 0)

(ranger-override-dired-mode t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
