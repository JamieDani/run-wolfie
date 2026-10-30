import 'package:flutter/material.dart';

import '../minigame.dart';

final minigame = Minigame(title: 'game1', builder: (_) => const Game1Page());

class Game1Page extends StatelessWidget {
  const Game1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('game1')),
      body: const Center(
        child: Text('game1 goes here.'),
      ),
    );
  }
}
