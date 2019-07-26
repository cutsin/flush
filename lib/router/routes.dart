import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

// Root
import '../views/home.dart';
import '../views/settings.dart';

var routes = {
  'home': {
    'title': 'Home',
    'path': '/',
    'handler': Handler(handlerFunc: (_, params) => HomeComponent()),
    'navBottomIndex': 0,
    'icon': Icons.home,
  },
  'settings': {
    'title': 'Settings',
    'path': '/settings',
    'handler': Handler(handlerFunc: (_, params) => SettingsComponent()),
    'navBottomIndex': 1,
    'icon': Icons.settings,
  },
};