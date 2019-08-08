import 'package:flutter/material.dart';

// SnackBar
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
void showInSnackBar(Widget text) {
  scaffoldKey.currentState.showSnackBar(SnackBar(content: text));
}