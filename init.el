'melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(ansi-term-color-vector
   [unspecified "#1f2022" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#4f97d7" "#a3a3a3"])
 '(background-color "#202020")
 '(background-mode dark)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(cursor-color "#cccccc")
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("b8929cff63ffc759e436b0f0575d15a8ad7658932f4b2c99415f3dde09b32e97" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "dd4628d6c2d1f84ad7908c859797b24cc6239dfe7d71b3363ccdd2b88963f336" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "73ad471d5ae9355a7fa28675014ae45a0589c14492f52c32a4e9b393fcc333fd" "d96587ec2c7bf278269b8ec2b800c7d9af9e22d816827639b332b0e613314dfd" "d9dab332207600e49400d798ed05f38372ec32132b3f7d2ba697e59088021555" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "527df6ab42b54d2e5f4eec8b091bd79b2fa9a1da38f5addd297d1c91aa19b616" "50ff65ab3c92ce4758cc6cd10ebb3d6150a0e2da15b751d7fbee3d68bba35a94" "0c3b1358ea01895e56d1c0193f72559449462e5952bded28c81a8e09b53f103f" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a4d03266add9a1c8f12b5309612cbbf96e1291773c7bc4fb685bfdaf83b721c6" "4980e5ddaae985e4bae004280bd343721271ebb28f22b3e3b2427443e748cd3f" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" default)))
 '(fci-rule-color "#383838")
 '(foreground-color "#cccccc")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (evil-surround company-ghc company dashboard page-break-lines marmalade-demo smart-mode-line-powerline-theme smart-mode-line perspective solarized-theme multiple-cursors anzu sublimity darktooth-theme intero fancy-battery aggressive-indent eyebrowse rainbow-delimiters smartparens doom exwm noctilux-theme try guide-key haskell-mode auto-complete org-bullets smex spaceline spacemacs-theme zenburn-theme org-babel-eval-in-repl avy nlinum-relative evil which-key use-package dracula-theme helm)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(persp-mode t)
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(sml/mode-width
   (if
       (eq
	(powerline-current-separator)
	(quote arrow))
       (quote right)
     (quote full)))
 '(sml/pos-id-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (car powerline-default-separator-dir)))
		   (quote powerline-active1)
		   (quote powerline-active2))))
     (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (cdr powerline-default-separator-dir)))
		   (quote powerline-active1)
		   (quote sml/global))))
     (:propertize " " face sml/global))))
 '(sml/pre-id-separator
   (quote
    (""
     (:propertize " " face sml/global)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (car powerline-default-separator-dir)))
		   (quote sml/global)
		   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator
   (quote
    (""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " "
		  (quote display)
		  (funcall
		   (intern
		    (format "powerline-%s-%s"
			    (powerline-current-separator)
			    (cdr powerline-default-separator-dir)))
		   (quote powerline-active2)
		   (quote powerline-active1))))
     (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes)))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(use-package general :ensure t)

; (use-package general :ensure t
;              :config
;              (general-define-key "C-'" 'avy-goto-word-1)
;              )

;; load org-mode for org-babel
(use-package org
  :ensure t)
(require 'org)

(org-babel-load-file
 (expand-file-name "config.el.org"
                   user-emacs-directory))
