import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_uni/constants/app_router.dart';
import 'package:quiz_uni/constants/styles.dart';
import 'package:quiz_uni/widgets/button.dart';
import 'package:quiz_uni/provider/question_provider.dart';

class ScoreWidget extends StatelessWidget {
  String title;
  int score;
  String bodytext;
  String image;
  double? width;
  double? height;

  ScoreWidget(
      {super.key,
      required this.score,
      required this.bodytext,
      required this.title,
      required this.image,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Styles.tealBold.copyWith(fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            image,
            width: width,
            height: height,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Your Score : $score / 10',
            style: Styles.greenBold,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            bodytext,
            style: Styles.blackBold.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            borderRadius: 10,
            isCenter: true,
            width: 210,
            height: 50,
            text: 'Back to home',
            function: () {
              Provider.of<QuestionProvider>(context, listen: false).score = 0;
              log(Provider.of<QuestionProvider>(context, listen: false)
                  .score
                  .toString());
              Navigator.pushReplacementNamed(context, AppRouter.home);
            },
          )
        ],
      ),
    );
  }
}
