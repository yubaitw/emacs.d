;;; init-windows.el --- Configuration for window managerment  -*- lexical-binding: t -*-

(use-package winum
  :ensure t
  :hook
  (after-init . winum-mode)
  :general
  (yubai/leader-def
    :states 'normal
    "0" 'winum-select-window-0
    "1" 'winum-select-window-1
    "2" 'winum-select-window-2
    "3" 'winum-select-window-3
    "4" 'winum-select-window-4
    "5" 'winum-select-window-5
    "6" 'winum-select-window-6
    "7" 'winum-select-window-7))

(use-package emacs
  :config
  (setq scroll-step            1
        scroll-conservatively  10000)
  :general
  (yubai/leader-def
    :states 'normal
    "wh" 'split-window-horizontally
    "wv" 'split-window-vertically))

(provide 'init-windows)
;;; init-windows.el ends here
