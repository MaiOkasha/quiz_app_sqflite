import 'package:flutter/material.dart';
import 'package:quiz_uni/constants/assets_constant.dart';
import 'package:quiz_uni/widgets/appbar.dart';
import 'package:quiz_uni/screens/quiz_result/score_widget.dart';

class FailScreen extends StatelessWidget {
  FailScreen({super.key, required this.score});
  int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(title: 'Quiz App'),
      ),
      body: Center(
        child: ScoreWidget(
          score: score,
          bodytext: 'Sorry, better luck next time!',
          title: 'Oops!',
          image: AppAssets.failimage,
          width: 200,
        ),
      ),
    );
  }
}
