# Flutter 应用

一个使用 Riverpod、go_router 和 Material 3 的 Flutter 应用。

## 特性

- ✅ Flutter 3.38.x (稳定版)
- ✅ Material 3 默认启用
- ✅ 浅色/深色主题跟随系统
- ✅ 多语言支持 (中文/英文)
- ✅ Riverpod 状态管理
- ✅ go_router 路由导航
- ✅ Dio HTTP 客户端 + 拦截器
- ✅ flutter_vector_icons 图标库

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
│   ├── l10n/                          # 多语言
│   │   └── arb/                       # 翻译文件（app_en.arb, app_zh.arb）
│   ├── network/                       # 网络请求
│   │   ├── dio_client.dart            # Dio 封装
│   │   └── interceptors/              # 拦截器
│   ├── theme/                         # 主题和颜色
│   └── utils/                         # 工具类和扩展方法
│
└── features/                          # 功能页面
    └── home/
        └── home_page.dart             # 首页
```

## 开始使用

### 环境要求

- Flutter SDK 3.24+
- Xcode 15+ (iOS 开发)
- Android Studio (Android 开发)
- CocoaPods (iOS 依赖管理)

### 安装

```bash
# 克隆仓库
git clone <repository-url>
cd flutter_app

# 安装依赖
flutter pub get

# 生成多语言文件
flutter gen-l10n

# 生成代码 (freezed, json_serializable 等)
flutter pub run build_runner build --delete-conflicting-outputs
```

## 运行应用

### 检查环境

```bash
flutter doctor
```

### 查看可用设备

```bash
flutter devices
```

### iOS 模拟器

```bash
# 打开 iOS 模拟器
open -a Simulator

# 在 iOS 模拟器上运行
flutter run -d iPhone

# 或者通过 Xcode 运行 (首次推荐)
open ios/Runner.xcworkspace
# 然后在 Xcode 中点击 ▶️ 按钮
```

> **注意**: 首次在 iOS 上运行，建议通过 Xcode 运行以配置代码签名。

### Android 模拟器

```bash
# 列出可用模拟器
flutter emulators

# 启动模拟器
flutter emulators --launch <emulator_id>

# 在 Android 上运行
flutter run -d android
```

### Web

```bash
flutter run -d chrome
```

### macOS

```bash
flutter run -d macos
```

## 开发

### 热重载

应用运行时：
- 在终端按 `r` 热重载
- 按 `R` 热重启
- 按 `q` 退出

### 代码生成

```bash
# 一次性构建
flutter pub run build_runner build --delete-conflicting-outputs

# 监听模式 (修改后自动重新构建)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 添加新的多语言文本

1. 在 `lib/core/l10n/arb/app_en.arb` 和 `app_zh.arb` 中添加文本
2. 运行 `flutter gen-l10n`

## 构建

### Android APK

```bash
flutter build apk --release
```

### iOS IPA

```bash
flutter build ios --release
```

## 许可证

MIT License
