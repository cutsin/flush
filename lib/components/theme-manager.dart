import 'package:flutter/material.dart';
import 'dart:async';

class ThemeManager {
  StreamController<ThemeData> _themeController;
  Stream<ThemeData> _stream;
  ThemeData _themeData;

  ThemeManager() {
    _themeData = ThemeData.light();
    _themeController = StreamController();
    _stream = _themeController.stream;
  }

  Stream<ThemeData> get stream => _stream;
  Stream<ThemeData> get theme => _themeController.stream;

  bool get dark => _themeData == ThemeData.dark();

  changeTheme() {
    _themeData = !dark ? ThemeData.dark() : ThemeData.light();
    _themeController.sink.add(_themeData);
  }
  dispose() {
    _themeController.close();
  }
}

final themeManager = ThemeManager();
