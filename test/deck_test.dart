import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/deck.dart';

void main() {
  test('Deck should contain 52 unique cards', () {
    final deck = Deck().createDeck();
    expect(deck.length, 52);
    final uniqueCards = deck.toSet();
    expect(uniqueCards.length, 52);
  });
}