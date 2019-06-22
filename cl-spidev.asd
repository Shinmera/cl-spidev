#|
 This file is a part of cl-spidev
 (c) 2016 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(asdf:defsystem cl-spidev
  :version "1.1.0"
  :license "zlib"
  :author "Nicolas Hafner <shinmera@tymoon.eu>"
  :maintainer "Nicolas Hafner <shinmera@tymoon.eu>"
  :description "A library for the Linux SPIDEV kernel module as used on hobby kits such as the Raspberry Pi"
  :homepage "https://Shinmera.github.io/cl-spidev/"
  :bug-tracker "https://github.com/Shinmera/cl-spidev/issues"
  :source-control (:git "https://github.com/Shinmera/cl-spidev.git")
  :serial T
  :components ((:file "package")
               (:file "ioctl")
               (:file "constants")
               (:file "low-level")
               (:file "wrapper")
               (:file "documentation"))
  :depends-on (:documentation-utils
               :trivial-garbage
               :cffi))
