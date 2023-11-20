;;; init-roam.el --- Org-roam config -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package org-roam
  :diminish
  :defines org-roam-graph-viewer
  :bind (("C-c n a" . org-id-get-create)
         ("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n j" . org-roam-dailies-capture-today)
         ("C-c n r" . org-roam-ref-find)
         ("C-c n R" . org-roam-ref-add)
         ("C-c n s" . org-roam-db-sync))
  :custom
  ;; (org-roam-database-connector 'sqlite-builtin)
  (org-roam-directory (file-truename "~/Documents/roam/org-roam/"))
  (org-roam-db-gc-threshold most-positive-fixnum)
  :config
  (unless (file-exists-p org-roam-directory)
    (make-directory org-roam-directory t))
  (org-roam-db-autosync-enable)
  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
                 (display-buffer-in-direction)
                 (direction . right)
                 (window-width . 0.33)
                 (window-height . fit-window-to-buffer))))

(use-package org-roam-ui
  :config
  (setq
   ;; org-roam-ui-sync-theme t
   org-roam-ui-follow t
   org-roam-ui-update-on-save t
   ;; org-roam-ui-open-on-start t
   ))


(provide 'init-roam)
;;; init-roam.el ends here
