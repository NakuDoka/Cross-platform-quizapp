import 'package:dailyquiz/components/alternativebutton.dart';
import 'package:dailyquiz/components/custombutton.dart';
import 'package:dailyquiz/functions/customprovider.dart';
import 'package:dailyquiz/functions/quizClass.dart';
import 'package:dailyquiz/functions/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Quizpage extends StatefulWidget {
  Quizpage({super.key, this.quiz});
  Quiz? quiz;

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final QuizProvider quizprovider = Provider.of<QuizProvider>(context);
    List options = widget.quiz!.questions![quizprovider.index]["options"];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: height - 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: widget.quiz!.color,
                width: width,
                height: height / 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(),
                    const SizedBox(),
                    Icon(
                      widget.quiz!.icon,
                      color: Colors.white,
                      size: 50,
                    ),
                    Text(
                      widget.quiz!.title!,
                      style: headlineWhite.copyWith(fontSize: 32),
                    ),
                    const SizedBox(),
                    const SizedBox(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 25, right: 25, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${quizprovider.index + 1}/${widget.quiz!.questions!.length}",
                      style: textYellow.copyWith(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.quiz!.questions![quizprovider.index]["question"],
                      style: headlineBlue.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (String option in options)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: InkWell(
                          onTap: () {
                            quizprovider.changeselectOption(options.indexOf(option));
                            if (quizprovider.selectOption == widget.quiz!.questions![quizprovider.index]["answer"]) {
                              quizprovider.changeisOnCorrect(true);
                            } else {
                              quizprovider.changeisOnCorrect(false);
                            }
                          },
                          child: AlternativeButton(
                            optionText: option,
                            isChosen: options.indexOf(option) == quizprovider.selectOption,
                          ),
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Center(
                    child: Custombutton(
                  isFinaleQuestion: quizprovider.index == widget.quiz!.questions!.length - 1,
                  quiz: widget.quiz,
                )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
