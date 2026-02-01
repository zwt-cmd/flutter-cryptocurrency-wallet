class ArticleItem {
  final String image; // 文章图片
  final String symbol; // 股票代码 (ALT, HKD, AAPL)
  final String change; // 涨跌幅 (-3.87%)
  final bool isUp; // 是否上涨
  final String date; // 日期
  final String title; // 标题
  final String description; // 描述

  ArticleItem({
    required this.image,
    required this.symbol,
    required this.change,
    required this.isUp,
    required this.date,
    required this.title,
    required this.description,
  });
}
