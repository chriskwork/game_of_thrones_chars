import 'package:flutter/material.dart';
import 'package:gameof_throne/screens/home.dart';
// import 'package:gameof_throne/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black54,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black54,
          foregroundColor: Color(0xFFE5E5E5),
        ),
        colorScheme: ColorScheme.dark(
          primary: Color.fromARGB(255, 215, 183, 0),
          onSurface: Color(0xFFE5E5E5),
        ),
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Color(0xFFE5E5E5),
          displayColor: Color.fromARGB(255, 215, 183, 0),
          fontFamily: GoogleFonts.baskervville().fontFamily,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
