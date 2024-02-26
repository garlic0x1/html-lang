(defpackage :html-lang
  (:use :cl)
  (:import-from :alexandria :if-let))
(in-package :html-lang)

;; some renamed runtime funcs
(defun dec (x) (1- x))
(defun times (a b) (* a b))

(defun normalize-string (string)
  (read-from-string (format nil "(~a)" string)))

(defun normalize-node (node)
  (let ((new '()))
    (dolist (c (xmls:node-children node))
      (if (stringp c)
          (dolist (c (normalize-string c))
            (setf new (append new (list c))))
          (setf new (append new (list c)))))
    (setf (xmls:node-children node) new)
    node))

(defmethod eval-html* (obj)
  obj)

(defmethod eval-html* ((obj xmls:node))
  (normalize-node obj)
  (if-let ((car (read-from-string (xmls:node-name obj))))
    (cons car (mapcar #'eval-html* (xmls:node-children obj)))
    (mapcar #'eval-html* (xmls:node-children obj))))

(defun eval-html (string)
  (let ((node (xmls:parse string)))
    (eval (eval-html* node))))

(defun eval-html-file (filename)
  (eval-html (format nil "<progn> ~a </progn>" (uiop:read-file-string filename))))
