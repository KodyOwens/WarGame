import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';
import 'package:myapp/game_screen.dart';

void main() {
  testWidgets('Home screen renders and navigates', (tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Start Game'), findsOneWidget);
    await tester.tap(find.text('Start Game'));
    await tester.pumpAndSettle();

    expect(find.byType(GameScreen), findsOneWidget);
  });
}
