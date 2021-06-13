import 'package:flutter/material.dart';

class PhotoTile extends StatelessWidget {
  final dynamic url;

  PhotoTile({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }
}
