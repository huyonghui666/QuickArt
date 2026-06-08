# quickart_thesis_defense - Design Spec

> Human-readable design narrative — rationale, audience, style, color choices, content outline. Read once by downstream roles for context.
>
> Machine-readable execution contract: `spec_lock.md` (color / typography / icon / image short form). Executor re-reads `spec_lock.md` before every SVG page to resist context-compression drift. Keep both in sync; on divergence, `spec_lock.md` wins.

## I. Project Information

| Item | Value |
| ---- | ----- |
| **Project Name** | quickart_thesis_defense |
| **Canvas Format** | PPT 16:9 (1280x720) |
| **Page Count** | 11 pages |
| **Design Style** | C) Top Consulting + academic defense |
| **Target Audience** | 本科毕业设计答辩老师 |
| **Use Case** | 中文毕业设计答辩现场汇报，时长约 10 分钟 |
| **Created Date** | 2026-06-08 |

---

## II. Canvas Specification

| Property | Value |
| -------- | ----- |
| **Format** | PPT 16:9 |
| **Dimensions** | 1280x720 |
| **viewBox** | `0 0 1280 720` |
| **Margins** | left/right 48px, top 40px, bottom 30px |
| **Content Area** | x=40–1240, y=75–670 |

---

## III. Visual Theme

### Theme Style

- **Style**: C) Top Consulting + academic defense
- **Theme**: Light theme
- **Tone**: 科技、专业、克制、适合答辩现场快速抓重点

### Color Scheme

| Role | HEX | Purpose |
| ---- | --- | ------- |
| **Background** | `#F7F9FC` | Page background |
| **Secondary bg** | `#FFFFFF` | Card background |
| **Primary** | `#1565C0` | Title decorations, key sections |
| **Accent** | `#00A8A8` | Data highlights, key information |
| **Secondary accent** | `#5C6BC0` | Secondary emphasis |
| **Body text** | `#1F2937` | Main body text |
| **Secondary text** | `#6B7280` | Captions, annotations |
| **Tertiary text** | `#94A3B8` | Supplementary info, footers |
| **Border/divider** | `#D9E2F1` | Card borders, divider lines |
| **Success** | `#2E7D32` | Positive indicators |
| **Warning** | `#C62828` | Issue / exception markers |

### Gradient Scheme (if needed, using SVG syntax)

```xml
<linearGradient id="titleGradient" x1="0%" y1="0%" x2="100%" y2="0%">
  <stop offset="0%" stop-color="#1565C0"/>
  <stop offset="100%" stop-color="#5C6BC0"/>
</linearGradient>

<linearGradient id="topBarGradient" x1="0%" y1="0%" x2="100%" y2="0%">
  <stop offset="0%" stop-color="#1565C0"/>
  <stop offset="100%" stop-color="#00A8A8"/>
</linearGradient>
```

---

## IV. Typography System

### Font Plan

**Typography direction**: 学术答辩风，标题更有识别度，正文保证投屏清晰度与可编辑性。

| Role | Chinese | English | Fallback tail |
| ---- | ------- | ------- | ------------- |
| **Title** | `"Microsoft YaHei"` | `Georgia` | `serif` |
| **Body** | `"Microsoft YaHei"` | `Arial` | `sans-serif` |
| **Emphasis** | `"Microsoft YaHei"` | `Georgia` | `serif` |
| **Code** | — | `Consolas, "Courier New"` | `monospace` |

**Per-role font stacks**:

- Title: `Georgia, "Microsoft YaHei", serif`
- Body: `"Microsoft YaHei", Arial, sans-serif`
- Emphasis: `Georgia, "Microsoft YaHei", serif`
- Code: `Consolas, "Courier New", monospace`

### Font Size Hierarchy

**Baseline**: Body font size = 20px

| Purpose | Ratio to body | Example @ body=24 (relaxed) | Example @ body=18 (dense) | Weight |
| ------- | ------------- | --------------------------- | ------------------------- | ------ |
| Cover title (hero headline) | 2.5-5x | 60-120px | 45-90px | Bold / Heavy |
| Chapter / section opener | 2-2.5x | 48-60px | 36-45px | Bold |
| Page title | 1.5-2x | 36-48px | 27-36px | Bold |
| Hero number (consulting KPIs) | 1.5-2x | 36-48px | 27-36px | Bold |
| Subtitle | 1.2-1.5x | 29-36px | 22-27px | SemiBold |
| **Body content** | **1x** | **24px** | **18px** | Regular |
| Annotation / caption | 0.7-0.85x | 17-20px | 13-15px | Regular |
| Page number / footnote | 0.5-0.65x | 12-16px | 9-12px | Regular |

