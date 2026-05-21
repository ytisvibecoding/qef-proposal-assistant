#!/usr/bin/env bash
# QEF Proposal Assistant - Install / Update Script
# Usage: curl -sL https://raw.githubusercontent.com/ytisvibecoding/qef-proposal-assistant/main/install.sh | bash
# Or:   bash install.sh

set -e

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

if [ -n "$LOCAL_VERSION" ] && [ "$LOCAL_VERSION" = "$REMOTE_VERSION" ]; then
  echo "✅ 已是最新版本，無需更新"
  exit 0
fi

# Download files
echo "📥 正在下載文件..."
mkdir -p "$SKILL_DIR/references"

curl -sL "${RAW}/SKILL.md" -o "$SKILL_DIR/SKILL.md"
curl -sL "${RAW}/references/rules.md" -o "$SKILL_DIR/references/rules.md"
curl -sL "${RAW}/README.md" -o "$SKILL_DIR/README.md"

# Verify download
if [ ! -s "$SKILL_DIR/SKILL.md" ]; then
  echo "❌ 下載失敗，請檢查網絡連接"
  rm -rf "$SKILL_DIR"
  exit 1
fi

INSTALLED_VERSION=$(grep '^version:' "$SKILL_DIR/SKILL.md" | head -1 | sed 's/version: *//' | tr -d '"'"'")
echo ""
echo "✅ 安裝完成！版本：${INSTALLED_VERSION}"
echo "📁 安裝位置：${SKILL_DIR}"
echo ""
echo "💬 現在可以在 AI 對話中說「我想申請 QEF」開始使用"
