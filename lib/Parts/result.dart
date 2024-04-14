import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import '../settings.dart' as settings;
import 'package:quiz/Parts/quiz_generator.dart';

class Result extends StatelessWidget {
  final int score;
  final int totalQuestions;
  Result(this.score, this.totalQuestions, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListView(
      children: <Widget>[
        Container(
          height: 60,
          child: Center(
              child: Text(
            "Resultaat: ",
            style: theme.textTheme.headlineMedium,
          )),
        ),
        Center(
            child: Text(
          score.toString(),
          style: theme.textTheme.headlineLarge,
        )),
        Center(
            child: Text(
          "van de $totalQuestions vragen goed!",
          style: theme.textTheme.bodyLarge,
        )),
        Container(
            margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
            child: ElevatedButton(
              child: Text("Opnieuw", style: theme.textTheme.bodyMedium),
              onPressed: () {
                settings.restart.add(true);
              },
            ))
      ],
    );
  }
}
