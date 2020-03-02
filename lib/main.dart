import 'package:flutter/material.dart';

import 'archs/mvc/login_page.dart';
import 'archs/mvp/login_page.dart';
import 'archs/mvvm/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPageMVVM(),
    );
  }
}
