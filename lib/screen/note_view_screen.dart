import 'package:flutter/material.dart';

class NoteView extends StatefulWidget {
  const NoteView({
    super.key,
    required this.title,
    required this.date,
    required this.content,
  });

  final String? title;
  final DateTime date;
  final String? content;

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? "Note"),
        backgroundColor: Colors.yellow.shade50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(widget.content ?? " ", style: TextStyle(fontSize: 16)),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}
