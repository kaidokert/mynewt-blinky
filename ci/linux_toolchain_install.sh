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

TC_HOME=$HOME/TC

case $ARMGCC_VERSION in
  "6.2.1")
       GCC_URL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2016q4/gcc-arm-none-eabi-6_2-2016q4-20161216-linux.tar.bz2
       GCC_BASE=gcc-arm-none-eabi-6_2-2016q4
     ;;
  "6.3.1")
       GCC_URL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2
       GCC_BASE=gcc-arm-none-eabi-6-2017-q2-update
     ;;
  "7.2.1")
       GCC_URL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2
       GCC_BASE=gcc-arm-none-eabi-7-2017-q4-major
     ;;
  *)  exit 1
     ;;
esac

mkdir -p $TC_HOME

if [ ! -s ${TC_HOME}/$GCC_BASE/bin/arm-none-eabi-gcc ]; then
  wget -O ${TC_HOME}/${GCC_BASE}.tar.bz2 $GCC_URL
  tar xfj ${TC_HOME}/${GCC_BASE}.tar.bz2 -C $TC_HOME
  ${TC_HOME}/$GCC_BASE/bin/arm-none-eabi-gcc --version
fi

for i in ${TC_HOME}/${GCC_BASE}/bin/arm-none-eabi-* ; do
    rm -f  ~/bin/${i##*/}
    ln -s $i ~/bin/${i##*/}
done
