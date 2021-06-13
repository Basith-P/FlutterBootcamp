import 'package:hive/hive.dart';

class UserDB {
  static dynamic boxName = 'profile';
  static Future<void> init() async => await Hive.openBox(boxName);

  void saveData({required dynamic name}) async {
    Box box = Hive.box(boxName);
    await box.put('name', name);
  }

  dynamic retriveData() {
    Box box = Hive.box(boxName);
    dynamic name = box.get('name');
    return name;
  }
}
