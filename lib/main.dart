import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/pages/home_page.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  // open the hive box
  var myBox = await Hive.openBox('todoBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
