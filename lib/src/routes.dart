import 'package:flutter/material.dart';

void toOtherSection(BuildContext context, Widget firstSection) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => firstSection));
}
