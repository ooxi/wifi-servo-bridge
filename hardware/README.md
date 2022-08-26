# Hardware Errata


## [WifiServoBridge/2021-09-15](WifiServoBridge/2021-09-15)

* `BOOT`-LED is connected to `GPIO6`, which internally is connected to the
  integrated SPI flash, thus unusable for status communication
* Current firmware thus uses `GPIO26` for status communication, which is not
  connected to an LED without a mod

