import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'signup_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth UI',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => LoginPage(),
        '/signup': (_) => SignUpPage(),
        '/home': (_) => HomePage(),
      },
    );
  }
}
