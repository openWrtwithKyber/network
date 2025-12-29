#!/bin/bash

# --- 설정 ---
OPENWRT_DIR="./openwrt"
PATCH_DIR="$OPENWRT_DIR/package/network/services/hostapd/patches"
CUSTOM_PATCH_NAME="999-my-custom-key-exchange.patch"

echo "[1] 기존 패치 제거 및 클린..."
rm -f "$PATCH_DIR/$CUSTOM_PATCH_NAME"
# 패치를 만들기 위해선 diff가 깨끗해야 하므로, 일단 수정 사항은 깃이 알고 있음.

echo "[2] 변경사항을 패치 파일로 추출..."
# hostapd 폴더의 변경사항만 추출하여 패치로 저장
# 주의: diff 경로는 openwrt 빌드 시스템이 인식하는 상대 경로와 맞춰야 할 수도 있음.
# OpenWrt 패치는 보통 소스 루트 기준이므로 -p 옵션 조정이 필요할 수 있음.
# 여기서는 가장 단순하게 '현재 수정된 내용'을 그대로 가져옴.

# (중요) git diff는 파일 경로까지 포함하므로, 패치 적용 시 경로 제거(-p1, -p2)가 맞아야 함.
# 여기서는 일단 깃의 diff를 저장.
git diff hostapd/ > "$PATCH_DIR/$CUSTOM_PATCH_NAME"

# 패치 파일 보정 (선택 사항: git diff 경로 a/hostapd/... 를 a/... 로 바꿔야 openwrt가 인식할 수도 있음)
# 하지만 보통 quilt나 patch 명령어가 알아서 처리하기도 함.
# 만약 경로 문제가 생기면 sed로 경로를 다듬어야 함.
sed -i 's|a/hostapd/|a/|g' "$PATCH_DIR/$CUSTOM_PATCH_NAME"
sed -i 's|b/hostapd/|b/|g' "$PATCH_DIR/$CUSTOM_PATCH_NAME"

if [ ! -s "$PATCH_DIR/$CUSTOM_PATCH_NAME" ]; then
    echo "⚠️  수정된 내용이 없습니다."
else
    echo "✅  패치 생성 완료."
fi

echo "[3] OpenWrt 빌드 (Hostapd)..."
make -C "$OPENWRT_DIR" package/network/services/hostapd/compile V=s
