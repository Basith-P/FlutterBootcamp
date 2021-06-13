import 'package:first_app/screens/profile_page.dart';
import 'package:first_app/widgets/photo_grid.dart';
import 'package:first_app/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _profileEdit() {
    Navigator.of(context)
        .pushNamed(ProfileScreen.routeName, arguments: "Basith")
        .then((value) => print("object $value"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileTab(),
              const SizedBox(height: 20),
              Text('  Projects',
                  style: TextStyle(fontSize: 22, color: Color(0xff0B3D2E))),
              const SizedBox(height: 10),
              PhotoGrid(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _profileEdit,
        child: Icon(Icons.edit),
      ),
    );
  }

  ValueListenableBuilder<Box<dynamic>> profileTab() {
    return ValueListenableBuilder(
      valueListenable: Hive.box('profile').listenable(),
      builder: (BuildContext context, Box value, Widget? child) => TopBar(
        title: value.get('name'),
        subtitle: 'Developer',
        color: Colors.cyan,
      ),
    );
  }
}
