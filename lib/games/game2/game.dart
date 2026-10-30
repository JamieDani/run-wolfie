import 'package:flutter/material.dart';

import '../minigame.dart';

final minigame = Minigame(title: 'game2', builder: (_) => const Game2Page());

class Game2Page extends StatelessWidget {
  const Game2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('game2')),
      body: const Center(
        child: Text('game2 goes here.'),
      ),
    );
  }
}
