import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserResponseBox extends StatelessWidget {
  const UserResponseBox({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Card(
        color: Colors.blue.shade50,
        child: Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Text(message, style: GoogleFonts.comicNeue(fontSize: 16)),
        ),
      ),
    );
  }
}