**Formula policy**: `text-only`

原因：本答辩稿重点在系统设计、实现与测试，不以公式推导为主，优先保证整体可编辑性与现场讲解效率。

---

## V. Layout Principles

### Page Structure

- **Header area**: 顶部 6px 渐变色条 + 页面标题区
- **Content area**: 主内容区采用“结论先行 + 结构图/流程图/模块卡片/表格矩阵”方式组织
- **Footer area**: 底部页码、论文题目简写、答辩标识

### Layout Pattern Library (combine or break as content demands)

| Pattern | Suitable Scenarios |
| ------- | ----------------- |
| **Single column centered** | 封面、总结、展望 |
| **Asymmetric split (3:7 / 2:8)** | 架构图、流程图、E-R 图配讲解 |
| **Three/four column cards** | 功能模块、贡献点、展望点 |
| **Matrix grid (2×2)** | 测试结果、能力分组 |
| **Negative-space-driven** | 背景页、结论页 |

### Spacing Specification

**Universal**:

| Element | Recommended Range | Current Project |
| ------- | ---------------- | --------------- |
| Safe margin from canvas edge | 40-60px | 48px |
| Content block gap | 24-40px | 24px |
| Icon-text gap | 8-16px | 10px |

**Card-based layouts**:

| Element | Recommended Range | Current Project |
| ------- | ---------------- | --------------- |
| Card gap | 20-32px | 22px |
| Card padding | 20-32px | 22px |
| Card border radius | 8-16px | 12px |
| Single-row card height | 530-600px | 560px |
| Double-row card height | 265-295px each | 272px |
| Three-column card width | 360-380px each | 372px |

**Non-card containers**:

- 图示类页面优先使用大图 + 右侧解释或上图下结论结构。
- 结论页与展望页优先使用留白，不堆叠过多容器。
- 线性阅读路径保持从左到右、从上到下，避免答辩时讲解跳跃。

---

## VI. Icon Usage Specification

### Source

- **Built-in icon library**: `templates/icons/`
- **Usage method**: SVG placeholder `<use data-icon="library/icon-name" .../>`

### Recommended Icon List (fill as needed)

| Purpose | Icon Path | Page |
| ------- | --------- | ---- |
| 研究目标 | `chunk-filled/target` | Slide 02 |
| 系统架构 | `chunk-filled/layers` | Slide 04 |
| 客户端 | `chunk-filled/mobile` | Slide 04 |
| 服务端 | `chunk-filled/server` | Slide 04 |
| 云端模型 | `chunk-filled/cloud` | Slide 04 |
| 图片生成 | `chunk-filled/image` | Slide 06 |
| 视频生成 | `chunk-filled/video` | Slide 06 |
| 工具模块 | `chunk-filled/toolbox` | Slide 06 |
| 用户与认证 | `chunk-filled/users` | Slide 06 |
| 数据库 | `chunk-filled/database` | Slide 07 |
| 实时通信 | `chunk-filled/arrows-left-right` | Slide 08 |
| 异步任务 | `chunk-filled/bolt` | Slide 08 |
| 安全与幂等 | `chunk-filled/shield-check` | Slide 08 |
| 测试结果 | `chunk-filled/checkmark` | Slide 09 |
| 支付积分 | `chunk-filled/coin` | Slide 06 |

---

## VII. Visualization Reference List (if needed)

本答辩稿不依赖 `templates/charts/` 中的标准图表模板。

- 系统总体架构、业务流程、E-R 图、异步任务与 WebSocket 推送流程均直接使用论文原图。
- 测试结果页采用原生 SVG 表格、状态矩阵与图标强化结论，不使用 catalog chart template。
- 因本稿核心任务是“清晰讲明系统怎么做的”，视觉重点放在结构图、流程图与模块关系，而不是复杂数据图表。

---

## VIII. Image Resource List (if needed)

