import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:examen/data/http_helper.dart';
import 'package:f_logs/model/flog/flog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:examen/menus/menu_drawer.dart';
import 'package:examen/model/entity.dart';
import 'package:examen/repository/bloc.dart';
import 'package:examen/repository/database.dart';
import 'package:examen/screens/list_widget.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../menus/menu_bottom.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  Bloc get bloc => Provider.of<Bloc>(context, listen: false);
  late HttpHelper h = HttpHelper();

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();
    const socketUrl = 'ws://192.168.0.118:3000';
    final WebSocketChannel channel =
        WebSocketChannel.connect(Uri.parse(socketUrl));
    logger.d("Web Socket connected!");

    channel.stream.listen((event) {
      logger.d("!!!!!ws " + event);
      Entity entity = Entity.fromJson(json.decode(event));
      Fluttertoast.showToast(
          msg: "A fost introdus Entity cu id " +
              entity.id.toString() +
              ", nume " +
              entity.nume +
              ", tip " +
              entity.tip +
              ", cantitate " +
              entity.cantitate.toString() +
              ", pret " +
              entity.pret.toString() +
              ", status " +
              entity.status.toString() +
              ", discount " +
              entity.discount.toString());
    }, onError: (error) => logger.d("ws error " + error.toString()));

    // List<UserEntry> users = [];
    // Provider.of<UserListViewModel>(context).users.then((value) {
    //   setState(() {
    //     users = value;
    //   });
    // });

    return Scaffold(
        appBar: AppBar(
          title: const Text('Entity'),
          backgroundColor: Colors.purple,
        ),
        bottomNavigationBar: MenuBottom(),
        // body: UsersListWidget(users, (int index) {
        //   Provider.of<UserListViewModel>(context, listen: false)
        //       .deleteUser(users[index]);
        // })

        drawer: const MenuDrawer(),
        body: StreamBuilder<List<EntityEntry>>(
            stream: bloc.homeScreenEntries,
            builder: (context, snapshot) {
              if (!snapshot.hasData ||
                  (snapshot.hasData && snapshot.data!.isEmpty)) {
                logger.d("No data...");
                return StreamBuilder<ConnectivityResult>(
                    stream: bloc.getConnectivity().onConnectivityChanged,
                    builder: (context, snapshot) {
                      Widget okButton = TextButton(
                        child: Text("Retry"),
                        onPressed: () {
                          bloc.setfetching = true;
                          bloc.updateEntities();
                          bloc.setfetching = false;
                          //return Navigator.of(context, rootNavigator: true)
                          //    .pop();
                        },
                      );
                      AlertDialog alert = AlertDialog(
                        title: const Text("No connection!"),
                        content: const Text("Wanna retry?"),
                        actions: [
                          okButton,
                        ],
                      );
                      logger.d("connectivity changed in stream builder");

                      logger.d("State: " + snapshot.data.toString());
                      if (!snapshot.hasData ||
                          (snapshot.hasData &&
                              snapshot.data == ConnectivityResult.none)) {
                        logger.d("Entered no connectivity!");
                        return alert;
                      } else {
                        if (bloc.fetching) {
                          return const Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return alert;
                        }
                      }
                    });
                // if (!bloc.isConnected()) {
                //   logger.d("!!!!!!Error on GET!!!!!");
                //   // Widget okButton = TextButton(
                //   //   child: Text("Retry"),
                //   //   onPressed: () {
                //   //     bloc.updateEntities();
                //   //     return Navigator.of(context, rootNavigator: true).pop();
                //   //   },
                //   // );
                //   // AlertDialog alert = AlertDialog(
                //   //   title: const Text("No connection!"),
                //   //   content: const Text("Wanna retry?"),
                //   //   actions: [
                //   //     okButton,
                //   //   ],
                //   // );
                //   // showDialog(
                //   //   context: context,
                //   //   builder: (BuildContext context) {
                //   //     return alert;
                //   //   },
                //   // );
                //   return Text("Retry");
                // }
                // return const Align(
                //   alignment: Alignment.center,
                //   child: CircularProgressIndicator(),
                // );
              }

              if (snapshot.hasError) {
                logger.d('!!!!Snapshot error: ' + snapshot.error.toString());
              }

              final entitys = snapshot.data!;
              logger.d("rendering data... " + entitys.length.toString());
              bloc.setfetching = false;
              return ListWidget(entitys, (int index) {
                try {
                  bloc.deleteEntry(entitys[index].id);
                } on Failure catch (f) {
                  FLog.error(
                      className: "IntroScreen",
                      methodName: "deleteEntry",
                      text: f.message);

                  Widget okButton = TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      return Navigator.of(context, rootNavigator: true).pop();
                    },
                  );
                  AlertDialog alert = AlertDialog(
                    title: const Text("Warning!"),
                    content: Text(f.message),
                    actions: [
                      okButton,
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                }
              });
            }));
  }
}
