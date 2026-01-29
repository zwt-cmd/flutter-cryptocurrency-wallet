/// 市场行情数据模型
class MarketItem {
  final String symbol;        // 代码: "DJIA", "AAPL"
  final String name;          // 名称: "Dow Jones"
  final String exchange;      // 交易所: "NYSE"
  final String time;          // 时间: "10:44:45"
  final double price;         // 价格: 20047.50
  final double change;        // 涨跌额: +203.5
  final double changePercent; // 涨跌幅: +1.04
  final MarketCategory category;

  MarketItem({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.time,
    required this.price,
    required this.change,
    required this.changePercent,
    required this.category,
  });

  /// 是否上涨
  bool get isUp => change >= 0;
}

/// 市场分类
enum MarketCategory {
  indices,    // 指数
  shares,     // 股票
  currencies, // 货币
  futures,    // 期货
  crypto,     // 加密货币
}
