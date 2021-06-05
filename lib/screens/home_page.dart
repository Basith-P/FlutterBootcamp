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
          color: Colors.black,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '  Projects',
          style: TextStyle(fontSize: 22, color: Color(0xff0B3D2E)),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
            itemBuilder: (ctx, index) => Container(
                  child: Image.network(
                    'https://images.pexels.com/photos/1072179/pexels-photo-1072179.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                    fit: BoxFit.cover,
                  ),
                )),
      ],
    )));
  }
}
