import 'package:flutter/material.dart';
import 'dart:async';
import '../utils/preferences.dart';

class _ThemeManager {
  StreamController<ThemeData> _themeController;
  ThemeData _themeData;
  String theme;

  _themeManagerAsync () async {
    _themeController = StreamController();
    var pref = await preferences();
    theme = pref.getString('theme') ?? 'light';
    _themeData = theme == 'light' ? ThemeData.light() : ThemeData.dark();
    _save();
  }

  _ThemeManager() {
    _themeManagerAsync();
  }

  bool get darkMode => theme == 'dark';
  Stream<ThemeData> get stream => _themeController.stream;

  _save() async {
    _themeController.sink.add(_themeData);
    var pref = await preferences();
    pref.setString('theme', theme);
  }

  changeTheme() async {
    bool dark = darkMode;
    theme = dark ? 'light' : 'dark';
    _themeData = dark ? ThemeData.light() : ThemeData.dark();
    _save();
  }
  dispose() {
    _themeController.close();
  }
}

final themeManager = _ThemeManager();
