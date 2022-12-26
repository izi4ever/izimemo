import 'dart:ui';

enum ThemeLessonColors {
  red(color: Color(0xFFBB1111)),
  green(color: Color(0xFF119955)),
  blue(color: Color(0xFF1155AA)),
  orange(color: Color(0xFFEE5511)),
  violet(color: Color(0xFF222B88)),
  aquamarine(color: Color(0xFF117070)),
  olive(color: Color(0xFF88AA22)),
  brown(color: Color(0xFFCC7722)),
  yellow(color: Color(0xFFE5D012)),
  amber(color: Color(0xFFFFC107)),
  pink(color: Color(0xFFFF00FF));

  const ThemeLessonColors({
    required this.color,
  });

  final Color color;
}
