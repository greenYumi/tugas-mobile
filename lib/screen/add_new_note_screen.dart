import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:well_being_2/data/note_data.dart';

class AddNewNoteScreen extends StatefulWidget {
  const AddNewNoteScreen({
    super.key,
    required this.listId,
    required this.newNoteId,
  });

  final int listId;
  final int newNoteId;

  @override
  State<AddNewNoteScreen> createState() => _AddNewNoteScreenState();
}

class _AddNewNoteScreenState extends State<AddNewNoteScreen> {
  final TextEditingController _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("got list_id : ${widget.listId}");
    print("got new note id: ${widget.newNoteId}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade50,
        title: Text("new note"),
        actions: [
          TextButton(
            onPressed: () {
              noteData[widget.listId]["notes"].add({
                "note_id": widget.newNoteId,
                "title": "new Note",
                "date": DateTime.now(),
                "content": _myController.text,
              });

              /// debug propose
              ///
              print(noteData);

              ///
              ///

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(50),
                  ),
                  width: 200,
                  backgroundColor: const Color.fromARGB(255, 254, 246, 255),
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "note tesimpan",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Icon(Icons.mark_as_unread),
                    ],
                  ),
                ),
              );

              Navigator.pop(context, true);
            },
            child: Text(
              "SAVE NOTE",
              style: TextStyle(
                color: Colors.teal.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _myController,
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
