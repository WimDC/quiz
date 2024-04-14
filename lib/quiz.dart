import 'package:flutter/material.dart';
import 'package:quiz/Parts/question.dart';
import 'package:quiz/Parts/result.dart';
import 'package:quiz/Parts/quiz_generator.dart';
import 'package:quiz/settings.dart' as settings;

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _MyQuizState();
}

class _MyQuizState extends State<Quiz> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive {
    return true;
  }

  late List<Map<String, dynamic>> quizData;
  int questionNumber = 0;
  int score = 0;

  @override
  void initState() {
    settings.restart.stream.listen((event) {
      setState(() {
        questionNumber = 0;
        score = 0;
      });
    });
    // Initialize quiz data
    quizData =
        QuizGenerator.generateQuiz(settings.movies, settings.randomQuestion);
    super.initState();
  }

  void processAnswer(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        score++;
      });
    }
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (questionNumber >= quizData.length) {
      return Result(score, quizData.length);
    } else {
      return Question(
        questionNumber,
        score,
        quizData[questionNumber],
        processAnswer,
      );
    }
  }
}
