import 'dart:io';
import 'dart:typed_data';

import 'package:fitness/services/firestore.dart';
import 'package:fitness/validators/formatters/telefone_formatter.dart';
import 'package:fitness/validators/mixins/validations_mixin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../models/atleta.dart';
import '../validators/formatters/cpf_formatter.dart';

class FormAtleta extends StatefulWidget {
  Atleta? atleta;

  FormAtleta({Key? key, this.atleta}) : super(key: key);

  @override
  _FormAtletaState createState() => _FormAtletaState();
}

class _FormAtletaState extends State<FormAtleta> with ValidationsMixin {
  final _form = GlobalKey<FormState>();
  final FirestoreService _firestore = FirestoreService();
  final imagePicker = ImagePicker();
  File? imageFile;

  String quantidade = '';

  void pick(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final avatar = TextEditingController(text: widget.atleta?.avatar);
    final nome = TextEditingController(text: widget.atleta?.nome);
    final cpf = TextEditingController(text: widget.atleta?.cpf);
    final telefone = TextEditingController(text: widget.atleta?.telefone);
    final email = TextEditingController(text: widget.atleta?.email);
    final endereco = TextEditingController(text: widget.atleta?.endereco);

    salvar() async {
      if (_form.currentState!.validate()) {
        String? imageUrl;
        Atleta atleta = Atleta(
          id: widget.atleta?.id,
          nome: nome.text,
          avatar: "",
          cpf: cpf.text,
          telefone: telefone.text,
          email: email.text,
          endereco: endereco.text,
        );

        if (imageFile != null) {
          imageUrl = await FirestoreService().uploadImage(imageFile!);
          if (imageUrl == null) {
            return;
          }

          atleta.avatar = imageUrl;
        }

        if (atleta.id != null) {
          _firestore.updateAtleta(atleta);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Atleta atualizado com sucesso')),
          );
        } else {
          _firestore.createAtleta(atleta);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Atleta criado com sucesso')),
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
            Row(
              children: [
                Stack(
                  children: [
                    imageFile != null
                        ? CircleAvatar(
                            radius: 32,
                            backgroundImage: FileImage(imageFile!),
                          )
                        : CircleAvatar(
                            radius: 32,
                            backgroundImage:
                                NetworkImage(widget.atleta?.avatar ?? ""),
                          ),
                    Positioned(
                      height: 64,
                      width: 64,
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          icon: const Icon(Icons.edit_outlined,
                              color: Colors.white),
                          onPressed: () {
                            pick(ImageSource.gallery);
                          },
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
                  onPressed: () => salvar(),
                  child: const Text('Salvar'),
                ),
              ],
            )
          ],
        ));
  }
}
