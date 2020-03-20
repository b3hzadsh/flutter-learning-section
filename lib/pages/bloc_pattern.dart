import 'package:flutter/material.dart';
import 'package:section_all/bloc/bloc.dart';
// import 'package:section_all/pages/radio_btn.dart';
import 'package:section_all/src/models/my_row.dart';
import 'package:section_all/src/models/cpmpound.dart';

int p = 1;

class BloCPattern extends StatefulWidget {
  @override
  _BloCPatternState createState() => _BloCPatternState();
}

class _BloCPatternState extends State<BloCPattern> {
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                myRow("سرمایه اولیه", _firstMoneyField, (txt) {
                  if (int.parse(txt) > 0) {
                    bloc.changeMoney(int.parse(txt));
                  } else {
                    // TODO make snakbar or dialog for warning
                  }
                }),
                myRow("سود ماهانه", _soodField, (txt) {
                  if (int.parse(txt) > 0) {
                    bloc.changeBenefit(int.parse(txt));
                  } else {
                    // TODO make snakbar or dialog for warning
                  }
                }),
                myRow(" مدت سپرده (سال) ", _timeField, (txt) {
                  if (int.parse(txt) > 0) {
                    bloc.changeTime(int.parse(txt));
                  } else {
                    // TODO make snakbar or dialog for warning
                  }
                }),
                /* StreamBuilder(
                    stream: bloc.benefit,
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? Text(snapshot.data.toString())
                          : Text("shit");
                    }) */
                StreamBuilder(
                    //initialData: "hello",
                    stream: bloc.submitValid,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(fResualt(
                            bloc.streamMoney.stream.value,
                            bloc.streamBenefit.stream.value,
                            bloc.streamTime.stream.value,
                            0));
                        print(bloc.streamMoney.stream.value);
                        print(bloc.streamTime.stream.value);
                        print(bloc.streamBenefit.stream.value);
                      }
                      return snapshot.hasData
                          ? Text(fResualt(
                                  bloc.streamMoney.stream.value,
                                  bloc.streamBenefit.stream.value,
                                  bloc.streamTime.stream.value,
                                  p)
                              .toString())
                          : Text("not yet");
                    }),
                Column(
                  children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        txtRadio("weekly", 0, () {
                          setState(() {
                            p = 0;
                          });
                        }),
                        txtRadio("monthly", 1, () {
                          p = 1;

                          setState(() {
                            p = 1;
                          });
                        }),
                        txtRadio("anualy", 2, () {
                          p = 2;

                          setState(() {
                            p = 2;
                          });
                        }),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget txtRadio(String txt, int vl, Function xO) {
  // txt for Text widget
  //vl for value of radiobtn
  //xO for setState after chnage groupNmae outside whidget
  return Container(
    margin: EdgeInsets.all(35.0),
    child: Row(
      children: <Widget>[
        Text("$txt"),
        Radio(
          groupValue: p,
          value: vl,
          onChanged: (vls) {
            p = vl;
            xO();
            // print(vls);
          },
        )
      ],
    ),
  );
}
// using global var for groupValue ! /
// dont use streamController instead stream
//use behaviorSubject for using .value and be broadcast streamCintroller
//remember this:  bloc.streamMoney.stream.value
