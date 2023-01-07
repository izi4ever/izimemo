enum AdditionalLinks {
  ukrNet(title: 'Ukr.net', url: 'https://www.ukr.net/', active: true),
  olx(title: 'OLX', url: 'https://m.olx.ua/', active: true),
  megogo(title: 'Megogo', url: 'https://megogo.net/ua/search-extended?category_id=films&country_id=be,br,gb,dk,il,ie,es,it,ca,nl,de,no,us,fi,fr&main_tab=filters&sort=popular&video_genre_id=comedy,action,detective,melodrama,adventures,sport,fiction,crime,short,bio,history,family,kids&vod_free=true&year_id=2022,2021,2020,2016-2019,2010-2015,2000-2009', active: true),
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
