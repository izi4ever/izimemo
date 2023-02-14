enum AdditionalLinks {
  ukrNet(title: 'Ukr.net', url: 'https://www.ukr.net/', active: true),
  olx(title: 'OLX', url: 'https://m.olx.ua/', active: true),
  megogo(title: 'Megogo', url: 'https://megogo.net/ua/', active: true),
  ;

  const AdditionalLinks({
    required this.title,
    required this.url,
    required this.active,
  });

  final String title;
  final String url;
  final bool active;
}