import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typethis/typethis.dart';

class AppDialogBox extends StatelessWidget {
  const AppDialogBox({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 350),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TypeThis(
              string: message,
              speed: 1,
              softWrap: true,
              style: GoogleFonts.comicNeue(fontSize: 16),
              showBlinkingCursor: false,
            ),
            // Text(
            //   softWrap: true,
            //   style: GoogleFonts.comicNeue(fontSize: 16),
            //   message,
            // ),
          ),
        ),
      ),
    );
  }
}
