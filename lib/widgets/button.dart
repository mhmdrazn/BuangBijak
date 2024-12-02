import 'package:flutter/material.dart';
import '../theme.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final Color? borderColor;
  final Color? textColor;

  const Button({
    super.key, 
    required this.text,
    required this.color,
    this.borderColor,
    this.textColor
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final double horizontalPadding = screenWidth * 0.04;

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: color == Colors.white ? white : Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: horizontalPadding,
        ),
        minimumSize: const Size(0, 36),
        side: BorderSide(color: borderColor?? Colors.transparent, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: bold14.copyWith( 
          color: textColor == Colors.black ? black : Colors.white,
        ),
      ),
    );
  }
}
