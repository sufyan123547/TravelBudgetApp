import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final double elevation;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF00BF6D), // Default green color
    this.textColor = Colors.white, // Default white text color
    this.height = 60.0,
    this.width = double.infinity, // Default full width
    this.elevation = 0.0, // Default elevation to 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed;
        },
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          minimumSize: Size(width, height),
          shape: const StadiumBorder(),
        ),
        child: Text(text,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: textColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500))));
  }
}
