import 'package:flutter/material.dart';
import 'package:quiz_third_project/data/questions.dart';
import 'package:quiz_third_project/questions_screen.dart';
import 'package:quiz_third_project/results_screen.dart';
import 'package:quiz_third_project/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswer,
          onRestart: restartQuiz,
        );
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 67, 7, 122),
                Color.fromARGB(255, 41, 10, 41)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
