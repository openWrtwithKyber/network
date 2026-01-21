#!/bin/bash

# ==========================================
# OpenWrt Hostapd Custom Build Script
# ==========================================
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
echo "✅ WSL Environment: Windows PATH removed."

CORES=$(nproc)
echo "🚀 Detected CPU Cores: $CORES"

# ./build_hostapd.sh full
if [ "$1" == "full" ]; then
    echo "----------------------------------------------------"
    echo "📦 Starting FULL BUILD to fix dependencies..."
    echo "   (This may take time, but ensures ubus.h exists)"
    echo "----------------------------------------------------"
    
    make dirclean
    
    make download
    
    make -j$CORES

    
    if [ $? -ne 0 ]; then
        echo "❌ Full build failed! Aborting."
        exit 1
    fi
    echo "✅ Full build completed successfully."
else
    echo "⏩ Skipping full build. (Run './build.sh full' if dependencies are missing)"
fi

echo "----------------------------------------------------"
echo "🔧 Building package: hostapd (Clean & Compile)"
echo "----------------------------------------------------"

make package/network/services/hostapd/clean

make package/network/services/hostapd/compile V=s

if [ $? -eq 0 ]; then
    echo "----------------------------------------------------"
    echo "🎉 SUCCESS: Hostapd build finished!"
    echo "----------------------------------------------------"
else
    echo "----------------------------------------------------"
    echo "🔥 FAILURE: Hostapd build failed. Check logs above."
    echo "----------------------------------------------------"
    exit 1
fi

