


import 'package:flutter/material.dart';
import 'package:untitled/Data/questions.dart';
import 'package:untitled/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.onRestart,
    required this.chosenAnswer,
  });

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> get summary {
    final List<Map<String, Object>> summaryList = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summaryList.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }

    return summaryList;
  }

  @override
  Widget build(BuildContext context) {



    final summaryList = summary;

    final numTotalQuestions = questions.length;

    final numCorrectQuestions = summaryList.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Scaffold(
      backgroundColor:
       Colors.deepPurpleAccent,
      body:SizedBox(
        width: double.infinity,
        child: Container(

        padding: const EdgeInsets.all(40),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    'You answered $numCorrectQuestions out of '
                        '$numTotalQuestions questions correctly!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: QuestionsSummary(summaryList),
                ),

                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: TextButton.icon(
                    onPressed: onRestart,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Restart Quiz',
                      style: TextStyle(fontSize: 20,
                          color: Color.fromARGB(255, 218, 226, 241)),

                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }
}