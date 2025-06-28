import 'package:flutter/material.dart';
import 'package:well_being_2/data/note_data.dart';
import 'package:well_being_2/widget/note_book.dart';

class NoteMainScreen extends StatefulWidget {
  const NoteMainScreen({super.key});

  @override
  State<NoteMainScreen> createState() => _NoteMainScreenState();
}

class _NoteMainScreenState extends State<NoteMainScreen> {
  final TextEditingController _myController = TextEditingController();
  final DateTime date = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _myController.text = "My notes ${date.year}-${date.month}-${date.day}";
  }

  @override
  Widget build(BuildContext context) {
    final int listIdx = noteData.length;
    final List<Map<String, dynamic>> noteBooks = noteData;
    final ScrollController _myScrollControler = ScrollController();

    return ListView(
      children: [
        ...noteBooks.map((e) {
          return NoteBook(
            noteBook: e,
            callback: () {
              setState(() {});
            },
          );
        }),

        Divider(),
        Card(
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Title"),
                    content: TextField(controller: _myController),
                    actions: [
                      TextButton(
                        onPressed: () {
                          noteData.add({
                            "list_id": listIdx,
                            "title": _myController.text,
                            "date": date,
                            "icon": Icons.book,
                            "notes": [],
                          });

                          // dibug propose
                          print("\nNoteMainScreen(): \n$noteData");
                          //
                          //
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Text("ok"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
