(in-package #:org.shirakumo.spidev.lli)

(cffi:defcstruct (xfer :class xfer :conc-name xfer-)
  (tx-buf :uint64)
  (rx-buf :uint64)
  (len :uint32)
  (speed-hz :uint32)
  (delay-usecs :uint16)
  (bits/word :uint8)
  (cs-change :uint8)
  (tx-nbits :uint8)
  (rx-nbits :uint8)
  (pad :uint16))

;; Read out using constants.c
(defconstant SPI-CPHA                 #x1)
(defconstant SPI-CPOL                 #x2)
(defconstant SPI-MODE-0               #x0)
(defconstant SPI-MODE-1               #x1)
(defconstant SPI-MODE-2               #x2)
(defconstant SPI-MODE-3               #x3)
(defconstant SPI-CS-HIGH              #x4)
(defconstant SPI-LSB-FIRST            #x8)
(defconstant SPI-3WIRE                #x10)
(defconstant SPI-LOOP                 #x20)
(defconstant SPI-NO-CS                #x40)
(defconstant SPI-READY                #x80)
(defconstant SPI-TX-DUAL              #x100)
(defconstant SPI-TX-QUAD              #x200)
(defconstant SPI-RX-DUAL              #x400)
(defconstant SPI-RX-QUAD              #x800)
(defconstant SPI-IOC-MESSAGE-1        #x40206B00)
(defconstant SPI-IOC-RD-MODE          #x80016B01)
(defconstant SPI-IOC-WR-MODE          #x40016B01)
(defconstant SPI-IOC-RD-LSB-FIRST     #x80016B02)
(defconstant SPI-IOC-WR-LSB-FIRST     #x40016B02)
(defconstant SPI-IOC-RD-BITS-PER-WORD #x80016B03)
(defconstant SPI-IOC-WR-BITS-PER-WORD #x40016B03)
(defconstant SPI-IOC-RD-MAX-SPEED-HZ  #x80046B04)
(defconstant SPI-IOC-WR-MAX-SPEED-HZ  #x40046B04)
(defconstant SPI-IOC-RD-MODE32        #x80046B05)
(defconstant SPI-IOC-WR-MODE32        #x40046B05)
