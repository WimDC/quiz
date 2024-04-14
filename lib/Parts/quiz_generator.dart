import 'dart:math';

import 'package:quiz/settings.dart' as settings;
import 'package:quiz/settings.dart';

class QuizGenerator {
  static List<Map<String, dynamic>> generateQuiz(
      List<dynamic> movies, List<dynamic> randomQuestion) {
    List<Map<String, dynamic>> quiz = [];

    // Iterate 10 times to generate 10 questions
    for (int i = 0; i < 10; i++) {
      // Randomly select a movie
      Map<String, dynamic> selectedMovie =
          movies[Random().nextInt(movies.length)];
      String tag = selectedMovie['tag'];
      print('selectedMovie: ' + selectedMovie.toString());

      // Generate the question
      String question = settings.randomQuestion[0]['questions']
          [Random().nextInt(questions.length - 1)];
      print('question: ' + question);

      // Determine the sort of question
      String sortOfQuestion = ''; // Initialize sortOfQuestion variable
      if (question == "Uit welke film of reeks komt deze foto?") {
        sortOfQuestion = "title";
      } else if (question == "In welk jaar is deze film geproduceerd?") {
        sortOfQuestion = "year";
      } else if (question == "Wie heeft deze film geregisseerd?") {
        sortOfQuestion = "director";
      }

      // Generate the correct answer
      String correctAnswer = selectedMovie[sortOfQuestion];

      // add correct answer to answers
      List<String> answers = [];
      answers.add(correctAnswer);
      print('correctAnswer :' + correctAnswer);

      // add the incorrect answers
      for (int j = 0; j < 3; j++) {
        // Pick a random movie title as an incorrect answer
        Map<String, dynamic> randomMovie =
            movies[Random().nextInt(movies.length)];
        if (!answers.contains(randomMovie[sortOfQuestion])) {
          answers.add(randomMovie[sortOfQuestion]);
        } else {
          j = j - 1;
          print('Else');
        }
      }

      //shuffle the answers array
      answers.shuffle();

      // Add the question and its details to the quiz
      quiz.add({
        'questionNumber': i + 1,
        'question': question,
        'sortOfQuestion': sortOfQuestion,
        'answers': answers,
        'correctAnswer': correctAnswer,
        'images': selectedMovie['images'],
      });
    }

    return quiz;
  }
}

// Example usage:
void main() {
  List<Map<String, dynamic>> quiz =
      QuizGenerator.generateQuiz(movies, randomQuestion);
  print(quiz);
}
