import 'dart:io';

import 'package:first_app/core/database/userDB.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> hiveInit() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  dynamic appDocPath = appDocDir.path;
  Hive.init(appDocPath);

  await UserDB.init();
}
