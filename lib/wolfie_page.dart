import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'wolfie_game.dart';

class WolfiePage extends StatelessWidget {
  const WolfiePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wolfie Possession')),
      body: GameWidget(game: WolfieGame()),
    );
  }
}