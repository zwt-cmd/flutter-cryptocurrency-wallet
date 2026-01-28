import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/utils/extensions.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      // 👈 去掉 Scaffold，直接返回内容
      children: [
        // 顶部标题栏区域
        Container(
          color: context.isDark ? Colors.black : Colors.white,
          // 使用 Stack 实现层叠布局
          child: Stack(
            // clipBehavior: Clip.none, // 允许子元素溢出显示
            children: [
              // 装饰图片 - 绝对定位在右上角，允许超出容器
              Positioned(
                top: -30, // 向上偏移，让图片从顶部延伸出去
                right: -120, // 向右偏移，让图片从右侧延伸出去
                child: Image.asset(
                  "assets/home_top_adorn.png",
                  width: 550, // 加大宽度
                  height: 150, // 设置高度
                  fit: BoxFit.cover, // 图片填充方式
                ),
              ),
              // 主要内容区域 - 在装饰图片上层
              SafeArea(
                bottom: false, // 只处理顶部安全区域
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "TRADIX",
                            style: TextStyle(
                              color: context.isDark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(width: 8),
                          Image(
                            image: AssetImage("assets/home_symbol.png"),
                            width: 25.0,
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        color: Colors.white,
                        icon: const Icon(Ionicons.search),
                        onPressed: () {
                          context.showSnackBar("搜索");
                        },
                      ),
                    ],
                  ),
                ),
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
                  leading: CircleAvatar(child: Icon(Icons.person)),
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
