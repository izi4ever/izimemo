class UpdateModel {
  String? appLastVersion;
  Lang? lang;
  Link? link;

  UpdateModel({this.appLastVersion, this.lang, this.link});

  UpdateModel.fromJson(Map<String, dynamic> json) {
    appLastVersion = json['app_last_version'];
    lang = json['lang'] != null ? Lang.fromJson(json['lang']) : null;
    link = json['link'] != null ? Link.fromJson(json['link']) : null;
  }
}

class Lang {
  LangData? en;
  LangData? ru;
  LangData? uk;
  LangData? de;

  Lang({this.en, this.ru, this.uk, this.de});

  Lang.fromJson(Map<String, dynamic> json) {
    en = json['en'] != null ? LangData.fromJson(json['en']) : null;
    ru = json['ru'] != null ? LangData.fromJson(json['ru']) : null;
    uk = json['uk'] != null ? LangData.fromJson(json['uk']) : null;
    de = json['de'] != null ? LangData.fromJson(json['de']) : null;
  }
}

class LangData {
  String? comment;
  String? buttonText;

  LangData({this.comment, this.buttonText});

  LangData.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    buttonText = json['button_text'];
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