import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/core/l10n/app_localizations.dart';
import '../../core/utils/extensions.dart';
import '../../core/data/mock_article_data.dart';

class ArticlePage extends ConsumerWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final tabs = [
      l10n.artTabEditorial,
      l10n.artCryptoNews,
      l10n.artRawMaterial,
      l10n.artEconomics,
    ];
    final dataList = [
      mockEditorialList,
      mockCryptoNewsList,
      mockRawMaterialList,
      mockEconomicsList,
    ];

    return DefaultTabController(
      length: tabs.length,

      child: Column(
        children: [
          // 顶部标题栏区域
          _buildHeader(context),

          // TabBar
          _buildTabBar(context, tabs),

          // banner
          _buildBanner(context),

          // TabBarView - 你自己写列表内容
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: TabBarView(
                children: dataList.map((items) {
                  return ListView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: context.isDark
                                  ? Color(0xFF262626)
                                  : Colors.white,
                              border: Border.all(
                                color: Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  0.4,
                                ), // R, G, B, Opacity(0.0-1.0)
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Image.asset(
                                    item.image,
                                    width: 110,
                                    height: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),

                                // 右边
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(height: 10),
                                          DefaultTextStyle(
                                            style: TextStyle(
                                              color: item.isUp
                                                  ? Color(0XFF0CF2B4)
                                                  : Color(0XFFF00909),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(item.symbol),
                                                SizedBox(width: 2),
                                                Text(item.change),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                            item.date,
                                            style: TextStyle(
                                              color: context.isDark
                                                  ? Color(0XFFD8D8D8)
                                                  : Color(0XFF2E2E2E),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        item.title,
                                        style: TextStyle(
                                          color: context.isDark
                                              ? Color(0XFFFFFFFF)
                                              : Color(0XFF2E2E2E),
                                          fontSize: 17,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              item.description,
                                              style: TextStyle(
                                                color: context.isDark
                                                    ? Color(0XFFD8D8D8)
                                                    : Color(0XFF2E2E2E),
                                                fontSize: 13,
                                                height: 1.2, // 行高
                                              ),
                                              maxLines: 3,
                                              overflow:
                                                  TextOverflow.ellipsis, //溢出省略号
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          IconButton(
                                            onPressed: () => {},
                                            icon: Icon(
                                              MaterialCommunityIcons
                                                  .share_outline,
                                              size: 18,
                                              color: context.isDark
                                                  ? Color(0XFFD8D8D8)
                                                  : Color(0XFF2E2E2E),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                        ],
                      );
                    },
                  );
                }).toList(),
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
                  Text(
                    "NEWS",
                    style: TextStyle(
                      color: context.isDark ? Colors.white : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    color: Colors.black,
                    icon: const Icon(Feather.more_vertical),
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
    );
  }

  Widget _buildTabBar(BuildContext context, List<String> tabs) {
    return Container(
      decoration: BoxDecoration(
        color: context.isDark ? Color(0xFF151515) : Color(0xFFF8F8F8),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
      ),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),

      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelColor: Color(0xFF151515),
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF00FFBA), Color(0xFF00FFBA)],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        indicatorPadding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        tabs: tabs.map((t) => Tab(text: t)).toList(),
      ),
    );
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
      height: 180,
      color: context.isDark ? Color(0xFF151515) : Color(0xFFF8F8F8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: 1.0,
            height: double.infinity,
          ),
          items: [
            Image.asset(
              'assets/protfolio_swiper_one.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Image.asset(
              'assets/protfolio_swiper_two.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
