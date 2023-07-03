(asdf:defsystem cl-spidev
  :version "1.1.0"
  :license "zlib"
  :author "Yukari Hafner <shinmera@tymoon.eu>"
  :maintainer "Yukari Hafner <shinmera@tymoon.eu>"
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
