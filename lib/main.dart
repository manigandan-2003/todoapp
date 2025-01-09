import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/pages/home_page.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  // open the hive box
  await Hive.openBox('todoBox');

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
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFD71921),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFD71921),
          foregroundColor: Colors.white,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: Color(0xFF1B1B1D),
        ),
      ),
    );
  }
}
