import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/services/firestore.dart';
import 'package:flutter/material.dart';
import '../../models/posicao.dart';
import '../../widgets/navbar.dart';
import 'editar.dart';

class ListaPosicoesPage extends StatefulWidget {
  const ListaPosicoesPage({super.key});

  @override
  State<ListaPosicoesPage> createState() => _ListaPosicoesPageState();
}

class _ListaPosicoesPageState extends State<ListaPosicoesPage> {
  final firestoreService = FirestoreService();
  String query = '';

  @override
  void initState() {
    super.initState();
  }

  void _mudarDePagina([Posicao? posicao]) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => EditarPosicaoPage(posicao: posicao)));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // getClientSteam();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void excluirPosicao(String id) async {
      await FirestoreService().deletePosicao(id);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Lista de posições",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[100],
                  ),
                  child: IconButton(
                      onPressed: () => _mudarDePagina(),
                      icon: const Icon(
                        Icons.add,
                        fill: 0.1,
                        weight: 4,
                        color: Colors.blue,
                      )),
                )
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getClientPosicaoSteam(query),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<Posicao> posicoes = snapshot.data!.docs
                      .map((e) => Posicao.fromDocumentSnapshot(e))
                      .toList();

                  return ListView.builder(
                    itemCount: posicoes.length,
                    itemBuilder: (BuildContext context, int index) {
                      Posicao posicao = posicoes[index];
                      String letraInicial = posicao.nome.split(' ')[0][0];

                      return Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      posicao.nome,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.edit_outlined),
                              onPressed: () {
                                _mudarDePagina(posicao);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outlined),
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24,
                                        left: 24,
                                        right: 24,
                                        bottom: 24),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 16),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Deseja excluir o posicao, ${posicao.nome}?',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Voltar'),
                                            ),
                                            const SizedBox(width: 8),
                                            FilledButton(
                                              onPressed: () {
                                                excluirPosicao(posicao.id!);
                                              },
                                              child: const Text('Excluir'),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const Navbar(selectedIndex: 0),
    );
  }
}
