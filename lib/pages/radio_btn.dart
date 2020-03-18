import 'package:flutter/material.dart';

int x = 0;

class RadioBtn extends StatefulWidget {
  @override
  _RadioBtnState createState() => _RadioBtnState();
}

class _RadioBtnState extends State<RadioBtn> {
  void afterRadio() {
    setState(() {
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio button test"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                txtRadio("weekly", 0, afterRadio),
                txtRadio("monthly", 1, afterRadio),
                txtRadio("annualy", 2, afterRadio)
              ],
            )
          ],
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
          groupValue: x,
          value: vl,
          onChanged: (vls) {
            x = vl;
            xO();
            print(vls);
          },
        )
      ],
    ),
  );
}
