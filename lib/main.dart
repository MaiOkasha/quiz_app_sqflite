import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_uni/constants/app_router.dart';
import 'package:quiz_uni/database/datebase_controller.dart';
import 'package:quiz_uni/constants/sigleton.dart';
import 'package:quiz_uni/provider/question_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  singleton();
  await getInstance.get<DbController>().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionProvider>(
      create: (context) => QuestionProvider(),
      child: const MaterialApp(
        onGenerateRoute: AppRouter.generatedRoute,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.home,
      ),
    );
  }
}
