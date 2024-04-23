import 'package:fitness/pages/editar_atleta.dart';
import 'package:flutter/material.dart';

import '../widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {

      mudarDePagina() {
        Navigator.push(context, 
          MaterialPageRoute(builder: (_) => const EditarAtleta(atleta: "Atleta 1"))
        );
      }
      
    return Scaffold(
      appBar: appBar(),
      body: FilledButton(
          onPressed: () => mudarDePagina(),
          child:  const Text('Ir para outra pagina'),
        ),
        drawer: const Navbar(selectedIndex: 0),
    );
  }



  AppBar appBar() {
    return AppBar(
      title: const Text('Home'),
    );
  }
}
