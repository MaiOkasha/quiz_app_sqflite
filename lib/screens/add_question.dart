
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_uni/constants/app_router.dart';
import 'package:quiz_uni/constants/colors.dart';
import 'package:quiz_uni/models/question.dart';
import 'package:quiz_uni/constants/styles.dart';
import 'package:quiz_uni/widgets/appbar.dart';
import 'package:quiz_uni/widgets/button.dart';
import 'package:quiz_uni/widgets/text_field.dart';
import 'package:quiz_uni/provider/question_provider.dart';

import '../widgets/options_widget_add.dart';

class AddNewQuestion extends StatefulWidget {
  const AddNewQuestion({super.key});

  @override
  State<AddNewQuestion> createState() => _AddNewQuestionState();
}

class _AddNewQuestionState extends State<AddNewQuestion> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<QuestionProvider>(
        builder: (context, value, child) => Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(
                title: 'Add new question',
              )),
          body: SingleChildScrollView(
            child: Form(
              key: value.key,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      vaildetor: (p0) {
                        if (p0!.isEmpty) {
                          return 'Question Field is required';
                        }
                        return null;
                      },
                      focusNode: value.focusNode,
                      controller: value.questionController,
                      label: 'Question',
                      hint: 'Enter the question',
                      prefixIcon: Icon(
                        Icons.question_mark,
                        color: value.isFocused ? Colors.teal : Colors.grey,
                      ),
                    ),
                    AddOption(
                      controller: value.firstChoiceController,
                      containerBackColor: Colors.amber,
                      textFieldTitle: 'First Answer',
                      title: 'A',
                    ),
                    AddOption(
                      controller: value.secondChoiceController,
                      containerBackColor: Colors.green,
                      textFieldTitle: 'Second Answer',
                      title: 'B',
                    ),
                    AddOption(
                      controller: value.thirdChoiceController,
                      containerBackColor: Colors.blueGrey,
                      textFieldTitle: 'Third Answer',
                      title: 'C',
                    ),
                    AddOption(
                      controller: value.fourthChoiceController,
                      containerBackColor: Colors.pink,
                      textFieldTitle: 'Fourth Answer',
                      title: 'D',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      Text(
                        'Select the correct Answer',
                        style: Styles.blackBold.copyWith(
                            fontWeight: FontWeight.w400, fontSize: 17),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 100,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: Container(
                            height: 1.5,
                            color: AppColors.greyColor,
                          ),
                          value:
                              Provider.of<QuestionProvider>(context, listen: false)
                                  .value2,
                          onChanged: (String? newValue) {
                            setState(
                              () {
                                Provider.of<QuestionProvider>(context,
                                        listen: false)
                                    .value2 = newValue!;
                              },
                            );
                          },
                          items: [
                            DropdownMenuItem<String>(
                              value: 'A',
                              child: Center(
                                  child: Text(
                                'A',
                                style: Styles.tealBold
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                            ),
                            DropdownMenuItem<String>(
                              value: 'B',
                              child: Center(
                                  child: Text(
                                'B',
                                style: Styles.tealBold
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                            ),
                            DropdownMenuItem<String>(
                              value: 'C',
                              child: Center(
                                  child: Text(
                                'C',
                                style: Styles.tealBold
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                            ),
                            DropdownMenuItem<String>(
                              value: 'D',
                              child: Center(
                                  child: Text(
                                'D',
                                style: Styles.tealBold
                                    .copyWith(fontWeight: FontWeight.w400),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                        width: double.infinity,
                        height: 45,
                        borderRadius: 8,
                        text: 'Add question',
                        isCenter: true,
                        function: () async {
                          if (value.key.currentState!.validate()) {
                            await value.insert(Question(
                              question: value.questionController.text,
                              choices: [
                                (value.firstChoiceController.text),
                                (value.secondChoiceController.text),
                                (value.thirdChoiceController.text),
                                (value.fourthChoiceController.text),
                              ],
                              answer: Provider.of<QuestionProvider>(context,
                                      listen: false)
                                  .value2,
                            ));
                            value.clear();

                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(
                                context, AppRouter.createQuiz);
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
