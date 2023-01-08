import 'dart:ui';

enum CustomLessonColors {
  red(color: Color(0xFFAA1111)),
  orange(color: Color(0xFFEE5511)),
  amber(color: Color(0xFFEE9907)),
  olive(color: Color(0xFF88AA22)),
  green(color: Color(0xFF119955)),
  aquamarine(color: Color(0xFF117070)),
  blue(color: Color(0xFF115599)),
  violet(color: Color(0xFF443399)),
  pink(color: Color(0xFF8822AA)),
  ;

  const CustomLessonColors({
    required this.color,
  });

  final Color color;
}
