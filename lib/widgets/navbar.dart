import 'package:flutter/material.dart';

import '../pages/atletas/lista.dart';
import '../pages/posicoes/lista.dart';

class Navbar extends StatefulWidget {
  final int selectedIndex;

  const Navbar({super.key, required this.selectedIndex});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    void navigate(Widget page) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    }

    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 100,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: const Image(
              image: AssetImage('assets/images/logo-glads-wide.png')),
        ),
        Container(
            padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            child:
                Text("Menu", style: Theme.of(context).textTheme.labelSmall!)),
        NavbarItem(
          name: 'Lista de atletas',
          onTap: () => navigate(const ListaAtletasPage()),
        ),
        NavbarItem(
          name: 'Lista de posições',
          onTap: () => navigate(const ListaPosicoesPage()),
        ),
        Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: const Divider())
      ],
    ));
  }
}

class NavbarItem extends StatelessWidget {
  const NavbarItem({super.key, required this.name, required this.onTap});

  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.transparent,
        ),
        child: ListTile(
          title: Text(name),
          onTap: onTap,
          selectedColor: Theme.of(context).colorScheme.onSecondaryContainer,
          titleTextStyle: Theme.of(context).textTheme.labelLarge,
        ));
  }
}
