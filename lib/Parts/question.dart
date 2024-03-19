import 'dart:js';

import 'package:flutter/material.dart';
import 'package:quiz/Parts/answerbutton.dart';
import '../settings.dart' as settings;

class Question extends StatelessWidget {
  final int questionNumber;
  final int score;
  final Function processAnswer;

  Question(this.questionNumber, this.score, this.processAnswer);

  Widget makeRowWithAnswerButtons(answerNumber) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AnswerButton(
            settings.questions[questionNumber]["answers"][answerNumber],
            settings.questions[questionNumber]["correct"] == answerNumber,
            processAnswer),
        if (answerNumber + 1 <
            settings.questions[questionNumber]["answers"].length)
          AnswerButton(
              settings.questions[questionNumber]["answers"][answerNumber + 1],
              settings.questions[questionNumber]["correct"] == answerNumber + 1,
              processAnswer),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ListView(
      children: [
        for (var i = 0;
            i < settings.questions[questionNumber]["answers"].length;
            i += 2)
          makeRowWithAnswerButtons(i),
        Container(
            margin: EdgeInsets.symmetric(vertical: settings.margin),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(settings.questions[questionNumber]["image"],
                fit: BoxFit.fitWidth)),
        Container(
            child: Padding(
                padding: EdgeInsets.all(settings.margin),
                child: Text(
                  settings.questions[questionNumber]["question"],
                  style: theme.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ))),
      ],
    );
  }
}
