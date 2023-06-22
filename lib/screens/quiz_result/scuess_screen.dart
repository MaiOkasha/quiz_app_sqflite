import 'package:flutter/material.dart';
import 'package:quiz_uni/constants/assets_constant.dart';
import 'package:quiz_uni/widgets/appbar.dart';
import 'package:quiz_uni/screens/quiz_result/score_widget.dart';

class SucsessScreen extends StatelessWidget {
  SucsessScreen({super.key, required this.score});
  int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(title: 'Quiz App'),
      ),
      body: Center(
        child: ScoreWidget(
          score: score,
          bodytext: 'You\'re a SuperStar!',
          title: 'Congratulations!',
          image: AppAssets.sucsessimage,
          width: 240,
        ),
      ),
    );
  }
}
