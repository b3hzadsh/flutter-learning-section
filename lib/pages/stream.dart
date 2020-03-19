import 'dart:math';

import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import 'dart:async';

bool firstTime = true;

class StreamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              bloc.dispose();
              firstTime = true;
              Navigator.pop(context);
            }),
        title: Text("Working with Stream"),
        actions: <Widget>[],
      ),
      body: streamBody(context),
    );
  }
}

Widget streamBody(BuildContext context) {
  var baker = new StreamTransformer.fromHandlers(
    handleData: (input, sink) {
      if (input.length < 4) {
        sink.add(input);
      } else {
        sink.addError("text is too short");
      }
    },
  );

  // .listen()
  final TextEditingController txtCtl = new TextEditingController();

  return Container(
    margin: EdgeInsets.all(15.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextField(
              controller: txtCtl,
              onChanged: (String s) {
                bloc.steChange(s);
                //bloc.str.map((s) => s).transform(baker);
              },
            ),
            Container(
              margin: EdgeInsets.all(15.0),
            ),
            StreamBuilder(
              builder: (context, snapshot) {
                String vs;
                Color cl = Colors.white;
                if (snapshot.hasData) {
                  if (txtCtl.text.length < 5) {
                    vs = "snapshot.error";
                  }

                  if (txtCtl.text.length > 5) {
                    cl = Colors.blue;
                    vs = txtCtl.text;
                  } else {
                    vs = "not enough letters";
                  }
                } else {
                  cl = Colors.red;
                  vs = "not yet";
                }
                return Text(
                  vs,
                  style: TextStyle(color: cl),
                );
              },
              stream: bloc.str,
            ),
          ],
        ),
      ),
    ),
  );
}
