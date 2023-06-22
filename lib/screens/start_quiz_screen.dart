
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiz_uni/constants/colors.dart';
import 'package:quiz_uni/widgets/appbar.dart';

import 'package:quiz_uni/provider/question_provider.dart';
import '../widgets/quiz_option_widget.dart';

class StartQuizScreen extends StatelessWidget {
  StartQuizScreen({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(title: 'Quiz App'),
        ),
        body: PageView.builder(
          controller: pageController,
          itemCount: value.quizQuestion.length,
          itemBuilder: (context, index) => Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Question ${index + 1}  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.tealColor,
                          fontSize: 25),
                    ),
                    TextSpan(
                      text: '/ ${value.quizQuestion.length}',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ])),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(13),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.tealColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      value.quizQuestion[index].question!,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageController.hasClients) {
                        pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 4),
                          curve: Curves.easeInOut,
                        );
                      }
                      value.checkAnswer(context, 'A', index);
                    },
                    child: QuizOptionWidget(
                      option: value.quizQuestion[index].choices![0],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageController.hasClients) {
                        pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 4),
                          curve: Curves.easeInOut,
                        );
                      }
                      value.checkAnswer(context, 'B', index);
                    },
                    child: QuizOptionWidget(
                      option: value.quizQuestion[index].choices![1],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageController.hasClients) {
                        pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 4),
                          curve: Curves.easeInOut,
                        );
                      }
                      value.checkAnswer(context, 'C', index);
                    },
                    child: QuizOptionWidget(
                      option: value.quizQuestion[index].choices![2],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (pageController.hasClients) {
                        pageController.animateToPage(
                          index + 1,
                          duration: const Duration(milliseconds: 4),
                          curve: Curves.easeInOut,
                        );
                      }
                      value.checkAnswer(context, 'D', index);
                    },
                    child: QuizOptionWidget(
                      option: value.quizQuestion[index].choices![3],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
