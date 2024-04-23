import 'package:flutter/material.dart';

import '../../widgets/navbar.dart';

class ListaAtletasPage extends StatefulWidget {
  const ListaAtletasPage({super.key});

  @override
  State<ListaAtletasPage> createState() => _ListaAtletasPageState();
}

class _ListaAtletasPageState extends State<ListaAtletasPage> {
  List<String> _atletas = [
    'Carlos Eduardo',
    'Carlos Testecar',
    'João',
    'Maria',
    'José',
    'Ana',
    'Pedro',
    'Paulo',
    'Lucas',
    'Luciana',
    'Mariana',
    'Joaquim',
    'Joaquina',
  ];

  List<String> _atletasFiltrados = [];

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _atletasFiltrados.addAll(_atletas);
  }

  void _filterList(String query) {
    _atletasFiltrados.clear();
    if (query.length >= 3) {
      _atletas.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          _atletasFiltrados.add(item);
        }
      });
    } else {
      _atletasFiltrados.addAll(_atletas);
    }
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
            Expanded(
              child: ListView.builder(
                itemCount: _atletasFiltrados.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_atletasFiltrados[index]),
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
