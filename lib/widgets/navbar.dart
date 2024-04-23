import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../pages/lista_atletas.dart';
import 'styled_text.dart';

class Navbar extends StatefulWidget {
  final int selectedIndex;

  const Navbar({super.key, required this.selectedIndex});

  @override
  State<Navbar> createState() => _NavbarState();
}


class _NavbarState extends State<Navbar> {
  



  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.selectedIndex;
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    void navigate(Widget page, int index) {
     Navigator.push(context, MaterialPageRoute(builder: (_) => page));
    setState(() {
      selectedIndex = index;
    });
  }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: const Image(image: AssetImage('assets/images/logo-glads-wide.png')),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child:  StyledText(name: "Menu", style: textTheme.titleSmall!)
          ),
          NavbarItem(
            name: 'Lista de atletas',
            onTap: () => navigate(const HomePage(), 0),
            selected: selectedIndex == 0,
          ),
          NavbarItem(
            name: 'Hisrorico de presença',
            onTap: () => navigate(const ListaAtletas(), 1),
            selected: selectedIndex == 1,
          ),          
            Container(
            padding: const EdgeInsets.only( left: 20, right: 20),
            child:  const Divider()
            )

        ],
      )
    );
  }
}

class NavbarItem extends StatelessWidget {
  const NavbarItem({super.key, required this.name, required this.onTap,  required this.selected});

  final String name;
  final Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: selected ? Theme.of(context).colorScheme.secondaryContainer : Colors.transparent,
      ),
      child: ListTile(
        title: Text(name),
        onTap: onTap,
        selected: selected,
        selectedColor: Theme.of(context).colorScheme.onSecondaryContainer,
        titleTextStyle: Theme.of(context).textTheme.labelLarge,
      )
      );
  }
}
