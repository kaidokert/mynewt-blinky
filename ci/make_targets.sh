newt target create stm32f4disc_boot
newt target set stm32f4disc_boot app=@apache-mynewt-core/apps/boot
newt target set stm32f4disc_boot bsp=@apache-mynewt-core/hw/bsp/stm32f4discovery
newt target set stm32f4disc_boot build_profile=optimized

newt target create stm32f4disc_blinky
newt target set stm32f4disc_blinky app=apps/blinky
newt target set stm32f4disc_blinky bsp=@apache-mynewt-core/hw/bsp/stm32f4discovery
newt target set stm32f4disc_blinky build_profile=debug

newt target create nrf52_boot
newt target set nrf52_boot app=@apache-mynewt-core/apps/boot
newt target set nrf52_boot bsp=@apache-mynewt-core/hw/bsp/nrf52dk
newt target set nrf52_boot build_profile=optimized

newt target create nrf52_blinky
newt target set nrf52_blinky app=apps/blinky
newt target set nrf52_blinky bsp=@apache-mynewt-core/hw/bsp/nrf52dk
newt target set nrf52_blinky build_profile=debug
