import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyPortofolio',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: .fromSeed(
          brightness: Brightness.light,
          seedColor: Color(0xFF285E8E),        // Rich True Navy
          
          primary: Color(0xFF285E8E),          // Rich True Navy
          secondary: Color(0xFF4A84BA),        // Lively Mid-Blue
          
          surface: Color(0xFFFAFCFD),          // Crisp White
          surfaceContainer: Color(0xFFEEF3F8), // Soft Cool Gray
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

