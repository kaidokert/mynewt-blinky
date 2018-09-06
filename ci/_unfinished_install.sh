#!/usr/bin/env bash
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


# set defaults
TC_HOME=${TC_HOME:-"/tmp/tc"}
TC_PLATFORM=${TC_PLATFORM:-"linux"}
ARMGCC_VERSION=${ARMGCC_VERSION:-"7.3.1"}

mkdir -p ${TC_HOME}
VERSIONS=("4.9.3" "5.4.1" "6.3.1" "7.3.1")

get_versions() {
case $ARMGCC_VERSION in
  "4.9.3")
       GCC_linux=https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2
         GCC_mac=https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-mac.tar.bz2
       GCC_win32=https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/gcc-arm-none-eabi-4_9-2015q3-20150921-win32.zip
       GCC_BASE=gcc-arm-none-eabi-4_9-2015q3
       GCC_FILE=gcc-arm-none-eabi-4_9-2015q3-20150921
       ;;
  "5.4.1")
       GCC_linux=https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_4-2016q3/gcc-arm-none-eabi-5_4-2016q3-20160926-linux.tar.bz2
         GCC_mac=https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_4-2016q3/gcc-arm-none-eabi-5_4-2016q3-20160926-mac.tar.bz2
       GCC_win32=https://developer.arm.com/-/media/Files/downloads/gnu-rm/5_4-2016q3/gcc-arm-none-eabi-5_4-2016q3-20160926-win32.zip
       GCC_BASE=gcc-arm-none-eabi-5_4-2016q3
       GCC_FILE=gcc-arm-none-eabi-5_4-2016q3-20160926
       ;;
  "6.3.1")
       GCC_linux=https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2
         GCC_mac=https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-mac.tar.bz2
       GCC_win32=https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-win32.zip
       GCC_BASE=gcc-arm-none-eabi-6-2017-q2-update
       GCC_FILE=gcc-arm-none-eabi-6-2017-q2-update
       ;;
  "7.3.1")
       GCC_linux=https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2
         GCC_mac=https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-mac.tar.bz2
       GCC_win32=https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-win32.zip
       GCC_BASE=gcc-arm-none-eabi-7-2018-q2-update
       GCC_FILE=gcc-arm-none-eabi-7-2018-q2-update
       ;;
  *) return
     ;;
esac
}

download_one() {
  echo "dl_one:" $ARMGCC_VERSION
  get_versions
  echo "platform: " ${TC_PLATFORM}
  eval DL_URL="\$GCC_${TC_PLATFORM}"
  echo $DL_URL
  if [ ! -s ${TC_HOME}/$GCC_BASE/bin/arm-none-eabi-gcc ]; then
    wget -v -v -N -P ${TC_HOME} $DL_URL
    LOCAL_FILE=${TC_HOME}/${GCC_FILE}-${TC_PLATFORM}.tar.bz2
    echo "LOCAL FILE: " ${LOCAL_FILE}
    if [ -f ${LOCAL_FILE} ]; then
       echo tar xfj ${LOCAL_FILE} -C $TC_HOME
       tar xfj ${LOCAL_FILE} -C $TC_HOME
    else
       unzip -l ${TC_HOME}/${GCC_FILE}-${TC_PLATFORM}.zip
    fi
    echo ${TC_HOME}/$GCC_BASE/bin/arm-none-eabi-gcc --version
    ${TC_HOME}/$GCC_BASE/bin/arm-none-eabi-gcc --version
  fi
}

download_all() {
  for ARMGCC_VERSION in ${VERSIONS[@]} ; do
    download_one
  done
}

linux_default_download() {
  download_one

  for i in ${TC_HOME}/${GCC_BASE}/bin/arm-none-eabi-* ; do
      rm -f  ~/bin/${i##*/}
      ln -vs $i ~/bin/${i##*/}
  done
}
