import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_uni/constants/app_router.dart';
import 'package:quiz_uni/constants/colors.dart';
import 'package:quiz_uni/constants/styles.dart';
import 'package:quiz_uni/widgets/appbar.dart';
import 'package:quiz_uni/widgets/button.dart';
import 'package:quiz_uni/provider/question_provider.dart';
import 'package:quiz_uni/widgets/option_create.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionProvider>(
      builder: (context, value, child) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              title: 'Create Quiz',
            ),
          ),
          body: CustomScrollView(slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      borderRadius: 14,
                      isCenter: true,
                      width: double.infinity,
                      height: 40,
                      text: '+  Add New Question',
                      function: () {
                        Navigator.pushNamed(context, AppRouter.addNewQuestion);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: value.quizQuestion.length,
                        itemBuilder: (context, index) => Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(18),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      value.quizQuestion[index].question ??
                                          ' What is Flutter',
                                      style: Styles.blackBold.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (dContext) {
                                            return AlertDialog(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8))),
                                              actionsPadding:
                                                  const EdgeInsets.all(0),
                                              title: const Text(
                                                'DeleteQuestion',
                                              ),
                                              content: const Text(
                                                'Are you sure you want to delete this question?',
                                                style: TextStyle(height: 1.6),
                                              ),
                                              contentTextStyle: const TextStyle(
                                                  color: Colors.black),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .tealColor),
                                                    )),
                                                TextButton(
                                                  onPressed: () async {
                                                    await value.delete(
                                                        value
                                                                .quizQuestion[
                                                                    index]
                                                                .questionNumber ??
                                                            0);
                                                    const snackBar = SnackBar(
                                                      content: Text(
                                                          'Question deleted'),
                                                    );

                                                    // ignore: use_build_context_synchronously
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(snackBar);

                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .tealColor),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      size: 25,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Option(
                                option: value.quizQuestion[index].choices![0],
                                color: value.quizQuestion[index].answer == 'A'
                                    ? AppColors.greenColor
                                    : AppColors.white,
                                textColor:
                                    value.quizQuestion[index].answer == 'A'
                                        ? AppColors.white
                                        : AppColors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Option(
                                option: value.quizQuestion[index].choices![1],
                                color: value.quizQuestion[index].answer == 'B'
                                    ? AppColors.greenColor
                                    : AppColors.white,
                                textColor:
                                    value.quizQuestion[index].answer == 'B'
                                        ? AppColors.white
                                        : AppColors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Option(
                                option: value.quizQuestion[index].choices![2],
                                color: value.quizQuestion[index].answer == 'C'
                                    ? AppColors.greenColor
                                    : AppColors.white,
                                textColor:
                                    value.quizQuestion[index].answer == 'C'
                                        ? AppColors.white
                                        : AppColors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Option(
                                option: value.quizQuestion[index].choices![3],
                                color: value.quizQuestion[index].answer == 'D'
                                    ? AppColors.greenColor
                                    : AppColors.white,
                                textColor:
                                    value.quizQuestion[index].answer == 'D'
                                        ? AppColors.white
                                        : AppColors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }
}
