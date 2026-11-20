import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class Wolfie extends PositionComponent {
  bool possessed = false;
  Vector2 velocity = Vector2.zero();
  Vector2 playerInput = Vector2.zero(); // joystick will set this later
  final _rng = Random();
  double _wanderTimer = 0;
  static const speed = 120.0;

  Wolfie() : super(size: Vector2.all(48));

  @override
  void update(double dt) {
    if (possessed) {
      velocity = playerInput * speed;
    } else {
      _wanderTimer -= dt;
      if (_wanderTimer <= 0) {
        final angle = _rng.nextDouble() * 2 * pi;
        velocity = Vector2(cos(angle), sin(angle)) * (speed * 0.5);
        _wanderTimer = 1 + _rng.nextDouble() * 2;
      }
    }
    position += velocity * dt;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), Paint()..color = possessed ? Colors.red : Colors.grey);
  }
}

class WolfieGame extends FlameGame with TapDetector {
  late Wolfie wolfie;

  @override
  Future<void> onLoad() async {
    wolfie = Wolfie()..position = size / 2;
    add(wolfie);
  }

  @override
  void onTap() {
    wolfie.possessed = !wolfie.possessed;
  }
}