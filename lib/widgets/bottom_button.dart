import 'package:flutter/material.dart';
import '../theme.dart';

class BottomButton extends StatelessWidget{
  final String text;
  final Color color;
  final Color borderColor;

  const BottomButton({
    super.key, 
    required this.text,
    required this.color,
    this.borderColor = Colors.transparent,

  });

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: color == Colors.white ? green : Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 128), // padding vertikal dan horizontal 
        minimumSize: const Size(0, 36), // set minimum size agar konsisten
        side: BorderSide(color: borderColor, width: 1), // ketebalan border outline
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
      ),
      child: Text(
        text,
        style: bold16.copyWith(color: color == Colors.black ? green : Colors.black),
      ),
    ); 
  }
}