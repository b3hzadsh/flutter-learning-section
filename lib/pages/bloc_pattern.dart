import 'package:flutter/material.dart';
import 'package:section_all/bloc/bloc.dart';
import 'package:section_all/src/models/my_row.dart';

bool justArrive = true;
Widget willSpawn;

class BloCPattern extends StatelessWidget {
  final TextEditingController _firstMoneyField = new TextEditingController();
  final TextEditingController _soodField = new TextEditingController();
  final TextEditingController _timeField = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            bloc.dispose();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Bloc Pattern"),
        actions: <Widget>[],
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              myRow("سرمایه اولیه", _firstMoneyField, (_) {}),
              myRow("سود ماهانه", _soodField, (_) {}),
              myRow(" مدت سپرده (سال) ", _timeField, (_) {}),
              //justArrive ? Text("just arrived!") : willSpawn,
            ],
          ),
        ),
      ),
    );
  }
}
