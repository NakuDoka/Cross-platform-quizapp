import 'package:dailyquiz/components/quizblock.dart';
import 'package:dailyquiz/functions/database.dart';
import 'package:dailyquiz/functions/quizClass.dart';
import 'package:dailyquiz/functions/theme.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    DatabaseFunctions db = DatabaseFunctions();

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: textGrey.copyWith(fontSize: 18),
                  ),
                  Text(
                    "Lets quiz!",
                    style: headlineBlue.copyWith(fontSize: 24),
                  ),
                  SizedBox(height: height / 35),
                  Text(
                    "Here is the most recent Quizes",
                    style: headlineBlue.copyWith(fontSize: 32),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder(
                  future: db.getQuizes(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Something went wrong");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 30.0,
                          right: 30.0,
                        ),
                        itemBuilder: (context, index) {
                          dynamic data = snapshot.data!.docs[index].data();
                          Quiz quiz = Quiz(
                              questions: data["questions"],
                              color: colors[data["Color"]],
                              icon: IconData(int.parse(data["Icon"]), fontFamily: 'MaterialIcons'),
                              title: data["Title"]);
                          return QuizBlock(
                            quiz: quiz,
                          );
                        },
                      );
                    }
                    return const Text("loading");
                  }),
            )
          ],
        ),
      )),
    );
  }
}
