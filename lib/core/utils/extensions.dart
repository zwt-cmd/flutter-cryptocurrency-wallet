import 'package:flutter/material.dart';

/// BuildContext 扩展
extension ContextExtensions on BuildContext {
  /// 获取主题
  ThemeData get theme => Theme.of(this);

  /// 获取颜色方案
  ColorScheme get colorScheme => theme.colorScheme;

  /// 获取文本主题
  TextTheme get textTheme => theme.textTheme;

  /// 获取屏幕尺寸
  Size get screenSize => MediaQuery.sizeOf(this);

  /// 获取屏幕宽度
  double get screenWidth => screenSize.width;

  /// 获取屏幕高度
  double get screenHeight => screenSize.height;

  /// 显示 SnackBar (封装的 Toast)
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colorScheme.error : null,
      ),
    );
  }
}

/// String 扩展
extension StringExtensions on String {
  /// 首字母大写
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// 是否为有效邮箱
  bool get isValidEmail {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  }
}
