import 'package:fitness/models/posicao.dart';
import 'package:flutter/material.dart';

import '../../widgets/form_posicao.dart';
import '../../widgets/navbar.dart';

class EditarPosicaoPage extends StatelessWidget {
  final Posicao? posicao;

  const EditarPosicaoPage({super.key, this.posicao});

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
                  "Editar Posicão",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: FormPosicao(posicao: posicao),
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
