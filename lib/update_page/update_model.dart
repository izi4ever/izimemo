class UpdateModel {
  String? appLastVersion;
  Comment? comment;
  Comment? buttonText;
  Link? link;

  UpdateModel({this.appLastVersion, this.comment, this.buttonText, this.link});

  UpdateModel.fromJson(Map<String, dynamic> json) {
    appLastVersion = json['app_last_version'];
    comment = json['comment'] != null ? Comment.fromJson(json['comment']) : null;
    buttonText = json['button_text'] != null ? Comment.fromJson(json['button_text']) : null;
    link = json['link'] != null ? Link.fromJson(json['link']) : null;
  }
}

class Comment {
  String? en;
  String? ru;
  String? uk;
  String? de;

  Comment({this.en, this.ru, this.uk, this.de});

  Comment.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ru = json['ru'];
    uk = json['uk'];
    de = json['de'];
  }
}

class Link {
  String? ios;
  String? android;

  Link({this.ios, this.android});

  Link.fromJson(Map<String, dynamic> json) {
    ios = json['ios'];
    android = json['android'];
  }
}