import 'dart:io';

import 'package:fitness/services/firestore.dart';
import 'package:fitness/validators/formatters/telefone_formatter.dart';
import 'package:fitness/validators/mixins/validations_mixin.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/atleta.dart';
import '../models/posicao.dart';
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
  List<Posicao> posicoes = [];
  String? selectedPosicaoId;

  final TextEditingController avatarController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadPosicoes();
    if (widget.atleta != null) {
      selectedPosicaoId = widget.atleta!.posicaoId ?? '';
      avatarController.text = widget.atleta!.avatar ?? '';
      nomeController.text = widget.atleta!.nome;
      cpfController.text = widget.atleta!.cpf;
      telefoneController.text = widget.atleta!.telefone;
      emailController.text = widget.atleta!.email;
      enderecoController.text = widget.atleta!.endereco;
    }
  }

  void _loadPosicoes() async {
    posicoes = await _firestore.getPosicoes();
    setState(() {});
  }

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
    salvar() async {
      if (_form.currentState!.validate()) {
        String? imageUrl;
        Atleta atleta = Atleta(
          id: widget.atleta?.id,
          nome: nomeController.text,
          avatar: "",
          cpf: cpfController.text,
          telefone: telefoneController.text,
          email: emailController.text,
          endereco: enderecoController.text,
          posicaoId: selectedPosicaoId, // Adicionando posicaoId
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
                    controller: nomeController,
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
                    controller: cpfController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CPF',
                    ),
                    inputFormatters: [
                      CPFFormatter(initialText: cpfController.text)
                    ],
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
                    controller: telefoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefone',
                    ),
                    inputFormatters: [
                      TelefoneFormatter(initialText: telefoneController.text)
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
              controller: emailController,
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
              controller: enderecoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Endereço',
              ),
              keyboardType: TextInputType.streetAddress,
              validator: (value) => combine([
                () => isNotEmpty(value),
                () => hasMinChars(value, 10),
              ]),
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: selectedPosicaoId,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Posição',
              ),
              items: posicoes.map((Posicao posicao) {
                return DropdownMenuItem<String>(
                  value: posicao.id,
                  child: Text(posicao.nome),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPosicaoId = newValue;
                });
              },
              validator: (value) =>
                  value != null ? null : 'Selecione uma posição',
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
