import 'package:chat_app/screens/set_pin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFFFCAc34),
        scaffoldBackgroundColor: const Color(0xFF0C0C0C),
       textTheme: GoogleFonts.onestTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: SetPinScreen(),
    );
  }
}
