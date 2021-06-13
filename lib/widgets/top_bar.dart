import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final dynamic title;
  final String subtitle;
  final Color color;

  TopBar({
    required this.subtitle,
    required this.title,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      color: color,
      child: Row(
        children: [
          CircleAvatar(
            radius: 71,
            backgroundColor: Color(0xffaaaaaa),
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/59326665?v=4'),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
