import 'dart:math';

import 'package:flutter/material.dart';
import '../settings.dart' as settings;
import 'package:quiz/Parts/answerbutton.dart';

class Question extends StatelessWidget {
  final int questionNumber;
  final int score;
  final Function processAnswer;

  const Question(this.questionNumber, this.score, this.processAnswer);

  // Function to shuffle answers and assign correct answer randomly
  void shuffleAnswers(List<Map<String, dynamic>>? questions) {
    final Random random = Random();

    if (questions != null) {
      for (var question in questions) {
        List<dynamic>? answers = question["answers"];
        int? correctIndex = question["correctIndex"];
        if (answers != null &&
            correctIndex != null &&
            correctIndex >= 0 &&
            correctIndex < answers.length) {
          var correctAnswer = answers[correctIndex];

          // Shuffle the answers list
          answers.shuffle();

          // Assign the correct answer to a random index within the shuffled list
          int randomIndex = random.nextInt(answers.length);
          answers[randomIndex] = correctAnswer;
          question["correctIndex"] = randomIndex;
        }
      }
    }
  }

  // Function to shuffle movies and assign correct and incorrect movies randomly
  void shuffleMovies(List<dynamic> questions, List<dynamic> movies) {
    final Random random = Random();

    for (var question in questions) {
      // Shuffle the movies list
      movies.shuffle();

      // Select a correct movie
      var correctMovie = movies[random.nextInt(movies.length)];

      // Select some incorrect movies
      var incorrectMovies = [];
      while (incorrectMovies.length < 3) {
        var randomMovie = movies[random.nextInt(movies.length)];
        if (randomMovie != correctMovie) {
          incorrectMovies.add(randomMovie);
        }
      }

      // Assign correct and incorrect movies to the question
      question["correctMovie"] = correctMovie;
      question["incorrectMovies"] = incorrectMovies;
    }
  }

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

    // Call shuffleAnswers and shuffleMovies
    shuffleAnswers(settings.questions);
    shuffleMovies(settings.questions, settings.movies);

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: settings.margin),
              child: Text(
                "Vraag ${questionNumber + 1} van ${settings.questions.length}",
                style: theme.textTheme.headlineSmall,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: settings.margin),
              child: Text(
                "score: 100",
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: settings.margin),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Image.asset(settings.questions[questionNumber]["image"],
                fit: BoxFit.fitWidth)),
        Container(
            child: Padding(
                padding: const EdgeInsets.all(settings.margin),
                child: Text(
                  settings.questions[questionNumber]["question"],
                  style: theme.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ))),
        for (var i = 0;
            i < settings.questions[questionNumber]["answers"].length;
            i += 2)
          makeRowWithAnswerButtons(i),
      ],
    );
  }
}
