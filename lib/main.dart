import 'package:first_app/env/hiveInit.dart';
import 'package:first_app/screens/home_page.dart';
import 'package:first_app/screens/profile_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {ProfileScreen.routeName: (ctx) => ProfileScreen()},
      home: HomePage(),
    );
  }
}
