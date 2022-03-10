import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen/model/entity.dart';
import 'package:examen/repository/bloc.dart';
import 'package:examen/repository/database.dart';

class ListWidget extends StatefulWidget {
  //final UserEntry entry;
  final List<EntityEntry> entitys;
  final Function deleteFunction;
  const ListWidget(this.entitys, this.deleteFunction, {Key? key})
      : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  Bloc get bloc => Provider.of<Bloc>(context, listen: false);

  bool toBoolean(String str, [bool strict = false]) {
    if (strict == true) {
      return str == '1' || str == 'true';
    }
    return str != '0' && str != 'false' && str != '';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.entitys.length,
        itemBuilder: (context, index) {
          final entity = EntityEntry(
              id: widget.entitys[index].id,
              nume: widget.entitys[index].nume,
              tip: widget.entitys[index].tip,
              cantitate: widget.entitys[index].cantitate,
              pret: widget.entitys[index].pret,
              status: widget.entitys[index].status,
              discount: widget.entitys[index].discount);

          final myEntity = Entity(
              id: int.parse(widget.entitys[index].id),
              nume: widget.entitys[index].nume,
              tip: widget.entitys[index].tip,
              cantitate: int.parse(widget.entitys[index].cantitate),
              pret: int.parse((widget.entitys[index].pret)),
              status: toBoolean(widget.entitys[index].status),
              discount: int.parse(widget.entitys[index].discount));

          final struser = myEntity.toString();

          return Dismissible(
            key: UniqueKey(),
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm"),
                    content: const Text(
                        "Are you sure you wish to delete this item?"),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("DELETE")),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("CANCEL"),
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) {
              //setState(() {});
              widget.deleteFunction(index);
            },
            background: Container(color: Colors.red),
            child: StreamBuilder(builder: (context, snapshot) {
              return Column(children: [
                ListTile(
                  onTap: () {
                    bloc.setEntity(entity);
                  },
                  title: Text(struser),
                ),
              ]);
            }),
          );
        });
  }
}
