import 'package:dailyquiz/functions/quizClass.dart';
import 'package:dailyquiz/pages/quizpage.dart';
import 'package:flutter/material.dart';

import '../functions/theme.dart';

class QuizBlock extends StatelessWidget {
  QuizBlock({super.key, this.quiz});
  Quiz? quiz;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Quizpage(
                        quiz: quiz,
                      )));
        },
        child: Container(
          height: height / 7,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15), blurRadius: 4, spreadRadius: 4, offset: const Offset(4, 4))
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: height / 7,
                    child: Column(
                      children: [
                        SizedBox(
                          height: (height / 7 - 70) / 2,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: (height / 7 - 70) / 2,
                            right: (height / 7 - 70) / 2,
                          ),
                          child: Container(
                            width: 60,
                            height: 60,
                            color: quiz!.color,
                            child: Icon(
                              quiz!.icon,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 7,
                    width: width - 60 - 70 - (height / 7 - 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: (height / 7 - 70) / 2, right: 20),
                          child: Text(
                            quiz!.title!,
                            maxLines: 2,
                            style: headlineBlue.copyWith(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: blue2,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0, right: 6.0, bottom: 2.0, top: 2.0),
                                  child: Text(
                                    "${quiz!.questions!.length} questions",
                                    style: textWhite.copyWith(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
