import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/welcome.dart';
import 'package:quiz/settings.dart';

import 'info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kwistet!',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const QuizApp(),
    );
  }
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Kwistet!"),
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: Theme.of(context).colorScheme.primary,
          labelColor: Theme.of(context).colorScheme.primary,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: "Welcome",
            ),
            Tab(
              icon: Icon(Icons.live_help),
              text: "Welcome",
            ),
            Tab(
              icon: Icon(Icons.info),
              text: "Info",
            ),
          ],
        ),
        body: const TabBarView(
          children: [
            Welcome(),
            Quiz(),
            Info(),
          ],
        ),
      ),
    );
  }
}
