import 'package:flutter/material.dart';

class NotifiCationPage extends StatefulWidget {
  const NotifiCationPage({super.key});

  @override
  State<NotifiCationPage> createState() => _NotifiCationPageState();
}

class _NotifiCationPageState extends State<NotifiCationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Notification page'),
      ),
    );
  }
}
