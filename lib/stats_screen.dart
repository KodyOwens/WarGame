import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  int totalGames = 0;
  int player1Wins = 0;
  int player2Wins = 0;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      totalGames = prefs.getInt('totalGames') ?? 0;
      player1Wins = prefs.getInt('player1Wins') ?? 0;
      player2Wins = prefs.getInt('player2Wins') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double player1winRate = totalGames > 0 ? player1Wins / totalGames * 100 : 0.0;
    double player2winRate = totalGames > 0 ? player2Wins / totalGames * 100 : 0.0;

    return Scaffold(
      appBar: AppBar(title: Text('Game Stats')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Games Played: $totalGames',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text('Player1 Wins: $player1Wins', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text('Player2 Wins: $player2Wins', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(
                'Player1 Win Rate: ${player1winRate.toStringAsFixed(1)}%',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Player2 Win Rate: ${player2winRate.toStringAsFixed(1)}%',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