| Filename | Dimensions | Ratio | Purpose | Type | Layout pattern | Acquire Via | Status | Reference | text_policy | page_role |
| -------- | --------- | ----- | ------- | ---- | -------------- | ----------- | ------ | --------- | ----------- | --------- |
| thesis__image_012.png | 1266x1672 | 0.76 | 系统功能模块图，用于系统目标与功能概览页右侧说明 | Diagram | #3 Right-third image + left text body + #70 Image with thin colored matte frame | user | Existing | 论文图4-2，展示认证登录、创作、工具、工作室、支付积分等模块划分 |  |  |
| thesis__image_011.png | 1833x409 | 4.48 | 系统总体架构图，用于架构设计页 | Diagram | #5 Top-band image + bottom multi-column text + #70 Image with thin colored matte frame | user | Existing | 论文图4-1，展示客户端、服务端、云端模型服务三层协同关系 |  |  |
| thesis__image_009.png | 714x1438 | 0.50 | 系统整体业务流程图，用于业务流程页 | Diagram | #2 Left-third image + right text body + #70 Image with thin colored matte frame | user | Existing | 论文图3-1，展示用户发起生成、服务端处理、结果回传与工作室查看主链路 |  |  |
| thesis__image_013.png | 770x500 | 1.54 | 系统总体E-R图，用于数据库设计页 | Diagram | #3 Right-third image + left text body + #70 Image with thin colored matte frame | user | Existing | 论文图4-3，展示用户、生成任务、支付订单、积分流水、模板资源等实体关系 |  |  |
| thesis__image_014.png | 1268x955 | 1.33 | 异步任务与WebSocket推送流程图，用于关键实现页 | Diagram | #5 Top-band image + bottom multi-column text + #70 Image with thin colored matte frame | user | Existing | 论文图4-4，展示任务创建、后台执行、轮询与推送更新流程 |  |  |
| thesis__image_017.jpeg | 276x607 | 0.45 | QuickArt 主创作界面截图 | Photography | #47 Small multiples — 3–6 same-kind images in an evenly spaced row + #21 Rounded rectangle crop | user | Existing | 论文图5.3，展示图生图创作入口与交互界面 |  |  |
| thesis__image_019.jpeg | 276x607 | 0.45 | 工具模块截图 | Photography | #47 Small multiples — 3–6 same-kind images in an evenly spaced row + #21 Rounded rectangle crop | user | Existing | 论文图5.5，展示工具模块入口 |  |  |
| thesis__image_023.jpeg | 276x607 | 0.45 | AI换脸目标人脸选择截图 | Photography | #47 Small multiples — 3–6 same-kind images in an evenly spaced row + #21 Rounded rectangle crop | user | Existing | 论文图5.9，展示换脸流程中的关键交互节点 |  |  |
| thesis__image_025.jpeg | 276x607 | 0.45 | 工作室页面截图 | Photography | #47 Small multiples — 3–6 same-kind images in an evenly spaced row + #21 Rounded rectangle crop | user | Existing | 论文图5.11，展示任务历史与状态管理界面 |  |  |
| thesis__image_027.jpeg | 276x607 | 0.45 | 支付页面截图 | Photography | #47 Small multiples — 3–6 same-kind images in an evenly spaced row + #21 Rounded rectangle crop | user | Existing | 论文图5.13，展示支付与积分业务界面 |  |  |

---

## IX. Content Outline

### Part 1: 开场与问题定义

#### Slide 01 - 封面

- **Layout**: Single column centered
- **Title**: 基于多模型融合与Flutter的跨平台AI内容生成系统设计与实现
- **Core message**: 本课题完成了一个面向移动端 AIGC 创作场景的跨平台系统实现。
- **Content**:
  - 学生：胡勇辉
  - 专业：计算机科学与技术
  - 指导教师：桂彦
  - 长沙理工大学城南学院毕业设计答辩

#### Slide 02 - 课题背景与研究意义

- **Layout**: Negative-space-driven
- **Title**: 移动端 AIGC 需要从“能力分散”走向“系统化落地”
- **Core message**: 当前 AIGC 在移动端场景存在模型分散、流程割裂、工程协同复杂等问题，因此需要一个完整的跨平台系统方案。
- **Content**:
  - 生成式 AI 正在从文本扩展到图像、视频等多模态创作，用户对“随时创作、即时分享”的移动端需求持续增长。
  - 现有应用常见问题是能力分散、创作链路断裂、长耗时任务状态难管理，用户体验缺乏闭环。
  - 本课题的价值在于：把多模型能力、跨平台客户端、异步任务机制和业务闭环统一到同一套系统中。

