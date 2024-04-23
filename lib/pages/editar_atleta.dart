import 'package:flutter/material.dart';

import '../widgets/navbar.dart';

class EditarAtleta extends StatelessWidget {
  final String atleta;

  const EditarAtleta({super.key, required this.atleta});



  @override
  Widget build(BuildContext context) {


      backFunction() {
        Navigator.pop(context);
      }


    return Scaffold(
      appBar: appBar(backFunction),
      body:  Text(atleta),
      drawer: const Navbar(selectedIndex: 0),
    );
  }


  AppBar appBar(void Function()? backFunction) {
    return AppBar(
      title: const Text('Editar atleta'),
      actions: [BackButton(onPressed: backFunction)],
    );
  }
}

