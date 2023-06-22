import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_uni/screens/home_screen.dart';
import 'package:quiz_uni/provider/question_provider.dart';
import 'package:quiz_uni/screens/invaild_number_question.dart';
import 'package:quiz_uni/screens/create_quiz.dart';
import '../screens/start_quiz_screen.dart';
import '../screens/add_question.dart';
import '../screens//quiz_result/fail_screen.dart';
import '../screens//quiz_result/scuess_screen.dart';
import '../screens//quiz_result/mid_screen.dart';

abstract class AppRouter {
  static const String home = '/home_screen';
  static const String addNewQuestion = '/AddNewQuestion';
  static const String createQuiz = '/QuizQuestion';
  static const String startQuiz = '/StatrQuiz';
  static const String invaild = '/inavaild';
  static const String sucsses = '/sucses_screen';
  static const String fail = '/fail_screen';
  static const String mid = '/mid_screen';

  static Route? generatedRoute(RouteSettings settings) {
    String x = '';
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case addNewQuestion:
        return MaterialPageRoute(
          builder: (_) => const AddNewQuestion(),
        );
      case createQuiz:
        return MaterialPageRoute(
          builder: (_) => const CreateQuiz(),
        );
      case startQuiz:
        return MaterialPageRoute(
          builder: (_) => StartQuizScreen(),
        );
      case invaild:
        return MaterialPageRoute(
          builder: (_) => const InvaildNumberOfQuestions(),
        );
      case sucsses:
        return MaterialPageRoute(
          builder: (BuildContext context) => SucsessScreen(
            score: Provider.of<QuestionProvider>(context, listen: false).score,
          ),
        );
      case mid:
        return MaterialPageRoute(
          builder: (BuildContext context) => MidScreen(
            score: Provider.of<QuestionProvider>(context, listen: false).score,
          ),
        );
      case fail:
        return MaterialPageRoute(
          builder: (BuildContext context) => FailScreen(
            score: Provider.of<QuestionProvider>(context, listen: false).score,
          ),
        );
    }
    return null;
  }
}
