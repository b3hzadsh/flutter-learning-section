import 'package:flutter/material.dart';
import 'package:section_all/pages/first_section.dart';
import 'package:section_all/pages/radio_btn.dart';
import 'package:section_all/pages/second-section.dart';
// import 'package:section_all/pages/wrap.dart';
import 'src/routes.dart';

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
      body: WillPopScope(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.0), // padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 0.0,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("Section 1 (wrap)"),
                        onPressed: () {
                          toOtherSection(context, FirstSection());
                        },
                      ),
                      // divider(context),
                      //  x(),
                      RaisedButton(
                        child: Text("Section 2 (Delay Page)"),
                        onPressed: ToDelayPage,
                      ),
                      RaisedButton(
                        child: Text("Section 3 (radio bottun)"),
                        onPressed: () {
                          toOtherSection(context, RadioBtn());
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () {},
      ),
    );
  }

  Widget x() {
    return SizedBox(width: 20);
  }
}
