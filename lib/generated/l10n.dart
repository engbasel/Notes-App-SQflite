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

  /// `Notes App`
  String get noteAppTitle {
    return Intl.message(
      'Notes App',
      name: 'noteAppTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Note`
  String get addNoteTitle {
    return Intl.message(
      'Add Note',
      name: 'addNoteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Main Title`
  String get mainTitleLabel {
    return Intl.message(
      'Main Title',
      name: 'mainTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Subtitle`
  String get subtitleLabel {
    return Intl.message(
      'Subtitle',
      name: 'subtitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get noteLabel {
    return Intl.message(
      'Note',
      name: 'noteLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add Note and Read Data`
  String get addNoteButton {
    return Intl.message(
      'Add Note and Read Data',
      name: 'addNoteButton',
      desc: '',
      args: [],
    );
  }

  /// `Edit Note`
  String get editNoteTitle {
    return Intl.message(
      'Edit Note',
      name: 'editNoteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notesTitle {
    return Intl.message(
      'Notes',
      name: 'notesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Note deleted successfully`
  String get deleteSuccess {
    return Intl.message(
      'Note deleted successfully',
      name: 'deleteSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Error deleting note`
  String get deleteError {
    return Intl.message(
      'Error deleting note',
      name: 'deleteError',
      desc: '',
      args: [],
    );
  }

  /// `No data available`
  String get noDataAvailable {
    return Intl.message(
      'No data available',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `العربية`
  String get arabic {
    return Intl.message(
      'العربية',
      name: 'arabic',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
