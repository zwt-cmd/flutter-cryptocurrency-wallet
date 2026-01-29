import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_app/core/l10n/app_localizations.dart';
import '../../core/utils/extensions.dart';

class PortfolioPage extends ConsumerWidget {
  const PortfolioPage({super.key});

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

    return DefaultTabController(
      length: tabs.length,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 第1层：白色背景（只覆盖 header 和 card 区域）
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300, // 根据 header + card 的高度调整
            child: Container(
              color: context.isDark ? Colors.black : Colors.white,
            ),
          ),
          // 第2层：绿色装饰条（中间）
          Positioned(
            top: 80,
            right: -40,
            child: Image.asset(
              "assets/protfolio_top_adorn.png",
              width: 500,
              height: 230,
              fit: BoxFit.cover,
            ),
          ),
          // 第3层：主要内容（最上面，背景透明）
          Column(
            children: [
              _buildHeader(context),
              _buildCard(context),
              _buildFilter(context), // 筛选项固定
              Expanded(child: _buildList(context)), // 列表滚动
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Text(
              "PORTFOLIO",
              style: TextStyle(
                color: context.isDark ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            const Spacer(),
            IconButton(
              color: context.isDark ? Colors.white : Colors.black,
              icon: const Icon(Ionicons.add),
              onPressed: () {
                context.showSnackBar("搜索");
              },
            ),
            IconButton(
              color: context.isDark ? Colors.white : Colors.black,
              icon: const Icon(Feather.more_vertical),
              onPressed: () {
                context.showSnackBar("搜索");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(26),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Container(
          // 用渐变背景代替图片
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF2E20DB), // 紫蓝色
                Color(0xFFE432C1), // 粉色
              ],
            ),
          ),
          padding: EdgeInsets.all(26),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SUMMARY",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "3443",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "USD",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Entypo.arrow_up, color: Color(0xFF0CF2B4), size: 20),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("24H", style: TextStyle(color: Colors.white)),
                      SizedBox(width: 4),
                      Text("+1200USC", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 筛选项/表头
  Widget _buildFilter(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      decoration: BoxDecoration(
        color: context.isDark ? Color(0xFF1A1A1A) : Color(0xFFF8F8F8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          // Portfolio 1 + 筛选图标
          Row(
            children: [
              Text(
                "Portfolio 1",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              SizedBox(width: 4),
              Icon(Feather.list, size: 16, color: Colors.grey),
            ],
          ),
          Spacer(),
          // Price 排序
          Row(
            children: [
              Text("Price", style: TextStyle(color: Colors.grey, fontSize: 14)),
              Icon(Icons.arrow_drop_down, size: 18, color: Colors.grey),
            ],
          ),
          SizedBox(width: 24),
          // Holdings 排序
          Row(
            children: [
              Text(
                "Holdings",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              Icon(Icons.arrow_drop_down, size: 18, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  // 列表
  Widget _buildList(BuildContext context) {
    // 模拟数据
    final items = [
      {
        'name': 'APPLE',
        'time': '10:44:45',
        'exchange': 'Nasdaq',
        'price': '20.047,50',
        'change': '+203 (+1,04%)',
        'isUp': true,
        'holdings': '900',
        'amount': '100',
      },
      {
        'name': 'NEO',
        'time': '10:44:45',
        'exchange': 'Binance',
        'price': '22.047,50',
        'change': '+340 (+5,04%)',
        'isUp': true,
        'holdings': '2500',
        'amount': '150',
      },
      {
        'name': 'USD/EUR',
        'time': '10:44:45',
        'exchange': 'Values',
        'price': '0.08593',
        'change': '+0.002 (+1,04%)',
        'isUp': true,
        'holdings': '930',
        'amount': '',
      },
      {
        'name': 'TSLA',
        'time': '10:44:45',
        'exchange': 'Nasdaq',
        'price': '420.81',
        'change': '-35 (-10,2%)',
        'isUp': false,
        'holdings': '1320',
        'amount': '50',
      },
    ];

    return Container(
      color: context.isDark ? Color(0xFF1A1A1A) : Color(0xFFF8F8F8),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: items.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          indent: 26,
          endIndent: 26,
          color: Colors.grey.withOpacity(0.2),
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return _buildListItem(context, item);
        },
      ),
    );
  }

  // 列表项
  Widget _buildListItem(BuildContext context, Map<String, dynamic> item) {
    final isUp = item['isUp'] as bool;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: Row(
        children: [
          // 左边：名称和时间
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  '${item['time']}  ${item['exchange']}',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          // 中间：价格和涨跌
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item['price']} USD', style: TextStyle(fontSize: 14)),
                SizedBox(height: 4),
                Text(
                  item['change'],
                  style: TextStyle(
                    color: isUp ? Color(0xFF0CF2B4) : Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // 右边：箭头和持仓
          Icon(
            isUp ? Entypo.arrow_up : Entypo.arrow_down,
            color: isUp ? Color(0xFF0CF2B4) : Colors.red,
            size: 18,
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF0CF2B4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown, // 自动调整字体大小
                  child: Text(
                    item['holdings'],
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 13, // 最大字号
                    ),
                  ),
                ),
              ),
              if (item['amount'].isNotEmpty) ...[
                SizedBox(height: 4),
                Text(
                  item['amount'],
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
