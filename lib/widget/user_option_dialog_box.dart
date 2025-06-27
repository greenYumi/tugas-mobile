import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserOptionDialogBox extends StatelessWidget {
  const UserOptionDialogBox({super.key, required this.response});

  final String response;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(response, style: GoogleFonts.comicNeue(fontSize: 16)),
        ),
      ),
    );
  }
}
