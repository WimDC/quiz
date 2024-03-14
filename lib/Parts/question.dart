import 'package:flutter/material.dart';
import '../settings.dart' as settings;
import 'package:quiz/Parts/answerbutton.dart';

class Question extends StatelessWidget {
  final int questionNumber;
  final int score;
  final Function processAnswer;

  const Question(this.questionNumber, this.score, this.processAnswer);

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
