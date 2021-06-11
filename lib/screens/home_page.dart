import 'package:dio/dio.dart';
import 'package:first_app/models/photos_model.dart';
import 'package:first_app/screens/profile_page.dart';
import 'package:first_app/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:first_app/env/keys.dart' as config;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PhotosModel> _photosData = [];

  Future<void> _fetchPhotos() async {
    final _doInstance = Dio();

    _doInstance.options.headers['Authorization'] =
        "Client-ID ${config.unsplashKey}";

    final _fetchData = await _doInstance.get('https://api.unsplash.com/photos');

    for (var _items in _fetchData.data) {
      setState(() {
        _photosData.add(
            PhotosModel(id: _items['id'], imgURL: _items['url']['regular']));
      });
    }
  }

  @override
  void initState() {
    _fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: Hive.box('profile').listenable(),
                builder: (BuildContext context, Box value, Widget? child) =>
                    TopBar(
                  title: value.get('name'),
                  subtitle: 'Developer',
                  color: Colors.cyan,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '  Projects',
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff0B3D2E),
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: _photosData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (ctx, index) => Container(
                  child: Image.network(
                    _photosData[index].imgURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ProfileScreen.routeName);
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
