import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/providers.dart';
import 'home/home_page.dart';
import 'portfolio/portfolio_page.dart';
import 'article/article_page.dart';
import 'mine/mine_page.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(tabIndexProvider);

    // 页面列表
    final pages = [
      const HomePage(),
      const PortfolioPage(),
      const ArticlePage(),
      const MinePage(),
    ];

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages), // 内容切换
      bottomNavigationBar: _buildCustomBottomBar(context, currentIndex, ref),
    );
  }

  // 自定义底部导航栏
  Widget _buildCustomBottomBar(
    BuildContext context,
    int currentIndex,
    WidgetRef ref,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bottomPadding = MediaQuery.of(context).padding.bottom; // 获取底部安全区域

    return Container(
      height: 50 + bottomPadding,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF000000) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem(
            context: context,
            icon: Icons.trending_up, // 趋势图
            label: '首页',
            index: 0,
            currentIndex: currentIndex,
            onTap: () => ref.read(tabIndexProvider.notifier).state = 0,
          ),
          _buildTabItem(
            context: context,
            icon: Icons.pie_chart, // 饼图
            label: '作品',
            index: 1,
            currentIndex: currentIndex,
            onTap: () => ref.read(tabIndexProvider.notifier).state = 1,
          ),
          _buildTabItem(
            context: context,
            icon: Icons.newspaper, // 报纸/文章
            label: '文章',
            index: 2,
            currentIndex: currentIndex,
            onTap: () => ref.read(tabIndexProvider.notifier).state = 2,
          ),
          _buildTabItem(
            context: context,
            icon: Icons.person_outline, // 用户
            label: '我的',
            index: 3,
            currentIndex: currentIndex,
            onTap: () => ref.read(tabIndexProvider.notifier).state = 3,
          ),
        ],
      ),
    );
  }

  // 单个 tab item
  Widget _buildTabItem({
    required BuildContext context,
    required IconData icon,
    required String label,
    required int index,
    required int currentIndex,
    required VoidCallback onTap,
  }) {
    final isSelected = index == currentIndex;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 图标容器（选中时有椭圆形渐变背景）
            AnimatedContainer(
              duration: const Duration(milliseconds: 500), // 加长动画时间
              curve: Curves.elasticOut, // 果冻弹性效果
              width: isSelected ? 60 : 50, // 选中时变大
              height: isSelected ? 36 : 30, // 选中时变大
              decoration: isSelected
                  ? BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFF21CC8), // 顶部颜色
                          Color(0xFFFD9FEB), // 底部颜色
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20), // 椭圆形
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFF21CC8).withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    )
                  : null,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 500), // 加长动画时间
                curve: Curves.elasticOut, // 果冻弹性效果
                scale: isSelected ? 1.1 : 0.85, // 加大缩放幅度
                child: Icon(
                  icon,
                  size: 24,
                  color: isSelected ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
