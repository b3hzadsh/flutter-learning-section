import 'package:flutter/material.dart';
import '../bloc/bloc.dart';
import 'dart:async';

class StreamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Working with Stream"),
      ),
      body: streamBody(context),
    );
  }
}

Widget streamBody(BuildContext context) {
  Widget strWidget = StreamBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data);
      } else {
        return Text(snapshot.error);
      }
    },
    stream: bloc.str,
  );
  bool firstTime = true;
  var baker = new StreamTransformer.fromHandlers(
    handleData: (input, sink) {
      if (input.length < 6) {
        sink.add(input);
      } else {
        sink.addError("text is too short");
      }
    },
  );

  bloc.str.map((s) => s + "Hi").transform(baker); // .listen()
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
                firstTime = false;
                bloc.steChange(s);
              },
            ),
            Container(
              margin: EdgeInsets.all(15.0),
            ),
            strWidget,
          ],
        ),
      ),
    ),
  );
}
