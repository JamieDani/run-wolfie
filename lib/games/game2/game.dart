import 'dart:math';
import 'package:flutter/material.dart';

import '../minigame.dart';

final minigame = Minigame(title: 'Wordle', builder: (_) => const WordlePage());

enum LetterStatus { initial, correct, present, absent }

class Tile {
  final String char;
  final LetterStatus status;
  Tile(this.char, [this.status = LetterStatus.initial]);
}

class WordlePage extends StatefulWidget {
  const WordlePage({super.key});

  @override
  State<WordlePage> createState() => _WordlePageState();
}

class _WordlePageState extends State<WordlePage> {
  static const _wordBank = ['MILES', 'WOLFY', 'SPEED', 'PACER', 'TRACK', 'RELAY', 'TRACK'];
  late String _targetWord;
  final List<List<Tile>> _board = List.generate(6, (_) => List.filled(5, Tile('')));
  final Map<String, LetterStatus> _keyStatuses = {};
  int _currentRow = 0;
  String _currentGuess = '';
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    _resetGame();
  }

  void _resetGame() {
    setState(() {
      _targetWord = _wordBank[Random().nextInt(_wordBank.length)];
      for (int r = 0; r < 6; r++) {
        _board[r] = List.filled(5, Tile(''));
      }
      _keyStatuses.clear();
      _currentRow = 0;
      _currentGuess = '';
      _gameOver = false;
    });
  }

  void _onKeyTap(String key) {
    if (_gameOver) return;

    setState(() {
      if (key == 'DEL') {
        if (_currentGuess.isNotEmpty) {
          _currentGuess = _currentGuess.substring(0, _currentGuess.length - 1);
          _board[_currentRow][_currentGuess.length] = Tile('');
        }
      } else if (key == 'ENTER') {
        if (_currentGuess.length == 5) _submitGuess();
      } else if (_currentGuess.length < 5) {
        _board[_currentRow][_currentGuess.length] = Tile(key);
        _currentGuess += key;
      }
    });
  }

  void _submitGuess() {
    final result = List<Tile?>.filled(5, null);
    final counts = <String, int>{};

    for (final char in _targetWord.split('')) {
      counts[char] = (counts[char] ?? 0) + 1;
    }

    // Pass 1: Exact matches (Green)
    for (int i = 0; i < 5; i++) {
      if (_currentGuess[i] == _targetWord[i]) {
        result[i] = Tile(_currentGuess[i], LetterStatus.correct);
        counts[_currentGuess[i]] = counts[_currentGuess[i]]! - 1;
      }
    }

    // Pass 2: Misplaced (Yellow) & Absent (Gray)
    for (int i = 0; i < 5; i++) {
      if (result[i] != null) continue;
      final char = _currentGuess[i];
      if ((counts[char] ?? 0) > 0) {
        result[i] = Tile(char, LetterStatus.present);
        counts[char] = counts[char]! - 1;
      } else {
        result[i] = Tile(char, LetterStatus.absent);
      }
    }

    _board[_currentRow] = result.cast<Tile>();

    for (final tile in _board[_currentRow]) {
      final existing = _keyStatuses[tile.char];
      if (existing == LetterStatus.correct) continue;
      if (existing == LetterStatus.present && tile.status == LetterStatus.absent) continue;
      _keyStatuses[tile.char] = tile.status;
    }

    if (_currentGuess == _targetWord) {
      _gameOver = true;
      _showEndDialog('You Won!');
    } else if (_currentRow == 5) {
      _gameOver = true;
      _showEndDialog('Game Over! Word was $_targetWord');
    } else {
      _currentRow++;
      _currentGuess = '';
    }
  }

  void _showEndDialog(String title) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _resetGame();
            },
            child: const Text('Play Again'),
          ),
        ],
      ),
    );
  }

  Color _getTileColor(LetterStatus status) {
    switch (status) {
      case LetterStatus.correct:
        return const Color(0xFF538D4E);
      case LetterStatus.present:
        return const Color(0xFFB59F3B);
      case LetterStatus.absent:
        return const Color(0xFF3A3A3C);
      case LetterStatus.initial:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121213),
      appBar: AppBar(
        title: const Text(
          'WORDLE',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: List.generate(6, (r) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (c) {
                      final tile = _board[r][c];
                      return Container(
                        width: 52,
                        height: 52,
                        margin: const EdgeInsets.all(3),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _getTileColor(tile.status),
                          border: Border.all(
                            color: tile.status == LetterStatus.initial
                                ? (tile.char.isEmpty ? const Color(0xFF3A3A3C) : const Color(0xFF565758))
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          tile.char,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }),
                  );
                }),
              ),
            ),
            const Spacer(),
            _buildKeyboard(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    const rows = [
      ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
      ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
      ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
    ];

    return Column(
      children: rows.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: row.map((key) {
            final isAction = key == 'ENTER' || key == 'DEL';
            final status = _keyStatuses[key] ?? LetterStatus.initial;
            final bgColor = status == LetterStatus.initial
                ? const Color(0xFF818384)
                : _getTileColor(status);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
              child: GestureDetector(
                onTap: () => _onKeyTap(key),
                child: Container(
                  width: isAction ? 52 : 33,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: key == 'DEL'
                      ? const Icon(Icons.backspace_outlined, color: Colors.white, size: 18)
                      : Text(
                          key,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isAction ? 11 : 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}

