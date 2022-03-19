import 'package:flutter/material.dart';
import 'package:html_ref/models/ref_tag.dart';
import 'screens/homepage.dart';
import 'screens/detailpage.dart';
import 'db/db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Database
  final Database db = new Database();
  db.initializeDb();
  List<RefTag> tagData = await db.getAllRefTags();

  runApp(App(tagData));
}

class App extends StatelessWidget {
  List<RefTag> tagData;

  App(this.tagData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(tagData),
        '/details': (context) => Detailpage(tagData),
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
