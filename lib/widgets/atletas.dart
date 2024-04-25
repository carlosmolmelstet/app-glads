import 'package:fitness/pages/atletas/editar.dart';
import 'package:flutter/material.dart';

class Atletas extends StatefulWidget {
  const Atletas({super.key});

  @override
  State<Atletas> createState() => _AtletasState();
}

class _AtletasState extends State<Atletas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: const Text('Ir para Carlos'),
    );
  }
}
