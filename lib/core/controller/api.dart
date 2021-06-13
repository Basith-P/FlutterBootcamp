import 'package:dio/dio.dart';
import 'package:first_app/env/keys.dart' as config;
import 'package:first_app/models/photos_model.dart';

class PhotosAPI {
  Future<List<PhotosModel>> fetchPhotos() async {
    BaseOptions options = new BaseOptions(
      followRedirects: false,
      validateStatus: (status) => true,
    );

    try {
      final _doInstance = Dio(options);

      _doInstance.options.headers['Authorization'] =
          "Client-ID ${config.unsplashKey}";

      final _fetchData =
          await _doInstance.get('https://api.unsplash.com/photos');

      final List<PhotosModel> _photosData = [];

      for (var _items in _fetchData.data) {
        _photosData.add(
            PhotosModel(id: _items['id'], imgURL: _items['urls']['regular']));
      }
      return _photosData;
    } catch (e) {
      throw e;
    }
  }
}
