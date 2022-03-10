// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import 'package:provider/provider.dart';
// import 'package:examen/menus/menu_drawer.dart';
// import 'package:examen/repository/bloc.dart';
// import 'package:examen/repository/database.dart';

// class DriversScreen extends StatefulWidget {
//   const DriversScreen({Key? key}) : super(key: key);

//   @override
//   _DriversScreenState createState() => _DriversScreenState();
// }

// class _DriversScreenState extends State<DriversScreen> {
//   Bloc get bloc => Provider.of<Bloc>(context, listen: false);
//   Logger logger = Logger();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Drivers'),
//           backgroundColor: Colors.purple,
//         ),
//         drawer: const MenuDrawer(),
//         body: StreamBuilder<List<DriverEntry>>(
//             stream: bloc.driverEntries,
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Align(
//                   alignment: Alignment.center,
//                   child: CircularProgressIndicator(),
//                 );
//               }

//               final drivers = snapshot.data!;
//               logger.d("!!!!final drivers: " + drivers.toString());

//               return ListView.builder(
//                   itemCount: drivers.length,
//                   itemBuilder: (context, index) {
//                     DriverEntry driver = drivers[index];
//                     return Column(children: [
//                       ListTile(
//                         onTap: () {
//                           // bloc.deleteAllTaxiColors();
//                           // bloc.setColor(color);
//                           // bloc.getTaxisWithColor();
//                         },
//                         title: Text(driver.driver + "," + driver.seats),
//                       ),
//                     ]);
//                   });
//             }));
//   }
// }
