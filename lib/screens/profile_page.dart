import 'package:first_app/core/database/userDB.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/ProfileScreen';
  final _formKey = GlobalKey<FormState>();
  dynamic _name = '';

  void onFormSubmit() {
    _formKey.currentState!.save();
    UserDB _userDB = UserDB();
    _userDB.saveData(name: _name);
  }

  @override
  Widget build(BuildContext context) {
    final _arg = ModalRoute.of(context)!.settings.arguments;
    print(_arg);

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
                  onSaved: (_val) {
                    _name = _val!;
                  },
                ),
                TextButton(onPressed: () => onFormSubmit(), child: Text('Done'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar customAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop("name result");
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
