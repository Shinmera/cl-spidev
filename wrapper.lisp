#|
 This file is a part of cl-spidev
 (c) 2016 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.spidev)

(defstruct (handle
            (:copier)
            (:predicate))
  (stream (make-broadcast-stream) :type stream :read-only T)
  (mode :unknown :type keyword)
  (lsb-first NIL :type boolean)
  (bits/word 0 :type (unsigned-byte 8))
  (max-speed 0 :type (unsigned-byte 32)))

(defun open (id)
  (let ((stream (cl-spidev-lli:open-spi id))
        (handle NIL))
    (unwind-protect
         (progn
           (setf handle (make-handle :stream stream
                                     :mode (cl-spidev-lli:mode stream)
                                     :lsb-first (cl-spidev-lli:lsb-first stream)
                                     :bits/word (cl-spidev-lli:bits/word stream)
                                     :max-speed (cl-spidev-lli:max-speed stream)))
           (tg:finalize handle (lambda ()
                                 (cl-spidev-lli:close-spi stream))))
      (unless handle
        (cl-spidev-lli:close-spi stream)))
    handle))

(defun close (handle)
  (tg:cancel-finalization handle)
  (cl-spidev-lli:close-spi (handle-stream handle)))

(setf (fdefinition 'mode) (fdefinition 'handle-mode))
(setf (fdefinition 'lsb-first) (fdefinition 'handle-lsb-first))
(setf (fdefinition 'bits/word) (fdefinition 'handle-bits/word))
(setf (fdefinition 'max-speed) (fdefinition 'handle-max-speed))

(defun (setf mode) (value handle)
  (ecase value (:mode-0) (:mode-1) (:mode-2) (:mode-3))
  (setf (cl-spidev-lli:mode (handle-stream handle)) value)
  (setf (handle-mode handle) value))

(defun (setf lsb-first) (value handle)
  (setf (cl-spidev-lli:lsb-first (handle-stream handle)) value)
  (setf (handle-lsb-first handle) value))

(defun (setf bits/word) (value handle)
  (check-type value (unsigned-byte 8))
  (setf (cl-spidev-lli:bits/word (handle-stream handle)) value)
  (setf (handle-bits/word handle) value))

(defun (setf max-speed) (value handle)
  (check-type value (unsigned-byte 32))
  (let ((value (setf (cl-spidev-lli:max-speed (handle-stream handle)) value)))
    (setf (handle-max-speed handle) value)))

(defun read (bytes handle &key (start 0) end)
  (cl-spidev-lli:read-bytes bytes (handle-stream handle) :start start :end end))

(defun read* (n handle)
  (let ((array (make-array n :element-type `(unsigned-byte ,(handle-bits/word handle)))))
    (read array handle)
    array))

(defun write (bytes handle &key (start 0) end)
  (cl-spidev-lli:write-bytes bytes (handle-stream handle) :start start :end end)
  (finish-output (handle-stream handle)))

(defun write* (handle &rest bytes)
  (write bytes handle))

(defun transmit (handle bytes &key speed delay bits/word)
  (let ((bytes #+(or sbcl ccl) bytes
               #-(or sbcl ccl) (replace (cffi:make-shareable-byte-vector (length bytes)) bytes)))
    (cl-spidev-lli:transmit
     (handle-stream handle)
     bytes
     (or speed (handle-max-speed handle))
     (* 1000000 (or delay 0))
     (or bits/word (handle-bits/word handle)))))
