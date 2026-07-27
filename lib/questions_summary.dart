import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
        ),
        child: SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: summaryData.map((data) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(((data['question_index'] as int)+ 1).toString()),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(data['question'] as String),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(data['user_answer'] as String),
                            Text(data['correct_answer'] as String),
                          ],
                        ),
                      )
                    ],
                  );
                }).toList(),

          ),
        ),
            ),
      );
  }
}