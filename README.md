## About cl-spidev
This is a bindings library for the Linux SPIDEV kernel module as described on <https://www.kernel.org/doc/Documentation/spi/spidev>. It provides both direct low-level, and high-level convenient access.

## How To
List all the available SPIDEV devices.

```
(spidev:devices)
```

Create a handle object to one of them.

```
(defvar *handle* (spidev:open "0.0"))
```

You can then read out the current information of the device.

```
(spidev:mode *handle*)
(spidev:lsb-first *handle*)
(spidev:bits/word *handle*)
(spidev:max-speed *handle*)
```

You can also set the above places to the values you need them to be. See the respective docstrings.

Finally you can read from and write to the device.

```
(spidev:read* 12 *handle*)
(spidev:write* *handle* 1 2 3 4)
```

Once you are done you can either close the handle explicitly...

```
(spidev:close *handle*)
```

Or simply lose all references to it and wait for the GC to take care of it for you. Either way, it should be safe.
