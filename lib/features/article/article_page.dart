import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/extensions.dart';

class ArticlePage extends ConsumerWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.article, size: 64, color: context.colorScheme.primary),
          SizedBox(height: 16),
          Text(
            '文章页面',
            style: context.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
