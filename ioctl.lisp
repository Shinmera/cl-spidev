#|
 This file is a part of cl-spidev
 (c) 2016 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.spidev.lli)

#+sbcl
(defun ioctl (fd cmd)
  (sb-alien:with-alien ((result sb-alien:int))
    (multiple-value-bind (wonp error)
        (sb-unix:unix-ioctl fd cmd (sb-alien:alien-sap (sb-alien:addr result)))
      (unless wonp
        (error "IOCTL ~a failed: ~a" cmd (sb-impl::strerror error))))
    (sb-alien:deref result)))

#+sbcl
(defun (setf ioctl) (arg fd cmd)
  (sb-alien:with-alien ((value sb-alien:int))
    (setf (sb-alien:deref value) arg)
    (multiple-value-bind (wonp error)
        (sb-unix:unix-ioctl (sb-sys:fd-stream-fd fd) cmd (sb-alien:alien-sap (sb-alien:addr value)))
      (unless wonp
        (error "IOCTL ~a failed: ~a" cmd (sb-impl::strerror error))))
    arg))

#+ccl
(defun ioctl (fd cmd)
  (ccl:rletz ((result :int))
    (let ((ret (ccl:external-call "ioctl" :int (ccl:stream-device fd :io)
                                          :unsigned-long cmd
                                          (:* :int) cmd
                                          :int)))
      (if (<= 0 ret)
          (ccl:pref result :int)
          (error "IOCTL ~a failed: ~a" cmd ret)))))

#+ccl
(defun (setf ioctl) (arg fd cmd)
  (ccl:rletz ((value :int))
    (setf (ccl:pref value :int) arg)
    (let ((ret (ccl:external-call "ioctl" :int (ccl:stream-device fd :io)
                                          :unsigned-long cmd
                                          (:* :int) cmd
                                          :int)))
      (if (<= 0 ret)
          arg
          (error "IOCTL ~a failed: ~a" cmd ret)))))
