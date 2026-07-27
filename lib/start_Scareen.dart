import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScareen extends StatelessWidget {
  const StartScareen(this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage(
              'images/quiz-logo.png'),
              width: 300,
          color: Color.fromARGB(255, 207, 196, 196),
          ),
          SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              color: Color.fromARGB(255, 218, 226, 241),
              fontSize: 24,
            )
          ),

          SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: (){
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
