import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
        children: const [
          Text("Body of the app teste"),
          SizedBox(height: 40,),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Lista de atletas'),
    );
  }
}