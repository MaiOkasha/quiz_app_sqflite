import 'package:quiz_uni/models/question.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:developer';
import 'package:path/path.dart';

class DbController {
  Database? database;

  initDatabase() async {
    database = await init();
  }

  String table = 'quizTable2';
  String questionNumber = 'id';
  String qustionsColumn = 'question';
  String choicesColumn = 'options';
  String answerColumn = 'answer';

  Future<Database> init() async {
    String databasePath = await getDatabasesPath();
    String databaseName = 'quiz.db';
    String path = join(databasePath, databaseName);
    Database database =
        await openDatabase(path, version: 1, onCreate: (db, i) {
      log(' Database created');
      db.execute('''
 CREATE TABLE $table (
  $questionNumber INTEGER PRIMARY KEY AUTOINCREMENT,
   $qustionsColumn TEXT,
    $choicesColumn TEXT,
    $answerColumn TEXT
    )
''');
    }, onOpen: (db) async {
      final tables =
          await db.rawQuery('SELECT name FROM sqlite_master ORDER BY name;');
      log(tables.toString());
    });
    return database;
  }

  insert(Question question) async {
    int rowIndex = await database!.insert(table, question.toMap());
    log(rowIndex.toString());
  }

  Future<List<Question>> readAllQuestions() async {
    List<Map<String, Object?>> rows = await database!.query(table);
    List<Question> questions =
        rows.map((e) => Question.fromMap(e)).toList();
    return questions;
  }

  Future<void> delete(int id) async {
    await database!.delete(table, where: '$questionNumber=?', whereArgs: [id]);
    id = 0;
    readAllQuestions();
  }
}
