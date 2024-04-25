import 'package:flutter/material.dart';

import '../../models/atleta.dart';
import '../../repositories/atletas.dart';
import '../../widgets/navbar.dart';
import 'editar.dart';

class ListaAtletasPage extends StatefulWidget {
  const ListaAtletasPage({super.key});

  @override
  State<ListaAtletasPage> createState() => _ListaAtletasPageState();
}

class _ListaAtletasPageState extends State<ListaAtletasPage> {
  final List<Atleta> _atletas = AtletasRepository().getAtletas();
  final List<Atleta> _atletasFiltrados = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _atletasFiltrados.addAll(_atletas);
  }

  void _filterList(String query) {
    _atletasFiltrados.clear();
    if (query.length >= 3) {
      for (var atleta in _atletas) {
        if (atleta.nome.toLowerCase().contains(query.toLowerCase())) {
          _atletasFiltrados.add(atleta);
        }
      }
    } else {
      _atletasFiltrados.addAll(_atletas);
    }
    setState(() {});
  }

  void _mudarDePagina(Atleta atleta) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => EditarAtletaPage(atleta: atleta)));
  }

  void _excluirAtleta(Atleta atleta) {
    _atletas.remove(atleta);
    _atletasFiltrados.remove(atleta);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Lista de atletas",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                labelText: 'Procure por um atleta',
              ),
              controller: _controller,
              onChanged: _filterList,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: _atletasFiltrados.length,
                itemBuilder: (BuildContext context, int index) {
                  String letraInicial =
                      _atletasFiltrados[index].nome.split(' ')[0][0];

                  return Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(children: [
                        Expanded(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    _atletasFiltrados[index].avatar ?? ''),
                                backgroundColor: Colors.red[200],
                                child: _atletasFiltrados[index].avatar == null
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
                                  _atletasFiltrados[index].nome,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () {
                            _mudarDePagina(_atletasFiltrados[index]);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outlined),
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 24, left: 24, right: 24, bottom: 24),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Deseja excluir o atleta, ${_atletasFiltrados[index].nome}?',
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
                                            _excluirAtleta(
                                                _atletasFiltrados[index]);
                                            Navigator.pop(context);
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
              ),
            ),
          ],
        ),
      ),
      drawer: const Navbar(selectedIndex: 0),
    );
  }
}
