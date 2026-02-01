import '../../features/article/models/article_item.dart';

// EDITORIAL 文章列表
final mockEditorialList = [
  ArticleItem(
    image: 'assets/protfolio_swiper_one.png',
    symbol: 'ALT',
    change: '-3.87%',
    isUp: false,
    date: '3 Sept 2020',
    title: 'ATLANTIA',
    description:
        'Illum velit nam voluptatum enim aut ratione ratione officiis totam. Mollitia eum sint tempora ducimus',
  ),
  ArticleItem(
    image: 'assets/protfolio_swiper_two.png',
    symbol: 'HKD',
    change: '-2.13%',
    isUp: false,
    date: '2 Sept 2020',
    title: 'XIAOMI',
    description:
        'Illum velit nam voluptatum enim aut ratione ratione officiis totam. Mollitia eum sint tempora ducimus',
  ),
  ArticleItem(
    image: 'assets/protfolio_swiper_one.png',
    symbol: 'AAPL',
    change: '-0.91%',
    isUp: false,
    date: '1 Sept 2020',
    title: 'APPLE',
    description:
        'Illum velit nam voluptatum enim aut ratione ratione officiis totam. Mollitia eum sint tempora ducimus',
  ),
];

// CRYPTO NEWS 文章列表
final mockCryptoNewsList = [
  ArticleItem(
    image: 'assets/protfolio_swiper_one.png',
    symbol: 'BTC',
    change: '+5.23%',
    isUp: true,
    date: '3 Sept 2020',
    title: 'BITCOIN',
    description:
        'Bitcoin reaches new highs as institutional investors continue to accumulate.',
  ),
  ArticleItem(
    image: 'assets/protfolio_swiper_two.png',
    symbol: 'ETH',
    change: '+3.45%',
    isUp: true,
    date: '2 Sept 2020',
    title: 'ETHEREUM',
    description:
        'Ethereum 2.0 upgrade brings new opportunities for DeFi ecosystem.',
  ),
];

// RAW MATERIAL 文章列表
final mockRawMaterialList = [
  ArticleItem(
    image: 'assets/protfolio_swiper_one.png',
    symbol: 'GOLD',
    change: '+1.25%',
    isUp: true,
    date: '3 Sept 2020',
    title: 'GOLD',
    description: 'Gold prices surge amid global economic uncertainty.',
  ),
  ArticleItem(
    image: 'assets/protfolio_swiper_two.png',
    symbol: 'OIL',
    change: '-2.10%',
    isUp: false,
    date: '2 Sept 2020',
    title: 'CRUDE OIL',
    description: 'Oil prices drop as demand concerns persist.',
  ),
];

// ECONOMICS 文章列表
final mockEconomicsList = [
  ArticleItem(
    image: 'assets/protfolio_swiper_one.png',
    symbol: 'USD',
    change: '+0.15%',
    isUp: true,
    date: '3 Sept 2020',
    title: 'US DOLLAR',
    description:
        'Federal Reserve signals potential rate changes in upcoming meeting.',
  ),
  ArticleItem(
    image: 'assets/protfolio_swiper_two.png',
    symbol: 'EUR',
    change: '-0.32%',
    isUp: false,
    date: '2 Sept 2020',
    title: 'EURO ZONE',
    description: 'European markets react to new economic policies.',
  ),
];
