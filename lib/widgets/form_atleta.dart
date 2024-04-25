import 'package:fitness/repositories/atletas.dart';
import 'package:fitness/validators/formatters/telefone_formatter.dart';
import 'package:fitness/validators/mixins/validations_mixin.dart';
import 'package:flutter/material.dart';

import '../models/atleta.dart';
import '../validators/formatters/cpf_formatter.dart';

class FormAtleta extends StatefulWidget {
  Atleta atleta;

  FormAtleta({Key? key, required this.atleta}) : super(key: key);

  @override
  _FormAtletaState createState() => _FormAtletaState();
}

class _FormAtletaState extends State<FormAtleta> with ValidationsMixin {
  final _form = GlobalKey<FormState>();

  String quantidade = '';

  @override
  Widget build(BuildContext context) {
    final avatar = TextEditingController(text: widget.atleta.avatar);
    final nome = TextEditingController(text: widget.atleta.nome);
    final cpf = TextEditingController(text: widget.atleta.cpf);
    final telefone = TextEditingController(text: widget.atleta.telefone);
    final email = TextEditingController(text: widget.atleta.email);
    final endereco = TextEditingController(text: widget.atleta.endereco);

    comprar() {
      if (_form.currentState!.validate()) {
        Atleta atleta = Atleta(
          id: widget.atleta.id,
          nome: nome.text,
          avatar: avatar.text,
          cpf: cpf.text,
          telefone: telefone.text,
          email: email.text,
          endereco: endereco.text,
        );

        AtletasRepository().updateAtleta(atleta);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Compra realizada com' + atleta.nome)),
        );

        Navigator.pop(context);
      }
    }

    return Form(
        key: _form,
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.atleta.avatar ?? ''),
                      minRadius: 32,
                    ),
                    Positioned(
                      height: 64,
                      width: 64,
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          icon: const Icon(Icons.edit_outlined,
                              color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
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
                      () => hasMinChars(value, 6),
                    ]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: cpf,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CPF',
                    ),
                    inputFormatters: [CPFFormatter(initialText: cpf.text)],
                    keyboardType: TextInputType.number,
                    validator: (value) => combine([
                      () => isNotEmpty(value),
                      () => isCPF(value),
                    ]),
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: TextFormField(
                    controller: telefone,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefone',
                    ),
                    inputFormatters: [
                      TelefoneFormatter(initialText: telefone.text)
                    ],
                    keyboardType: TextInputType.phone,
                    validator: (value) => combine([
                      () => isNotEmpty(value),
                      () => isTelefone(value),
                    ]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => combine([
                () => isNotEmpty(value),
                () => isEmail(value),
                () => hasMinChars(value, 10),
              ]),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: endereco,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enderço',
              ),
              keyboardType: TextInputType.streetAddress,
              validator: (value) => combine([
                () => isNotEmpty(value),
                () => hasMinChars(value, 10),
              ]),
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
                  onPressed: () => comprar(),
                  child: const Text('Salvar'),
                ),
              ],
            )
          ],
        ));
  }
}
