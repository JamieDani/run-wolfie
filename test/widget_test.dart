import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:run_wolfie/main.dart';

void main() {
  testWidgets('switches between map and games tabs', (tester) async {
    await tester.pumpWidget(const RunWolfieApp());

    expect(find.text('This page will show the map.'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.sports_esports_outlined));
    await tester.pumpAndSettle();

    for (final title in ['game1', 'game2', 'game3', 'game4']) {
      expect(find.text(title), findsOneWidget);
    }
  });

  testWidgets('game opens full screen and returns on back', (tester) async {
    await tester.pumpWidget(const RunWolfieApp());
    await tester.tap(find.byIcon(Icons.sports_esports_outlined));
    await tester.pumpAndSettle();

    await tester.tap(find.text('game2'));
    await tester.pumpAndSettle();

    expect(find.text('game2 goes here.'), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('game2 goes here.'), findsNothing);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text('game1'), findsOneWidget);
  });
}
