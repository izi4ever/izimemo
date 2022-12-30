enum DefaultLinks {
  google(link: 'https://www.google.com/', imageFileName: 'google.png', active: true),
  youtube(link: 'https://m.youtube.com/', imageFileName: 'youtube.png', active: true),
  facebook(link: 'https://m.facebook.com/', imageFileName: 'facebook.png', active: true),
  instagram(link: 'https://www.instagram.com/', imageFileName: 'instagram.png', active: true),
  tiktok(link: 'https://www.tiktok.com/', imageFileName: 'tiktok.png', active: true),
  pinterest(link: 'https://pinterest.com/', imageFileName: 'pinterest.png', active: true),
  linkedin(link: 'https://www.linkedin.com/', imageFileName: 'linkedin.png', active: true),
  upwork(link: 'https://www.upwork.com/', imageFileName: 'upwork.png', active: true),
  bbc(link: 'https://www.bbc.com/', imageFileName: 'bbc.png', active: true),
  cnn(link: 'https://edition.cnn.com/', imageFileName: 'cnn.png', active: true),
  cnbc(link: 'https://www.cnbc.com/world/?region=world', imageFileName: 'cnbc.png', active: true),
  translate(link: 'https://translate.google.com/', imageFileName: 'translate.png', active: true),
  // TODO https://web.telegram.org/?legacy=1#/login
  ;

  const DefaultLinks({
    required this.link,
    required this.imageFileName,
    required this.active,
  });

  final String link;
  final String imageFileName;
  final bool active;
}
