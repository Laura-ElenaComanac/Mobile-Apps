import 'package:flutter/material.dart';
import 'package:examen/screens/products_screen.dart';
import 'package:examen/screens/drivers_screen.dart';
import 'package:examen/screens/intro_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = ['Home', 'Cheapest Products'];
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.purple),
        child:
            Text('Menu', style: TextStyle(color: Colors.white, fontSize: 28))));

    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(element, style: TextStyle(fontSize: 18)),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = IntroScreen();
                break;
              case 'Cheapest Products':
                screen = ProductsScreen();
                break;
              // case 'Drivers':
              //   screen = DriversScreen();
              //   break;
            }
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    });
    return menuItems;
  }
}
