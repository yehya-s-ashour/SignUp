import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  String name;
  Screen2(this.name);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Return to Screen1'),
              onPressed: () {
                Navigator.of(context).pop('Hello from Screen2');
              },
            ),
          ],
        ),
      ),
    );
  }
}
