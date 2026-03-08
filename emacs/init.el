(setq evil-want-keybindings nil) 

(use-package evil
  :vc (:url "https://github.com/emacs-evil/evil.git" )
  :init
  :config
  (evil-mode 1))

(use-package evil-collection
  :vc (:url "https://github.com/emacs-evil/evil-collection.git" )
  :after evil
  :config
  (evil-collection-init))

(set-input-method 'russian-computer)
  (defun evil-toggle-input-method ()
    (interactive)
    (if (not current-input-method)
        (if (not (string= evil-state "insert"))
            (evil-insert-state))
      (if (string= evil-state "insert")
          (evil-normal-state)
          ))
    (toggle-input-method))
(global-set-key (kbd "C-\\") 'evil-toggle-input-method)


(set-face-attribute 'default nil
  :font "JetBrains Mono"
  :height 120
  :weight 'medium)
(add-to-list 'default-frame-alist '(font . "JetBrains Mono-20"))

;; Uncomment the following line if line spacing needs adjusting.
(setq-default line-spacing 0.12)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-hook 'window-setup-hook #'toggle-frame-fullscreen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(global-display-line-numbers-mode 1)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)

;; DIRED
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

;; MINIBUFFER
(fido-vertical-mode)
