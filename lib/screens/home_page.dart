import 'package:first_app/screens/widgets/top_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopBar(
          title: 'Basith P',
          subtitle: 'Developer',
          color: Colors.black87,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Projects',
          style: TextStyle(fontSize: 22),
        ),
      ],
    )));
  }
}
