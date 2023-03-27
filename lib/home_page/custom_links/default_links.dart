enum DefaultLinks {
  google(url: 'https://www.google.com/', imageFileName: 'google.png', active: true),
  youtube(url: 'https://m.youtube.com/', imageFileName: 'youtube.png', active: true),
  facebook(url: 'https://m.facebook.com/', imageFileName: 'facebook.png', active: true),
  instagram(url: 'https://www.instagram.com/', imageFileName: 'instagram.png', active: true),
  tiktok(url: 'https://www.tiktok.com/', imageFileName: 'tiktok.png', active: true),
  pinterest(url: 'https://pinterest.com/', imageFileName: 'pinterest.png', active: true),
  linkedin(url: 'https://www.linkedin.com/', imageFileName: 'linkedin.png', active: true),
  upwork(url: 'https://www.upwork.com/', imageFileName: 'upwork.png', active: true),
  bbc(url: 'https://www.bbc.com/', imageFileName: 'bbc.png', active: true),
  cnn(url: 'https://edition.cnn.com/', imageFileName: 'cnn.png', active: true),
  cnbc(url: 'https://www.cnbc.com/world/?region=world', imageFileName: 'cnbc.png', active: true),
  translate(url: 'https://translate.google.com/', imageFileName: 'translate.png', active: true),
  tube(url: 'https://www.cbc.ca/kids/games/play/color-pipes', imageFileName: '004-processor.png', active: true),
  tetris(url: 'https://arenaservices.cdn.arkadiumhosted.com/playgame/api/playgame/play/gamedistribution.arkadiumarena.com/block-champ/', imageFileName: '002-tetris-1.png', active: true),
  // TODO https://web.telegram.org/?legacy=1#/login
  ;

  const DefaultLinks({
    required this.url,
    required this.imageFileName,
    required this.active,
  });

  final String url;
  final String imageFileName;
  final bool active;
}
