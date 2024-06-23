// --------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:notesv2/views/splash/SplashView.dart';
import 'generated/l10n.dart';
import 'package:notesv2/views/notesView.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'theme.dart';
import 'views/HomeView.dart';
// --------------------------------------------------------------------------

// --------------------------------------------------------------------------
void main(List<String> args) {
  sqfliteFfiInit();
  databaseFactoryOrNull = databaseFactoryFfi;
  runApp(const NotesApp());
}
// --------------------------------------------------------------------------

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  _NotesAppState createState() => _NotesAppState();
}

// --------------------------------------------------------------------------
class _NotesAppState extends State<NotesApp> {
  ThemeMode themeMode = ThemeMode.system;
  Locale _locale = const Locale('en');
  // --------------------------------------------------------------------------
  void toggleTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }
  // --------------------------------------------------------------------------

  // --------------------------------------------------------------------------
  void _setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  // --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      locale: _locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // --------------------------------------------------------------------------

      routes: {
        'NotesView': (context) => const NotesView(),
        'HomeView': (context) => HomeView(
              toggleTheme: toggleTheme,
              themeMode: themeMode,
              setLocale: _setLocale,
            ),
      },
      // --------------------------------------------------------------------------

      home: SplashScreenView(
        toggleTheme: toggleTheme,
        themeMode: themeMode,
        setLocale: _setLocale,
      ),
      // --------------------------------------------------------------------------
    );
  }
}
