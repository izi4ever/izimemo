import 'dart:ui';

enum CustomBookmarkColors {
  red(color: Color.fromARGB(255, 255, 241, 241)),
  green(color: Color.fromARGB(255, 241, 255, 233)),
  blue(color: Color.fromARGB(255, 237, 237, 255)),
  yellow(color: Color.fromARGB(255, 255, 255, 237)),
  aquamarine(color: Color.fromARGB(255, 237, 255, 255));
  // pink(color: Color.fromARGB(255, 255, 241, 255)),
  // orange(color: Color.fromARGB(255, 255, 248, 244)),
  // amber(color: Color.fromARGB(255, 254, 250, 240)),
  // olive(color: Color.fromARGB(255, 241, 255, 198));

  const CustomBookmarkColors({
    required this.color,
  });

  final Color color;
}
