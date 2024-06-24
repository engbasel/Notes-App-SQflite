import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;

  const CustomSnackBar({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    return const SizedBox
        .shrink(); // This widget itself does not render anything.
  }
}
