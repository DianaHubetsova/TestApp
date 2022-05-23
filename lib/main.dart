
import 'package:flutter/material.dart';
import 'package:test_app/ui/authorization_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      home: AuthorizationPage(),
    );
  }
}
