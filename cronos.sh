#!/bin/bash
#
# Cronos Build Script
# For Exynos7885
# Coded by BlackMesa/AnanJaser1211/Prashantp01 @2018
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software

# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Directory Contol
CR_DIR=$(pwd)
CR_TC=/home/prashantp/Downloads/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
CR_DTS=arch/arm64/boot/dts
CR_DTB=$CR_DIR/boot.img-dtb
# Kernel Variables
CR_VERSION=V1.0
CR_NAME=Quantum_Quack
CR_JOBS=5
CR_ANDROID=q
CR_PLATFORM=10
CR_ARCH=arm64
CR_DATE=$(date +%Y%m%d)
# Init build
export CROSS_COMPILE=$CR_TC
export ANDROID_MAJOR_VERSION=$CR_ANDROID
export PLATFORM_VERSION=$CR_PLATFORM
export $CR_ARCH
##########################################
# Device specific Variables [SM-A750f]
CR_CONFG_A750F=exynos7885-a7y18lte_defconfig
CR_VARIANT_A750F=A750F
##########################################

# Script functions
CLEAN_SOURCE()
{
echo "----------------------------------------------"
echo " "
echo "Cleaning"	
make clean
make mrproper
# rm -r -f $CR_OUT/*
rm -r -f $CR_DTB
rm -rf $CR_DTS/.*.tmp
rm -rf $CR_DTS/.*.cmd
rm -rf $CR_DTS/*.dtb 
echo " "
echo "----------------------------------------------"	
}
BUILD_ZIMAGE()
{
	echo "----------------------------------------------"
	echo " "
	echo "Building zImage for $CR_VARIANT"	
	export LOCALVERSION=-$CR_NAME-$CR_VERSION-$CR_VARIANT
	make  $CR_CONFG
	make -j$CR_JOBS
	echo " "
	echo "----------------------------------------------"	
}

# Main Menu
clear
echo "----------------------------------------------"
echo "$CR_NAME $CR_VERSION Build Script"
echo "----------------------------------------------"
PS3='Please select your option : '
menuvar=("SM-A750F" "Exit")
select menuvar in "${menuvar[@]}"
do
    case $menuvar in
        "SM-A750F")
            clear
            CLEAN_SOURCE
            echo "Starting $CR_VARIANT_A750F kernel build..."
	    CR_VARIANT=$CR_VARIANT_A750F
	    CR_CONFG=$CR_CONFG_A750F
	    BUILD_ZIMAGE
            echo " "
            echo "----------------------------------------------"
            echo "$CR_VARIANT kernel build finished."
	    echo "Press Any key to end the script"
            echo "----------------------------------------------"
            read -n1 -r key
            break
            ;;
        "Exit")
            break
            ;;
        *) echo Invalid option.;;
    esac
done

