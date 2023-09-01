import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_finder/modules/home/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recipe Generator",
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepOrange,
        textTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.deepOrange,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 10,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 248, 238),
      ),
    );
  }
}
