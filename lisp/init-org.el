;;; init-org.el --- Org-mode config -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package org
  :ensure nil
  :config
  (add-hook 'org-mode-hook
	    (lambda()
	      (setq truncate-lines nil))))

(use-package org-modern
  :config
  (global-org-modern-mode)
  (set-face-attribute 'org-modern-symbol nil :family "Iosevka"))

;;; Org agenda
(use-package org-agenda
  :ensure nil
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture))
  :config
  ;; Directories settings
  (when (file-directory-p "~/Documents/gtd/")
    (setq org-agenda-files (list "~/Documents/gtd/")))
  (setq org-agenda-skip-deadline-if-done nil)
  (setq org-agenda-skip-scheduled-if-done nil)
  (setq org-agenda-start-on-weekday nil)
  (setq org-deadline-warning-days 16)
  (setq org-use-speed-commands t)
  (setq org-agenda-start-day "+0d")
  (setq org-todo-keywords
	'(
          (sequence "TODO(t)" "STARTED(s)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)")
          (sequence "|" "CANCELED(c)" "DELEGATED(l)" "SOMEDAY(f)")
          (sequence "|" "READ(r)")
          (sequence "|" "BLOG(b)")
          (sequence "|" "IDEA(i)")
	  (sequence "|" "WANNA(a)")
	  ))

  ;; my agenda view contains follow items:
  ;;; Ideas
  ;;; Day views
  ;;; Reading list
  ;;; Blogs
  (defvar org-agenda-custom-commands nil
    "Custom commands for org agenda.")
  (setq org-agenda-custom-commands
	'(("d" "Daily agenda and ideas"
	   ((todo "IDEA"
		  ((org-agenda-overriding-header "Thinking:")))
	    (agenda ""
		    ((org-agenda-overriding-header "Today's agenda")
		     (org-agenda-span 'day)
		     (org-agenda-toggle-deadlines)))
	    (agenda ""
		    ((org-agenda-overriding-header "Weekly agenda")
		     (org-agenda-start-day "+1d")
		     (org-agenda-span 7)
		     (org-agenda-toggle-deadlines)))
	    (todo "READ"
		  ((org-agenda-overriding-header "Reading List:")))
	    (todo "BLOG"
		  ((org-agenda-overriding-header "Blogs:")))
	    (todo "WANNA"
		  ((org-agenda-overriding-header "All we wanna do:")))
	    ))))

  ;; org capture
  (defvar org-capture-templates nil
    "Org capture templates.")
  (setq org-capture-templates '(("i" "Idea"
				 entry (file+headline "~/Documents/gtd/ideas.org" "Someday/Maybe")
				 "* IDEA %?\nAdded: %U\n"
				 :prepend t
				 :kill-buffer t)
				("t" "Todo"
				 entry (file+headline "~/Documents/gtd/inbox.org" "TODOs")
				 "* TODO %?\nAdded: %U\n"
				 :prepend t
				 :kill-buffer t)
				("r" "Read"
				 entry (file+headline "~/Documents/gtd/read.org" "Reading List")
				 "* READ %?\nAdded: %U\n"
				 :prepend t
				 :kill-buffer t)
				("b" "Blog"
				 entry (file+headline "~/Documents/gtd/blog.org" "Blogs")
				 "* BLOG %?\nAdded: %U\n"
				 :prepend t
				 :kill-buffer t)
				("a" "Wanna"
				 entry (file+headline "~/Documents/gtd/wanna.org" "Wanna do")
				 "* WANNA %?\nAdded: %U\n"
				 :prepend t
				 :kill-buffer t))))


(provide 'init-org)
;;; init-org.el ends here
