import 'package:flutter/material.dart';
import 'package:section_all/pages/animation.dart';
import 'package:section_all/pages/bloc_pattern.dart';
import 'package:section_all/pages/first_section.dart';
import 'package:section_all/pages/radio_btn.dart';
import 'package:section_all/pages/second-section.dart';
import 'package:section_all/pages/stream.dart';
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
      body: bodyH([
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
        ),
        RaisedButton(
          child: Text("Section 4 (Stream)"),
          onPressed: () {
            toOtherSection(context, StreamPage());
          },
        ),
        RsBtn(context, "BloC Pattern", BloCPattern()),
        RsBtn(context, "Animation", AnimationPage()),
      ]),
    );
  }

  Widget x() {
    return SizedBox(width: 20);
  }
}

Widget RsBtn(context, String btnTxt, Widget nextPage) {
  return RaisedButton(
    child: Text("$btnTxt"),
    onPressed: () {
      toOtherSection(context, nextPage);
    },
  );
}

Widget bodyH(List<Widget> x) {
  return WillPopScope(
    child: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10.0), // padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Wrap(
                spacing: 20.0,
                runSpacing: 0.0,
                children: x,
              ),
            )
          ],
        ),
      ),
    ),
    onWillPop: () {},
  );
}
