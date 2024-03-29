;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; (require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* t) ;; Disabled with nil if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-a-linux* (eq system-type 'gnu/linux))

;; Adjust garbage collection thresholds during startup, and thereafter

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(setq confirm-kill-emacs #'yes-or-no-p)
(electric-pair-mode t)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(global-display-line-numbers-mode 1)
;;(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-visual-line-mode 1)
(setq-default line-spacing 0.2)
(setq-default fringe-indicator-alist (assq-delete-all 'truncation fringe-indicator-alist))

(require 'init-package)
(require 'init-font)
(require 'init-theme)
(require 'init-minibuffer)
(require 'init-utils)
(require 'init-org)
(require 'init-roam)
(when *spell-check-support-enabled*
  (require 'init-spelling))

(provide 'init)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(which-key embark marginalia vertico orderless minibuffer nord-theme org-agenda writeroom-mode paradox org-roam-ui org-modern org-download markdown-mode consult-org-roam)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
