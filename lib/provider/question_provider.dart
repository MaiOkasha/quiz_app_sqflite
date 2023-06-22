import 'package:flutter/cupertino.dart';
import 'package:quiz_uni/database/datebase_controller.dart';
import 'package:quiz_uni/models/question.dart';
import 'package:quiz_uni/constants/sigleton.dart';
import 'package:quiz_uni/screens/quiz_result/fail_screen.dart';

import '../constants/app_router.dart';

class QuestionProvider extends ChangeNotifier {
  QuestionProvider() {
    selectQuestions();
    focusNode = FocusNode();
    focusNode.addListener(_onFocusChange);
  }

  TextEditingController questionController = TextEditingController();
  TextEditingController firstChoiceController = TextEditingController();
  TextEditingController secondChoiceController = TextEditingController();
  TextEditingController thirdChoiceController = TextEditingController();
  TextEditingController fourthChoiceController = TextEditingController();

  clear() {
    questionController.clear();
    firstChoiceController.clear();
    secondChoiceController.clear();
    thirdChoiceController.clear();
    fourthChoiceController.clear();
  }

  late FocusNode focusNode;
  bool isFocused = false;

  void _onFocusChange() {
    isFocused = focusNode.hasFocus;
    notifyListeners();
  }

  DbController dbController = getInstance.get<DbController>();
  List<Question> quizQuestion = [];
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String value2 = 'A';
  String dropdownValue = 'A';
  int score = 0;

  checkAnswer(BuildContext context, String option, int index) {
    if (option == quizQuestion[index].answer) {
      score++;
      notifyListeners();
    }

    if (index + 1 == quizQuestion.length) {
      if (score < 5) {
        Navigator.pushNamed(context, AppRouter.fail,
            arguments: FailScreen(score: score));
      } else if (score == 5) {
        Navigator.pushNamed(context, AppRouter.mid,
            arguments: FailScreen(score: score));
      } else {
        Navigator.pushNamed(context, AppRouter.sucsses,
            arguments: FailScreen(score: score));
      }
    }
    score == 0;

    notifyListeners();
  }

  Future<dynamic> insert(Question question) async {
    await dbController.insert(question);

    selectQuestions();
  }

  fillLists(List<Question> questions) {
    quizQuestion = questions;
    notifyListeners();
  }

  selectQuestions() async {
    List<Question> questionsList = await dbController.readAllQuestions();
    fillLists(questionsList);
  }

  delete(int questionNumber) async {
    await dbController.delete(questionNumber);
    selectQuestions();
    notifyListeners();
  }
}
