import 'package:get_it/get_it.dart';
import 'package:quiz_uni/constants/app_router.dart';
import 'package:quiz_uni/database/datebase_controller.dart';

final getInstance = GetIt.instance;

void singleton() {
  getInstance.registerSingleton<AppRouter>;
  getInstance.registerSingleton<DbController>(DbController());
}
