// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `List products`
  String get products {
    return Intl.message(
      'List products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Title product`
  String get titleProducts {
    return Intl.message(
      'Title product',
      name: 'titleProducts',
      desc: '',
      args: [],
    );
  }

  /// `Description product`
  String get descriptionProducts {
    return Intl.message(
      'Description product',
      name: 'descriptionProducts',
      desc: '',
      args: [],
    );
  }

  /// `Image product`
  String get imageProducts {
    return Intl.message(
      'Image product',
      name: 'imageProducts',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get saveBtn {
    return Intl.message(
      'Save',
      name: 'saveBtn',
      desc: '',
      args: [],
    );
  }

  /// `Add product`
  String get addProduct {
    return Intl.message(
      'Add product',
      name: 'addProduct',
      desc: '',
      args: [],
    );
  }

  /// `Edit product`
  String get editProduct {
    return Intl.message(
      'Edit product',
      name: 'editProduct',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove?`
  String get removeProduct {
    return Intl.message(
      'Are you sure you want to remove?',
      name: 'removeProduct',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
