import 'package:flutter/material.dart';
import 'package:showroom_app/src/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Showroom App',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: const Welcome(),
    );
  }
}