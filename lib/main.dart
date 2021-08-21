import 'package:flutter/material.dart';
import 'package:movie_selector/opening_screen.dart';
import './movie_chooser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movie-selector',
      initialRoute: '/',
      routes: {
        OpeningScreen.routename: (context) => OpeningScreen(),
        MovieChooser.routename: (context) => MovieChooser(),
      },
    );
  }
}
