# TRADIX - The Future of Trading

A comprehensive financial trading platform built with Flutter, featuring real-time market data, portfolio management, currency exchange, and financial news.

## App Overview

TRADIX is a modern financial trading application that provides users with:

- **Market Data** - Real-time quotes for indices, stocks, currencies, futures, and cryptocurrencies
- **Portfolio Management** - Track your investments and holdings
- **Currency Exchange** - Convert between multiple currencies with live exchange rates
- **Price Alerts** - Set notifications for target prices
- **Financial News** - Stay updated with market news and analysis

## Screenshots

| Home | Portfolio | Coin Detail | Exchange |
|------|-----------|-------------|----------|
| Market indices & quotes | Investment tracking | Charts & analysis | Currency conversion |

## Features

### Core Features
- 📈 **Market Data** - INDEX, SHARES, CURRENCIES, FUTURES, CRYPTO
- 💼 **Portfolio** - Track holdings, P&L, total assets
- 💱 **Currency Exchange** - Multi-currency conversion (USD, EUR, GBP, CHF, etc.)
- 🔔 **Price Alerts** - Custom price notifications
- 📰 **News** - Editorial, Crypto News, Raw Material, Economics

### Technical Features
- ✅ Flutter 3.38.x (Stable)
- ✅ Material 3 Design
- ✅ Light/Dark theme support
- ✅ Multi-language (Chinese/English)
- ✅ Riverpod state management
- ✅ go_router navigation
- ✅ Dio HTTP client

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
│   ├── data/                          # Mock data
│   ├── l10n/                          # Localization
│   ├── network/                       # Network layer
│   ├── theme/                         # Theme & colors
│   └── utils/                         # Utilities & extensions
│
└── features/                          # Feature modules
    ├── home/                          # Home - Market data
    ├── portfolio/                     # Portfolio management
    ├── article/                       # News & articles
    └── mine/                          # User profile & settings
```

## Getting Started

### Prerequisites

- Flutter SDK 3.24+
- Xcode 15+ (for iOS)
- Android Studio (for Android)

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd flutter_app

# Install dependencies
flutter pub get

# Generate localization files
flutter gen-l10n

# Run the app
flutter run
```

## Running the App

```bash
# Check environment
flutter doctor

# List available devices
flutter devices

# Run on Android
flutter emulators --launch <emulator_id>
flutter run

# Run on iOS
open -a Simulator
flutter run -d iPhone
```

### Hot Reload

While the app is running:
- Press `r` for hot reload
- Press `R` for hot restart
- Press `q` to quit

## Localization (i18n)

Translation files are located in `lib/core/l10n/arb/`:
- `app_en.arb` - English
- `app_zh.arb` - Chinese

### Add/Update Translations

1. Edit the `.arb` files to add or modify translations
2. Run the following command to regenerate Dart code:
```bash
flutter gen-l10n
```
3. Use in code:
```dart
import 'package:flutter_app/core/l10n/app_localizations.dart';

final l10n = AppLocalizations.of(context)!;
Text(l10n.tabIndex)  // "INDEX" or "指数"
```

### Switch Language

In `lib/app/app.dart`, modify the `locale` parameter:
```dart
locale: const Locale('zh'),  // Chinese
locale: const Locale('en'),  // English
locale: null,                // Follow system
```

## Build

```bash
# Android APK
flutter build apk --release

# iOS IPA
flutter build ios --release
```

## License

MIT License
