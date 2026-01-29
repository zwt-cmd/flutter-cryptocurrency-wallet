# TRADIX - 未来交易平台

一个使用 Flutter 构建的综合金融交易平台，提供实时行情、投资组合管理、货币兑换和财经资讯。

## 应用概述

TRADIX 是一款现代化的金融交易应用，为用户提供：

- **市场行情** - 指数、股票、货币、期货、加密货币的实时报价
- **投资组合** - 追踪您的投资和持仓
- **货币兑换** - 多币种实时汇率换算
- **价格提醒** - 设置目标价格通知
- **财经资讯** - 获取最新市场新闻和分析

## 应用截图

| 首页 | 投资组合 | 币种详情 | 货币兑换 |
|------|----------|----------|----------|
| 市场指数和报价 | 投资追踪 | 图表和分析 | 货币换算 |

## 功能特性

### 核心功能
- 📈 **市场行情** - 指数、股票、货币、期货、加密货币
- 💼 **投资组合** - 持仓追踪、盈亏统计、总资产
- 💱 **货币兑换** - 多币种换算（USD、EUR、GBP、CHF 等）
- 🔔 **价格提醒** - 自定义价格通知
- 📰 **财经资讯** - 社论、加密货币新闻、原材料、经济

### 技术特性
- ✅ Flutter 3.38.x (稳定版)
- ✅ Material 3 设计
- ✅ 浅色/深色主题支持
- ✅ 多语言支持（中文/英文）
- ✅ Riverpod 状态管理
- ✅ go_router 路由导航
- ✅ Dio HTTP 客户端

## 项目结构

```
lib/
├── main.dart                          # 应用入口
│
├── app/                               # 应用配置
│   ├── app.dart                       # MaterialApp（主题、路由、多语言）
│   ├── router.dart                    # 路由定义
│   └── providers.dart                 # 全局 Provider
│
├── core/                              # 核心工具
│   ├── data/                          # Mock 数据
│   ├── l10n/                          # 多语言
│   ├── network/                       # 网络请求
│   ├── theme/                         # 主题和颜色
│   └── utils/                         # 工具类和扩展方法
│
└── features/                          # 功能模块
    ├── home/                          # 首页 - 市场行情
    ├── portfolio/                     # 投资组合
    ├── article/                       # 新闻资讯
    └── mine/                          # 个人中心和设置
```

## 开始使用

### 环境要求

- Flutter SDK 3.24+
- Xcode 15+ (iOS 开发)
- Android Studio (Android 开发)

### 安装

```bash
# 克隆仓库
git clone <repository-url>
cd flutter_app

# 安装依赖
flutter pub get

# 生成多语言文件
flutter gen-l10n

# 运行应用
flutter run
```

## 运行应用

```bash
# 检查环境
flutter doctor

# 查看可用设备
flutter devices

# 在 Android 上运行
flutter emulators --launch <emulator_id>
flutter run

# 在 iOS 上运行
open -a Simulator
flutter run -d iPhone
```

### 热重载

应用运行时：
- 按 `r` 热重载
- 按 `R` 热重启
- 按 `q` 退出

## 多语言 (i18n)

翻译文件位于 `lib/core/l10n/arb/`：
- `app_en.arb` - 英文
- `app_zh.arb` - 中文

### 添加/更新翻译

1. 编辑 `.arb` 文件添加或修改翻译
2. 运行以下命令重新生成 Dart 代码：
```bash
flutter gen-l10n
```
3. 在代码中使用：
```dart
import 'package:flutter_app/core/l10n/app_localizations.dart';

final l10n = AppLocalizations.of(context)!;
Text(l10n.tabIndex)  // "INDEX" 或 "指数"
```

### 切换语言

在 `lib/app/app.dart` 中修改 `locale` 参数：
```dart
locale: const Locale('zh'),  // 中文
locale: const Locale('en'),  // 英文
locale: null,                // 跟随系统
```

## 构建

```bash
# Android APK
flutter build apk --release

# iOS IPA
flutter build ios --release
```

## 许可证

MIT License
