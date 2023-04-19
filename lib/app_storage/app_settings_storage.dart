import 'package:get_storage/get_storage.dart';

class AppSettingsStorage {
  final box = GetStorage();

  double get readEntriesInLesson => box.read('entriesInLesson') ?? 10;
  void writeEntriesInLesson(double value) => box.write('entriesInLesson', value);

  double get readSecondsPerEntries => box.read('secondsPerEntries') ?? 10;
  void writeSecondsPerEntries(double value) => box.write('secondsPerEntries', value);

  bool get readLoadLastUrl => box.read('loadLastUrl') ?? false;
  void writeLoadLastUrl(bool value) => box.write('loadLastUrl', value);

  String get readLastUrl => box.read('lastUrl') ?? 'https://google.com/';
  void writeLastUrl(String value) => box.write('lastUrl', value);

  bool get readIsTextReading => box.read('isTextReading') ?? true;
  void writeIsReading(bool value) => box.write('isTextReading', value);

  double get readReadingSpeed => box.read('readingSpeed') ?? 0.25;
  void writeReadingSpeed(double value) => box.write('readingSpeed', value);

  double get readBackgroundVolume => box.read('backgroundVolume') ?? 0.45;
  void writeBackgroundVolume(double value) => box.write('backgroundVolume', value);
}
