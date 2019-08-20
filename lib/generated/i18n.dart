import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes
// ignore_for_file: unnecessary_brace_in_string_interps

//WARNING: This file is automatically generated. DO NOT EDIT, all your changes would be lost.

typedef void LocaleChangeCallback(Locale locale);

class I18n implements WidgetsLocalizations {
  const I18n();
  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale _newLocale) {
    _shouldReload = true;
    I18n._locale = _newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate =
    const GeneratedLocalizationsDelegate();

  /// function to be invoked when changing the language
  static LocaleChangeCallback onLocaleChanged;

  static I18n of(BuildContext context) =>
    Localizations.of<I18n>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  /// "Home"
  String get Home => "Home";
  /// "Settings"
  String get Settings => "Settings";
  /// "Language"
  String get Language => "Language";
  /// "Add"
  String get Add => "Add";
  /// "Back"
  String get Back => "Back";
  /// "${action} manualy"
  String actManualy(String action) => "${action} manualy";
  /// "Hello ${name}"
  String greetTo(String name) => "Hello ${name}";
}

class _I18n_en_US extends I18n {
  const _I18n_en_US();

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class _I18n_zh_CN extends I18n {
  const _I18n_zh_CN();

  /// "首页"
  @override
  String get Home => "首页";
  /// "设置"
  @override
  String get Settings => "设置";
  /// "语言"
  @override
  String get Language => "语言";
  /// "添加"
  @override
  String get Add => "添加";
  /// "后退"
  @override
  String get Back => "后退";
  /// "${action} manualy"
  @override
  String actManualy(String action) => "${action} manualy";
  /// "你好, ${name}"
  @override
  String greetTo(String name) => "你好, ${name}";

  @override
  TextDirection get textDirection => TextDirection.ltr;
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      const Locale("en", "US"),
      const Locale("zh", "CN")
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (this.isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale _locale) {
    I18n._locale ??= _locale;
    I18n._shouldReload = false;
    final Locale locale = I18n._locale;
    final String lang = locale != null ? locale.toString() : "";
    final String languageCode = locale != null ? locale.languageCode : "";
    if ("en_US" == lang) {
      return new SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("zh_CN" == lang) {
      return new SynchronousFuture<WidgetsLocalizations>(const _I18n_zh_CN());
    }
    else if ("en" == languageCode) {
      return new SynchronousFuture<WidgetsLocalizations>(const _I18n_en_US());
    }
    else if ("zh" == languageCode) {
      return new SynchronousFuture<WidgetsLocalizations>(const _I18n_zh_CN());
    }

    return new SynchronousFuture<WidgetsLocalizations>(const I18n());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => I18n._shouldReload;
}