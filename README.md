# QEF 計劃書助手 — 使用說明

> 香港優質教育基金 (QEF) 計劃書 AI 代筆助手。老師只需提供一句想法，AI 主動搜索、推理、填充，生成完整申請書初稿。
>
> **本助手是純 Markdown，沒有任何平台專有語法，可在任何 AI 工具中使用。**

## 快速開始（選你的 AI 工具）

### 🔄 更新已有 Skill

如果你已經安裝過，只需在 AI 對話中說：

```
更新 QEF skill
```

AI 會自動從 GitHub 下載最新版本並覆蓋本地文件。**不需要跑終端命令。**

> 💡 AI 每次啟動時也會自動檢查版本，發現新版本會主動提示並自動更新。

### WorkBuddy / CodeBuddy（一句話安裝）

```
安裝 skill：https://github.com/ytisvibecoding/qef-proposal-assistant
```

AI 會自動下載並安裝到 `~/.workbuddy/skills/qef-proposal-assistant/`。

### OpenClaw（對話式安裝）

在 OpenClaw 對話中直接說：

```
安裝 skill：https://github.com/ytisvibecoding/qef-proposal-assistant
```

或用 CLI：

```bash
npx skills add ytisvibecoding/qef-proposal-assistant
```

或手動 clone 到 skills 目錄：

```bash
git clone https://github.com/ytisvibecoding/qef-proposal-assistant.git ~/.openclaw/workspace/skills/qef-proposal-assistant
```

### Hermes Agent（CLI 安裝）

```bash
hermes skills install github/ytisvibecoding/qef-proposal-assistant
```

或手動 clone 到 skills 目錄：

```bash
git clone https://github.com/ytisvibecoding/qef-proposal-assistant.git ~/.hermes/skills/qef-proposal-assistant
```

### Claude (claude.ai)

**方式一（推薦）：Project Instructions**
1. 新建 Project → 把 `SKILL.md` 和 `references/rules.md` 內容貼進 Project Instructions
2. 開始對話

**方式二（快速）：直接貼對話**
1. 開新對話，把 GitHub repo 鏈接貼進去：`https://github.com/ytisvibecoding/qef-proposal-assistant`
2. 告訴 Claude：「請讀取這個 repo 的 SKILL.md 和 references/rules.md，然後幫我寫 QEF 計劃書」

### ChatGPT Custom GPT

1. 新建 GPT → 把 `SKILL.md` 內容貼進 Instructions
2. 把 `references/rules.md` 作為 Knowledge file 上傳
3. 開始對話

### Cursor / Windsurf

1. 把 `SKILL.md` 和 `references/rules.md` 複製到專案目錄
2. 在對話中告訴 AI：「請參考專案中的 SKILL.md 和 references/rules.md 來協助我」

### 任何對話式 AI

1. 開新對話
2. 告訴 AI：「我要用這個 QEF 計劃書助手：https://github.com/ytisvibecoding/qef-proposal-assistant，請讀取 SKILL.md 和 references/rules.md 的內容」
3. 開始對話

### 手動下載（任何平台通用）

1. 點擊 [下載 ZIP](https://github.com/ytisvibecoding/qef-proposal-assistant/archive/refs/heads/main.zip)
2. 解壓後按上述對應平台的方式使用

或 Git Clone：
```bash
git clone https://github.com/ytisvibecoding/qef-proposal-assistant.git
```

## 檔案結構

```
qef-proposal-assistant/
├── README.md              ← 你正在看的這份
├── SKILL.md               # 核心：工作流程、鐵律、搜索策略
├── install.sh             # 一鍵安裝/更新腳本
└── references/
    └── rules.md           # 知識庫：10 份 QEF 官方文檔整合
```

## 三種模式

| 模式 | 適用場景 |
|------|---------|
| **代筆模式** | 只有一句想法，AI 幫你從零寫完整計劃書 |
| **優化模式** | 已有初稿，AI 按 QEF 官方標準優化 |
| **單點模式** | 只需幫某一章節（預算、評鑑等）|

## 核心理念

**AI 替老師打工，不是老師替 AI 打工。** 老師只需提供想法，AI 負責搜索政策、搭框架、寫全文，老師最後確認修改即可。

AI 不確定的內容會用 `[方括號]` 標記，老師只需替換這些地方——不用從空白開始寫。

## 資料來源

知識庫 (`references/rules.md`) 整合自 10 份 2025/26 年度 QEF 官方文檔：
- 申請指引、常見問題、價格標準、計劃書範本
- 4 份附錄（申請類別、優先主題、預算規則、推廣指引）
- 微型/非微型計劃錦囊

## 安全

純 Markdown 文檔，零可執行代碼，無任何安全風險。

## 更新方式匯總

| 方式 | 命令/操作 | 適合誰 |
|------|----------|--------|
| **AI 對話中更新（推薦）** | 說「更新 QEF skill」 | 所有用戶，最簡單 |
| **AI 自動檢查** | 每次啟動自動檢查，有新版自動更新 | 所有用戶，零操作 |
| **Bash 腳本更新** | `curl -sL https://raw.githubusercontent.com/ytisvibecoding/qef-proposal-assistant/main/install.sh \| bash` | 有終端的用戶 |
| **Bash 強制覆蓋** | `curl -sL https://raw.githubusercontent.com/ytisvibecoding/qef-proposal-assistant/main/install.sh \| bash -s -- --force` | 版本不對時使用 |
| **手動更新** | 下載 ZIP → 解壓覆蓋 skill 目錄 | 任何用戶 |

> ⚠️ 如果 bash 腳本顯示「已是最新」但你知道不是，請加 `--force` 強制覆蓋，或在 AI 對話中說「更新 QEF skill」。
