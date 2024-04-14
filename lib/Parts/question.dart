import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/Parts/answerbutton.dart';
import 'package:quiz/settings.dart' as settings;

class Question extends StatelessWidget {
  final int questionNumber;
  final Map<String, dynamic> quizData;
  final Function processAnswer;
  final int score;

  Question(this.questionNumber, this.score, this.quizData, this.processAnswer);

  Widget makeRowWithAnswerButtons(BuildContext context, int answerNumber) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AnswerButton(
          quizData['answers'][answerNumber],
          quizData['answers'][answerNumber] == quizData['correctAnswer'],
          processAnswer,
        ),
        if (answerNumber + 1 < quizData['answers'].length)
          AnswerButton(
            quizData['answers'][answerNumber + 1],
            quizData['answers'][answerNumber + 1] == quizData['correctAnswer'],
            processAnswer,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<String> images = quizData['images'];
    String randomImage = images[Random().nextInt(images.length)];

    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: settings.margin),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Image.asset(randomImage, fit: BoxFit.fitWidth),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(settings.margin),
            child: Text(
              quizData['question'],
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        for (var i = 0; i < quizData['answers'].length; i += 2)
          makeRowWithAnswerButtons(context, i),
      ],
    );
  }
}
