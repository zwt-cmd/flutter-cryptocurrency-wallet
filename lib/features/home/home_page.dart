import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_app/core/l10n/app_localizations.dart';
import '../../core/utils/extensions.dart';
import '../../core/data/mock_market_data.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final tabs = [
      l10n.tabIndex,
      l10n.tabShares,
      l10n.tabCurrencies,
      l10n.tabFutures,
      l10n.tabCrypto,
    ];
    final dataList = [
      mockIndexList, // INDEX
      mockSharesList, // SHARES
      mockCurrenciesList, // CURRENCIES
      mockFuturesList, // FUTURES
      mockCryptoList, // CRYPTO
    ];

    return DefaultTabController(
      length: tabs.length,

      child: Column(
        children: [
          // 顶部标题栏区域
          _buildHeader(context),

          // TabBar
          _buildTabBar(context, tabs),

          // TabBarView - 你自己写列表内容
          Expanded(
            child: TabBarView(
              children: dataList.map((items) {
                return ListView.builder(
                  padding: EdgeInsets.only(top: 20),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          color: context.isDark
                              ? Color(0xFF151515)
                              : Colors.white,
                          child: Row(
                            children: [
                              // 左边
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '${item.time}  ${item.exchange}',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              Spacer(), // 占余空间
                              // 右边
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF00D9A5),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Text(
                                      item.price.toString(),
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '+203 (+1.04%)',
                                    style: TextStyle(
                                      color: context.isDark
                                          ? Colors.white
                                          : Color(0xFF151515),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // item边框
                        Divider(
                          height: 1,
                          thickness: 0.5,
                          indent: 16,
                          endIndent: 16,
                          color: Color(0xFFE0E0E0),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
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
            top: -30,
            right: -120,
            child: Image.asset(
              "assets/home_top_adorn.png",
              width: 550,
              height: 150,
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
                    "TRADIX",
                    style: TextStyle(
                      color: context.isDark ? Colors.white : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Image(
                    image: AssetImage("assets/home_symbol.png"),
                    width: 25.0,
                  ),
                  const Spacer(),
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
    );
  }

  Widget _buildTabBar(BuildContext context, List<String> tabs) {
    return Container(
      decoration: BoxDecoration(
        color: context.isDark ? Colors.black : Color(0xFFF8F8F8),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
      ),
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),

      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFF21CC8), Color(0xFFFD9FEB)],
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
}
