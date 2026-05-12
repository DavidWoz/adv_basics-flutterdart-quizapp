import 'package:adv_basics/screens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/screens/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/screens/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start_screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results_screen';
      });
    }
  }

  void restartQuiz() {
    // 👈 added right here, alongside the other methods
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions_screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results_screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz, // 👈 passed down here
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 65, 3, 172),
                Color.fromARGB(255, 101, 37, 153),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
