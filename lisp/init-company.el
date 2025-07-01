;;; init-company.el --- Configuration for company.el  -*- lexical-binding: t -*-

(defun yubai/ispell-setup ()
  (with-eval-after-load 'ispell
    (setq ispell-look-p nil)
    (let* ((dict (concat yubai/emacs-d "misc/english-words.txt")))
      (when (and (null ispell-alternate-dictionary)
                 (file-exists-p dict))
        ;; @see https://github.com/redguardtoo/emacs.d/issues/977
        ;; fallback to built in dictionary
        (setq ispell-alternate-dictionary (file-truename dict))))))

(defun yubai/company-ispell-setup ()
  (when (boundp 'company-backends)
    (make-local-variable 'company-backends)
    (push 'company-ispell company-backends)
    (setq yubai/dictionary (concat yubai/emacs-d "misc/english-words.txt"))
    (cond
     ((and (boundp 'ispell-alternate-dictionary) ispell-alternate-dictionary)
      (setq company-ispell-dictionary ispell-alternate-dictionary))
     (t (setq company-ispell-dictionary (file-truename yubai/dictionary))))))

(use-package company
  :ensure t
  :init
  (yubai/ispell-setup)
  :hook
  (org-mode . yubai/company-ispell-setup)
  (markdown-mode . yubai/company-ispell-setup)
  (text-mode . yubai/company-ispell-setup)
  (after-init . global-company-mode)
  :custom
  (company-show-numbers t)
  (company-idle-delay 0)
  (company-minimum-prefix-length 1))

(use-package company-prescient
  :ensure t
  :hook
  (company-mode . company-prescient-mode))

(use-package company-posframe
  :ensure t
  :hook
  (company-mode . company-posframe-mode)
  :custom
  (company-posframe-quickhelp-delay 1.0))

(provide 'init-company)
;;; init-company.el ends here
