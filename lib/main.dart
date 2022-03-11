import 'package:application_1/form_textForm/code1.dart';
import 'package:application_1/radio/Screen2.dart';
import 'package:application_1/radio/code2.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      'radio': ((context) => radio('')),
      //'Screen2': (context) => Screen2()
    },
    onGenerateRoute: (RouteSettings routeSettings) {
      String? name = routeSettings.name;
      var arguments = routeSettings.arguments;/*
      if (name == 'radio') {
        return MaterialApp(
          builder: (context) {
            return Screen2(arguments);
          },
        );
      }*/
    },
    home: screen(),
  ));
}

class screen extends StatefulWidget {
  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [radio('')],
        ),
      ),
    );
  }
}
