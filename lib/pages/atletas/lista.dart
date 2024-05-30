import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/services/firestore.dart';
import 'package:flutter/material.dart';
import '../../models/atleta.dart';
import '../../widgets/navbar.dart';
import 'editar.dart';

class ListaAtletasPage extends StatefulWidget {
  const ListaAtletasPage({super.key});

  @override
  State<ListaAtletasPage> createState() => _ListaAtletasPageState();
}

class _ListaAtletasPageState extends State<ListaAtletasPage> {
  final firestoreService = FirestoreService();
  String query = '';

  @override
  void initState() {
    super.initState();
  }

  void _mudarDePagina([Atleta? atleta]) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => EditarAtletaPage(atleta: atleta)));
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Atleta> filtrarAtletas(List<Atleta> atletas, String query) {
    if (query.length < 3) return atletas;

    return atletas
        .where((element) =>
            element.nome.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  void didChangeDependencies() {
    // getClientSteam();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void excluirAtleta(String id) async {
      await FirestoreService().deleteAtleta(id);
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
                  "Lista de atletas",
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
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                labelText: 'Procure por um atleta',
              ),
              onChanged: (value) => setState(() {
                query = value;
              }),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firestoreService.getClientSteam(query),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List<Atleta> atletas = filtrarAtletas(
                      snapshot.data!.docs
                          .map((e) => Atleta.fromDocumentSnapshot(e))
                          .toList(),
                      query);

                  return ListView.builder(
                    itemCount: atletas.length,
                    itemBuilder: (BuildContext context, int index) {
                      Atleta atleta = atletas[index];
                      String letraInicial = atleta.nome.split(' ')[0][0];

                      return Container(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(children: [
                            Expanded(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(atleta.avatar ?? ''),
                                    backgroundColor: Colors.red[200],
                                    child: atleta.avatar == null
                                        ? Text(
                                            letraInicial,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          )
                                        : const SizedBox(),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      atleta.nome,
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
                                _mudarDePagina(atleta);
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
                                            'Deseja excluir o atleta, ${atleta.nome}?',
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
                                                excluirAtleta(atleta.id!);
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
