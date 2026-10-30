import 'package:flutter/widgets.dart';

/// Describes one minigame: the label on its button and the page it opens.
class Minigame {
  const Minigame({required this.title, required this.builder});

  final String title;
  final WidgetBuilder builder;
}
