import 'package:flutter/material.dart';
import 'package:project_30112023/main_page.dart';
import 'package:project_30112023/pages/Welcome/welcome_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Nunito",
      ),
      home: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}
