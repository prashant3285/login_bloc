import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return Provider(
      child: MaterialApp(
        title: 'Login Screen',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
