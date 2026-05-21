# QEF 計劃書助手 — 使用說明

> 香港優質教育基金 (QEF) 計劃書 AI 代筆助手。老師只需提供一句想法，AI 主動搜索、推理、填充，生成完整申請書初稿。
>
> **本助手是純 Markdown，沒有任何平台專有語法，可在任何 AI 工具中使用。**

## 快速開始（選你的 AI 工具）

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

1. 建立 Project → 把 `SKILL.md` 和 `references/rules.md` 內容貼進 Project Instructions
2. 開始對話即可

### ChatGPT Custom GPT

1. 建立 GPT → 把 `SKILL.md` 內容貼進 Instructions
2. 把 `references/rules.md` 作為 Knowledge file 上傳
3. 開始對話即可

### Cursor / Windsurf

1. 把 `SKILL.md` 內容放入 `.cursor/rules/` 或 `.windsurfrules`
2. `references/rules.md` 放在專案根目錄或貼入 rules

### 任何對話式 AI

1. 開新對話
2. 先把 `SKILL.md` 全文貼進去
3. 再把 `references/rules.md` 全文貼進去
4. 告訴 AI：「以上是我的 QEF 計劃書助手規則，請按此協助我」
5. 開始對話

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