### Part 2: 系统设计与实现

#### Slide 03 - 系统目标与功能概览

- **Layout**: Asymmetric split (3:7 / 2:8)
- **Title**: QuickArt 面向移动端 AIGC 创作，构建“生成—管理—分享—支付”完整闭环
- **Core message**: 系统不是单一功能演示，而是覆盖创作、任务管理、结果查看与支付积分的一体化业务系统。
- **Content**:
  - **系统目标**：以 Flutter 实现跨平台移动端，以 Spring Boot + Kotlin 提供后端服务，以多模型接入支撑图像与视频生成。
  - **核心能力**：文生图、图生图、文生视频、图生视频、AI换脸。
  - **业务闭环**：认证登录、工作室任务管理、结果分享、积分购买与支付回调。
  - **Visualization**: 使用论文图4-2说明模块划分与功能边界。

#### Slide 04 - 系统总体架构设计

- **Layout**: Top-band image + bottom multi-column text
- **Title**: 系统采用“客户端—服务端—云端模型服务”的三层端云协同架构
- **Core message**: 架构设计的关键在于明确三层职责边界，并通过统一接口与任务机制把多模型能力接入到移动端应用中。
- **Content**:
  - **客户端层**：Flutter 构建 UI，Riverpod 负责状态管理，GoRouter 负责路由协同，SQLite/Hive 负责本地持久化。
  - **服务端层**：Spring Boot 3 + Kotlin 封装业务逻辑、统一模型调用接口、处理鉴权、订单、积分与任务状态。
  - **云端模型层**：火山方舟提供文生图/视频生成，Magic Hour 提供 AI 换脸，阿里云 OSS 提供结果文件存储与分发。
  - **Takeaway**：三层职责清晰，使系统既能快速接入模型能力，又能保持工程可维护性。

#### Slide 05 - 核心业务流程设计

- **Layout**: Left-third image + right text body
- **Title**: 主业务流程围绕“发起任务—异步执行—结果回传—工作室管理”展开
- **Core message**: 用户视角下的核心体验是一次创作请求能够稳定进入后台处理，并实时回到客户端完成结果闭环。
- **Content**:
  - 1）用户登录后进入创作页，填写提示词或上传图片，发起生成任务。
  - 2）客户端将请求提交到服务端，服务端统一封装模型调用并创建任务记录。
  - 3）长耗时任务在后台异步执行，避免阻塞接口响应线程。
  - 4）任务状态变化后，服务端通过 WebSocket 将最新结果主动推送到客户端。
  - 5）客户端在工作室中展示历史任务、状态变化和生成结果，支持查看与分享。

#### Slide 06 - 功能模块设计与实现

- **Layout**: Three/four column cards
- **Title**: 五大模块共同支撑多模态创作与业务闭环
- **Core message**: 系统实现不是分散功能堆砌，而是围绕用户创作主链路形成协同工作的模块化设计。
- **Content**:
  - **认证登录模块**：接入微信扫码授权，完成 OAuth 回调、JWT 签发与登录态持久化。
  - **QuickArt 创作模块**：实现文生图、图生图与模板化创作，是系统的核心入口。
  - **工具模块**：扩展文生视频、图生视频与 AI 换脸能力，提升多模态创作覆盖度。
  - **工作室模块**：负责任务历史管理、状态更新、结果预览与分享。
  - **支付与积分模块**：完成积分套餐展示、支付宝下单、支付回调和积分到账。
  - **Visualization**: 使用 5 张论文界面截图构成多图对照，体现主要功能落地效果。

#### Slide 07 - 数据库与关键数据设计

- **Layout**: Right-third image + left text body
- **Title**: 数据层围绕“任务、订单、积分、恢复能力”进行建模
- **Core message**: 数据库设计既要支撑核心业务一致性，也要兼顾长耗时任务的追踪与客户端恢复能力。
- **Content**:
  - **users**：保存第三方登录用户信息与当前积分余额。
  - **generation_tasks**：统一记录图像、视频、换脸任务的状态流转，是异步任务机制的核心载体。
  - **payment_orders**：记录支付订单全生命周期，支持对账与回调处理。
  - **points_ledger**：记录每一笔积分变动，配合业务主键实现幂等防重。
  - **SQLite 本地表**：客户端保存工作室任务记录，支撑应用重启后的任务恢复与状态续订阅。

