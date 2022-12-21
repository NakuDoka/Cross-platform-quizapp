import 'package:dailyquiz/functions/customprovider.dart';
import 'package:dailyquiz/functions/theme.dart';
import 'package:dailyquiz/pages/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../functions/quizClass.dart';

class Custombutton extends StatelessWidget {
  Custombutton({super.key, this.isFinaleQuestion = false, this.isOnResultPage = false, this.quiz});
  bool isFinaleQuestion;
  bool isOnResultPage;
  Quiz? quiz;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final QuizProvider quizprovider = Provider.of<QuizProvider>(context);

    return ElevatedButton(
      onPressed: () {
        if (quizprovider.isOnCorrect) {
          quizprovider.addRightAnswer();
        }
        if (isOnResultPage) {
          quizprovider.resetQuiz();
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
        if (isFinaleQuestion) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(quiz: quiz)));
        }
        if (!isFinaleQuestion && !isOnResultPage) {
          quizprovider.nextPage();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: blue,
        fixedSize: Size(width - 60, 90),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        isOnResultPage ? "Go back to menu" : "Next",
        style: textWhite.copyWith(fontSize: 24),
      ),
    );
  }
}
