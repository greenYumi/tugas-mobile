import 'package:flutter/material.dart';
import 'package:well_being_2/data/note_data.dart';
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
            // Card(
            //   child: ListTile(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
            //     ),
            //     onTap: () {},
            //     tileColor: note["color"],
            //     title: Text(note["title"]),
            //     subtitle: SizedBox(
            //       height: 20,
            //       width: 20,
            //       child: Text(note["content"], overflow: TextOverflow.ellipsis),
            //     ),
            //     trailing: PopupMenuButton(
            //       icon: Icon(Icons.more_vert),
            //       itemBuilder: (context) => <PopupMenuEntry>[
            //         PopupMenuItem(
            //           child: ListTile(
            //             onTap: () {
            //               Navigator.pop(context);
            //             },
            //             leading: Icon(Icons.delete),
            //             title: Text("Hapus"),
            //           ),
            //         ),
            //         PopupMenuDivider(),
            //         PopupMenuItem(
            //           child: ListTile(
            //             onTap: () {
            //               noteData[widget
            //                       .notes["list_id"]]["notes"][note["note_id"]]["color"] =
            //                   Colors.red.shade300;
            //               Navigator.pop(context);
            //               setState(() {});
            //             },
            //             leading: CircleAvatar(
            //               backgroundColor: Colors.red.shade300,
            //               radius: 10,
            //             ),
            //             title: Text("Red"),
            //           ),
            //         ),
            //         PopupMenuItem(
            //           child: ListTile(
            //             onTap: () {
            //               noteData[widget
            //                       .notes["list_id"]]["notes"][note["note_id"]]["color"] =
            //                   Colors.yellow.shade300;
            //               Navigator.pop(context);
            //               setState(() {});
            //             },
            //             leading: CircleAvatar(
            //               backgroundColor: Colors.amber.shade300,
            //               radius: 10,
            //             ),
            //             title: Text("Yellow"),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // );
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
              print("from addnew to list, data Change!! and work!");
            },
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
