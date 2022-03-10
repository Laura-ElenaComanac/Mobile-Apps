// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import 'package:provider/provider.dart';
// import 'package:examen/menus/menu_drawer.dart';
// import 'package:examen/repository/bloc.dart';
// import 'package:examen/repository/database.dart';

// class VehiclesScreen extends StatefulWidget {
//   const VehiclesScreen({Key? key}) : super(key: key);

//   @override
//   _VehiclesScreenState createState() => _VehiclesScreenState();
// }

// class _VehiclesScreenState extends State<VehiclesScreen> {
//   Bloc get bloc => Provider.of<Bloc>(context, listen: false);
//   Logger logger = Logger();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Colors Vehicles'),
//           backgroundColor: Colors.purple,
//         ),
//         drawer: const MenuDrawer(),
//         body: StreamBuilder<List<EntityColorEntry>>(
//             stream: bloc.entitysWithColorEntries,
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Align(
//                   alignment: Alignment.center,
//                   child: CircularProgressIndicator(),
//                 );
//               }

//               final entitycolors = snapshot.data!;
//               logger.d("!!!!final vehicles: " + entitycolors.toString());

//               return ListView.builder(
//                   itemCount: entitycolors.length,
//                   itemBuilder: (context, index) {
//                     EntityColorEntry entitycolor = EntityColorEntry(
//                         id: entitycolors[index].id,
//                         license: entitycolors[index].license,
//                         status: entitycolors[index].status,
//                         seats: entitycolors[index].seats,
//                         driver: entitycolors[index].driver,
//                         color: entitycolors[index].color,
//                         cargo: entitycolors[index].cargo);

//                     return Column(children: [
//                       ListTile(
//                         title: Text(entitycolor.toString()),
//                       ),
//                     ]);
//                   });
//             }));
//   }
// }
