#!/bin/bash

# ==========================================
# OpenWrt Hostapd Custom Build Script
# ==========================================

# 1. WSL 환경 변수 클린업 (윈도우 PATH 제거)
# 윈도우의 공백 포함 경로가 빌드 시스템(make)을 방해하는 것을 방지합니다.
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
echo "✅ WSL Environment: Windows PATH removed."

# 2. CPU 코어 수 자동 감지 (Ryzen 9 9950X3D 활용)
CORES=$(nproc)
echo "🚀 Detected CPU Cores: $CORES"

# 3. 전체 빌드 수행 여부 확인 (옵션 처리)
# 스크립트 실행 시 'full' 인자를 주면 전체 빌드를 먼저 수행합니다.
# 사용법: ./build.sh full
if [ "$1" == "full" ]; then
    echo "----------------------------------------------------"
    echo "📦 Starting FULL BUILD to fix dependencies..."
    echo "   (This may take time, but ensures ubus.h exists)"
    echo "----------------------------------------------------"
    
    make -j$CORES
    
    # 전체 빌드 실패 시 스크립트 중단
    if [ $? -ne 0 ]; then
        echo "❌ Full build failed! Aborting."
        exit 1
    fi
    echo "✅ Full build completed successfully."
else
    echo "⏩ Skipping full build. (Run './build.sh full' if dependencies are missing)"
fi

# 4. Hostapd 집중 빌드 (Fast Loop)
echo "----------------------------------------------------"
echo "🔧 Building package: hostapd (Clean & Compile)"
echo "----------------------------------------------------"

# 기존 빌드 잔여물 제거 (로컬 소스 반영을 위해 필수)
make package/network/services/hostapd/clean

# 상세 로그(V=s)와 함께 컴파일 수행
make package/network/services/hostapd/compile V=s

# 결과 확인
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
