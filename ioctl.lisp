#|
 This file is a part of cl-spidev
 (c) 2016 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.spidev.lli)

(cffi:defcfun (%ioctl "ioctl") :int
  (fd :int)
  (request :ulong)
  (data :pointer))

(cffi:defcvar "errno" :int)

(cffi:defcfun strerror :string
  (error :int))

(declaim (inline stream-fd))
(defun stream-fd (fd)
  #+sbcl (sb-sys:fd-stream-fd fd)
  #+ccl (ccl:stream-device fd :io)
  #-(or sbcl ccl) fd)

#-sbcl
(defun ioctl (fd cmd)
  (cffi:with-foreign-object (arg :int)
    (let ((ret (%ioctl (stream-fd fd) cmd arg)))
      (if (<= 0 ret)
          (cffi:mem-ref arg :int)
          (error "IOCTL ~a failed: ~a" cmd (strerror *errno*))))))

#-sbcl
(defun (setf ioctl) (value fd cmd)
  (cffi:with-foreign-object (arg :int)
    (setf (cffi:mem-ref arg :int) value)
    (let ((ret (%ioctl (stream-fd fd) cmd arg)))
      (if (<= 0 ret)
          value
          (error "IOCTL ~a failed: ~a" cmd (strerror *errno*))))))

#+sbcl
(defun ioctl (fd cmd)
  (sb-alien:with-alien ((result sb-alien:int))
    (multiple-value-bind (wonp error)
        (sb-unix:unix-ioctl (stream-fd fd)
                            (if (< cmd (expt 2 31)) cmd (- cmd (expt 2 32)))
                            (sb-alien:alien-sap (sb-alien:addr result)))
      (unless wonp
        (error "IOCTL ~a failed: ~a" cmd (sb-impl::strerror error))))
    result))

#+sbcl
(defun (setf ioctl) (arg fd cmd)
  (sb-alien:with-alien ((value sb-alien:int))
    (setf value arg)
    (multiple-value-bind (wonp error)
        (sb-unix:unix-ioctl (stream-fd fd)
                            (if (< cmd (expt 2 31)) cmd (- cmd (expt 2 32)))
                            (sb-alien:alien-sap (sb-alien:addr value)))
      (unless wonp
        (error "IOCTL ~a failed: ~a" cmd (sb-impl::strerror error))))
    arg))
