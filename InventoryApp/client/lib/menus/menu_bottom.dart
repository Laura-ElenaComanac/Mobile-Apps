import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.purple,
      fixedColor: Colors.white,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/intro');
            break;
          case 1:
            Navigator.pushNamed(context, '/register');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: 'Add')
      ],
    );
  }
}
