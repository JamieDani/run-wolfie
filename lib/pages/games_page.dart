import 'package:flutter/material.dart';

import '../games/games.g.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        for (final game in allGames)
          FilledButton.tonal(
            // Pushes onto the root navigator, so the game covers the whole app
            // (including the bottom nav bar).
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: game.builder),
            ),
            child: Text(game.title),
          ),
      ],
    );
  }
}
