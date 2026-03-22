# 1. Rokit 설치 (Rojo 공식 설치 스크립트)
curl -sSf https://raw.githubusercontent.com | bash

# 2. 즉시 경로 적용 (현재 설치 세션용)
export PATH="$HOME/.rokit/bin:$PATH"

# 3. Rokit 초기화 및 도구 추가 (별칭 사용)
rokit self-install
rokit add wally argon

# 4. 실제 바이너리 다운로드
rokit install

# 5. .bashrc에 Rokit 경로 자동 추가 (중복 방지)
if ! grep -q ".rokit/bin" "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/.rokit/bin:$PATH"' >> "$HOME/.bashrc"
fi

echo "Rokit, Wally, Argon 설치 완료!"
