import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: summaryData.length,
        itemBuilder: (context, index) {
          final data = summaryData[index];

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "Your answer: ${data['user_answer']}",
                    ),

                    Text(
                      "Correct answer: ${data['correct_answer']}",
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                    ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}