;;; init-package.el --- Settings and helpers for package.el -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


(require 'package)

;;; Install into separate package dirs
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))

;;; Standard package repositories
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;; Should set before loading `use-package'
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-expand-minimally t
      use-package-enable-imenu-support t)

(when (not (package-installed-p 'paradox))
  (package-install 'paradox))

(paradox-require 'use-package)

(require 'use-package)

;; Update packages
(unless (fboundp 'package-upgrade-all)
  (use-package auto-package-update
    :init
    (setq auto-package-update-delete-old-versions t
          auto-package-update-hide-results t)
    (defalias 'package-upgrade-all #'auto-package-update-now)))

(provide 'init-package)
;;; init-package.el ends here
