import 'package:flutter/material.dart';
import 'package:well_being_2/screen/add_new_note_screen.dart';
import 'package:well_being_2/widget/note.dart';

bool setStateWhenPop = false;
void openNewNote(context, listId, newNoteId, Function() callback) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          AddNewNoteScreen(listId: listId, newNoteId: newNoteId),
    ),
  );

  if (result == true) {
    // global var
    setStateWhenPop = true;
    //

    callback();
  }
}

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key, required this.notes});
  final Map<String, dynamic> notes;

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  @override
  Widget build(BuildContext context) {
    print("NoteListScreen():\nget render");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, (setStateWhenPop == true) ? true : null);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(widget.notes["title"]),
        backgroundColor: Colors.blue.shade50,
      ),
      body: ListView(
        children: [
          ...widget.notes["notes"].map((note) {
            return Note(
              listId: widget.notes["list_id"],
              note: note,
              callback: () {
                setState(() {});
              },
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openNewNote(
            context,
            widget.notes["list_id"],
            widget.notes["notes"].length,
            () {
              setState(() {});
            },
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
