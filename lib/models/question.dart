import 'package:quiz_uni/database/datebase_controller.dart';
import 'package:quiz_uni/constants/sigleton.dart';

class Question {
  int? questionNumber;
  String? question;
  List<String>? choices;
  String? answer;

  Question(
      {required this.question, required this.choices, required this.answer});
  DbController db = getInstance.get<DbController>();
  Question.fromMap(Map<String, dynamic> map) {
    questionNumber = map[db.questionNumber];
    question = map[db.qustionsColumn];
    choices = map[db.choicesColumn].split(',');
    answer = map[db.answerColumn];
  }
  Map<String, dynamic> toMap() {
    return {
      db.qustionsColumn: question,
      db.answerColumn: answer,
      db.choicesColumn: choices?.join(','),
    };
  }
}
