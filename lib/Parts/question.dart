import 'package:flutter/material.dart';
import 'package:quiz/Parts/answerbutton.dart';
import '../settings.dart' as settings;
import 'dart:math';

class Question extends StatelessWidget {
  final int questionNumber;
  final int score;
  final Function processAnswer;
  final List<String> answers;

  Question(this.questionNumber, this.score, this.processAnswer)
      : answers = generateAnswers(questionNumber);

  static List<String> generateAnswers(int questionNumber) {
    List<String> answers = [];

    // Pick random movie titles for answers
    List<Map<String, dynamic>> shuffledMovies = List.from(settings.movies)
      ..shuffle();

    // Ensure one of the answers is the correct one
    answers.add(shuffledMovies.firstWhere((movie) =>
        movie['title'] ==
        settings.randomQuestions[questionNumber]['correct'])['title']);

    // Pick other random incorrect answers
    for (int i = 0; i < 3; i++) {
      if (shuffledMovies[i]['title'] !=
          settings.randomQuestions[questionNumber]['correct']) {
        answers.add(shuffledMovies[i]['title']);
      }
    }

    answers.shuffle();

    return answers;
  }

  Widget makeRowWithAnswerButtons(BuildContext context, int answerNumber) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AnswerButton(
          answers[answerNumber],
          answers[answerNumber] ==
              settings.randomQuestions[questionNumber]["correct"],
          processAnswer,
        ),
        if (answerNumber + 1 < answers.length)
          AnswerButton(
            answers[answerNumber + 1],
            answers[answerNumber + 1] ==
                settings.randomQuestions[questionNumber]["correct"],
            processAnswer,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    List<String> images = settings.randomQuestions[questionNumber]['images'];
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
              settings.randomQuestions[questionNumber]['question'],
              style: theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        for (var i = 0; i < answers.length; i += 2)
          makeRowWithAnswerButtons(context, i),
      ],
    );
  }
}
