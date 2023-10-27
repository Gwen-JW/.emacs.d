;;; init-org.el --- Org-mode config -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package org-modern
  :config
  (global-org-modern-mode)
  (set-face-attribute 'org-modern-symbol nil :family "Iosevka"))

(provide 'init-org)
;;; init-org.el ends here
