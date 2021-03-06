(setq debug-on-error t)

(require 'ert)

(load "conversions.el")
(load "uninterrupt.el")
(load "parsing.el")

(defvar jdibug-smoke-failure-count)
(defun jdibug-smoke-done-running (pass fail)
  (setq jdibug-smoke-failure-count (+ jdibug-smoke-failure-count fail)))


;; (let ((jdibug-smoke-failure-count 0))
;;   (if (and (> jdibug-smoke-failure-count 0)
;;            (if (featurep 'xemacs)
;;                (noninteractive)
;;              noninteractive))
;;       ;; Running in batch mode and we had failures.  Exit with an error
;;       (progn
;;         (message "%s" (save-excursion
;;                         (set-buffer "*elunit report*")
;;                         (buffer-string)))
;;         ;; It seems that the exit code here is ignored.  So the build
;;         ;; will succeed even when thre are errors.
;;         (kill-emacs jdibug-smoke-failure-count))))




