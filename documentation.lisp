(in-package #:org.shirakumo.spidev.lli)

;; constants.lisp
(docs:define-docs
  (type xfer
    "Struct holding data for a transmission over the SPI.

See XFER-TX-BUF
See XFER-RX-BUF
See XFER-LEN
See XFER-SPEED-HZ
See XFER-DELAY-USECS
See XFER-BITS/WORD
See XFER-CS-CHANGE
See XFER-TX-NBITS
See XFER-RX-NBITS
See XFER-PAD")
  
  (function xfer-tx-buf
    "Holds pointer to userspace buffer with transmit data, or null.

See XFER")
  
  (function xfer-rx-buf
    "Holds pointer to userspace buffer for receive data, or null.

See XFER")
  
  (function xfer-len
    "Length of tx and rx buffers, in bytes.

See XFER")
  
  (function xfer-speed-hz
    "Temporary override of the device's bitrate.

See XFER")
  
  (function xfer-delay-usecs
    "If nonzero, how long to delay after the last bit transfer before optionally deselecting the device before the next transfer.

See XFER")
  
  (function xfer-bits/word
    "Temporary override of the device's wordsize.

See XFER")
  
  (function xfer-cs-change
    "True to deselect device before starting the next transfer.

See XFER")
  
  (function xfer-tx-nbits
    "Unknown purpose, has to be set to zero.

See XFER")
  
  (function xfer-rx-nbits
    "Unknown purpose, has to be set to zero.

See XFER")
  
  (function xfer-pad
    "Unknown purpose, has to be set to zero.

See XFER")
  
  (variable spi-cpha
    "Constant holding the value defined in the kernel constant SPI_CPHA.")
  
  (variable spi-cpol
    "Constant holding the value defined in the kernel constant SPI_CPOL.")
  
  (variable spi-mode-0
    "Constant holding the value defined in the kernel constant SPI_MODE_0.")
  
  (variable spi-mode-1
    "Constant holding the value defined in the kernel constant SPI_MODE_1.")
  
  (variable spi-mode-2
    "Constant holding the value defined in the kernel constant SPI_MODE_2.")
  
  (variable spi-mode-3
    "Constant holding the value defined in the kernel constant SPI_MODE_3.")
  
  (variable spi-cs-high
    "Constant holding the value defined in the kernel constant SPI_CS_HIGH.")
  
  (variable spi-lsb-first
    "Constant holding the value defined in the kernel constant SPI_LSB_FIRST.")
  
  (variable spi-3wire
    "Constant holding the value defined in the kernel constant SPI_3WIRE.")
  
  (variable spi-loop
    "Constant holding the value defined in the kernel constant SPI_LOOP.")
  
  (variable spi-no-cs
    "Constant holding the value defined in the kernel constant SPI_NO_CS.")
  
  (variable spi-ready
    "Constant holding the value defined in the kernel constant SPI_READY.")
  
  (variable spi-tx-dual
    "Constant holding the value defined in the kernel constant SPI_TX_DUAL.")
  
  (variable spi-tx-quad
    "Constant holding the value defined in the kernel constant SPI_TX_QUAD.")
  
  (variable spi-rx-dual
    "Constant holding the value defined in the kernel constant SPI_RX_DUAL.")
  
  (variable spi-rx-quad
    "Constant holding the value defined in the kernel constant SPI_RX_QUAD.")

  (variable spi-ioc-message-1
    "Constant holding the value defined in the kernel constant SPI_IOC_MESSAGE(1).")
  
  (variable spi-ioc-rd-mode
    "Constant holding the value defined in the kernel constant SPI_IOC_RD_MODE.")
  
  (variable spi-ioc-wr-mode
    "Constant holding the value defined in the kernel constant SPI_IOC_WR_MODE.")
  
  (variable spi-ioc-rd-lsb-first
    "Constant holding the value defined in the kernel constant SPI_IOC_RD_LSB_FIRST.")
  
  (variable spi-ioc-wr-lsb-first
    "Constant holding the value defined in the kernel constant SPI_IOC_WR_LSB_FIRST.")
  
  (variable spi-ioc-rd-bits-per-word
    "Constant holding the value defined in the kernel constant SPI_IOC_RD_BITS_PER_WORD.")
  
  (variable spi-ioc-wr-bits-per-word
    "Constant holding the value defined in the kernel constant SPI_IOC_WR_BITS_PER_WORD.")
  
  (variable spi-ioc-rd-max-speed-hz
    "Constant holding the value defined in the kernel constant SPI_IOC_RD_MAX_SPEED_HZ.")
  
  (variable spi-ioc-wr-max-speed-hz
    "Constant holding the value defined in the kernel constant SPI_IOC_WR_MAX_SPEED_HZ.")
  
  (variable spi-ioc-rd-mode32
    "Constant holding the value defined in the kernel constant SPI_IOC_RD_MODE32.")
  
  (variable spi-ioc-wr-mode32
    "Constant holding the value defined in the kernel constant SPI_IOC_WR_MODE32."))

;; ioctl.lisp
(docs:define-docs
  (function ioctl
    "Accessor to perform an IOCTL command, which can either get or set an int value.

Use SETF to set a value.
Signals an error if the command failed.

This is available on the following implementations:
 * SBCL
 * CCL"))

;; low-level.lisp
(docs:define-docs
  (variable *spidev-root*
    "The root path for SPIDEV devices.
Should be /dev/")

  (function file-name
    "Returns the full file name of the path.")

  (function spidev-file
    "Return an absolute path to the requested SPIDEV device.

See *SPIDEV-ROOT*")

  (function devices
    "Return a list of available SPIDEV devices on the system.")

  (function open-spi
    "Open a handle to a SPIDEV device.

See WITH-OPEN-SPI")

  (function close-spi
    "Close a handle to a SPIDEV device.

See WITH-OPEN-SPI")

  (function with-open-spi
    "Convenience wrapper to lexically retain a handle to a SPIDEV device.

See OPEN-SPI
See CLOSE-SPI")

  (function mode
    "Accessor to the mode in which the SPIDEV device operates.

The value should be one of :MODE-0 :MODE-1 :MODE-2 :MODE-3 or
a specific mode integer.

See IOCTL
See SPI-IOC-WR-MODE32
See SPI-IOC-RD-MODE32
See SPI-MODE-0
See SPI-MODE-1
See SPI-MODE-2
See SPI-MODE-3")

  (function lsb-first
    "Accessor to whether the least significant byte comes first on the SPIDEV device.

The value should be T or NIL.

See IOCTL
See SPI-IOC-RD-LSB-FIRST
See SPI-IOC-WR-LSB-FIRST")

  (function bits/word
    "Accessor to how many bits there are per word on the SPIDEV device.

The value should be a positive integer, where 0 defaults to 8.

See IOCTL
See SPI-IOC-RD-BITS-PER-WORD
See SPI-IOC-WR-BITS-PER-WORD")

  (function max-speed
    "Accessor to the maximum speed frequency of the SPIDEV device in Hertz.

The value should be a positive integer. If it is too large and
the device refuses to adjust to it, a warning is signalled.

The actual rate in Hertz is returned.

See IOCTL
See SPI-IOC-RD-MAX-SPEED-HZ
See SPI-IOC-WR-MAX-SPEED-HZ")

  (function write-bytes
    "Writes the byte sequence to the SPIDEV device handle.

See LSB-FIRST
See BITS/WORD")

  (function read-bytes
    "Reads a byte sequence from the SPIDEV device handle.

See LSB-FIRST
See BITS/WORD")

  (function transmit
    "Perform a SPI transmission of the given byte sequence.

The array must be an unsigned-byte 8 array that is sharable.
On most implementations that matter this will correspond to
any simple-vector with element-type unsigned-byte 8.

The speed-hz, delay-usecs, and bits/word parameters are temp
overrides for the device configuration during the transmission.

Returned is a fresh vector of the same length as the bytes
vector, containing the contents of the read buffer of the
transmission.

See CFFI:MAKE-SHAREABLE-BYTE-VECTOR"))

(in-package #:org.shirakumo.spidev)

;; wrapper.lisp
(docs:define-docs
  (type handle
    "Struct to wrap a handle to a SPIDEV device and all of its associated information.

See OPEN
See CLOSE
See HANDLE
See MODE
See LSB-FIRST
See BITS/WORD
See MAX-SPEED
See READ
See READ*
See WRITE
See WRITE*")

  (function handle
    "Returns the underlying stream handle of the handle object.

This is useful when you need to interact with the low-level
system directly for some reason.

See HANDLE")

  (function open
    "Open a handle to a SPIDEV device.

This will produce a safe object that will always ensure the
underlying file-system handle is closed when the object is
no longer referenced. It will also cache the properties of
the underlying device, so read access to them should be fast.

See HANDLE")

  (function close
    "Safely closes the SPIDEV device. It becomes unusable after this.

See HANDLE")

  (function mode
    "Accessor to the SPIDEV device's transfer mode.

The value should be one of :MODE-0 :MODE-1 :MODE-2 :MODE-3

See HANDLE")

  (function lsb-first
    "Accessor to whether the least significant byte comes first.

Should be a boolean.

See HANDLE")

  (function bits/word
    "Accessor to how many bits there are in a word on the device.

Should be an (UNSIGNED-BYTE 8) value.

See HANDLE")

  (function max-speed
    "Accessor to the maximum transfer speed of the SPIDEV device in Hertz.

Should be an (UNSIGNED-BYTE 32) value.
The device may reject your requested speed, in which case a
warning is signalled and the actual speed is returned.

See HANDLE")

  (function read
    "Read a sequence of words from the SPIDEV device.

The bytes vector should be able to contain unsigned-bytes of
size up to the number of BITS/WORD of the handle.

See HANDLE
See READ*")

  (function read*
    "Read n words from the SPIDEV device into a fresh array.

See READ")

  (function write
    "Write a sequence of words to the SPIDEV device.

The bytes vector should contain unsigned-bytes of size up to
the number of BITS/WORD of the handle.

The bytes written are automatically flushed to the spi device
handle, so that when WRITE returns, the operation should have
completed. If you need to manually control flushing or need
to write in much smaller intervals, please refer to the low-
level interface.

See HANDLE
See WRITE*")

  (function write*
    "Writes the bytes in the arguments list to the SPIDEV device.

See WRITE")

  (function transmit
    "Perform a SPI transmission of the given byte sequence.

The array must be an unsigned-byte 8 array.

The speed-hz, delay-usecs, and bits/word parameters are temp
overrides for the device configuration during the transmission.
They default to MAX-SPEED, 0, and BITS/WORD respectively.

Returned is a fresh vector of the same length as the bytes
vector, containing the contents of the read buffer of the
transmission.

See HANDLE
See MAX-SPEED
See BITS/WORD"))
