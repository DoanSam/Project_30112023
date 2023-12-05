import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter SnackBar Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Hiển thị thông báo khi nút được nhấn
          },
          child: Text('Nhấn vào đây'),
        ),
      ),
    );
  }
}
