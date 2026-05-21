#!/usr/bin/env bash
# QEF Proposal Assistant - Install / Update Script
# Usage:
#   Install/Update:  curl -sL https://raw.githubusercontent.com/ytisvibecoding/qef-proposal-assistant/main/install.sh | bash
#   Force reinstall:  curl -sL https://raw.githubusercontent.com/ytisvibecoding/qef-proposal-assistant/main/install.sh | bash -s -- --force
#   Or:              bash install.sh [--force]

set -e

FORCE=false
for arg in "$@"; do
  case "$arg" in
    --force|-f) FORCE=true ;;
  esac
done

REPO="https://github.com/ytisvibecoding/qef-proposal-assistant"
RAW="https://raw.githubusercontent.com/ytisvibecoding/qef-proposal-assistant/main"
SKILL_NAME="qef-proposal-assistant"

# Detect skill directory
detect_skill_dir() {
  if [ -d "$HOME/.workbuddy/skills" ]; then
    echo "$HOME/.workbuddy/skills"
  elif [ -d "$HOME/.codebuddy/skills" ]; then
    echo "$HOME/.codebuddy/skills"
  else
    # Default: try workbuddy first, create if needed
    mkdir -p "$HOME/.workbuddy/skills"
    echo "$HOME/.workbuddy/skills"
  fi
}

SKILL_DIR="$(detect_skill_dir)/${SKILL_NAME}"

echo "🔧 QEF 計劃書助手 — 安裝/更新"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Check if already installed
if [ -d "$SKILL_DIR" ]; then
  LOCAL_VERSION=$(grep '^version:' "$SKILL_DIR/SKILL.md" 2>/dev/null | head -1 | sed 's/version: *//' | tr -d '"'"'")
  echo "📋 本地已安裝版本：${LOCAL_VERSION:-未知}"
else
  echo "📋 本地未安裝，將進行全新安裝"
fi

# Check remote version
echo "🔍 正在檢查遠端最新版本..."
REMOTE_VERSION=$(curl -sL "${RAW}/SKILL.md" 2>/dev/null | grep '^version:' | head -1 | sed 's/version: *//' | tr -d '"'"'" || echo "未知")
echo "📋 遠端最新版本：${REMOTE_VERSION}"

if [ "$FORCE" = false ] && [ -n "$LOCAL_VERSION" ] && [ "$LOCAL_VERSION" = "$REMOTE_VERSION" ]; then
  echo "✅ 已是最新版本，無需更新"
  echo "💡 如需強制重新安裝，請加 --force 參數"
  exit 0
fi

if [ "$FORCE" = true ]; then
  echo "⚡ --force 模式：強制重新安裝（忽略版本比對）"
fi

# Download files
echo "📥 正在下載文件..."
mkdir -p "$SKILL_DIR/references"

curl -sL "${RAW}/SKILL.md" -o "$SKILL_DIR/SKILL.md"
curl -sL "${RAW}/references/rules.md" -o "$SKILL_DIR/references/rules.md"
curl -sL "${RAW}/README.md" -o "$SKILL_DIR/README.md"
curl -sL "${RAW}/install.sh" -o "$SKILL_DIR/install.sh" 2>/dev/null || true

# Verify download
if [ ! -s "$SKILL_DIR/SKILL.md" ]; then
  echo "❌ 下載失敗，請檢查網絡連接"
  rm -rf "$SKILL_DIR"
  exit 1
fi

# Verify version in downloaded file matches remote
INSTALLED_VERSION=$(grep '^version:' "$SKILL_DIR/SKILL.md" | head -1 | sed 's/version: *//' | tr -d '"'"'")
if [ "$INSTALLED_VERSION" != "$REMOTE_VERSION" ] && [ "$REMOTE_VERSION" != "未知" ]; then
  echo "⚠️ 下載版本 ($INSTALLED_VERSION) 與遠端版本 ($REMOTE_VERSION) 不一致，可能下載不完整"
  echo "💡 建議在 AI 對話中說「更新 QEF skill」讓 AI 直接更新"
fi

echo ""
echo "✅ 安裝完成！版本：${INSTALLED_VERSION}"
echo "📁 安裝位置：${SKILL_DIR}"
echo ""
echo "💬 現在可以在 AI 對話中說「我想申請 QEF」開始使用"
echo "🔄 如需更新，在 AI 對話中說「更新 QEF skill」即可（無需跑腳本）"
