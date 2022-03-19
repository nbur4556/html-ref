import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/detailpage.dart';
import 'db/db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Database
  final Database db = new Database();
  db.initializeDb();
  List tags = await db.getAllRefTags();

  tags.forEach((tag) {
    print(tag.id);
    print(tag.tagName);
    print(tag.description);
    print(tag.attributes);
  });

  runApp(App());
}

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
