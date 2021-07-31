import 'package:flutter/material.dart';

import 'screens/movies_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies Info',
      theme: ThemeData(
       fontFamily: 'Gotham'
      ),
      home: HomePage()
    );
  }
}

