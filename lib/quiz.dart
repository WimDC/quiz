import 'package:flutter/material.dart';
import 'package:quiz/Parts/Question.dart';
import 'package:quiz/Parts/Result.dart';
import 'package:quiz/settings.dart' as settings;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<Quiz> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  void initState() {
    settings.restart.stream.listen((event) {
      setState(() {
        questionNumber = 0;
        score = 0;
      });
    });
    super.initState();
  }

  int questionNumber = 0;
  int score = 0;
  int totalQuestions = settings.questions.length;

  void processAnswer(bool isCorrect) {
    if (isCorrect) {
      score++;
    }
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (questionNumber == totalQuestions) {
      return Result(score);
    } else {
      return Question(questionNumber, score, processAnswer);
    }
  }
}
