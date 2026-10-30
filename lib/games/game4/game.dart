import 'package:flutter/material.dart';

import '../minigame.dart';

final minigame = Minigame(title: 'game4', builder: (_) => const Game4Page());

class Game4Page extends StatelessWidget {
  const Game4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('game4')),
      body: const Center(
        child: Text('game4 goes here.'),
      ),
    );
  }
}
