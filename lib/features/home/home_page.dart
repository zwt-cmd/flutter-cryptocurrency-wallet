import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/utils/extensions.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(  // 👈 去掉 Scaffold，直接返回内容
      children: [
        // AppBar 改成普通的标题栏
        Container(
          padding: EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Row(
            children: [
              Text(
                "用户列表",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(),
              IconButton(
                icon: const Icon(Ionicons.search),
                onPressed: () {
                  context.showSnackBar("搜索");
                },
              ),
            ],
          ),
        ),
        
        Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: '搜素用户',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text('张三'),
                  subtitle: Text('1909118034@qq.com'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    context.showSnackBar('点击了用户');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
