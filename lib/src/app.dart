import 'package:bloc_demo/src/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'blocs/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      MaterialApp(
        home: SafeArea(
          child: Scaffold(
            body: LoginScreen(),
          ),
        ),
      ),
    );
  }
}
