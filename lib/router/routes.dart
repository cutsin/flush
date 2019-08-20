import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../generated/i18n.dart';

// Routes
import '../views/home.dart';
import '../views/settings/index.dart';
import '../views/settings/language.dart';

final Duration immediately = Duration();

Map<String, dynamic> routes = {
  'home': {
    'title': (_) => I18n.of(_).Home,
    'path': '/',
    'handler': Handler(handlerFunc: (_, params) => HomeView()),
    'navBottomIndex': 0,
    'duration': immediately,
    'icon': Icons.home,
  },
  'settings': {
    'title': (_) => I18n.of(_).Settings,
    'path': '/settings',
    'handler': Handler(handlerFunc: (_, params) => SettingsView()),
    'navBottomIndex': 1,
    'duration': immediately,
    'icon': Icons.settings,
  },
  'language': {
    'title': (_) => I18n.of(_).Language,
    'path': '/settings/language',
    'handler': Handler(handlerFunc: (_, params) => LanguageView()),
    'icon': Icons.language,
  },
};
