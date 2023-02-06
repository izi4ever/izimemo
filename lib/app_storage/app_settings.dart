import 'package:get_storage/get_storage.dart';

class AppSettings {
  final box = GetStorage();

  double get readEntriesInLesson => box.read('entriesInLesson') ?? 5;
  void writeEntriesInLesson(double value) => box.write('entriesInLesson', value);

  double get readSecondsPerEntries => box.read('secondsPerEntries') ?? 5;
  void writeSecondsPerEntries(double value) => box.write('secondsPerEntries', value);

  bool get readLoadLastUrl => box.read('loadLastUrl') ?? false;
  void writeLoadLastUrl(bool value) => box.write('loadLastUrl', value);

  String get readLastUrl => box.read('lastUrl') ?? 'https://google.com/';
  void writeLastUrl(String value) => box.write('lastUrl', value);

  // TODO read/write KeyLastDic
}
