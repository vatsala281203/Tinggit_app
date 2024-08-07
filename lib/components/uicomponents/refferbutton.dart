import 'package:flutter/material.dart';

class MyReferButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyReferButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center, // Align button to center
      child: Container(
        constraints: BoxConstraints(maxWidth: 60,
          maxHeight: 30,), // Set max width
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
