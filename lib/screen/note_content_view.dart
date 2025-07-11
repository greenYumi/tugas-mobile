import 'package:flutter/material.dart';

class NoteContentView extends StatelessWidget {
  const NoteContentView({super.key, required this.note});

  final Map<String, dynamic> note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(note["title"])));
  }
}
