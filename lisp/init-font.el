;; -*- lexical-binding: t; Font Configuration -*-

(defun font-installed-p (font-name)
  (member font-name (font-family-list)))

(defun centaur-setup-fonts ()
  "Setup fonts."
  (when (display-graphic-p)
    ;; Set default font
    (cl-loop for font in '("Roboto Mono" "Monaco")
             when (font-installed-p font)
             return (set-face-attribute 'default nil
                                        :family font
                                        :height 130))

    ;; Set mode-line font
    ;; (cl-loop for font in '("Menlo" "SF Pro Display" "Helvetica")
    ;;          when (font-installed-p font)
    ;;          return (progn
    ;;                   (set-face-attribute 'mode-line nil :family font :height 120)
    ;;                   (when (facep 'mode-line-active)
    ;;                     (set-face-attribute 'mode-line-active nil :family font :height 120))
    ;;                   (set-face-attribute 'mode-line-inactive nil :family font :height 120)))

    ;; Specify font for all unicode characters
    (cl-loop for font in '("Segoe UI Symbol" "Symbola" "Symbol")
             when (font-installed-p font)
             return (set-fontset-font t 'unicode font nil 'prepend))

    ;; Emoji
    (cl-loop for font in '("Apple Color Emoji" "Noto Color Emoji")
             when (font-installed-p font)
             return (if (>= emacs-major-version 28)
                        (set-fontset-font t 'emoji (font-spec :family font) nil 'prepend)
                      (set-fontset-font t 'symbol (font-spec :family font) nil 'prepend)))
    ))

(centaur-setup-fonts)
(add-hook 'window-setup-hook #'centaur-setup-fonts)
(add-hook 'server-after-make-frame-hook #'centaur-setup-fonts)


(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
		    charset (font-spec :family "KaiTi" :size 28)))

(provide 'init-font)
;;; init-font.el ends here
