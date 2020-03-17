import 'package:flutter/material.dart';

class SecondSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Scaffold(
        body: Center(child: Text("just for 3 sec!")),
      )),
    );
  }
}
