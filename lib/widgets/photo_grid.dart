import 'package:first_app/core/controller/api.dart';
import 'package:first_app/models/photos_model.dart';
import 'package:first_app/widgets/photo_tile.dart';
import 'package:flutter/material.dart';

class PhotoGrid extends StatefulWidget {
  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  List<PhotosModel> _photosData = [];

  Future<void> _fetchPhotos() async {
    PhotosAPI _photosAPI = PhotosAPI();
    List<PhotosModel> _tempPhotosData =
        // ignore: invalid_return_type_for_catch_error
        await _photosAPI.fetchPhotos().catchError((err) => print(err));
    setState(() => _photosData = _tempPhotosData);
  }

  @override
  void initState() {
    _fetchPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: _photosData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
      itemBuilder: (ctx, index) => PhotoTile(
        url: _photosData[index].imgURL,
      ),
    );
  }
}
