import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_uni/constants/app_router.dart';
import 'package:quiz_uni/constants/assets_constant.dart';
import 'package:quiz_uni/constants/colors.dart';
import 'package:quiz_uni/constants/styles.dart';
import 'package:quiz_uni/widgets/button.dart';
import 'package:quiz_uni/provider/question_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tealColor,
        title: Text(
          'Quiz app',
          style: Styles.whiteBold.copyWith(fontSize: 20),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Mai Okasha'),
            accountEmail: Text('maiokasha930@gmail.com'),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(
                  'M',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                )),
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AppRouter.addNewQuestion);
            },
            leading: const Icon(Icons.edit),
            title: const Text('Create Quiz'),
          ),
          ListTile(
            onTap:() {
              log(Provider.of<QuestionProvider>(context, listen: false)
                  .quizQuestion
                  .length
                  .toString());

              if (Provider.of<QuestionProvider>(context, listen: false)
                  .quizQuestion
                  .length <=
                  4) {
                Navigator.pushNamed(context, AppRouter.invaild);
              } else {
                Navigator.pushNamed(context, AppRouter.startQuiz);
              }
            }

            /*() {
              Navigator.pushNamed(context, AppRouter.startQuiz);
            }*/,
            leading: const Icon(Icons.quiz),
            title: const Text('Start Quiz'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              exit(0);
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
          ),
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.homeimage,
              width: 260,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              isCenter: true,
              borderRadius: 10,
              width: 185,
              height: 44,
              text: 'Let\'s Strat!',
              function: () {
                log(Provider.of<QuestionProvider>(context, listen: false)
                    .quizQuestion
                    .length
                    .toString());

                if (Provider.of<QuestionProvider>(context, listen: false)
                        .quizQuestion
                        .length <=
                    4) {
                  Navigator.pushNamed(context, AppRouter.invaild);
                } else {
                  Navigator.pushNamed(context, AppRouter.startQuiz);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
