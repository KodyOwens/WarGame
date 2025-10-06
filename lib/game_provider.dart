import 'package:flutter/material.dart';
import 'card_model.dart';
import 'deck.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameProvider extends ChangeNotifier {
  late List<CardModel> player1Deck;
  late List<CardModel> player2Deck;
  List<CardModel> tableCards = [];
  List<CardModel> warPile = [];

  int player1Wins = 0;
  int player2Wins = 0;

  GameProvider() {
    resetGame();
  }

  void resetGame() {
    var fullDeck = Deck().createDeck();

    // Creates the two separate decks
    player1Deck = fullDeck.sublist(0, 26);
    player2Deck = fullDeck.sublist(26, 52);

    tableCards = [];
    notifyListeners();
  }

  void playRound() {
    if (player1Deck.isEmpty || player2Deck.isEmpty) return;

    var player1Card = player1Deck.removeAt(0);
    var player2Card = player2Deck.removeAt(0);
    // Displays the cards
    tableCards = [player1Card, player2Card];

    // Add to war pile
    warPile.addAll([player1Card, player2Card]);

    if (player1Card.rank > player2Card.rank) {
      player1Deck.addAll(warPile);
      warPile.clear();
    } else if (player2Card.rank > player1Card.rank) {
      player2Deck.addAll(warPile);
      warPile.clear();
    } else {
      if (player1Deck.length > 1 && player2Deck.length > 1) {
        warPile.add(player1Deck.removeAt(0));
        warPile.add(player2Deck.removeAt(0));
        playRound();
      } 
    }

    notifyListeners();
  }

  // void _handleWar(CardModel card1, CardModel card2) {
  //   // This is how we re-add cards to decks
  //   player1Deck.add(card1);
  //   player2Deck.add(card2);
  // }

  bool get gameOver => player1Deck.isEmpty || player2Deck.isEmpty;

  String get winner {
    if (player1Deck.length > player2Deck.length) {
      return 'Player1';
    } else if (player2Deck.length > player1Deck.length) {
      return 'Player2';
    } else {
      return 'Draw';
    }
  }

  Future<void> saveStats() async {
    final prefs = await SharedPreferences.getInstance();

    int totalGames = prefs.getInt('totalGames') ?? 0;
    int player1Wins = prefs.getInt('player1Wins') ?? 0;
    int player2Wins = prefs.getInt('player2Wins') ?? 0;

    await prefs.setInt('totalGames', totalGames + 1);

    if (winner == 'Player1') {
      await prefs.setInt('player1Wins', player1Wins + 1);
    } else if (winner == 'Player2') {
      await prefs.setInt('player2Wins', player2Wins + 1);
    }
  }
}
