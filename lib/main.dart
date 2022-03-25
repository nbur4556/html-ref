import 'package:flutter/material.dart';
import 'package:html_ref/models/ref_tag.dart';
import 'screens/homepage.dart';
import 'screens/detailpage.dart';
import 'db/db.dart';
import './styles/app_theme.dart';

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
      theme: AppThemeData(),
    );
  }
}
