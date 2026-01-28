# Flutter App

A Flutter application with Riverpod, go_router, and Material 3.

## Features

- ✅ Flutter 3.38.x (Stable)
- ✅ Material 3 enabled by default
- ✅ Light/Dark theme follows system
- ✅ Multi-language support (Chinese/English)
- ✅ Riverpod state management
- ✅ go_router navigation
- ✅ Dio HTTP client with interceptors
- ✅ flutter_vector_icons icon library

## Project Structure

```
lib/
├── main.dart                          # App entry point
│
├── app/                               # App configuration
│   ├── app.dart                       # MaterialApp (theme, router, l10n)
│   ├── router.dart                    # Route definitions
│   └── providers.dart                 # Global providers
│
├── core/                              # Core utilities
│   ├── l10n/                          # Localization
│   │   └── arb/                       # Translation files (app_en.arb, app_zh.arb)
│   ├── network/                       # Network layer
│   │   ├── dio_client.dart            # Dio wrapper
│   │   └── interceptors/              # Interceptors
│   ├── theme/                         # Theme & colors
│   └── utils/                         # Utilities & extensions
│
└── features/                          # Feature pages
    └── home/
        └── home_page.dart             # Home page
```

## Getting Started

### Prerequisites

- Flutter SDK 3.24+
- Xcode 15+ (for iOS)
- Android Studio (for Android)
- CocoaPods (for iOS)

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd flutter_app

# Install dependencies
flutter pub get

# Generate localization files
flutter gen-l10n

# Generate code (freezed, json_serializable, etc.)
flutter pub run build_runner build --delete-conflicting-outputs
```

## Running the App

### Check Environment

```bash
flutter doctor
```

### List Available Devices

```bash
flutter devices
```

### iOS Simulator

```bash
# Open iOS Simulator
open -a Simulator

# Run on iOS Simulator
flutter run -d iPhone

# Or run via Xcode (recommended for first time)
open ios/Runner.xcworkspace
# Then click ▶️ button in Xcode
```

> **Note**: For the first run on iOS, it's recommended to run via Xcode to configure code signing.

### Android Emulator

```bash
# List available emulators
flutter emulators

# Launch an emulator
flutter emulators --launch <emulator_id>

# Run on Android
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

## Development

### Hot Reload

While the app is running:
- Press `r` in terminal for hot reload
- Press `R` for hot restart
- Press `q` to quit

### Code Generation

```bash
# One-time build
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-rebuild on changes)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Add New Localization

1. Add strings to `lib/core/l10n/arb/app_en.arb` and `app_zh.arb`
2. Run `flutter gen-l10n`

## Build

### Android APK

```bash
flutter build apk --release
```

### iOS IPA

```bash
flutter build ios --release
```

## License

MIT License
