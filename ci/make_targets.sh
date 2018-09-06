#!/bin/sh -x
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

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
