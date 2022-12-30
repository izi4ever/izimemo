enum AdditionalLinks {
  ukrNet(title: 'Ukr.net', url: 'https://www.ukr.net/', active: true),
  olx(title: 'OLX', url: 'https://m.olx.ua/', active: true),
  megogo(title: 'Megogo', url: 'https://megogo.net/', active: true),
  rezka(title: 'Rezka', url: 'https://rezka.ag/', active: true),
  thisIsEnglish(title: 'Вот это английский', url: 'https://m.youtube.com/@votetoang/playlists', active: true),
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
