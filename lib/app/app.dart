import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/l10n/app_localizations.dart';
import '../core/utils/constants.dart';
import 'router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFF21CC8), // 👈 用粉色，不能用白色
        ),
        scaffoldBackgroundColor: Color(0xFFF8F8F8),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white, // 浅色模式：白色
          selectedItemColor: Color(0xFFF21CC8), // 选中颜色
          unselectedItemColor: Color(0xFF707070),// 未选中颜色
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFFF21CC8), // 👈 用粉色
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Color(0xFF151515),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF000000), // 深色模式：黑色
          selectedItemColor: Color(0xFFF21CC8),
          unselectedItemColor: Colors.white,
          elevation: 0,  // 👈 去掉阴影
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark, // light浅色 / dark深色 / system系统（默认）
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('zh'), // zh中文 / en 英文 / null（系统）
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
