import 'package:fitness/widgets/navbar.dart';
import 'package:flutter/material.dart';

class PresencasPage extends StatefulWidget {
  const PresencasPage({super.key});

  @override
  State<PresencasPage> createState() => _PresencasPageState();
}

class _PresencasPageState extends State<PresencasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presenças'),
      ),
      body: const Text("Presenças"),
        drawer: const Navbar(selectedIndex: 1),
    );
  }
}