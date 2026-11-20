import 'package:flutter/material.dart';
import 'wolfie_page.dart';

import 'pages/games_page.dart';
import 'pages/map_page.dart';

void main() {
  runApp(const RunWolfieApp());
}

class RunWolfieApp extends StatelessWidget {
  const RunWolfieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Run Wolfie',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  static const _pages = <Widget>[
    MapPage(),
    GamesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _index, children: _pages),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.map_outlined), label: ''),
          NavigationDestination(icon: Icon(Icons.sports_esports_outlined), label: ''),
        ],
      ),
    );
  }
}
<<<<<<< Updated upstream
=======

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('This page will show the map.'),
    );
  }
}

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Center(
      child: FilledButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const WolfiePage()),
        ),
        child: const Text('Play Wolfie Possession'),
      ),
    );
  }
}
>>>>>>> Stashed changes
