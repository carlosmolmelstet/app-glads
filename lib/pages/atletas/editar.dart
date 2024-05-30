import 'package:fitness/models/atleta.dart';
import 'package:flutter/material.dart';

import '../../widgets/form_atleta.dart';
import '../../widgets/navbar.dart';

class EditarAtletaPage extends StatelessWidget {
  final Atleta? atleta;

  const EditarAtletaPage({super.key, this.atleta});

  @override
  Widget build(BuildContext context) {
    backFunction() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: appBar(backFunction),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Editar Atleta",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: FormAtleta(atleta: atleta),
            ),
          ],
        ),
      ),
      drawer: const Navbar(selectedIndex: 0),
    );
  }

  AppBar appBar(void Function()? backFunction) {
    return AppBar(
      actions: [BackButton(onPressed: backFunction)],
    );
  }
}
