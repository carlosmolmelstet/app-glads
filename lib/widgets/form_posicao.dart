import 'package:fitness/services/firestore.dart';
import 'package:fitness/validators/mixins/validations_mixin.dart';
import 'package:flutter/material.dart';

import '../models/posicao.dart';

class FormPosicao extends StatefulWidget {
  Posicao? posicao;

  FormPosicao({Key? key, this.posicao}) : super(key: key);

  @override
  _FormPosicaoState createState() => _FormPosicaoState();
}

class _FormPosicaoState extends State<FormPosicao> with ValidationsMixin {
  final _form = GlobalKey<FormState>();
  final FirestoreService _firestore = FirestoreService();
  List<Posicao> posicoes = [];

  @override
  void initState() {
    super.initState();
    _loadPosicoes();
  }

  void _loadPosicoes() async {
    posicoes = await _firestore.getPosicoes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final nome = TextEditingController(text: widget.posicao?.nome);

    salvar() async {
      if (_form.currentState!.validate()) {
        Posicao posicao = Posicao(
          id: widget.posicao?.id,
          nome: nome.text,
        );

        if (posicao.id != null) {
          _firestore.updatePosicao(posicao);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Posicao atualizado com sucesso')),
          );
        } else {
          _firestore.createPosicao(posicao);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Posicao criado com sucesso')),
          );
        }

        // Fecha o formulário
        Navigator.pop(context);
      }
    }

    return Form(
        key: _form,
        child: Column(
          children: [
            Flexible(
              child: TextFormField(
                controller: nome,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome completo',
                ),
                keyboardType: TextInputType.name,
                validator: (value) => combine([
                  () => isNotEmpty(value),
                  () => hasMinChars(value, 2),
                ]),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar'),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () => salvar(),
                  child: const Text('Salvar'),
                ),
              ],
            )
          ],
        ));
  }
}
