import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/core/l10n/app_localizations.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../core/utils/extensions.dart';

class MinePage extends ConsumerWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      color: context.isDark
          ? Color.fromARGB(255, 0, 0, 0)
          : Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          _buildHeader(context),

          // Expanded 放在 Column 的 children 里
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                color: context.isDark ? Color(0XFF262626) : Color(0XFFF8F8F8),
              ),
              padding: EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/protfolio_swiper_two.png',
                            fit: BoxFit.cover,
                            width: 55,
                            height: 55,
                          ),
                        ),
                        SizedBox(width: 14),
                        Text("MARN OLSON", style: TextStyle(fontSize: 19)),
                        Spacer(),
                        Row(
                          children: [
                            IconButton(
                              color: context.isDark
                                  ? Color(0XFFFFFFFF)
                                  : Color(0XFF000000),
                              icon: const Icon(Ionicons.settings_outline),
                              onPressed: () {
                                context.showSnackBar("搜索");
                              },
                            ),
                            IconButton(
                              color: context.isDark
                                  ? Color(0XFFFFFFFF)
                                  : Color(0XFF000000),
                              icon: const Icon(Ionicons.md_language_outline),
                              onPressed: () {
                                context.showSnackBar("搜索");
                              },
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    // 菜单
                    _buildMenu(context, l10n),
                    _buildMenuTool(context, l10n),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: context.isDark ? Colors.black : Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: -90,
            right: -100,
            child: Image.asset(
              "assets/home_top_adorn.png",
              width: 550,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Text(
                    "MENU",
                    style: TextStyle(
                      color: context.isDark ? Colors.white : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context, AppLocalizations l10n) {
    return Column(
      children: [
        SizedBox(height: 15),
        Divider(
          height: 1,
          thickness: context.isDark ? 0.1 : 0.5,
          indent: 5,
          endIndent: 5,
          color: Color(0xFFE0E0E0),
        ),
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton.filled(
                    onPressed: () => {},
                    icon: const Icon(AntDesign.notification, size: 18),
                    style: IconButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 242, 61, 206),
                      minimumSize: Size(42, 42),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    l10n.mineAlert,
                    style: TextStyle(
                      fontSize: 17,
                      color: context.isDark ? Colors.white : Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton.filled(
                    onPressed: () => {},
                    icon: const Icon(AntDesign.retweet, size: 18),
                    style: IconButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 242, 61, 206),
                      minimumSize: Size(42, 42),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    l10n.minePerdictions,
                    style: TextStyle(
                      fontSize: 17,
                      color: context.isDark ? Colors.white : Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton.filled(
                    onPressed: () => {},
                    icon: const Icon(AntDesign.pushpino, size: 18),
                    style: IconButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 242, 61, 206),
                      minimumSize: Size(42, 42),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    l10n.mineSavedElement,
                    style: TextStyle(
                      fontSize: 17,
                      color: context.isDark ? Colors.white : Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  IconButton.filled(
                    onPressed: () => {},
                    icon: const Icon(AntDesign.unlock, size: 18),
                    style: IconButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 242, 61, 206),
                      minimumSize: Size(42, 42),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    l10n.mineRemove,
                    style: TextStyle(
                      fontSize: 17,
                      color: context.isDark ? Colors.white : Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuTool(BuildContext context, AppLocalizations l10n) {
    return Column(
      children: [
        SizedBox(height: 15),
        Divider(
          height: 1,
          thickness: context.isDark ? 0.1 : 0.5,
          indent: 5,
          endIndent: 5,
          color: Color(0xFFE0E0E0),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Color(0xFF0CF2B4), // 绿色背景
                borderRadius: BorderRadius.circular(25), // 圆角
              ),
              child: Text(
                'Tools',
                style: TextStyle(color: Color(0xFF000000), fontSize: 16),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),

        Container(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(AntDesign.calculator, size: 18),
                  ),
                  SizedBox(width: 10),
                  Text(
                    l10n.mineSelectStocks,
                    style: TextStyle(
                      fontSize: 17,
                      color: context.isDark
                          ? const Color.fromARGB(255, 213, 213, 213)
                          : Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(AntDesign.fork, size: 18),
                  ),
                  SizedBox(width: 10),
                  Text(
                    l10n.mineCurrencyEXchange,
                    style: TextStyle(
                      fontSize: 17,
                      color: context.isDark
                          ? const Color.fromARGB(255, 213, 213, 213)
                          : Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(AntDesign.videocamera, size: 18),
                  ),
                  SizedBox(width: 10),
                  Text(
                    l10n.mineWebinar,
                    style: TextStyle(
                      fontSize: 17,
                      color: context.isDark
                          ? const Color.fromARGB(255, 213, 213, 213)
                          : Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      MaterialCommunityIcons.home_edit_outline,
                      size: 18,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    l10n.mineBestBroker,
                    style: TextStyle(
                      fontSize: 17,
                      color: context.isDark
                          ? const Color.fromARGB(255, 213, 213, 213)
                          : Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ],
    );
  }
}