#### Slide 08 - 关键实现：异步任务与 WebSocket 实时推送

- **Layout**: Top-band image + bottom multi-column text
- **Title**: 长耗时生成问题通过“立即返回 taskId + 后台异步执行 + WebSocket 主动推送”解决
- **Core message**: 这一机制是系统能在移动端稳定承载 AIGC 长耗时任务的关键实现。
- **Content**:
  - **立即返回**：服务端创建任务后先返回 `taskId`，提升接口响应速度。
  - **后台执行**：生成任务转入异步处理流程，避免阻塞 HTTP 线程。
  - **状态同步**：服务端在任务处理完成或状态变化时，通过 WebSocket 实时推送最新状态与结果 URL。
  - **客户端恢复**：工作室模块结合本地 SQLite 与 WebSocket 重连订阅，保证应用重启或网络中断后任务仍可恢复。
  - **业务安全**：支付回调使用业务键实现幂等，避免重复到账。

### Part 3: 测试、总结与展望

#### Slide 09 - 系统测试与结果分析

- **Layout**: Matrix grid (2×2)
- **Title**: 关键模块测试均通过，系统在功能完整性与交互流畅性上达到预期
- **Core message**: 测试结果表明，系统已具备较完整的业务功能和较稳定的交互表现。
- **Content**:
  - **认证登录测试**：验证微信授权登录、JWT 签发、本地持久化与未登录拦截链路。
  - **QuickArt 创作测试**：验证文生图、图生图、模板创作与“异步提交 + WebSocket 推送”闭环。
  - **工具模块测试**：验证视频生成、AI换脸及无人脸异常路径处理。
  - **工作室模块测试**：验证任务展示、实时更新、应用重启后的任务恢复。
  - **支付积分测试**：验证下单、支付成功、积分到账及重复回调下的幂等正确性。
  - **Takeaway**：从论文测试结果看，各核心模块均通过验证，系统满足移动端 AIGC 创作的实际使用需求。

#### Slide 10 - 总结

- **Layout**: Single column centered
- **Title**: 本课题完成了一个可运行、可扩展、具备业务闭环的跨平台 AI 内容生成系统
- **Core message**: 论文工作的核心价值不只是“做出几个功能”，而是完成了一套面向真实业务流程的工程化系统实现。
- **Content**:
  - **完成了跨平台客户端实现**：基于 Flutter 构建统一的移动端创作体验。
  - **完成了多模型能力整合**：把图像、视频、换脸等能力接入到统一业务体系中。
  - **完成了关键工程问题落地**：解决了异步长任务、实时状态同步、支付积分与本地恢复等问题。

#### Slide 11 - 展望

- **Layout**: Single column centered
- **Title**: 后续可从模型能力、系统性能与治理机制三个方向持续完善
- **Core message**: 当前系统已经完成基础落地，但在模型效果、平台能力和规范治理方面仍有继续拓展空间。
- **Content**:
  - **模型能力扩展**：引入更多视频生成、风格编辑与多模态理解模型，提升创作质量与场景覆盖度。
  - **系统能力优化**：进一步优化任务调度、并发处理、缓存与异常恢复机制，提升性能与稳定性。
  - **治理与规范**：加强内容审核、生成边界提示与使用日志管理，提高系统的合规性与可控性。
  - **收尾语**：我的汇报完毕，恳请各位老师批评指正。

---

## X. Speaker Notes Strategy

- 答辩总时长控制在 10 分钟左右。
- 第 02 页背景只讲 30–40 秒，老师如需跳过可直接进入第 03 页。
- 第 04–08 页为重点，每页聚焦一个核心设计点：架构、流程、模块、数据、异步通信。
- 第 09 页强调“测试覆盖面 + 结果通过 + 关键异常路径验证”。
- 第 10–11 页用于收束全篇，突出“完成了什么”和“下一步还能怎么做”。

---

## XI. Technical Constraints

- Output language: Chinese
- All slide titles must be conclusion-first, not descriptive-only headings
- Keep each page focused on one core message
- Prefer editable SVG text and native shapes over baked-in long text
- Existing thesis images must be used as first-class assets; do not generate decorative AI images
- Theme must remain restrained and academic-defense friendly
- Footer should keep page number and thesis short label
