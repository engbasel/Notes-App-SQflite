import 'package:flutter/material.dart';
import 'package:notesv2/views/HomeView.dart';
import 'package:notesv2/views/notesView.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'theme.dart';

void main(List<String> args) {
  sqfliteFfiInit(); // Initialize sqflite_ffi

  // Initialize databaseFactory with sqflite_ffi
  databaseFactoryOrNull = databaseFactoryFfi;

  runApp(const NotesApp());
}

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  _NotesAppState createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  ThemeMode themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//
      title: 'Notes App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routes: {
        'NotesView': (context) => const NotesView(),
      },
      home: HomeView(toggleTheme: toggleTheme, themeMode: themeMode),
    );
  }
}
