import 'package:dailyquiz/components/custombutton.dart';
import 'package:dailyquiz/functions/quizClass.dart';
import 'package:dailyquiz/functions/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../functions/customprovider.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key, this.quiz});
  Quiz? quiz;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final QuizProvider quizprovider = Provider.of<QuizProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: quiz!.color,
            width: width,
            height: height / 8.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(),
                const SizedBox(),
                Icon(
                  quiz!.icon,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  quiz!.title!,
                  style: headlineWhite.copyWith(fontSize: 32),
                ),
                const SizedBox(),
                const SizedBox(),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "Your result",
                style: headlineBlue.copyWith(fontSize: 32),
              ),
              Text(
                "${quizprovider.rightAnswers.toString()}/${quiz!.questions!.length}",
                style: textRed.copyWith(fontSize: 40),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Custombutton(
              isOnResultPage: true,
              quiz: quiz,
            ),
          )
        ],
      )),
    );
  }
}
