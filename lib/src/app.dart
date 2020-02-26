import 'package:flutter/material.dart';
import 'package:messenger_clone_ui/screens/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Messenger UI Clone",
      theme: ThemeData(
        // brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
        ),
      ),
      home: Home(),
    );
  }
}