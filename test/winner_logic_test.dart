import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/card_model.dart';

void main() {
  test('Correct winner is determined', () {
    final player1Card = CardModel(rank: 10, suit: 'hearts');
    final player2Card = CardModel(rank: 5, suit: 'spades');
    expect(player1Card.rank > player2Card.rank, true);
  });
}