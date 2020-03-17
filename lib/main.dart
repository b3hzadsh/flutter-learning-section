import 'package:flutter/material.dart';
import 'package:section_all/pages/first_section.dart';
import 'package:section_all/pages/second-section.dart';
import 'package:section_all/pages/wrap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demoes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Sections'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void ToFirstSection() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FirstSection()));
  }

  void ToDelayPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondSection()),
    );
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Wrap(
                spacing: 0.0,
                runSpacing: 0.0,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Section 1 (wrap)"),
                    onPressed: ToFirstSection,
                  ),
                  // divider(context),
                  SizedBox(width: 20),
                  RaisedButton(
                    child: Text("Delay Page"),
                    onPressed: ToDelayPage,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
