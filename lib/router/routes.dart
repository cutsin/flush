import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// Routes
import '../views/home.dart';
import '../views/settings/index.dart';
import '../views/settings/language.dart';

final Duration immediately = Duration();

Map<String, dynamic> routes = {
  'home': {
    'title': 'Home',
    'path': '/',
    'handler': Handler(handlerFunc: (_, params) => HomeComponent()),
    'navBottomIndex': 0,
    'duration': immediately,
    'icon': Icons.home,
  },
  'settings': {
    'title': 'Settings',
    'path': '/settings',
    'handler': Handler(handlerFunc: (_, params) => SettingsComponent()),
    'navBottomIndex': 1,
    'duration': immediately,
    'icon': Icons.settings,
  },
  'language': {
    'title': 'Language',
    'path': '/settings/language',
    'handler': Handler(handlerFunc: (_, params) => LanguageComponent()),
    'icon': Icons.language,
  },
};