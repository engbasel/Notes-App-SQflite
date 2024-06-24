import 'package:flutter/material.dart';
import 'package:notesv2/views/Notes_views/HomeView.dart';
import '../../constant.dart';

class SplashScreenView extends StatefulWidget {
  final VoidCallback toggleTheme;
  final ThemeMode themeMode;
  final Function(Locale) setLocale;

  const SplashScreenView({
    super.key,
    required this.toggleTheme,
    required this.themeMode,
    required this.setLocale,
  });

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override

  // --------------------------------------------------------------------------

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: KdurationTime), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeView(
            toggleTheme: widget.toggleTheme,
            themeMode: widget.themeMode,
            setLocale: widget.setLocale,
          ),
        ),
      );
    });
  }
  // --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --------------------------------------------------------------------------
              Image.asset(
                'assets/Icon.png',
                height: 200,
                width: 200,
              ),
              // --------------------------------------------------------------------------
              const SizedBox(height: 21),
              const Text(
                'My Note',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff37474F),
                ),
              ),
              // --------------------------------------------------------------------------
              const Text(
                'Keep Note every day',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff37474F),
                ),
              ),
              // --------------------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
