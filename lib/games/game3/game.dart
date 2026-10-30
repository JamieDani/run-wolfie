import 'package:flutter/material.dart';

import '../minigame.dart';

final minigame = Minigame(title: 'game3', builder: (_) => const Game3Page());

class Game3Page extends StatelessWidget {
  const Game3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('game3')),
      body: const Center(
        child: Text('game3 goes here.'),
      ),
    );
  }
}
