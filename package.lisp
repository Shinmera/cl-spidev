#|
 This file is a part of cl-spidev
 (c) 2016 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:cl-user)
(defpackage #:cl-spidev-lli
  (:nicknames #:org.shirakumo.spidev.lli)
  (:use #:cl)
  ;; low-level.lisp
  (:export
   #:*spidev-root*
   #:spi-pha
   #:spi-cpol
   #:spi-mode-0
   #:spi-mode-1
   #:spi-mode-2
   #:spi-mode-3
   #:spi-cs-high
   #:spi-lsb-first
   #:spi-3wire
   #:spi-loop
   #:spi-no-cs
   #:spi-ready
   #:spi-tx-dual
   #:spi-tx-quad
   #:spi-rx-dual
   #:spi-rx-quad
   #:spi-ioc-rd-mode
   #:spi-ioc-wr-mode
   #:spi-ioc-rd-lsb-first
   #:spi-ioc-wr-lsb-first
   #:spi-ioc-rd-bits-per-word
   #:spi-ioc-wr-bits-per-word
   #:spi-ioc-rd-max-speed-hz
   #:spi-ioc-wr-max-speed-hz
   #:spi-ioc-rd-mode32
   #:spi-ioc-wr-mode32
   #:devices
   #:open-spi
   #:close-spi
   #:with-open-spi
   #:mode
   #:lsb-first
   #:bits/word
   #:max-speed
   #:write-bytes
   #:read-bytes))

(defpackage #:cl-spidev
  (:nicknames #:org.shirakumo.spidev #:spidev)
  (:use #:cl)
  (:shadow #:open #:close #:read #:write)
  (:import-from #:org.shirakumo.spidev.lli #:devices)
  ;; wrapper.lisp
  (:export
   #:devices
   #:handle
   #:open
   #:close
   #:mode
   #:lsb-first
   #:bits/word
   #:max-speed
   #:read
   #:read*
   #:write
   #:write*))
