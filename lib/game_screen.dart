import 'package:flutter/material.dart';
import 'package:myapp/card_model.dart';
import 'package:provider/provider.dart';
import 'game_provider.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, game, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('War Game'),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: game.gameOver
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${game.winner} wins!',
                        style: TextStyle(fontSize: 32),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          game.saveStats();
                          Navigator.pop(context);
                        },
                        child: Text('Return to Home'),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player 1 vs Player 2',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildCard(
                            'Player1',
                            game.tableCards.isNotEmpty
                                ? game.tableCards[0]
                                : null,
                          ),
                          _buildCard(
                            'Player2',
                            game.tableCards.isNotEmpty
                                ? game.tableCards[1]
                                : null,
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Text('Player1 Cards: ${game.player1Deck.length}'),
                      Text('Player2 Cards: ${game.player2Deck.length}'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: game.playRound,
                        child: Text('Play Round'),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  Widget _buildCard(String title, CardModel? card) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        Container(
          height: 120,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              card !=null ? '${card.rank} of ${card.suit}': 'No Card',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}

    // didn't work
          // child: card != null
          //     ? SvgPicture.asset(
          //         card.asset,
          //         fit: BoxFit.contain,