import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/ProfileScreen';
  final _formKey = GlobalKey<FormState>();

  void onFormSubmit() {
    print("atft");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                  onSaved: (_val) {},
                ),
                TextButton(onPressed: onFormSubmit, child: Text('Done'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar customAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.teal,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new)),
    );
  }
}
