class CurrentDictionaryDataModel {
  String storageName;
  String humanName;
  String fromLanguage;
  String toLanguage;
  int readingIndex;

  CurrentDictionaryDataModel({
    required this.storageName,
    required this.humanName,
    required this.fromLanguage,
    required this.toLanguage,
    required this.readingIndex,
  });

  factory CurrentDictionaryDataModel.fromJson(Map<String, dynamic> json) {
    return CurrentDictionaryDataModel(
      storageName: json['storageName'],
      humanName: json['humanName'],
      fromLanguage: json['fromLanguage'],
      toLanguage: json['toLanguage'],
      readingIndex: json['readingIndex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'storageName': storageName,
      'humanName': humanName,
      'fromLanguage': fromLanguage,
      'toLanguage': toLanguage,
      'readingIndex': readingIndex.toString(),
    };
  }
}