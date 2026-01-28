/// 全局 Provider 定义
///
/// 在此文件中定义跨模块共享的 Provider
/// 例如：用户状态、应用配置等

library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

// 示例：
// final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
//   return UserNotifier();
// });

// 底部导航索引
final tabIndexProvider = StateProvider<int>((ref) => 0);
