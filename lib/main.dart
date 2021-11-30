import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walleto/notes/notes_provider.dart';
import 'package:walleto/ui/home_page.dart';
import 'package:flutter/services.dart';
import 'package:walleto/ui/notes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));
    return ChangeNotifierProvider(
      create: (context) => DbProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          NotesPage.routeName: (context) => NotesPage(),
        },
      ),
    );
  }
}