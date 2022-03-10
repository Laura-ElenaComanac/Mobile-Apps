import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:examen/menus/menu_bottom.dart';
import 'package:examen/menus/menu_drawer.dart';
import 'package:examen/repository/bloc.dart';
import 'package:examen/repository/database.dart';
import 'package:examen/screens/vehicles_screen.dart';

import 'list_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  Bloc get bloc => Provider.of<Bloc>(context, listen: false);
  Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          backgroundColor: Colors.purple,
        ),
        drawer: const MenuDrawer(),
        body: StreamBuilder<List<ProductEntry>>(
            stream: bloc.productsEntries,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }

              final products = snapshot.data!;
              logger.d("!!!!final colors: " + products.toString());

              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    //String color = colors[index].color;
                    ProductEntry productEntry = products[index];
                    return Column(children: [
                      ListTile(
                        onTap: () {
                          // bloc.deleteAllEntityColors();
                          // bloc.setColor(color);
                          // bloc.getEntitysWithColor();
                          // Navigator.pushNamed(context, '/vehicles');
                        },
                        title: Text(productEntry.toString()),
                      ),
                    ]);
                  });
            }));
  }
}
