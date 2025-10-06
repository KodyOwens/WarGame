import 'card_model.dart';

class Deck {
  List<CardModel> createDeck() {
    final suits = ['hearts', 'diamonds', 'clubs', 'spades'];
    final deck = <CardModel>[];
    for (var suit in suits) {
      for (var rank = 2; rank <= 14; rank++) {
        deck.add(CardModel(suit: suit, rank: rank));
      }
    }
    deck.shuffle();
    return deck;
  }
}
