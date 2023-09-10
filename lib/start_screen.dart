import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
              color: Color.fromARGB(216, 237, 236, 238),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            label: const Text(
              'Start Quiz',
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
          ),
        ],
      ),
    );
  }
}
