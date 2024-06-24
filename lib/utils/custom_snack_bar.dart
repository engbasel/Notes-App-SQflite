import 'package:flutter/material.dart';

void showCustomSnackBar(BuildContext context, String message) {
  final isLightTheme = Theme.of(context).brightness == Brightness.light;
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(
        color: isLightTheme ? Colors.black : Colors.white,
      ),
    ),
    backgroundColor:
        isLightTheme ? const Color(0xffF3D0D7) : const Color(0xff223547),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
