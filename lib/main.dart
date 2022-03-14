import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/detailpage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        '/details': (context) => Detailpage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple[900],
        scaffoldBackgroundColor: Colors.grey[50],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple[900],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple[900]),
          ),
        ),
      ),
    );
  }
}
