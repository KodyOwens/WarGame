class CardModel {
  final String suit;
  final int rank;

  CardModel({required this.suit, required this.rank});

  String get asset => 'assets/cards/${rank}_of_${suit}.svg';
}
