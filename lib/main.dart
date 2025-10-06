// My Student ID # is 90032598
// The date I submitted this is: 10/5/2025
import 'package:flutter/material.dart';
import 'game_provider.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => GameProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'War Card Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}