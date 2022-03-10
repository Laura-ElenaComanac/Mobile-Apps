import 'package:f_logs/model/flog/flog.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:examen/repository/bloc.dart';
import 'package:examen/repository/database.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Bloc get bloc => Provider.of<Bloc>(context, listen: false);

  final TextEditingController txtnume = TextEditingController();
  final TextEditingController txttip = TextEditingController();
  final TextEditingController txtcantitate = TextEditingController();
  final TextEditingController txtpret = TextEditingController();
  final TextEditingController txtstatus = TextEditingController();
  final TextEditingController txtdiscount = TextEditingController();

  String numeMessage = 'nume';
  String tipMessage = 'tip';
  String cantitateMessage = 'cantitate';
  String pretMessage = 'pret';
  String statusMessage = 'status';
  String discountMessage = 'discount';

  @override
  Widget build(BuildContext context) {
    Logger logger = Logger();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
        backgroundColor: Colors.purple,
      ),
      //bottomNavigationBar: HomeBottom(),
      body: Column(children: [
        TextField(
          controller: txtnume,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: numeMessage),
        ),
        TextField(
          controller: txttip,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: tipMessage),
        ),
        TextField(
          controller: txtcantitate,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: cantitateMessage),
        ),
        TextField(
          controller: txtpret,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: pretMessage),
        ),
        TextField(
          controller: txtstatus,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: statusMessage),
        ),
        TextField(
          controller: txtdiscount,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: discountMessage),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ),
            onPressed: () {
              if (txtnume.text == '' ||
                  txttip.text == '' ||
                  txtcantitate.text == '' ||
                  txtpret.text == '' ||
                  txtstatus.text == '' ||
                  txtdiscount.text == '') {
                Widget okButton = TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    return Navigator.of(context, rootNavigator: true)
                        .pop(); // dismisses only the dialog and returns nothing
                  },
                );
                AlertDialog alert = AlertDialog(
                  title: Text("Warning!"),
                  content: Text("No empty fields allowed!"),
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
              } else {
                final entity = EntityEntry(
                    id: '',
                    nume: txtnume.text,
                    tip: txttip.text,
                    cantitate: txtcantitate.text,
                    pret: txtpret.text,
                    status: txtstatus.text,
                    discount: txtdiscount.text);

                bloc.addEntry(entity).then((value) {
                  logger.d("addEntry val: " + value.toString());

                  if (!value) {
                    Widget okButton = TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                        return Navigator.of(context, rootNavigator: true).pop();
                      },
                    );
                    AlertDialog alert = AlertDialog(
                      title: Text("Warning!"),
                      content: Text("No internet connection!"),
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
                  } else {
                    Navigator.pop(context);
                  }
                });
              }
            },
            child: const Text(
              'REGISTER',
              style: TextStyle(fontSize: 18),
            )),
      ]),
    );
  }
}
