import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:run_wolfie/main.dart';

void main() {
  testWidgets('switches between map and games tabs', (tester) async {
    await tester.pumpWidget(const RunWolfieApp());

    expect(find.text('This page will show the map.'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.sports_esports_outlined));
    await tester.pumpAndSettle();

    expect(
      find.text('This page will show minigame selection and stats.'),
      findsOneWidget,
    );
  });
}
