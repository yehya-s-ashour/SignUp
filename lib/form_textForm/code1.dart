import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class form extends StatefulWidget {
  @override
  State<form> createState() => _formState();
}

class _formState extends State<form> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool flag = false;

  late String password;
  late String email;

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  saveForm() {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState?.save();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              validator: (value) {
                if (value?.length == 0) {
                  return "Required Field";
                } else if (!isEmail(value!)) {
                  return 'Please enter valid email';
                }
              },
              onSaved: (value) {
                print('Email Saved');
                setEmail(value!);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent.withOpacity(0.2),
                  label: Text(
                    'Email',
                    textScaleFactor: 1.2,
                  )),
              obscureText: flag,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: TextFormField(
              validator: (value) {
                if (value?.length == 0) {
                  return "Required Field";
                } else if (value!.length < 6) {
                  return 'Please enter Password more than 6 Charcters';
                }
              },
              onSaved: (value) {
                print('Password Saved');
                setPassword(value!);
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.vpn_key_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent.withOpacity(0.2),
                  label: Text(
                    'Password',
                    textScaleFactor: 1.2,
                  )),
              obscureText: flag,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                saveForm();
                setState(() {});
              },
              child: Text('Save'))
        ],
      ),
    );
  }
}
