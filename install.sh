#!/bin/bash

# 1. 경로 설정 및 디렉토리 생성
INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$INSTALL_DIR"
export PATH="$INSTALL_DIR:$PATH"

# 2. Aftman 설치 (Wally를 관리하기 위한 도구)
if ! command -v aftman &> /dev/null; then
    echo "Aftman이 없습니다. 설치를 시작합니다..."
    
    # 최신 리눅스용 Aftman 다운로드
    curl -L https://github.com -o aftman.zip
    unzip -q aftman.zip -d "$INSTALL_DIR"
    chmod +x "$INSTALL_DIR/aftman"
    rm aftman.zip
    
    # Aftman 초기화 (PATH 자동 등록 등)
    "$INSTALL_DIR/aftman" self-install
fi

# 3. Aftman을 사용하여 Wally 설치
echo "Wally CLI 설치 중..."
# 전역 설정 파일에 Wally 추가 및 설치
aftman add --global UpliftGames/wally
aftman install

# 4. 쉘 재시작 시에도 PATH가 유지되도록 .bashrc에 추가
if ! grep -q ".local/bin" "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
    echo 'export PATH="$HOME/.aftman/bin:$PATH"' >> "$HOME/.bashrc"
fi

echo "모든 설치가 완료되었습니다! 'wally --version'으로 확인하세요."
