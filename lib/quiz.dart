import 'package:flutter/material.dart';
import 'package:untitled/Data/questions.dart';
import 'package:untitled/questions_screen.dart';
import 'package:untitled/results_scareen.dart';
import 'package:untitled/start_Scareen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswer = [];

  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScareen(switchScreen);
  }

  // رفتن به صفحه سوالات
  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onSlectAnswer: chooseAnswer,
      );
    });
  }

  // انتخاب پاسخ
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswer: [...selectedAnswer],
          onRestart: restartQuiz, // ← این قسمت مهم است
        );
      });
    }
  }

  // شروع دوباره آزمون
  void restartQuiz() {
    setState(() {
      selectedAnswer.clear();
      activeScreen = StartScareen(switchScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 95, 8, 145),
                Color.fromARGB(255, 107, 15, 168),
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