;;; helm-file-preview.el --- Preview the current helm file selection.  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Shen, Jen-Chieh
;; Created date 2019-06-18 14:03:53

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Preview the current helm selection.
;; Keyword: file helm preview select selection
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.4") (helm "2.0"))
;; URL: https://github.com/jcs090218/helm-file-preview

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Preview the current helm file selection.
;;

;;; Code:


(require 'helm)


(defgroup helm-file-preview nil
  "Preview the current helm file selection."
  :prefix "helm-file-preview-"
  :group 'tools
  :link '(url-link :tag "Repository" "https://github.com/jcs090218/helm-file-preview"))


(defcustom helm-file-preview-only-when-line-numbers t
  "Find the file only when the line numbers appears in the selection."
  :type 'boolean
  :group 'helm-file-preview)

(defcustom helm-file-preview-preview-only t
  "Preview the file instead of actually opens the file."
  :type 'boolean
  :group 'helm-file-preview)


(defvar helm-file-preview--prev-window nil
  "Record down the previous window before we do `helm-' related commands.")

(defvar helm-file-preview--file-list '()
  "List of file the are previewing, and ready to be killed again.")

(defvar helm-file-preview--current-select-fn ""
  "Record current selecting filename.")


(defun helm-file-preview--helm-move-selection-after-hook (&rest _args)
  "Helm after move selection for `helm-' related commands preview action.
ARGS : rest of the arguments."
  (when (and helm-file-preview--prev-window
             (helm-get-selection))
    (let* ((sel-lst (split-string (helm-get-selection nil t) ":"))
           (fn (nth 0 sel-lst))   ; filename
           (ln (nth 1 sel-lst))   ; line
           (cl (nth 2 sel-lst))   ; column
           (root (cdr (project-current)))
           (fp (concat root fn))  ; file path
           (ln-num nil)
           (cl-num nil)
           (did-find-file nil)
           )
      (when (and root
                 (file-exists-p fp))
        (save-selected-window
          (when (or (not helm-file-preview-only-when-line-numbers)
                    (and helm-file-preview-only-when-line-numbers
                         ln))
            (select-window helm-file-preview--prev-window)

            (when helm-file-preview-preview-only
              (setq helm-file-preview--current-select-fn fn)
              (unless (get-buffer fn)
                (push fn helm-file-preview--file-list)))

            (find-file fp)
            (setq did-find-file t))

          (when did-find-file
            (when ln
              (setq ln-num (string-to-number ln))
              (when (< 0 ln-num)
                (goto-char (point-min))
                (forward-line (1- ln-num))
                (when cl
                  (setq cl-num (string-to-number cl))
                  (when (< 0 cl-num)
                    (move-to-column (1- cl-num))))))))))))


(defun helm-file-preview--helm-before-initialize-hook ()
  "Record all necessary info for `helm-file-preview' package to work."
  (setq helm-file-preview--prev-window (selected-window))
  (setq helm-file-preview--file-list '())
  (setq helm-file-preview--current-select-fn ""))

(defun helm-file-preview--helm-exit-minibuffer-hook ()
  "Cleanup and kill preview files."
  (when helm-file-preview-preview-only
    (dolist (fn helm-file-preview--file-list)
      (unless (string= helm-file-preview--current-select-fn fn)
        (kill-buffer fn)))))

(defun helm-file-preview--enable ()
  "Enable `helm-file-preview'."
  (add-hook 'helm-before-initialize-hook #'helm-file-preview--helm-before-initialize-hook)
  (add-hook 'helm-exit-minibuffer-hook #'helm-file-preview--helm-exit-minibuffer-hook)
  (advice-add 'helm-mark-current-line :after 'helm-file-preview--helm-move-selection-after-hook))

(defun helm-file-preview--disable ()
  "Disable `helm-file-preview'."
  (remove-hook 'helm-before-initialize-hook #'helm-file-preview--helm-before-initialize-hook)
  (remove-hook 'helm-exit-minibuffer-hook #'helm-file-preview--helm-exit-minibuffer-hook)
  (advice-remove 'helm-mark-current-line 'helm-file-preview--helm-move-selection-after-hook))

;;;###autoload
(define-minor-mode helm-file-preview-mode
  "Minor mode 'helm-file-preview-mode'."
  :lighter " HelmFilePrev"
  :group helm-file-preview
  (if helm-file-preview-mode
      (helm-file-preview--enable)
    (helm-file-preview--disable)))


(provide 'helm-file-preview)
;;; helm-file-preview.el ends here
