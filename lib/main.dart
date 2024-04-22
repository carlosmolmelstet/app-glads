import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glads',
      theme: const MaterialTheme(TextTheme()).light(),
      home: const HomePage()
    );
  }
}

