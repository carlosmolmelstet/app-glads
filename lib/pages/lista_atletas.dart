import 'package:fitness/widgets/navbar.dart';
import 'package:flutter/material.dart';

class ListaAtletas extends StatefulWidget {
  const ListaAtletas({super.key});

  @override
  State<ListaAtletas> createState() => _ListaAtletasState();
}

class _ListaAtletasState extends State<ListaAtletas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de atletas'),
      ),
      body: const Text("Lista de atletas"),
        drawer: const Navbar(selectedIndex: 1),
    );
  }
}