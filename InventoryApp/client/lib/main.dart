import 'package:examen/repository/bloc.dart';
import 'package:examen/screens/intro_screen.dart';
import 'package:examen/screens/register_screen.dart';
import 'package:examen/screens/vehicles_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const ProjyApp());

class ProjyApp extends StatelessWidget {
  const ProjyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //late WebSocketHelper ws;
    return Provider<Bloc>(
        create: (_) {
          Bloc bloc = Bloc();
          //ws = WebSocketHelper(bloc);
          return bloc;
        },
        dispose: (_, bloc) => {bloc.close()}, //, ws.dispose()},
        //providers: [ChangeNotifierProvider.value(value: UserListViewModel())],
        child: MaterialApp(
          title: 'Taxi',
          routes: {
            '/': (context) => IntroScreen(),
            '/register': (context) => RegisterScreen(),
            //'/vehicles': (context) => VehiclesScreen()
          },
          initialRoute: '/',
        ));
  }
}
