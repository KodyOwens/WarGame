import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/game_provider.dart';
import 'package:myapp/game_screen.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Game screen shows intial UI elements', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => GameProvider(),
        child: MaterialApp(home: GameScreen()),
      ),
    );
    // Looks for the Play Round button
    expect(find.text('Play Round'), findsOneWidget);
    // Looks for the Player1 vs Player2 title
    expect(find.text('Player1 vs Player2'), findsOneWidget);
    // Looks for when there are no cards
    expect(find.text('No Card'), findsNWidgets(2));
  });
}
