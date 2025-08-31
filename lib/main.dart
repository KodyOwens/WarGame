// My Student ID # is 90032598 
// The date I submitted this is: 8/31/2025

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'User Profile Card';
    return MaterialApp(
      title: appTitle,
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ProfileCard(),
          SizedBox(height: 30),
          FollowCounter(),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            'https://images.unsplash.com/photo-1528821154947-1aa3d1b74941?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          ),
          SizedBox(height: 16),
        Text(
          'Ramon Venezuela',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'Software Developer',
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        Text(
          'RamonVenezuela@gmail.com',
          style: TextStyle(fontSize: 16, color: Colors.blueGrey),
        ),
      ],
    );
  }
}

