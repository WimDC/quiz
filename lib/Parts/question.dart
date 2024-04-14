import 'package:flutter/material.dart';
import 'package:quiz/Parts/answerbutton.dart';
import 'package:quiz/settings.dart';
import '../settings.dart' as settings;
import 'dart:math';

class Question extends StatelessWidget {
  final int questionNumber;
  final int score;
  final Function processAnswer;
  late List<String> answers;
  final String randomQuestion;

  Question(this.questionNumber, this.score, this.processAnswer)
      : randomQuestion = getRandomQuestion() {
    answers = generateAnswers(questionNumber, randomQuestion);
  }

  static List<String> generateAnswers(
      int questionNumber, String randomQuestion) {
    List<String> answers = [];

    // Pick random movie titles for answers
    List<Map<String, dynamic>> shuffledMovies = List.from(settings.movies)
      ..shuffle();

    // Determine the sortOfQuestion
    String sortOfQuestion = getSortOfQuestion(questionNumber, randomQuestion);
    print('sortOfQuestion: ' + sortOfQuestion);

    // Fill the correct-tag in randomQuestions with the correct answer
    String correct = shuffledMovies.firstWhere((movie) =>
        movie['tag'] ==
        settings.randomQuestions[questionNumber]['tag'])[sortOfQuestion];

    print('correct: ' + correct);

    settings.randomQuestions[questionNumber]['correct'] = correct;

    print('Correct answer for question $questionNumber: $correct');

    // Ensure one of the answers is the correct one
    dynamic correctAnswer = settings.randomQuestions[questionNumber]['correct'];
    answers.add(correctAnswer);

    // Pick other random incorrect answers
    for (int i = 0; i < shuffledMovies.length && answers.length < 4; i++) {
      print('shuffledMovies.length: ' +
          shuffledMovies.length.toString() +
          ' i: ' +
          i.toString());
      if (shuffledMovies[i][sortOfQuestion] !=
              settings.randomQuestions[questionNumber]['correct'] &&
          !answers.contains(shuffledMovies[i][sortOfQuestion])) {
        answers.add(shuffledMovies[i][sortOfQuestion]);
      }
    }

    answers.shuffle();

    return answers;
  }

  static String getRandomQuestion() {
    String randomQuestion = settings.randomQuestion[0]['questions']
        [Random().nextInt(questions.length - 1)];

    return randomQuestion;
  }

  static String getSortOfQuestion(int questionNumber, String randomQuestion) {
    print('randomQuestion: ' + randomQuestion);
    String sortOfQuestion = "";
    if (randomQuestion == "Uit welke film of reeks komt deze foto?") {
      sortOfQuestion = "title";
    } else if (randomQuestion == "In welk jaar is deze film geproduceerd?") {
      sortOfQuestion = "year";
    } else if (randomQuestion == "Wie heeft deze film geregisseerd?") {
      sortOfQuestion = "director";
    }
    return sortOfQuestion;
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
    List<String> questions =
        settings.randomQuestions[questionNumber]['questions'];
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
              randomQuestion,
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
