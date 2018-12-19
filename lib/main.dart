import 'package:flutter/material.dart';
import 'ui/Home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'AAAA',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new Home(),
    );
  }
}
